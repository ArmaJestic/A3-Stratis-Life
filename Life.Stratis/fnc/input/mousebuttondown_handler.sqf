// A_input_fnc_mousebuttondown_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


params["_disp","_key","_x","_y","_shift","_ctrl","_alt"];
disableSerialization;

private _player = player;

// buttons
//		0, left
//		1, right
//		2, middle
//		3, back
//		4, forward

if (_key == 0) exitwith {
	if ([_player] call A_drag_fnc_object_active) then {
		private _object = [_player, "held_target", objNull] call A_object_fnc_getVariable;
		
		if (isNull _object) exitwith {};
		private _item = [_object, "item", ""] call A_object_fnc_getVariable;
		
		if (_item == "knife") exitwith {
			[_player, _object] spawn A_interaction_fnc_use_knife;
		};
		if ((_item == "woodaxe") || {_item == "pickaxe"}) exitwith {
			[_player, _object] spawn A_interaction_fnc_use_axe;
		};
		if (_item == "shovel") exitwith {
			[_player, _object] spawn A_quarry_fnc_interact_use_shovel;
		};
		if (_item == "bucket") exitwith {
			[_player, _object] spawn A_interaction_fnc_use_bucket;
		};
	};	
};

// return does not matter
// maybe for dialogs, not for "46"