Rmin=100;xmin=[];
for i=1:20
d_layers0=[200 360 100 340 200 360]+100*(rand(1,6)-0.5)*2;

% opt=optimoptions(@fmincon,'Display','iter');
% problem=createOptimProblem('fmincon',...
%     'lb',[0,0,0,0,0,0],'ub',[1,1,1,1,1,1]*1e3,...
%     'objective',@DEstim_fun,...
%     'x0',d_layers0,...
%     'options',opt);
% gs=GlobalSearch;   
% [x,f]=run(gs,problem)

% options=gaoptimset('Display','iter','InitialPopulation',...
%     d_layers0,'PopInitRange',[0;500],'Generations',100,'PopulationSize',20,...
%     'FitnessLimit',5);
% x=ga(@DEstim_fun,6,[],[],[],[],[],[],[],options)


% lb=[0,0,0,0,0,0];
% ub=[1,1,1,1,1,1]*1e3;
options = optimoptions(@lsqnonlin,'Algorithm','levenberg-marquardt','Display','off');
[x,resnorm] =lsqnonlin(@DEstim_fun,d_layers0,[],[],options)

if Rmin>resnorm
    xmin=x
    Rmin=resnorm
end
if Rmin<1e-3 
    break;
end
end