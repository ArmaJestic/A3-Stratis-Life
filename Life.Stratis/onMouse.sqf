#include "Awesome\Functions\macro.h"
#include "Awesome\Functions\dikcodes.h"





mouseButtonDown_handler = {_this spawn {
	disableSerialization;
	//player groupChat format["mouseButtonDown_handler %1", _this];
	ARGV(0,_this);
	
	private["_player"];
	_player = player;
	
	
	ARGV(0,_display);
	ARGV(1,_button);
	ARGV(2,_x);
	ARGV(3,_y);
	ARGV(4,_shift);
	ARGV(5,_control);
	
	
	if (_button == 0) then {
		if ([_player] call A_drag_fnc_object_active) then {
			private["_object"];
			_object = [_player, "held_target", objNull] call A_object_fnc_getVariable;
			
			if (isNull _object) exitWith {};
			private["_item"];
			_item = [_object, "item", ""] call A_object_fnc_getVariable;
			if (_item == "knife") exitWith {
				[[_player, _object]] call A_interaction_fnc_use_knife;
			};
			
			if (_item == "woodaxe" || {_item == "pickaxe"}) exitWith {
				[[_player, _object]] call A_interaction_fnc_use_axe;
			};
			
			if (_item == "shovel") exitWith {
				[[_player, _object]] call A_quarry_fnc_interact_use_shovel;
			};
			
			if (_item == "bucket") exitWith {
				[[_player, _object]] call A_interaction_fnc_use_bucket;
			};
		};	
	};
	
	true
};};


remove_MouseButtonDown = {
	disableSerialization;
	private["_display"];
    _display = findDisplay 46;
	if (not(undefined(mouseButtonDown_id))) then {
		_display displayRemoveEventHandler  ["MouseButtonDown", mouseButtonDown_id];
		mouseButtonDown_id = null;
	};
};

setup_MouseButtonDown = {
	private["_data"];
	_data = _this;
	disableSerialization;
	private["_display"];
    _display = findDisplay 46;
	if ( undefined(mouseButtonDown_id) ) then {
		mouseButtonDown_id = _display displayAddEventHandler  ["MouseButtonDown", format["[_this, %1] call mouseButtonDown_handler", _data]];
		player groupChat format["mouseButtonDown_id = %1",mouseButtonDown_id];
	};
};


[] call setup_MouseButtonDown;
