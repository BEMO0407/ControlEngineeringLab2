%% RT2 Labor 2
prep_lab_1; % Werte aus lab 1
Ts = 0.01;    % Abtastzeit 
%% Ziegler Nichols
Tt_zn = Tt;
if Tt_zn < 0.05
    Tt_zn = 0.2;
end

Kp_zn = 0.9 * tau / (K * Tt_zn);
Tn_zn = 3.33 * Tt_zn;
Ki_zn = Kp_zn / Tn_zn;

% Diskretisierung
z = tf('z', Ts);
C_zn = Kp_zn + Ki_zn * (Ts * z / (z - 1));

fprintf('\n Ziegler-Nichols Tt = %.2f s \n', Tt_zn);
fprintf('Kp_zn = %.4f %%/°C\n', Kp_zn);
fprintf('Ki_zn = %.4f %%/(°C*s)  (Tn = %.2f s)\n', Ki_zn, Tn_zn);

%% DIREKTER ZEITDISKRETER ENTWURF (Polvorgabe ts = 20 s)

%  G(z) = b0 / (z - a1)
Gd = c2d(Gp1, Ts, 'zoh');
[num_d, den_d] = tfdata(Gd, 'v');
b0 = num_d(2);
a1 = -den_d(2);

% Polstelle
ts_soll = 20;
s_pol   = -4 / ts_soll;
z_pol   = exp(s_pol * Ts);

% Pol-Nullstellen-Kürzung
% C(z) = Kp + Ki * Ts*z/(z-1) = ((Kp + Ki*Ts)*z - Kp) / (z - 1)
% Nullstelle des Reglers z0 = Kp / (Kp + Ki*Ts) == a1
Kp_dd = a1 * (1 - z_pol) / b0;
Ki_dd = (1 - a1) * (1 - z_pol) / (b0 * Ts);

C_dd = Kp_dd + Ki_dd * (Ts * z / (z - 1));

fprintf('\nDirekter diskreter Entwurf ts = %.0f s ---\n', ts_soll);
fprintf('z_pol = %.6f\n', z_pol);
fprintf('Kp_dd = %.4f %%/°C\n', Kp_dd);
fprintf('Ki_dd = %.4f %%/(°C*s)  (Tn = %.2f s)\n', Ki_dd, Kp_dd/Ki_dd);

%% Vergleich beider Varianten
T_cl_zn = feedback(C_zn * Gd, 1);
T_cl_dd = feedback(C_dd * Gd, 1);

t_sim = (0:Ts:60)';
dT_step = 35 - T0;   % Sprung vom Arbeitspunkt T0 auf 35 °C

[y_zn, ~] = step(dT_step * T_cl_zn, t_sim);
[y_dd, ~] = step(dT_step * T_cl_dd, t_sim);

figure; hold on; grid on;
plot(t_sim, T0 + y_dd, '-',  'LineWidth', 1.5, 'DisplayName', 'Variante B (Direkt diskret, ts=20 s)');
plot(t_sim, T0 + y_zn, '--', 'LineWidth', 1.5, 'DisplayName', 'Variante A (Ziegler-Nichols)');
yline(35, ':', 'Color', [0.4 0.4 0.4], 'DisplayName', 'Sollwert 35 °C');
xlabel('Zeit / s'); ylabel('Temperatur / °C');
title('Vergleich Closed-Loop-Sprungantwort (linear, ohne Sättigung)');
legend('Location', 'southeast');

%% Trajektorie
T_amb = 23.5;                 % Umgebungstemperatur
t_traj = (0:Ts:250)';
[w_traj, uV_traj] = trajektorie_2dof(t_traj, K, tau, T_amb);

figure;
subplot(2,1,1); grid on; hold on;
plot(t_traj, w_traj - T_amb, 'LineWidth', 1.5);
xlabel('Zeit / s'); ylabel('\Delta T_{ref} / °C');
title('Trajectorie to the roomtemperatur ');

subplot(2,1,2); grid on; hold on;
plot(t_traj, uV_traj, 'LineWidth', 1.5, 'DisplayName', 'u_V');
plot(t_traj, min(max(uV_traj, 0), 100), '--', 'LineWidth', 1.5, 'DisplayName', 'u_V (begrenzt 0..100 %)');
xlabel('Zeit / s'); ylabel('Vorsteuerung u_V / %');
title('Calculated Control K_v(s) = (\tau s + 1)/K');
legend('Location', 'northeast');
