// A_config_fnc_class_container

#include "../../includes/macro.h"


//player groupChat format["A_config_fnc_class_container %1", _this];
ARGV(0,_container_id);
if (undefined(_container_id)) exitWith {false};
if (typeName _container_id != "STRING") exitWith {false};

private["_parent"];
_parent = configName(inheritsFrom(configFile >> "CfgVehicles" >> _container_id));

(_parent == toLower("ContainerSupply"))
