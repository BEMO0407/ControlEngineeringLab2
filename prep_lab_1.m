%% RT2 Labor 1 - Vorbereitung
%  1) Messgain Kmeas
%  2) Identifikation PT1Tt aus Sprungantwort (lsqcurvefit)
%  3) Vorschau Reglerentwurf (Variante A: Ziegler-Nichols, Variante B: direkt diskret)
clear; clc; close all;
 
%% ------------------------------------------------------------------------
%  1) MESSGAIN
%  MBED "Analog Read" liefert einen normierten Wert x = 0...1 (entspricht 0...3.3 V)
%  LM35: 10 mV/°C  ->  T = x * 3.3 V / 0.01 V/°C
% -------------------------------------------------------------------------
Vref   = 3.3;          % V, ADC-Referenz Nucleo
S_LM35 = 10e-3;        % V/°C, Empfindlichkeit LM35
Kmeas  = Vref/S_LM35;  % = 330 °C pro Einheit
fprintf('Kmeas = %.0f\n', Kmeas);
 
%% ------------------------------------------------------------------------
%  2) DATEN LADEN
%  useDemo = true  -> synthetische Testdaten (zum Testen des Skripts)
%  useDemo = false -> echte Messung (Beispiel von Sakai bzw. Labormessung)
% -------------------------------------------------------------------------
useDemo = true;
 
if useDemo
    dt   = 0.1;  t = (0:dt:600)';
    D    = 25 + 10*(t >= 60);                      % Sprung 25 % -> 35 % bei t = 60 s
    T    = 40 + 0.9*10*(1 - exp(-max(t-60-1.5,0)/90)) + 0.15*randn(size(t));
else
    % --- Variante CSV (Spalten: Zeit, Duty, Temperatur) ---
    data = readmatrix('sprungantwort.csv');
    t = data(:,1);  D = data(:,2);  T = data(:,3);
 
    % --- Variante MAT aus Data Inspector (Signalnamen ggf. anpassen) ---
    % S   = load('sprungantwort.mat');               % enthält Simulink-Dataset
    % ds  = S.data;                                  % Variablenname mit whos prüfen
    % sT  = ds.get('temperature').Values;  t = sT.Time;  T = sT.Data;
    % sD  = ds.get('Step Input').Values;   D = interp1(sD.Time, sD.Data, t, 'previous');
end
t = t(:); D = double(D(:)); T = double(T(:));
 
%% ------------------------------------------------------------------------
%  3) SPRUNG FINDEN, ARBEITSPUNKT BESTIMMEN
% -------------------------------------------------------------------------
idx    = find(abs(diff(D)) > 0.5*max(abs(diff(D))), 1) + 1;  % erster Sprung im Duty
t_step = t(idx);
dD     = D(end) - D(1);                                       % Sprunghöhe (hier 10 %)
T0     = mean(T(t < t_step & t > t_step - 20));               % stationär vor dem Sprung (letzte 20 s)
 
tt = t - t_step;                       % Zeit relativ zum Sprung
use = tt >= -10;                       % etwas Vorlauf mitnehmen
tt = tt(use);  Tm = T(use);
 
%% ------------------------------------------------------------------------
%  4) FIT PT1Tt:  T(t) = T0 + K*dD*(1 - exp(-(t-Tt)/tau)) für t >= Tt
%  p = [K, tau, Tt]
% -------------------------------------------------------------------------
model = @(p,x) T0 + p(1)*dD*(1 - exp(-max(x - p(3),0)/p(2)));
 
% Startwerte aus den Daten
Tend = mean(Tm(end-round(0.05*numel(Tm)):end));     % letzte 5 % = Endwert
K0   = (Tend - T0)/dD;
i63  = find(Tm >= T0 + 0.632*(Tend - T0), 1);
tau0 = max(tt(i63), 1);
p0   = [K0, tau0, 0.5];
 
lb = [0,   0.1,  0];
ub = [Inf, Inf, 30];
 
opts = optimoptions('lsqcurvefit', 'Display', 'off');
p    = lsqcurvefit(model, p0, tt, Tm, lb, ub, opts);
% Ohne Optimization Toolbox alternativ:
% p = fminsearch(@(p) sum((model(p,tt) - Tm).^2), p0);
 
K = p(1);  tau = p(2);  Tt = p(3);
R2 = 1 - sum((Tm - model(p,tt)).^2) / sum((Tm - mean(Tm)).^2);
 
fprintf('\n--- Identifikation ---\n');
fprintf('K   = %.4f °C/%%\n', K);
fprintf('tau = %.2f s\n', tau);
fprintf('Tt  = %.2f s\n', Tt);
fprintf('R^2 = %.4f\n', R2);
 
figure; hold on; grid on;
plot(tt, Tm, '.', 'Color', [0.6 0.6 0.6], 'DisplayName', 'Messung');
plot(tt, model(p,tt), 'r', 'LineWidth', 1.5, 'DisplayName', 'Fit PT1T_t');
xlabel('t - t_{Sprung} / s'); ylabel('Temperatur / °C');
title(sprintf('K = %.3f °C/%%,  \\tau = %.1f s,  T_t = %.2f s', K, tau, Tt));
legend('Location', 'southeast');
 
% Streckenmodell (s-Bereich)
G   = tf(K, [tau 1], 'InputDelay', Tt);   % PT1Tt (Variante A)
Gp1 = tf(K, [tau 1]);                     % PT1   (Variante B)
 