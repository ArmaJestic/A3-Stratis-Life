// A_vector_fnc_rotate3d
#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


params["_v1","_angle","_axis"];

private _matrix = [];
if (_axis == 0) then {
	//rotate around X axis
	_matrix = [[1, 0,           0              ],
			   [0, cos(_angle), -(sin(_angle)) ],
			   [0, sin(_angle), cos(_angle)    ]];
}else{
	if (_axis == 1) then {
		//rotate around Y axis
		_matrix = [[cos(_angle),    0, sin(_angle)],
				   [0,              1, 0          ],
				   [-(sin(_angle)), 0, cos(_angle)]];

	}else{
		if (_axis == 2) then {
			//rotate around Z axis
			_matrix = [[cos(_angle), -(sin(_angle)), 0],
					   [sin(_angle), cos(_angle),    0],
					   [0,           0,              1]];
		};
	};
};


([_matrix, _v1] call A_vector_fnc_matrixX)