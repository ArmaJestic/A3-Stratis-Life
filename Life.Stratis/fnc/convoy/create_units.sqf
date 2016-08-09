// A_convoy_fnc_create_units

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

#define CONVOY_MSG_SPAWN 1
#define CONVOY_MSG_DRIVER_DEAD 2
#define CONVOY_MSG_DAMAGED 3
#define CONVOY_MSG_COMPLETE 4


ARGV(0,_truck);
ARGV(1,_location);

private["_convoy_group"];
_convoy_group = createGroup west;

{
	private["_data", "_name", "_class", "_weapons", "_magazines", "_commander"];
	_data = _x;
	_name = _data select A_convoy_var_unit_name;
	_class = _data select A_convoy_var_unit_class;
	_weapons = _data select A_convoy_var_unit_weapons;
	_magazines = _data select A_convoy_var_unit_magazines;
	_commander = _data select A_convoy_var_unit_commander;

	private["_unit"];
	_unit = _convoy_group createUnit [_class, _location, [], 0, "FORM"];
	
	/*
	_unit setVehicleInit format[
	'
		liafu = true;
		%1 = this; 
		this setSpeedMode "full"; 
		this allowFleeing 0;
		this setVehicleVarName "%1";
	', _name];
	processInitCommands;
	*/
	removeAllWeapons _unit;
	
	_unit addMPEventHandler ["MPKilled", { _this call A_player_fnc_handle_mpkilled }];
	
	_unit setSkill ["general", 0.86];
	_unit setSkill ["endurance", 1];
	_unit setSkill ["spotDistance", 1];
		
	{ _unit addWeapon _x } forEach _weapons;
	{ _unit addMagazine _x } forEach _magazines;
	
	if (_commander) then {
		_convoy_group selectLeader _unit;
		_unit moveInDriver _truck; 
		_unit assignAsDriver _truck;
		_unit setSkill ["commanding", 1];
	}else{
		_unit doFollow _truck;
		_unit moveInCargo _truck; 
		_unit assignAsCargo _truck;
	};
} forEach A_convoy_var_units;

_convoy_group setBehaviour "AWARE";
_convoy_group setCombatMode "RED";

sleep 2;
_convoy_group
