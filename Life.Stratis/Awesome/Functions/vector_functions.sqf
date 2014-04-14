#include "constants.h"
#include "macro.h"

if (not(undefined(vector_functions_defined))) exitWith {};

draw_modelVector = {
	ARGV(0,_object);
	ARGV(1,_vector1)
	ARGV(2,_vector2);
	
	private["_pos1", "_pos2"];
	_pos1 = (_object modelToWorld _vector1);
	_pos2 = (_object modelToWorld _vector2);
	
	drawLine3D [_pos1, _pos2, [1,0,0,1]];	
};

vector_substract = {
	ARGV(0,_v1);
	ARGV(1,_v2);
	
	([((_v1 select 0) - (_v2 select 0)), ((_v1 select 1) - (_v2 select 1)), ((_v1 select 2) - (_v2 select 2))])
};

vector_add = {
	ARGV(0,_v1);
	ARGV(1,_v2);
	
	([((_v1 select 0) + (_v2 select 0)), ((_v1 select 1) + (_v2 select 1)), ((_v1 select 2) + (_v2 select 2))])
};

vector_interpolate = {
	private["_v1", "_v2", "_p"];
	_v1 = _this select 0;
	_v2 = _this select 1;
	_p = _this select 2;
	private["_V1x", "_V1y", "_V1z", "_V2x", "_V2y", "_V2z"];
	_V1x = _v1 select 0;
	_V1y = _v1 select 1;
	_V1z = _v1 select 2;
	
	_V2x = _v2 select 0;
	_V2y = _v2 select 1;
	_V2z = _v2 select 2;
	
	[ (_V1x + ((_V2x - _V1x)*_p)), (_V1y + ((_V2y - _V1y)*_p)),  (_V1z + ((_V2z - _V1z)*_p))]
};

vector_dotp = {
	ARGV(0,_v1);
	ARGV(1,_v2);
	(((_v1 select 0) * (_v2 select 0)) + ((_v1 select 1) * (_v2 select 1)) + ((_v1 select 2) * (_v2 select 2)))
};

vector_magnitude = {
	ARGV(0,_v1);
	(sqrt((_v1 select 0)^2  + (_v1 select 1)^2 + (_v1 select 2)^2))
};

vector_angle = {
	ARGV(0,_v1);
	ARGV(1,_v2);
	
	_v1m = [_v1] call vector_magnitude;
	_v2m = [_v2] call vector_magnitude;
	_vdp = [_v1, _v2] call vector_dotp;
	
	private["_m"];
	_m = (_v1m * _v2m);
	if (_m == 0) exitWith {0};
	
	(acos(_vdp / _m))
};

vector_nomalize = {
	private["_v1"];
	_v1 = _this select 0;
	
	private["_len"];
	_len = sqrt((_v1 select 0)^2 + (_v1 select 1)^2 + (_v1 select 2)^2);
	if (_len == 0) exitWith {[0,0,0]};
	([(_v1 select 0)/(_len), (_v1 select 1)/(_len), (_v1 select 2)/(_len)])
};

vector_resize = {
	private["_v1", "_len"];
	_v1 = _this select 0;
	_len = _this select 1;
	
	private["_n"];
	_n = [_v1] call vector_nomalize;
	([(_n select 0)*(_len), (_n select 1)*(_len), (_n select 2)*(_len)])
};



matrix_X_vector = {
	ARGV(0,_m);
	ARGV(1,_v);
	
	([
	   (((_v select 0) * ((_m select 0) select 0)) + ((_v select 1) * ((_m select 0) select 1)) + ((_v select 2) * ((_m select 0) select 2))),
	   (((_v select 0) * ((_m select 1) select 0)) + ((_v select 1) * ((_m select 1) select 1)) + ((_v select 2) * ((_m select 1) select 2))),
	   (((_v select 0) * ((_m select 2) select 0)) + ((_v select 1) * ((_m select 2) select 1)) + ((_v select 2) * ((_m select 2) select 2)))
	 ])
};

vector_3d_rotate = {
	ARGV(0,_v1);
	ARGV(1,_angle);
	ARGV(2,_axis);
	
	private["_matrix"];
	if (_axis == 0) then {
		//rotate around X axis
		_matrix = [[1, 0,           0              ],
				   [0, cos(_angle), -(sin(_angle)) ],
				   [0, sin(_angle), cos(_angle)    ]];
	};
	
	if (_axis == 1) then {
		//rotate around Y axis
		_matrix = [[cos(_angle),    0, sin(_angle)],
				   [0,              1, 0          ],
		           [-(sin(_angle)), 0, cos(_angle)]];
	
	};
	
	if (_axis == 2) then {
		//rotate around Z axis
		_matrix = [[cos(_angle), -(sin(_angle)), 0],
				   [sin(_angle), cos(_angle),    0],
		           [0,           0,              1]];
	};
	
	([_matrix, _v1] call matrix_X_vector)
};

vector_functions_defined = true;