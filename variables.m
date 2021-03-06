function vars = variables()
    % find system variables and store in struct "vars"
    % Variables
    vars.E_1 = 8;
    vars.E_2 = 4;
    vars.E_3 = 13;

    vars.Va = 1430;     % Volume [m^3]
    vars.A_a = NaN;      % Area [m^2]
    vars.Ca = 1005;     % Specific heat {J/(kg K)}
    vars.rhoa = 1.2;    % specific mass [kg/m^3]   
    vars.alpha_a = NaN;  % Absorbation [-]
    vars.tau_a = NaN;    % Transmittance [-]
    vars.phi = 3;        % cross flow area m^2
    vars.g = 9.81;       % gravity [m/s^2]
    vars.H = 5;           % tower height [m]   
    vars.ha = 5;        % heat transfer coefficient [W/(m^2*K)]
    vars.ho = 25;        % heat transfer coefficient [W/(m^2*K)]
    vars.lambda = 4.5*10^-8; %heat transfer coefficient [W/(m^2K^4)]

    vars.V = [17.5,15,80];     % Volume [m^3]
    vars.A = [350,286,286];      % Area [m^2]
    vars.C = [900,840,840];     % Specific heat {J/(kg K)}
    vars.rho = [2500,2000,2000];    % specific mass [kg/m^3]   
    vars.alpha = [0.085,0.2,0.6];  % Absorbation [-]
    vars.tau = [0.9,NaN,NaN];    % Transmittance [-]
    % with w[1,2,3]=[Facade,Ceiling,Floor]

    vars.Beta = 10^6; %penalty factor [K^-2]
    vars.dt = 300; %5 min

    % Iterative variables
    for k=1:47
        vars.I(k)=300+vars.E_1;
        vars.T_o(k)=12+0.1*vars.E_2;
        vars.qpdot(k)=5000+10*vars.E_3;
    end
    for k=48:96
        vars.I(k)=700+vars.E_1;
        vars.T_o(k)=18+0.1*vars.E_2;
        vars.qpdot(k)=25000+10*vars.E_3;
    end
    for k=97:144
        vars.I(k)=300+vars.E_1;
        vars.T_o(k)=17+0.1*vars.E_2;
        vars.qpdot(k)=20000+10*vars.E_3;
    end
    vars.T_o = vars.T_o + 273;
    vars.Tsky = vars.T_o - 8;
    vars.Tref = 21+273; % Temperature reference [K]

end

