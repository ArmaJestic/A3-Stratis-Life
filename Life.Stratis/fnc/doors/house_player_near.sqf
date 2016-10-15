// A_doors_fnc_house_player_near

#include "header.h"


ARGV(0,_player);
private["_object"];
_object = cursorTarget;

if (!(_object isKindOf "House")) exitWith {null};

private["_neck_pos", "_pos1", "_pos2"];
_neck_pos = _player selectionPosition "neck";
_pos1 = player modelToWorld _neck_pos;
_pos2 = player modelToWorld [(_neck_pos select 0), (_neck_pos select 1) + 2, (_neck_pos select 2)];

private["_intersect"];
_intersect = [_object, "FIRE"] intersect [_pos1, _pos2];

if (count(_intersect) == 0) exitWith {null};

private["_name"];
_name = ((_intersect select 0) select 0);


private _data = [];
_data set [INDEX_OBJECT, _object];
_data set [INDEX_DOOR, _name];
_data