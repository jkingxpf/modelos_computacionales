function[Input, Output, Target] = ValoresIOT(Data,W,i)
   Input = Data(i,1:end - 1);
   Output = [Input,-1] * W;
   Target = Data(i, end);

end