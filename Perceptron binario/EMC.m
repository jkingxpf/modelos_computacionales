function emc = EMC(Target, Output)
    m = Target - Output;
    t = size(m);
    emc = sum(m^2)/t(1);
end