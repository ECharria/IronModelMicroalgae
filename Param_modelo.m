% Strategy for Managing Industrial Anaerobic Sludge through the Heterotrophic Cultivation of Chlorella sorokiniana: Effect of Iron Addition on Biomass and Lipid Production
%
% Universidad Icesi
% Esteban Charria-Girón, Vanessa Amazo, Daniela De Angulo, Eliana Hidalgo, María Francisca Villegas-Torres, Frank Baganz, Nelson. H Caicedo.
%%
% Kinetic parameters for iron co-limitation model

function Pa=Param_modelo()

% Kinetic paramaters:
Pa.Ks=5.33;      % Glucose affinity constant [g/L]
Pa.Yxs=0.525;    % Substrate yield [g cell/g glucose]
Pa.Um= 0.2561;   % Maximum specific growth rate [1/h]
Pa.Um_Fe=0.58;   % Iron maximum specific growth rate [1/h]
Pa.Ks_Fe=12;     % Iron affinity constant [mg/L]
Pa.Ki_Fe=74;     % Iron inhibition constant [mg/L]   
Pa.Fo=0;         % Iron initial concentration [mgL] 
Pa.RFe=0.35;     % Iron first order consumption constant [1/g cell] 