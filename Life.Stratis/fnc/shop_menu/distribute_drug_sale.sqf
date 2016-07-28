// A_shop_menu_fnc_distribute_drug_sale

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_shop_id);
ARGV(1,_total_due);

if (undefined(_total_due)) exitWith {null};
if (typeName _total_due != "SCALAR") exitWith {null};


private["_gang", "_gang_name", "_gang_members", "_income"];
_gang = [_shop_id] call A_shop_menu_fnc_get_gang_by_shop_id;

if (undefined(_gang)) exitWith {null};
_A_gang_var_name = _gang select A_gang_var_name;
_A_gang_var_members = _gang select A_gang_var_members;
_gang_members_count = (count _gang_members);
if (_gang_members_count == 0) exitWith {null};

_income = round(_total_due/_gang_members_count);
format['if((getPlayerUID player) in %1) then {player groupchat "You received $%2 from a drug sale"; [player, %2] call A_bank_fnc_transaction;};', _gang_members, strM(_income)] call A_broadcast_fnc_broadcast;
