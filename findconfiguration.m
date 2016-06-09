function [Configid,cantileverflag]=findconfiguration(force,WL,WR,PV1,PV2,TR,udl,uvl)
Configid=1;
cantileverflag=0;
Pforce=~(isempty(force));
PWL=~(isempty(WL));
PWR=~(isempty(WR)) ;
PPV1=~(isempty(PV1));
PPV2=~(isempty(PV2));
PTR=~(isempty(TR));
Pudl=~(isempty(udl));
Puvl=~(isempty(uvl));
endsupports=[PWL ,PWR ,PPV1,PPV2]; 
if (Pforce || Pudl || Puvl) && sum(endsupports)==1
    cantileverflag=1;
end
if cantileverflag==1
    if Pforce && sum([PWL,PWR])==1 && ~PPV1 && ~PPV2 && ~PTR && ~Pudl && ~Puvl
        Configid=1;
    elseif ~Pforce && sum([PWL,PWR])==1 && ~PPV1 && ~PPV2 && ~PTR && Pudl && ~Puvl
        Configid=2;
    elseif ~Pforce && sum([PWL,PWR])==1 && ~PPV1 && ~PPV2 && ~PTR && ~Pudl && Puvl
        Configid=3;   
    elseif ~Pforce && sum([PWL,PWR])==1 && ~PPV1 && ~PPV2 && PTR && ~Pudl && ~Puvl
        Configid=4;       
    end
else   
    if Pforce && sum([PWL,PWR])==0 && sum([PPV1,PPV2])>0 && ~PTR && ~Pudl && ~Puvl
        Configid=1;
    elseif ~Pforce && sum([PWL,PWR])==0 && PPV1 && PPV2 && ~PTR && Pudl && ~Puvl
        Configid=3;
    elseif ~Pforce && sum([PWL,PWR])==0 && PPV1 && PPV2 && PTR && ~Pudl && ~Puvl
        Configid=4;   
    elseif ~Pforce && sum([PWL,PWR])==0 && PPV1 && PPV2 && ~PTR && ~Pudl && Puvl
        Configid=5;       
    end
end    