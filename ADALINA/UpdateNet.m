function [Wact] = UpdateNet(W,LR,Output,Target,Input)
%UPDATENET Summary of this function goes here
%   Detailed explanation goes here

%calculamos el delta del peso
pesoVar = LR*(Target-Output).*[Input -1]'; 
Wact = W + pesoVar; %sumamos al peso original

end

