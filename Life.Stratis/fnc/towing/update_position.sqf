// A_towing_fnc_update_position

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_towing);
ARGV(1,_towed);
ARGV(2,_hitch);
ARGV(3,_dir_vector);
ARGV(4,_up_vector);
ARGV(5,_anchor);
ARGV(6,_towed_hitch_offset);

private["_dir_vector"];
_dir_vector = [(_towing modelToWorld _anchor), (_towed modelToWorld _towed_hitch_offset)] call A_vector_fnc_subtract;

private["_towed_pos", "_offset"];
_offset = [(_towed_hitch_offset select 0), - (_towed_hitch_offset select 1), (_towed_hitch_offset select 2)];
_towed_pos = _hitch modelToWorld _offset;

_bridge = (nearestObject [_towed, "Land_Bridge_01_PathLod_F"]);
if ((_towed distance _bridge) < 15) then {
	//special processing when crossing a bridge
	private["_ASL_pos", "_bridge_pos"];
	_bridge_pos = getPosASL _bridge;
	_ASL_pos = getPosASL _towing;
	_towed_pos set [2, (_bridge_pos select 2) + 0.9];
	_towed setPosASL _towed_pos;
	_towed setVectorUp [0,0,1];
	_towed setVectorDir _dir_vector;
}
else {
	_towed_pos set [2, 0];
	_towed setPos _towed_pos;
	_towed setVectorUp _up_vector;
	_towed setVectorDir _dir_vector;
	detach _towed;
	
};
