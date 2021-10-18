%% Variables
E_1 = 8;
E_2 = 4;
E_3 = 13;

V_a = 1430;     % Volume [m^3]
A_a = NaN;      % Area [m^2]
C_a = 1005;     % Specific heat {J/(kg K)}
rho_a = 1.2;    % specific mass [kg/m^3]   
alpha_a = NaN;  % Absorbation [-]
tau_a = NaN;    % Transmittance [-]

V_w = [17.5,15,80];     % Volume [m^3]
A_w = [350,286,286];      % Area [m^2]
C_w = [900,840,840];     % Specific heat {J/(kg K)}
rho_w = [2500,2000,2000];    % specific mass [kg/m^3]   
alpha_w = [0.085,0.2,0.6];  % Absorbation [-]
tau_w = [0.9,NaN,NaN];    % Transmittance [-]
% with w[1,2,3]=[Facade,Ceiling,Floor]

dt = 5 %min

%% Iterative variables
for k=1:47
    I(k)=300+E_1;
    T_o(k)=12+0.1*E_2;
    qp_dot(k)=5000+10*E_3;
end
for k=48:96
    I(k)=700+E_1;
    T_o(k)=18+0.1*E_2;
    qp_dot(k)=25000+10*E_3;
end
for k=97:144
    I(k)=300+E_1;
    T_o(k)=17+0.1*E_2;
    qp_dot(k)=20000+10*E_3;
end