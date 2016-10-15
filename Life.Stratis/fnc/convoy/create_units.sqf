// A_convoy_fnc_create_units

#include "header.h"


params["_truck","_location"];

private _convoy_group = createGroup west;
{
	private _data = _x;
	private _name = _data select INDEX_NAME;
	private _class = _data select INDEX_CLASS;
	private _weapons = _data select INDEX_WEAPONS;
	private _magazines = _data select INDEX_MAGAZINES;
	private _commander = _data select INDEX_COMMANDER;
	
	private _unit = _convoy_group createUnit [_class, _location, [], 0, "FORM"];
	
	_unit setSpeedMode "full"; 
	_unit allowFleeing 0;
	missionNamespace setVariable[_name,_unit,true];
	removeAllWeapons _unit;
	
	_unit addMPEventHandler ["MPKilled", A_player_fnc_handle_mpkilled];
	
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

_convoy_group