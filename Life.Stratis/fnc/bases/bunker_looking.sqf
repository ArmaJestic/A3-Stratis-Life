// A_bases_fnc_bunker_looking

#include "header.h"


params["_player","_gate"];

private _gate_range = 150;
private _gate_angle_mid = getDir _gate;
private _gate_angle_min = _gate_angle_mid - _gate_range/2;
private _gate_angle_max = _gate_angle_mid + _gate_range/2;
private _direction = getDir (vehicle player);

_gate_angle_min = NORMALIZE_ANGLE(_gate_angle_min);
_gate_angle_max = NORMALIZE_ANGLE(_gate_angle_max);
_direction = NORMALIZE_ANGLE(_direction);

private _looking = false;
if (_gate_angle_min < _gate_angle_max) then {
	_looking = (_direction > _gate_angle_min) && {_direction < _gate_angle_max};
}else{
	_looking = ((_direction > _gate_angle_min) && {_direction < 360}) || {(_direction > 0) && {_direction < _gate_angle_max}};
};

_looking