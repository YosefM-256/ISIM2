close all; clear all;
global DAC1 DAC0 CRes EpwrPin;

DAC1 = 0; DAC0 = 4095; CRes = 1; EpwrPin = 1;

pathsNconsts = struct(  'simulationCommand',    'XVIIx64.exe -b -ascii', ...
                        'homePath',             'U:\ISIM2\PMOS_NX3008PBKW', ...
                        'cirFileName',          'ISIM2cir_PMOS_NX3008PBKW.cir', ...
                        'rawFileName',          'ISIM2cir_PMOS_NX3008PBKW.raw', ...
                        'variablesFile',        'variables_PMOS_NX3008PBKW.txt', ...
                        'LTSpicePath',          'C:\Program Files\LTC\LTspiceXVII', ...
                        'databasePath',         'database_PMOS_NX3008PBKW.mat');

simulationVariables = getSimulationVariables(pathsNconsts);
% q = {};
% for i=3600:25:4075
%     setDAC1(i);
%     q{end+1} = simulate(pathsNconsts,simulationVariables);
%     i
% end

global app; app = ISIMapp;

% tuneBy("Ib","DAC0",-1e-3,"inverse",pathsNconsts,simulationVariables)

% q = plotIcVcePNP(-1e-3,[100:100:4000],pathsNconsts,simulationVariables);
% p = plotVsatIcPNP(10,10.^[-3:0.1:-0.5],pathsNconsts,simulationVariables);

% simulate(pathsNconsts,simulationVariables)
% f = plotVsatIcNPN(10, [ [1:9]*1e-4 [1:9]*1e-3 [1:9]*1e-2 [1:4]*1e-1 ], pathsNconsts,simulationVariables);
% s = plotIcVce([5e-3],[10 [100:100:4000]],pathsNconsts,simulationVariables);
% d = plothfeIc(5,[ [1:9].*1e-5 [1:9].*1e-4 [1:9].*1e-3],"return",pathsNconsts,simulationVariables);

% g = plotIdVds([2 3 4],[200:200:4000],pathsNconsts,simulationVariables);
m = sweepDAC0VgsPMOS([2],50:50:4050,pathsNconsts,simulationVariables);
saveDatabase(pathsNconsts);