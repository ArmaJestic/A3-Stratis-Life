// A_vehicle_fnc_lockpick

#include "..\..\includes\macro.h"


private["_item"];
ARGV(0,_item);	
_incarpark = false;
_vehicle  = [10] call INV_LocateClosestVehicle;
		
if (undefined(_vehicle)) exitWith {
	player groupChat "No vehicle close enough";
};
		
if (([player, _vehicle] call A_vehicle_fnc_owner)) exitWith {	
	player groupChat "You already own this vehicle.";
};
player groupChat format["lockpicking %1", _vehicle];
[player, _item, -1] call A_inventory_fnc_add_item;
format ["%1 switchmove ""AinvPknlMstpSlayWrflDnon_medic"";", player] call broadcast;

{
	if (_vehicle in (list _x)) then {
		_incarpark = true;
	};
} forEach INV_VehicleGaragen;	

private["_near_cops", "_near_civilians"];
_near_cops = [player, 40] call A_player_fnc_near_cops;
_near_civilians = [player, 40] call A_player_fnc_near_civilians;
	
if ((random 100) < lockpickchance) then {
	[player, _vehicle] call A_vehicle_fnc_add;
	player groupChat localize "STRS_inventar_lockpick_success";		
	
	if ((_near_cops || _near_civilians || _incarpark) && not(isblu)) then {
		private["_message"];
		_message =  format["%1 was seen stealing a vehicle (registration plate: %2)!", player, _vehicle];
		format['hint (toString(%1));', toArray(_message)] call broadcast;
		[player, "vehicle theft", 10000] call A_player_fnc_update_warrants;
	};
}
else {																																						
	player groupChat localize "STRS_inventar_lockpick_noluck";
	
	if ((_near_cops || _near_civilians || _incarpark) && not(isblu)) then { 
		[player, "attempted vehicle theft", 2000] call A_player_fnc_update_warrants;
		private["_message"];
		_message = format["%1 was seen attempting to lockpick a vehicle (Registration plate: %2)", player, _vehicle];
		format['hint (toString(%1));', toArray(_message)] call broadcast;
	};			
};
