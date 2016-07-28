// A_nametags_fnc_tags_max_z

#include "..\..\includes\macro.h"
#include "..\..\constants.h"


private["_target"];
_target = _this select 0;

private["_bbox"];
_bbox = boundingBox _target;
_maxZ = (_bbox select 1) select 2;
_maxZ = if (_maxZ > 2) then { 1 } else {_maxZ};
_maxZ = _maxZ + 0.3;
(_target modelToWorld ([0,0,_maxZ]))
