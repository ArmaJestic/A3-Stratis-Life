// A_prison_menu_fnc_menu_create

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_player);
ARGV(1,_prison_id);

if (not([_player] call A_player_fnc_exists)) exitWith {};
if (undefined(_prison_id)) exitWith {};
if (typeName _prison_id != "SCALAR") exitWith {};

private["_prison_data"];
_prison_data = [_prison_id] call A_prison_menu_fnc_lookup_id;
if (undefined(_prison_data)) exitWith {};

//player groupChat format["_prison_data = %1", _prison_data];
private["_prison_name"];
_prison_name = _prison_data select A_prison_menu_var_data_name;

[_player, _prison_name] call A_prison_menu_fnc_prison_menu_setup;
buttonSetAction [prison_menu_pay_button_idc, '[' + str(_player) + ', ([(ctrlText prison_bail_amount_field_idc)] call A_misc_fnc_parse_number)] call A_interaction_fnc_pay_bail; closeDialog 0'];
