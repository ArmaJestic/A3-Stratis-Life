// A_item_fnc_defuser

#include "..\..\includes\macro.h"


_art = _this select 0;

if (_art == "use") then {
	_item   = _this select 1;
	_anzahl = _this select 2;
	_DefuseBombArray = ["TimeBomb", "Mine", "MineE", "BAF_ied_v1", "BAF_ied_v2", "BAF_ied_v3", "BAF_ied_v4"];
	if (undefined(INV_BombDefuserInUse)) then {
		INV_BombDefuserInUse = false;
	};

	if (!(INV_BombDefuserInUse)) then {
		INV_BombDefuserInUse = true;
		if (vehicle player == player) then {
			_bombs = [];

			{
				_bombs = _bombs + ( (position player) nearObjects  [_x, 3] );
			} forEach _DefuseBombArray;

			if (count _bombs > 0) then {

				if (random 100 < 99) then {
					player groupChat localize "STRS_inv_items_defuser_success";
					deletevehicle (_bombs select 0);
				}else{
					player groupChat localize "STRS_inv_items_defuser_failed";
					[(position player)] spawn A_misc_fnc_Bomb_Vehicle;
				};
			}else{
				player groupChat localize "STRS_inv_items_defuser_nobomb";
			};
		}else{
			for [{_i=0}, {_i < (count A_bombs_var_serverbombarray)}, {_i=_i+1}] do {
				if (((A_bombs_var_serverbombarray select _i) select 1) == (vehicle player)) exitWith {
					format["""%1"" call A_bombs_fnc_delete", ((A_bombs_var_serverbombarray select _i) select 0)] call A_broadcast_fnc_broadcast;
					[player, ((A_bombs_var_serverbombarray select _i) select 2), 1] call A_inventory_fnc_add_item;
					player groupChat localize "STRS_inv_items_defuser_success";
				};
			};
		};
		INV_BombDefuserInUse = false;
	};
};
