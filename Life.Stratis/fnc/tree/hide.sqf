// A_tree_fnc_hide

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


player groupChat format["A_tree_fnc_hide %1", _this];
ARGV(0,_tree);
ARGV(1,_target);

private["_grade"];
_grade = [(getPos _tree)] call A_tree_fnc_average_grade;
player grouPchat format["AVERGAGE GRADE: %1", _grade];

if (_grade > 15) exitWith {
	_tree setDamage 1;
};


if (!((damage _tree) >= 1)) then {
	_tree setDamage 1;
	sleep 2;
};

if (typeName _target == "OBJECT" && {local(_target)}) then {
	[_tree] call A_tree_fnc_local_hide;
}else{
	[[_tree], "A_tree_fnc_local_hide", _target, false] call BIS_fnc_MP;
};

if ((damage _tree) >= 1) then {
	sleep 2;
	_tree setDamage 0;
};
