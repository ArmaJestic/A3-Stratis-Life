// A_server_fnc_drug_replenish

#include "header.h"


{
	private _gang_area = _x;
	if (!([_gang_area] call A_gang_fnc_area_neutral)) exitWith {};
	
	private _shop_id = _gang_area call A_inventory_fnc_get_shop_number;
	
	if(_gang_area == gangarea1) then {
		[_shop_id, "lsd", 1] call A_server_fnc_shop_drug_replenish;
		sleep 1;
		[_shop_id, "cocaine", 2] call A_server_fnc_shop_drug_replenish;
		sleep 1;
		[_shop_id, "marijuana", 3] call A_server_fnc_shop_drug_replenish;
		sleep 1;
	};
	if(_gang_area == gangarea2) then {
		[_shop_id, "lsd", 2] call A_server_fnc_shop_drug_replenish;
		sleep 1;
		[_shop_id, "cocaine", 2] call A_server_fnc_shop_drug_replenish;
		sleep 1;		
	};
	if(_gang_area == gangarea3) then {
		[_shop_id, "heroin", 2] call A_server_fnc_shop_drug_replenish;
		sleep 1;
		[_shop_id, "marijuana", 3] call A_server_fnc_shop_drug_replenish;
		sleep 1;	
	};
} forEach A_main_var_gangareas;