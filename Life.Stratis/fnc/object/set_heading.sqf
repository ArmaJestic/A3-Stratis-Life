// A_object_fnc_set_heading

#include "..\..\includes\macro.h"


params["_object","_data"];

// data is, [direction,angle,pitch]
// direction (yaw)
// angle (bank/roll)
// pitch (pitch)
// calculate is returning something off

private _vectors = [_data] call A_object_fnc_calculate_vectors;
diag_log format["A_object_fnc_set_heading(%1,%2):%3",_object,_data,_vectors];
_object setVectorDirAndUp _vectors;

// BIS fnc will not work, unless I have pitch and bank reversed (doubt it)
//_data params ["_dir","_bank","_pitch"];
//_object setDir _dir;
//[_object,_pitch,_bank] call BIS_fnc_setPitchBank;
//diag_log format["A_object_fnc_set_heading(%1,%2): up:%3, dir:%4",_object,_data,vectorUp _object, vectorDir _object];