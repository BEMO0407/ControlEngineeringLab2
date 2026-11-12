function [w, u_V] = trajektorie_2dof(t, K, tau, T_amb)
% TRAJEKTORIE_2DOF  2DOF-Trajektorienplanung und Vorsteuerung (Abb. 12 & 13)
%   [w, u_V] = trajektorie_2dof(t, K, tau, T_amb)
%
%   Eingänge:
%     t     - Aktuelle Zeit / s (Skalar oder Vektor)
%     K     - Streckenverstärkung / (°C/%)
%     tau   - Zeitkonstante der Strecke / s
%     T_amb - Umgebungstemperatur (Starttemperatur) / °C
%
%   Ausgänge:
%     w     - Soll-Temperaturverlauf / °C
%     u_V   - Vorsteuergröße (Duty Cycle) / %

    y_ref  = zeros(size(t));
    dy_ref = zeros(size(t));

    % Abschnitt 1: Aufheizrampe 0 -> 15 °C (0 <= t < 80 s)
    idx1 = (t >= 0) & (t < 80);
    dy_up = 15 / 80;
    y_ref(idx1)  = dy_up * t(idx1);
    dy_ref(idx1) = dy_up;

    % Abschnitt 2: Halteplateau 15 °C (80 <= t < 120 s)
    idx2 = (t >= 80) & (t < 120);
    y_ref(idx2)  = 15;
    dy_ref(idx2) = 0;

    % Abschnitt 3: Abkühlrampe 15 -> 0 °C (120 <= t <= 240 s)
    idx3 = (t >= 120) & (t <= 240);
    dy_down = -15 / (240 - 120);
    y_ref(idx3)  = 15 + dy_down * (t(idx3) - 120);
    dy_ref(idx3) = dy_down;

    % Sollwert absolut (relativ zur Umgebungstemperatur)
    w = T_amb + y_ref;

    % Vorsteuerung Kv(s) = G^-1(s) = (tau*s + 1) / K
    u_V = (y_ref + tau * dy_ref) / K;
end
