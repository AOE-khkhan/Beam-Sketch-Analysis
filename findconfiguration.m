function Configid=findconfiguration(force,WL,WR,PV1,PV2,TR)
Configid=1;
Pforce=~(isempty(force));
PWL=~(isempty(WL));
PWR=~(isempty(WR)) ;
PPV1=~(isempty(PV1));
PPV2=~(isempty(PV2));
PTR=~(isempty(TR));

if Pforce && PWL && ~PWR && ~PPV1 && ~PPV2 && ~PTR
    Configid=1;
elseif Pforce && PWR && ~PWL && ~PPV1 && ~PPV2 && ~PTR
    Configid=2;
elseif Pforce && PWL && ~PWR && PPV1 && ~PPV2 && ~PTR
    Configid=3;
end    