function resultado  = CheckPattern(Data, W)
    r = true;
    i = 1;
    while r && i < size(Data,1)
        [Input,Output,Target] = ValoresIOT(Data,W,i);

        r = Output == Target;
        i = i + 1;
    end

    resultado = r;
end