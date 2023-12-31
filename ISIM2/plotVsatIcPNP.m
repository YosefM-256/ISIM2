function results = plotVsatIcPNP(beta,Icset,pathsNconsts,simulationVariables)
    arguments                             
        beta                    double      {mustBePositive}
        Icset                   double      {mustBeNonempty, mustBePositive}
        pathsNconsts            struct
        simulationVariables     struct
    end

    informLog(["starting [Vsat - Ic](PNP) graph for beta=" num2str(beta)]);

    results = {};
    setCRes(0);
    CResNum = 0;
    setDAC1(0);
    setEpwr(1);

    for ic = Icset
        Icmsg = tuneToIc(ic);
        if Icmsg ~= "SUCCESS"
            error("TOP BREACH occured while tuning Ic to %d",ic);
        end
        betamsg = tuneToBeta();
        if betamsg ~= "SUCCESS"
            error("TOP BREACH occured while tuning beta to %d",beta);
        end
        results{end+1} = simulate(pathsNconsts,simulationVariables);
    end
    informProgress("[Vsat - Ic](NPN) graph successufully finished");
    results = cell2mat(results)
    
    function result = tuneToIc(ic)
        result = "SUCCESS";
        msg = tuneBy("Ic","DAC0",ic,"direct",pathsNconsts,simulationVariables);
        if msg == "TOP BREACH" && CResNum == 0  
            informLog(['TOP BREACH occured while trying to tune DAC1 for Ib=' num2str(ic) ...
                '.Switching to Rb=100 Ohm']);
            setCRes(1);
            CResNum = 1;
            msg = tuneToIc(ic);
        end
        if msg == "TOP BREACH" && CResNum == 1
            informLog(['the TOP BREACH for Ic=' num2str(ic) ' repeated when Rc=10 Ohm']);
            result = "TOP BREACH";
            return;
        end
    end
        
    function result = tuneToBeta
        result = "SUCCESS";
        msg = tuneBy("beta","DAC1",beta,"direct",pathsNconsts,simulationVariables);
        if msg == "TOP BREACH" && CResNum == 1
            informLog(['the TOP BREACH for beta=' num2str(beta) ' repeated when Rc=10 Ohm']);
            result = msg;
            return;
        end
        if msg == "TOP BREACH" && CResNum == 0  
            informLog(['TOP BREACH occured while trying to tune DAC1 for beta=' num2str(beta) ...
                '.Switching to Rb=100 Ohm']);
            setCRes(1);
            CResNum = 1;
            msg = tuneToIc(ic);
        end           
    end
end