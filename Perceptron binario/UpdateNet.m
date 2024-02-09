function resultado = UpdateNet(W,LR,Output, Target, Input)
    dw = LR * (Target - Output) * [Input,-1]';
    resultado = W + dw;
end