// A_nametags_fnc_tags_position

#include "..\..\includes\macro.h"
#include "..\..\constants.h"


//player groupChat format["A_nametags_fnc_tags_position %1", _this];
ARGV(0,_target);


if (_target isKindOf "Man") exitWith {
	([_target] call A_nametags_fnc_tags_head_position)
};

private["_parts", "_pos", "_part"];
_parts = ["rotorShaft", "velka osa", "rotor_axis", "trup", "aimPoint", "zamerny", "pos driver", "pos cargo", ""];
_part = "";

_pos = [0,0,0];
{
	private["_cpart", "_cpos"];
	_cpart = _x;
	_cpos = _target selectionPosition _cpart;
	if (not(((_cpos select 0) == 0) && { ((_cpos select 1) == 0) && {((_cpos select 2) == 0)}})) exitWith {
		_pos = _cpos;
		_part = _cpart;
	};
} forEach _parts;

//player groupChat format["_part = %1, _pos = %2", _part, _pos];

if (_part == "" || ((_pos select 2) > 2)) exitWith {
	([_target] call A_nametags_fnc_tags_max_z)
};


//(_target modelToWorld (_pos))
visiblePosition _target
