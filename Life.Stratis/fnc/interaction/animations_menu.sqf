// A_interaction_fnc_animations_menu

#include "../../includes/macro.h"
#include "../../includes/constants.h"
#include "../../includes/dikcodes.h"


ARGV(0,_player);

if (not([_player] call A_player_fnc_human)) exitWith {null};

private["_list"];

_list = [] call A_animations_menu_fnc_setup;

{
	private["_animation", "_name"];
	_animation = _x;
	_name = _animation select A_interaction_var_animation_display_name;
	_list lbAdd _name;
} forEach A_interaction_var_animation_list;

buttonSetAction [animations_menu_select_button_idc, '[(lbCurSel animations_menu_list_idc)] call A_interaction_fnc_animation_play; closedialog 0;'];
buttonSetAction [animations_menu_close_button_idc, 'closedialog 0;'];
