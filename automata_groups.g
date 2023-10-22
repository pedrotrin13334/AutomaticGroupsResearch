loadPackage("automgrp");;
Grigorchuk_Group := AutomatonGroup("a=(1,1)(1,2),b=(a,c),c=(a,d),d=(1,b)");;
growth1 := Growth(Grigorchuk_Group, 10);;
growth2 := Growth(FreeGroup(3), 10);;
