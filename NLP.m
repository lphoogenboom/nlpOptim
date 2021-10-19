%% Variables
vars.E_1 = 8;
vars.E_2 = 4;
vars.E_3 = 13;

vars.V_a = 1430;     % Volume [m^3]
vars.A_a = NaN;      % Area [m^2]
vars.C_a = 1005;     % Specific heat {J/(kg K)}
vars.rho_a = 1.2;    % specific mass [kg/m^3]   
vars.alpha_a = NaN;  % Absorbation [-]
vars.tau_a = NaN;    % Transmittance [-]
vars.phi = 3;        %Area m^2



vars.V_w = [17.5,15,80];     % Volume [m^3]
vars.A_w = [350,286,286];      % Area [m^2]
vars.C_w = [900,840,840];     % Specific heat {J/(kg K)}
vars.rho_w = [2500,2000,2000];    % specific mass [kg/m^3]   
vars.alpha_w = [0.085,0.2,0.6];  % Absorbation [-]
vars.tau_w = [0.9,NaN,NaN];    % Transmittance [-]
% with w[1,2,3]=[Facade,Ceiling,Floor]

vars.dt = 300 %5 min

%% Iterative variables
for k=1:47
    vars.I(k)=300+vars.E_1;
    vars.T_o(k)=12+0.1*vars.E_2;
    vars.qp_dot(k)=5000+10*vars.E_3;
end
for k=48:96
    vars.I(k)=700+vars.E_1;
    vars.T_o(k)=18+0.1*vars.E_2;
    vars.qp_dot(k)=25000+10*vars.E_3;
end
for k=97:144
    vars.I(k)=300+vars.E_1;
    vars.T_o(k)=17+0.1*vars.E_2;
    vars.qp_dot(k)=20000+10*vars.E_3;
end