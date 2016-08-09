// A_nametags_fnc_tags_head_position

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


private["_target", "_pos", "_pos_x", "_pos_y", "_pos_z"];
_target = _this select 0;

private["_distance"];
_distance = player distance _target;


private["_pos", "_pos_x", "_pos_y", "_pos_z"];
_pos = (_target selectionPosition "neck");

_pos_x = (_pos select 0);
_pos_y = (_pos select 1);
_pos_z = (_pos select 2) + 0.2;

_pos_z = if (_pos_z > 1.6) then { 1.9 } else {_pos_z};
_pos =  [_pos_x, _pos_y, _pos_z];

(_target modelToWorld _pos)
