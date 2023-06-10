function circuitPanel = createDiagram(fig) 
    close all;
    circuitPanel = uipanel(fig,'Units','Pixels',"Position",[0 0 360 300]);
    %linkdata on;
    global circuitDiagram; circuitDiagram = struct();
    circuitDiagram.DAC1 = annotation(circuitPanel,"textbox",'Units','Pixels','Position',[55 55 50 30], ...
        "HorizontalAlignment","center","VerticalAlignment","middle", ...
        'String',"-","FontSize",8);
    circuitDiagram.L0 = annotation(circuitPanel,"Line",'Units','Pixels','Position',[105 70 30 0]);
    circuitDiagram.RBbranch.RB = annotation(circuitPanel,"textbox",'Units','Pixels', ...
        'Position',[135 62 40 16],'String','100',"HorizontalAlignment","center","VerticalAlignment", ...
        "middle","FontSize",6);
    circuitDiagram.Ib = annotation(circuitPanel,"arrow",'Units','Pixels','Position',[195 75 30 0]);
    circuitDiagram.L5 = annotation(circuitPanel,"Line",'Units','Pixels','Position',[175 70 65 0]);
    circuitDiagram.DUT = annotation(circuitPanel,"ellipse",'Units','Pixels','Position',[240 50 40 40]);
    circuitDiagram.textDUT = annotation(circuitPanel,"textbox",'Units','Pixels','Position',[240 50 40 40], ...
        "String","DUT","HorizontalAlignment","center","VerticalAlignment","middle",...
        "EdgeColor",'none');
    circuitDiagram.EpwrPinBox.ground.groundbox = annotation(circuitPanel,"rectangle","Units","pixels","Position", ...
        [240 45 40 -40]);
    circuitDiagram.EpwrPinBox.ground.L0 = annotation(circuitPanel,"Line",'Units','Pixels','Position',[250 30 20 0]);
    circuitDiagram.EpwrPinBox.ground.L1 = annotation(circuitPanel,"Line",'Units','Pixels','Position',[255 25 10 0]);
    circuitDiagram.EpwrPinBox.ground.L2 = annotation(circuitPanel,"ellipse",'Units','Pixels','Position',[259 20 2 2]);
    circuitDiagram.EpwrPinBox.ground.L3 = annotation(circuitPanel,"Line",'Units','Pixels','Position',[260 45 0 -15]);
    circuitDiagram.EpwrPinBox.high = annotation(circuitPanel,"textbox","Units","pixels","Position", ...
        [240 45 40 -40],"EdgeColor","red","VerticalAlignment","middle","HorizontalAlignment","center", ...
        "String","5V","Color","red","Visible","off");    
    circuitDiagram.L6 = annotation(circuitPanel,"Line",'Units','Pixels','Position',[260 50 0 -5]);
    circuitDiagram.L9 = annotation(circuitPanel,"Line",'Units','Pixels','Position',[260 90 0 40]);
    circuitDiagram.Ic = annotation(circuitPanel,"arrow",'Units','Pixels','Position',[265 125 0 -30]);
    circuitDiagram.Ictext = annotation(circuitPanel,"textbox",'Units','Pixels','Position',[280 110 20 10] ...
        ,'String',"-","HorizontalAlignment","center","VerticalAlignment","middle","EdgeColor",'none', ...
        "FontSize",8);
    circuitDiagram.VcArrow = annotation(circuitPanel,"arrow",'Units','Pixels','Position',[294 94 -36 -4],'Color', ...
        'r','HeadStyle','ellipse','HeadLength',4,'HeadWidth',4,'LineStyle',':');
    circuitDiagram.Vctext = annotation(circuitPanel,"textbox",'Units','Pixels','Position',[304 94 20 10] ...
        ,'String',"-","HorizontalAlignment","center","VerticalAlignment","middle","EdgeColor",'none' ...
        ,'Color','r',"FontSize",8);
    circuitDiagram.RC1branch.W1 = annotation(circuitPanel,"Line",'Units','Pixels','Position',[260 130 30 0]);
    circuitDiagram.RC0branch.W1 = annotation(circuitPanel,"Line",'Units','Pixels','Position',[260 130 -30 0]);
    circuitDiagram.RC1branch.W0 = annotation(circuitPanel,"Line",'Units','Pixels','Position',[290 130 0 30]);
    circuitDiagram.RC0branch.W0 = annotation(circuitPanel,"Line",'Units','Pixels','Position',[230 130 0 30]);
    circuitDiagram.RC0branch.RC0 = annotation(circuitPanel,"textbox",'Units','Pixels', ...
        'Position',[222 160 16 40],'String','1K',"HorizontalAlignment","center", ...
        "VerticalAlignment","middle","FontSize",6);
    circuitDiagram.RC1branch.RC1 = annotation(circuitPanel,"textbox",'Units','Pixels', ...
        'Position',[282 160 16 40],'String','10',"HorizontalAlignment","center", ...
        "VerticalAlignment","middle","FontSize",6);
    circuitDiagram.RC1branch.W2 = annotation(circuitPanel,"Line",'Units','Pixels','Position',[290 200 0 30]);
    circuitDiagram.RC0branch.W2 = annotation(circuitPanel,"Line",'Units','Pixels','Position',[230 200 0 30]);
    circuitDiagram.RC0branch.W3 = annotation(circuitPanel,"Line",'Units','Pixels','Position',[260 230 -30 0]);
    circuitDiagram.RC1branch.W3 = annotation(circuitPanel,"Line",'Units','Pixels','Position',[260 230 30 0]);
    circuitDiagram.L16 = annotation(circuitPanel,"Line",'Units','Pixels','Position',[260 230 0 30]);
    circuitDiagram.L17 = annotation(circuitPanel,"Line",'Units','Pixels','Position',[260 260 -50 0]);
    circuitDiagram.DAC0 = annotation(circuitPanel,"textbox",'Units','Pixels','Position',[210 275 -50 -30], ...
        "HorizontalAlignment","center","VerticalAlignment","middle", ...
        'String',"-","FontSize",8);
    circuitDiagram.Ibtext = annotation(circuitPanel,"textbox",'Units','Pixels','Position',[180 80 20 10] ...
        ,'String',"-","HorizontalAlignment","center","VerticalAlignment","middle","EdgeColor",'none' ...
        ,"FontSize",8);
    circuitDiagram.VbArrow = annotation(circuitPanel,"arrow",'Units','Pixels', ...
        'Position',[230 50 9 21],'Color','r','HeadStyle','ellipse','HeadLength',4, ...
        'HeadWidth',4,'LineStyle',':');
    circuitDiagram.Vbtext = annotation(circuitPanel,"textbox",'Units','Pixels','Position',[200 40 20 10] ...
        ,'String',"-","HorizontalAlignment","center","VerticalAlignment","middle","EdgeColor",'none' ...
        ,'Color','r',"FontSize",8);
    circuitDiagram.Vcbtext = annotation(circuitPanel,"textbox",'Units','Pixels','Position',[40 180 100 10] ...
        ,'String',"Vcb = -","HorizontalAlignment","left","VerticalAlignment","middle","EdgeColor",'none' ...
        ,"FontSize",8,'Color','red');
    circuitDiagram.Vcetext = annotation(circuitPanel,"textbox",'Units','Pixels','Position',[40 165 100 10] ...
        ,'String',"Vce = -","HorizontalAlignment","left","VerticalAlignment","middle","EdgeColor",'none' ...
        ,"FontSize",8,'Color','red');
    circuitDiagram.Vbetext = annotation(circuitPanel,"textbox",'Units','Pixels','Position',[40 150 100 10] ...
        ,'String',"Vbe = -","HorizontalAlignment","left","VerticalAlignment","middle","EdgeColor",'none' ...
        ,"FontSize",8,'Color','red');
    circuitDiagram.RCnum = -1;
    circuitDiagram.RBnum = -1;
    circuitDiagram.IbArrowDirection = 1;
    circuitDiagram.EpwrPin = 0;
end
