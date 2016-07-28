// A_input_fnc_surrender_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


//player groupChat format["A_input_fnc_surrender_handler %1", _this];
if(!INV_shortcuts) exitWith {false};
if (A_main_var_keyblock) exitWith {
	player groupChat format["WARNING: This A_actions_fnc_action is temporarily blocked"];
};

if(vehicle player != player) exitWith {false};
A_main_var_keyblock=true; [] spawn {
	sleep 2; 
	A_main_var_keyblock=false;
};

private["_state"];
_state = (animationState player);
if (_state == "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon") then {
	[[player], "A_player_fnc_unsurrender_animation", true] call BIS_fnc_MP;
}	
else {
	[[player], "A_player_fnc_surrender_animation", true] call BIS_fnc_MP;
};
true
