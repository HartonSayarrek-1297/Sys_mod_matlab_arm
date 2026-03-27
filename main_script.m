% Yamanaev RR
% 
close all;
clc;
clear;
% set(0,'DefaultFigureWindowStyle','docked')

inertia_basis = [3 0 0;
                0 3 0;
                0 0 3];
inertia_home = [0;0;0];
global J J_inv;
J = [1, 0, 0; % inertia tensor
     0, 1, 0;
     0, 0, 1];
J_inv = J^(-1);
%%
v = [2;1;3];
fi1 = pi/4; % 1st Euler's angle
fi2 = pi/4; % 2nd Euler's angle

start_draw_kin_params;

%%

M_xyz = [0 0 1, 3;
         0 0 -3, 1;
         0 1 0, 3;
         0 -3 0, 1;
         1 0 0, 3;
         -3 0 0, 1];
v1 = [1; 1; 1];
rel_home = [-1;2;1];
rel_basis = [2 0 0;
             0 2 0;
             0 0 2];
w = [0 0 0]; % initial angular rate

start_draw_angular_motion;
start_draw_logs_angmot;

%%
G = 6.67*10^(-11); % gravitational constant
m = 10^(13); % planet mass
r = 1; % planet radius
h = 4; % orbital altitude
rel_basis = [-2 0 0;
             0 2 0;
             0 0 -2];
rel_home = [0; r + h; 0];

start_draw_orbital_motion;
start_draw_logs_orbmot;