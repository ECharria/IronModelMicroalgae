% Strategy for Managing Industrial Anaerobic Sludge through the Heterotrophic Cultivation of Chlorella sorokiniana: Effect of Iron Addition on Biomass and Lipid Production
%
% Universidad Icesi
% Esteban Charria-Girón, Vanessa Amazo, Daniela De Angulo, Eliana Hidalgo, María Francisca Villegas-Torres, Frank Baganz, Nelson. H Caicedo.
%
%%
% The present script allows the user to the iron co-limitation effect on
% the heterotrophic growth of microalgae. For this purpose, the user first
% needs to determine the model paramaters using fminsearch function or the
% one chosen by preference.

% In the present example, the script is intended to model the effect of
% iron addition during the heterotropic culture of C.sorokiniana.
%%
function Iron_CoLimitation_Model()
%clear all;
%close all;
%clc;

% In the following lines please introduce experimental data as x and y-vectors 

% First set of data:
x=[0 13 18.5 20.5 22.5 24.5];
y=[0.47 2.6 3.73 4 4.12 4.16];

% Second set of data:
y1=[0.47 2.65 3.76 4.1 4.25 4.42];
y2=[0.47 2.7 3.77 4.19 4.5 4.72];


% Initial conditions (Co): Create an array with your initial conditions
Co=Cond_Init_modelo();

% Kinetic parameters (Pa): Create an array with your kinetic parameters
Pa=Param_modelo();

% Numerical solution to ODE from Iron co-limitation model for 30 h of culture:
options=odeset('NonNegative',[1;2]);
[t,f]=ode45(@Dinamic,[0 30],Co,options,Pa);


% Figures set-up for growth and substrate consumption kinetics:
for i=1:2
    
    figure(i)
plot(t,f(:,i),'k','LineWidth',1)

 hold on

end

options=odeset('NonNegative',[1;2]);
[t,f2]=ode45(@Dinamic2,[0 30],Co,options,Pa);

for i=1:2
    
    figure(i)
    
plot(t,f2(:,i),'r','LineWidth',1)

hold on
 if i==1
    xlabel('Time (h)')
    ylabel('Biomass (g L^{-1})')
    s1=scatter(x,y,'LineWidth',1);
    s1.Marker = 's';
    s1.MarkerEdgeColor= 'k';
    s2=scatter(x,y2,'LineWidth',1);
    s2.Marker = 's';
    s2.MarkerEdgeColor= darkgreen;
    s3=scatter(x,y1,'LineWidth',1);
    s3.Marker = 's';
    s3.MarkerEdgeColor= darkgreen;
    legend({'0 mg L^{-1} FeCl-{3}','12 mg L^{-1} FeCl-{3}','60 mg L^{-1} FeCl-{3}'},'Location','east','Orientation','vertical')
 
 elseif i==2
    
    xlabel('Time (h)')
    ylabel('Glucose (g L^{-1})')
   
 end
end
return;

function f = Dinamic(t,f,Pa)
    
X=f(1); % Biomass  [g/L]
S=f(2); % Glucose  [g/L]


f(1)= ((Pa.Um*S)/(Pa.Ks+S))*X;                   %[g cell/(h*L)]
f(2)= -(1/Pa.Yxs)*f(1);                          %[g glucose/(h*L]


return
%%
%%
function f2= Dinamic2(t,f2,Pa)

X=  f2(1);  %Biomass
S=  f2(2);  %Glucose

if t<17

f2(1)= ((Pa.Um*S)/(Pa.Ks+S))*X;                                  %[g cells/(h*L)]
f2(2)= -(1/Pa.Yxs)*f2(1);                                        %[g glucose/(h*L)]

else 
Fe=60;    

U_max=(Pa.Um_Fe*Fe)/(Pa.Ks_Fe+Fe+((Fe^2)/(Pa.Ki_Fe)));           %[1/h]

f2(1)= (((U_max)*S)/(Pa.Ks+S))*X;                                %[g cells/(h*L)]
f2(2)= -(1/((U_max/Pa.Um)^Pa.Ks_Fe*Pa.Yxs))*f2(1);               %[g glucose/(h*L)]

end
return