LoadPackage("automgrp");;
LoadPackage("json");;

UP_UNTIL_RADIUS := 10;

Grigorchuk_Group := AutomatonGroup("a=(1,1)(1,2),b=(a,c),c=(a,d),d=(1,b)");;
growth  := Growth(Grigorchuk_Group, UP_UNTIL_RADIUS);
growth_json := GapToJsonString(growth);;

PrintTo("./data/growth.json", growth_json);;

