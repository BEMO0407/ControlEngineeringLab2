function [w, u_V] = trajektorie(t, K, tau, T_amb)

%   input:
%     t     - time
%     K     - gain
%     tau   - time constant
%     T_amb - ambient temperatur
%
%   Ausgänge:
%     w     - temperatur traj
%     u_V   - duty cycle

    y_ref  = zeros(size(t));
    dy_ref = zeros(size(t));

    % heating
    idx1 = (t >= 0) & (t < 80);
    dy_up = 15 / 80;
    y_ref(idx1)  = dy_up * t(idx1);
    dy_ref(idx1) = dy_up;

    % const temp
    idx2 = (t >= 80) & (t < 120);
    y_ref(idx2)  = 15;
    dy_ref(idx2) = 0;

    % cool down
    idx3 = (t >= 120) & (t <= 240);
    dy_down = -15 / (240 - 120);
    y_ref(idx3)  = 15 + dy_down * (t(idx3) - 120);
    dy_ref(idx3) = dy_down;

    % desired temp
    w = T_amb + y_ref;

    % Kv(s) = G^-1(s) = (tau*s + 1) / K
    u_V = (y_ref + tau * dy_ref) / K;
end
