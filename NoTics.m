
%%% Initialize
Population=1;
InitialPhosphate=1e2;
Gen=50;
PopulationData=zeros(1,Gen);
PhosphateData=zeros(1,Gen);


%%% Start Simulation
for Generation=1:1:Gen
    Phosphate=InitialPhosphate;
    Energy=InitialEnergy;
    % De-novo spawns
    Population=Population+1;
    
    % Growth
    Population=Population*20;
    
    Phosphate = Phosphate-log(Population);
    
    if 1e8 < Population
        Population=0;
    end
    
    % Data Collection
    PopulationData(Generation)=Population;
    PhosphateData(Generation)=Phosphate;
    
    % Kill 90%
    Population=poissrnd(0.1*Population);
end