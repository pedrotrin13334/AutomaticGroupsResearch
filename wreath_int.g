LoadPackage("automgrp");;
LoadPackage("json");;

UP_UNTIL_RADIUS := 10;

wreath_group := AutomatonGroup("a=(1,a,1)(1, 2), b=(b,1,a)");;
growth  := Growth(Grigorchuk_Group, UP_UNTIL_RADIUS);
growth_json := GapToJsonString(growth);;

PrintTo("./data/growth.json", growth_json);;