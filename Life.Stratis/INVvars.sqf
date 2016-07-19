#include "includes\macro.h"

INV_shortcuts  = true;
//INV_SperrenVerbotArray  = [[copbase1, 250],[mosqueprop, 120], [banklogic, 35], [pmcprop, 70], [tairspawn, 150], [asairspawn, 30], [airfacspawn, 30], [insvehspawn, 80],[redhelispawn, 100],[CopPrisonAusgang, 20]];

_handler = [] execVM "createfunctions.sqf";
waitUntil {scriptDone _handler};
_handler = [] execVM "carparks.sqf";
waitUntil {scriptDone _handler};
//_handler = [] execVM "masterarray.sqf";
//waitUntil {scriptDone _handler};
//_handler = [] execVM "Awesome\Scripts\optimize_2.sqf";
//waitUntil {scriptDone _handler};
_handler = [] execVM "Awesome\Scripts\shops.sqf";
waitUntil {scriptDone _handler};
_handler = [] execVM "facharvest.sqf";
waitUntil {scriptDone _handler};
