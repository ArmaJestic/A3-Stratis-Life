// A_towing_fnc_classes_setup

#include "../../includes/constants.h"
#include "../../includes/macro.h"


towing_data = [
	["B_Truck_01_covered_F", [0.05,-4.5,-1], [0.2,4.2,-1], [0,3,-1], [0,-3,-1], true, true],
	["C_Offroad_01_F", [0,-3,-0.7], [0,2.7,-0.5], [0,1.5,-1], [0,-2,-1], true, true],
	["Man", [0,0,0], [0,0,1],[0,0,0], [0,0,0], false, true]
];

towing_classes = [];
towed_classes = [];
{
	private["_entry", "_towing_enabled", "_class", "_towed_enabled"];
	_entry = _x;
	_class = _entry select A_towing_var_data_class;
	_towing_enabled = _entry select A_towing_var_data_towing_enabled;
	_towed_enabled = _entry select A_towing_var_data_towed_enabled;

	if (_towing_enabled) then {
		towing_classes set [count(towing_classes), _class];
	};

	if (_towed_enabled) then {
		towed_classes set [count(towed_classes), _class];
	};
} forEach towing_data;
