figure; [hAx,hL1,hL2] = plotyy(X,Y1*1000/0.674,X,Y2,'scatter');
hL1.Marker='.';hL1.MarkerEdgeColor='r';
hL2.Marker='.';
set(hAx(1),'XColor','k','YColor','r');
set(get(hAx(1),'Ylabel'),'string','Power(nW)');
set(hAx(2),'XColor','k','YColor','b');
set(get(hAx(2),'Ylabel'),'string','Power(uW)');


xlabel('Detector at 1550nm(V)');
ylabel('Detector at 1630nm(V)');