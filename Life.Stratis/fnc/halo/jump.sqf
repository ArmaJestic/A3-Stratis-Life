// A_halo_fnc_jump

#include "..\..\includes\macro.h"


//player groupchat "A_other_fnc_halo jump with delay!";
ARGV(0,_vehicle);
ARGV(1,_unit);

//_unit action ["getOut", _vehicle];
moveOut _unit;
_pos = getPosATL _unit;
_unit setvelocity [0,0,0];
_unit setPosATL [(_pos select 0), (_pos select 1) - 5, (_pos select 2)];
	
_height = _pos select 2;

[] spawn {
    private[ "_anim", "_canim"];
	_time_end = time + 10;
	_anim = "HaloFreeFall_non";
	format[' if (%1 != player) then { %1 switchMove "%2";};', player, _anim] call A_broadcast_fnc_broadcast;
	while { _time_end > time } do {
		_canim = animationState player;
		if ( _canim != _anim ) then {
			player switchMove _anim;
		};
		if (_canim == _anim) exitWith {
			[] spawn A_halo_fnc_start;
		};
	};
	format[' if (%1 != player) then { %1 switchMove "%2";};', player, _anim] call A_broadcast_fnc_broadcast;
};


[_height, _unit] spawn {
	ARGV(0,_height);
	ARGV(1,_unit);
	
	private ["_near", "_obj"];
	_near = nearestObject [_unit, "ParachuteBase"];
	[_unit] call A_halo_fnc_add_smoke_actions;
	while { _height > 1 } do {
		_obj = _unit;
		if (format["%1", _near] == "<NULL-object>") then {
			_near = nearestObject [_unit, "ParachuteBase"];
		}
		else {
			_obj = _near;
		};	
		
		hintSilent format["Altitude\n %1 meters\n Grid Reference \n %2\n Horizontal Speed \n %3 \n Vertical Speed\n %4", round(_height),  mapGridPosition _obj,round(speed _obj), round((velocity _obj) select 2)];
		_height = (getPosATL _unit) select 2;
	};
	[_unit] call A_halo_fnc_remove_all_smoke_actions;
	[_unit] call A_halo_fnc_deactivate_smoke;
	sleep 3;
	if (alive _unit) then {
		hint "Sucessful landing";
		_canim = (animationState player);
		_anim_list = ["halofreefall_non", "halofreefall_f", "halofreefall_b", "halofreefall_fr", "halofreefall_br", "halofreefall_fl", "halofreefall_bl"];
		//player groupChat format["_canim = %1", _canim];
		 
		if (_canim in _anim_list ) then {
			player groupChat "You have landed alive without parachute, miracle!";
			player switchMove "aidlpercmstpsraswrfldnon_idlesteady01n";
			[player, "halo_terminate", true] call A_object_fnc_setVariable;
		};
	} 
	else {
		hint "Fail landing";
	};	
};
