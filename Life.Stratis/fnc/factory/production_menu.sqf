// A_factory_fnc_production_menu

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

 _this spawn {
ARGV(0,_player);
ARGV(1,_factory_id);

if (!([_player] call A_player_fnc_human)) exitWith {null};
if (undefined(_factory_id)) exitWith {null};
if (typeName _factory_id != "STRING") exitWith {null};

private["_factory"];
_factory = [_factory_id] call A_factory_fnc_lookup_id;

if (!(createDialog "factory_dialog")) exitWith {hint "Dialog Error!";};

disableSerialization;

//set the factory being used, for other UI functions
A_factory_var_selected = _factory;
[] spawn {
	waitUntil { !(ctrlVisible factory_enqueue_list_idc) };
	A_factory_var_selected = null;
};

private["_factory_name"];
_factory_name = _factory  select factory_name;

[_factory_name] call A_factory_fnc_menu_setup;


call A_factory_fnc_update_enqueue_list;
call A_factory_fnc_update_queue_list;

private["_player", "_factory_id", "_item"];

buttonSetAction [factory_enqueue_button_idc, format['[%1, "%2", (lbData [factory_enqueue_list_idc, (lbCurSel factory_enqueue_list_idc)]), ([(ctrlText factory_amount_field_idc)] call A_misc_fnc_parse_number)] call A_factory_fnc_item_enqueue;', _player, _factory_id]];
buttonSetAction [factory_create_button_idc, format['[%1, "%2", (lbData [factory_enqueue_list_idc, (lbCurSel factory_enqueue_list_idc)]), ([(ctrlText factory_amount_field_idc)] call A_misc_fnc_parse_number)] call A_factory_fnc_item_create;', _player, _factory_id]];
buttonSetAction [factory_dequeue_button_idc, format['[%1, "%2", (lbData [factory_dequeue_list_idc, (lbCurSel factory_dequeue_list_idc)]), (lbCurSel factory_dequeue_list_idc)] call A_factory_fnc_item_dequeue;', _player, _factory_id]]; 
};
