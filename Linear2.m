
%%% Initialize
Population=1;
InitialPhosphate=1e2;
InitialEnergy=1e6;
Gen=50;
PopulationData=zeros(1,Gen);
PhosphateData=zeros(1,Gen);

% Generating Time Variance
Time=10.*ones(1,Gen);
for it=1:3:Gen
    Time(it)=Time(it)*1.5;
end

%%% Start Simulation
for Generation=1:1:Gen
    Phosphate=InitialPhosphate;
    Energy=InitialEnergy;
    % De-novo spawns
    Population=Population+1;
    
    for t=0:1:Time(Generation)
        
        % Prevent negative food
        if Phosphate < 0
            Phosphate = 0;
        end
        if Energy < 0
            Energy = 0;
        end
        
        Food=Energy/(Population+1);
        Energy=Energy-Population/3;
        Phosphate=Phosphate-log(Population)*Phosphate/InitialPhosphate;
        
        % Growth/Death
        if 1 < Food
            Population=Population*1.25;
        else
            Population=Population*Food*1.25;
        end
        
    end
    % Data Collection
    PopulationData(Generation)=Population;
    PhosphateData(Generation)=Phosphate;
    
    % Kill 90%
    Population=poissrnd(0.1*Population);
end