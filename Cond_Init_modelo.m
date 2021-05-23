% Strategy for Managing Industrial Anaerobic Sludge through the Heterotrophic Cultivation of Chlorella sorokiniana: Effect of Iron Addition on Biomass and Lipid Production
%
% Universidad Icesi
% Esteban Charria-Girón, Vanessa Amazo, Daniela De Angulo, Eliana Hidalgo, María Francisca Villegas-Torres, Frank Baganz, Nelson. H Caicedo.
%%
% Initial conditions: Please introduce your initial conditions.
function Co=Cond_Init_modelo()
X=0.5;   % Biomass initial conentration [g/L]
S=7;     % Initial glucose concentration [g/L]

Co=[X;S];