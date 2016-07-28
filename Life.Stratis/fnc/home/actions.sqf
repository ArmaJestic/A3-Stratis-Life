// A_home_fnc_actions



_target = _this select 0;
_arguments = _this select 3;

_action_name = _arguments select 0;
_home   = _arguments select 1;


if (_action_name == "buy" ) then {
	_moneh  = [player, 'money'] call A_inventory_fnc_get_item_amount;
	_cost = (_home select A_home_var_buying_price);
	if (_moneh < _cost) 
		exitWith {player groupChat "Not enough money in your inventory to buy this house";};
	
	[player, 'money', -(_cost)] call A_inventory_fnc_add_item;

	[_home] call A_home_fnc_buy;  
	
	if(true) exitWith {null};
};

if (_action_name == "sell") then {
	_moneh  = [player, 'money'] call A_inventory_fnc_get_item_amount;
	_cost = (_home select A_home_var_selling_price);

	[player, 'money', (_cost)] call A_inventory_fnc_add_item;
	[_home] call A_home_fnc_sell;
	
	if(true) exitWith {null};
};

if (_action_name == "lock") then
{
	[_home] call A_home_fnc_lock;
	if(true) exitWith {null};
};

if (_action_name == "unlock") then
{
	[_home] call A_home_fnc_unlock;
	if(true) exitWith {null};
};

if (_action_name == "info") then
{
	[_home] call A_home_fnc_info;
	if(true) exitWith {null};
};
