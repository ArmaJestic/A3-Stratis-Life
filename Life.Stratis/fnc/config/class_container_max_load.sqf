// A_config_fnc_class_container_max_load

#include "../../includes/macro.h"


//player groupChat format["A_config_fnc_class_container_max_load %1", _this];
ARGV(0,_container_id);
if (not([_container_id] call A_config_fnc_class_container)) exitWith {0};


private["_config"];
_config = (configFile >> "CfgVehicles" >> _container_id);
if (not(isNumber(_config >> "maximumload"))) exitWith {0};

(getNumber(_config >> "maximumload"))
