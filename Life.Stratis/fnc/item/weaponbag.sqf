// A_item_fnc_weaponbag

#include "..\..\includes\macro.h"


_art = _this select 0;

if (_art == "use") then {
	_item   = _this select 1;
	_anzahl = _this select 2;

	if (vehicle player == player) then {
		_deleted = 0;
		
		{
			deleteVehicle _x;
			_deleted = _deleted + 1;
		} forEach (player nearObjects ["WeaponHolder", 5]);

		player groupChat format[localize "STRS_inv_items_weapondeleted", _deleted];
	}else{
		format ["clearWeaponCargo %1; clearMagazineCargo %1;", (vehicle player)] call A_broadcast_fnc_broadcast;
		player groupChat "STRS_inv_items_weaponcargocleared";
		_deleted = 1;
	};

	if (_deleted > 0) then {
		[player, _item, -(1)] call A_inventory_fnc_add_item;
	};
};