#include "Awesome\Functions\macro.h"

petrol_refuel_tank = {
	private ["_fuel", "_fuelstartposition", "_liter_price"];
	
	_liter_price = _this select 0;
	if (undefined(_liter_price)) exitWith {null};
	if (typeName _liter_price != "SCALAR") exitWith {null};
	
	_fuel = fuel (vehicle player);
	_fuelstartposition = getpos(vehicle player);

	private["_liters_consumed", "_refuel_cost", "_vehicle"];
	_liters_consumed = 0;
	_refuel_cost = 0;
	_vehicle = vehicle player;
	
	[_vehicle, true] call petrol_set_refueling;
	call petrol_remove_refuel_action;
	
	while {((fuel _vehicle) < 0.99)} do {
		private["_cvehicle", "_next_cost", "_player_money"];
		_next_cost = round((_liters_consumed + fuel_pump_rate) * _liter_price);
		_player_money = ([player, 'money'] call A_inventory_fnc_get_item_amount);
		if (_player_money < _next_cost ) exitWith {
			player groupChat "You don't have enough money to refuel the vehicle completely.";
		};

		_cvehicle = vehicle player;
	
		if (_vehicle != _cvehicle) exitWith {
			player groupChat "Stay inside the car while you are refueling it";
		};

		if (_vehicle distance _fuelstartposition > 3) exitWith {
			player groupChat "You cancelled the refuel-action by moving your vehicle";
		};
		
		private["_i"];
		_i = 0;
		while { _i < fuel_pump_rate && ((fuel _vehicle) < 0.99)} do {
			_vehicle setFuel ((fuel _vehicle) + 0.01);
			_liters_consumed = _liters_consumed + 1;
			_i = _i + 1;
		};
		
		titleText [ format["Refueling %1%2 ...", round(fuel _vehicle * 100), "%"], "PLAIN DOWN"];
		sleep 1;
	};
	
	call petrol_remove_refuel_action;
	[_vehicle, false] call petrol_set_refueling;
	
	if (_liters_consumed > 0) then {
		
		_refuel_cost = round((_liters_consumed * _liter_price));
		_percent_refueled =  round(fuel _vehicle * 100);
		titleText[format["Your total refueling cost was $%1, your vehicle is now %2%3 full.", _refuel_cost, _percent_refueled, "%"], "PLAIN DOWN"];
		[_liters_consumed] call A_shop_menu_fnc_update_fuel_consumed;
		[player, 'money', -(_refuel_cost)] call A_inventory_fnc_add_item;
	};
};

petrol_set_refueling = {
	private["_vehicle", "_state"];
	
	_vehicle = _this select 0;
	_state = _this select 1;
	
	if (undefined(_vehicle)) exitWith {null};
	if (undefined(_state)) exitWith {null};
	if (typeName _state != "BOOL") exitWith {null};
	
	[_vehicle, "refueling", _state] call A_object_fnc_setVariable;
	
};

petrol_get_refueling = {
	private["_vehicle", "_state"];
	
	_vehicle = _this select 0;
	if (undefined(_vehicle)) exitWith {null};
	
	_state = [_vehicle, "refueling"] call A_object_fnc_getVariable;
	if (undefined(_state)) exitWith { false };
	if (typeName _state != "BOOL") exitWith { false };
	_state
};

petrol_get_nearest_station = {
	private["_distance", "_station"];
	
	_max_distance = _this select 0;
	_station = null;
	_distance = -1;
	
	{
		private["_cdistance", "_cstation"];
		_cstation = _x;
		_cdistance  = (player distance _cstation);
	
		if (_distance < 0 || _cdistance <= _distance) then {
			_distance = _cdistance;
			_station = _cstation;
		};	
	} foreach GasStationArray;
	
	
	if (_distance > _max_distance) exitWith {null};
	_station
};


petrol_get_refuel_vehicle = {
	private["_vehicle"];
	_vehicle = [player, "refuel_vehicle"] call A_object_fnc_getVariable;
	if (undefined(_vehicle)) exitWith {null};
	_vehicle
};


petrol_get_refuel_action = {
	private["_vehicle"];
	_vehicle = call petrol_get_refuel_vehicle;
	if (undefined(_vehicle)) exitWith {-1};
	_refuel_action = [_vehicle, "refuel_action"] call A_object_fnc_getVariable;;
	_refuel_action = if (undefined(_refuel_action)) then { -1 } else { _refuel_action };
	_refuel_action
};

petrol_set_refuel_action = {
	private["_action"];
	_vehicle = _this select 0;
	_action = _this select 1;
	
	if (undefined(_vehicle)) exitWith {null};
	if (undefined(_action)) exitWith {null};
	if (typeName _action != "SCALAR") exitWith {null};

	[_vehicle, "refuel_action", _action] call A_object_fnc_setVariable;
	[player, "refuel_vehicle", _vehicle] call A_object_fnc_setVariable;
};

petrol_add_refuel_action = {
	private["_liter_price", "_refuel_cost", "_liters_missing",  "_vehicle"];
	
	_vehicle  = vehicle player;
	_liter_price = call A_shop_menu_fnc_get_fuel_price;
	_liters_missing = round((1 - (fuel _vehicle)) * 100);
	_refuel_cost = round(_liters_missing *  _liter_price);
	
	if (_refuel_cost <= 0) exitWith {null};
	if (([_vehicle] call petrol_get_refueling)) exitWith {null};
	
	
	_refuel_action = _vehicle addAction [format["Fill gas tank for $%1", _refuel_cost], "noscript.sqf", format["[%1] call petrol_refuel_tank", _liter_price], 1];
	
	[_vehicle, _refuel_action] call petrol_set_refuel_action;
	
};

petrol_remove_refuel_action = {
		private["_vehicle"];
		

		_vehicle = call petrol_get_refuel_vehicle;
		if (undefined(_vehicle)) exitWith {null};
		_refuel_action = call petrol_get_refuel_action;
		if (_refuel_action < 0) exitWith {null};
		
		_vehicle removeAction _refuel_action;
		[_vehicle, -1] call petrol_set_refuel_action;
};


petrol_check_actions = {
	private["_vehicle", "_station", "_refuel_action"];
	
	_vehicle  = vehicle player;
	_station = [16] call petrol_get_nearest_station;
	_isDriver = (_vehicle != player) && ((driver _vehicle) == player);
	_isNearStation = (_isDriver && defined(_station));
	
	_refuel_action = call petrol_get_refuel_action;
	
	if (_isNearStation && _refuel_action < 0 ) then {
		call petrol_add_refuel_action;
	} 
	else { if (not(_isNearStation) && _refuel_action >= 0) then {
		call petrol_remove_refuel_action;
	};};
};

petrol_actions_loop = {
	{_x setFuelCargo 0} foreach (nearestobjects [getpos copbase1, ["Land_FuelStation_Feed_F"], 6000]);
	_count = count GasStationArray;
	while {true} do {
		call petrol_check_actions;
		sleep 3;
	};
};

[] spawn petrol_actions_loop;
