// A_tree_fnc_average_grade

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


ARGV(0,_pos);

private["_i", "_px", "_py", "_step", "_x", "_y", "_angle"];
_i = 360;
_radius = 10;
_step = 4;
_px = _pos select 0;
_py = _pos select 1;

private["_total", "_count"];
_total = 0;
_count = 0;
while { _i > 0 } do {
	_x = _px + _radius * cos(_i);
	_y = _py + _radius * sin(_i);
	_angle = [(surfaceNormal [_x, _y]), [0,0,1]] call A_vector_fnc_angle;
	_total = _total +  _angle;
	_i = _i - _step;
	_count = _count + 1;
};
(_total / _count)