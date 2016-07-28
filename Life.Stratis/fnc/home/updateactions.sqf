// A_home_fnc_updateactions



_home = _this select 0;
_A_home_var_object = _home select A_home_var_object;

if ((_home select A_home_var_ownership_action) >= 0) then {
	_action = _home select A_home_var_ownership_action;
	_home_object removeAction _action;
	_home set [A_home_var_ownership_action, -1];
};

if ((_home select A_home_var_locking_action) >= 0) then {
	_action = _home select A_home_var_locking_action;
	_home_object removeAction _action;
	_home set [A_home_var_locking_action, -1];
};

if ((_home select A_home_var_info_action) >= 0) then {
	_action = _home select A_home_var_info_action;
	_home_object removeAction _action;
	_home set [A_home_var_info_action, -1];
};

_cur_key = [_home] call A_home_fnc_getkey;
_my_key = [] call A_home_fnc_mykey;

// if I am not the owner, I want to see the home info
if (_my_key != _cur_key) then {        
	_action_id = _home_object addAction ["House information", "Awesome\Houses\homeactions.sqf", ["info", _home], 1];
	_home set [A_home_var_info_action, _action_id];
};


// if no owner, then home is for salae
if (_cur_key == "_" or _cur_key == "") then {
	_action_id = _home_object addAction [format["Buy this house ($%1)", _home select A_home_var_buying_price], "Awesome\Houses\homeactions.sqf", ["buy", _home], 1];
	_home set [A_home_var_ownership_action, _action_id];
	_home set [A_home_var_locked, false];
}else{
	//home has an owner, so it's not for sale

	if (_cur_key == _my_key) then {
		// I am the current owner
		_action_id = _home_object addAction [format["Sell this house ($%1)", _home select A_home_var_selling_price], "Awesome\Houses\homeactions.sqf", ["sell", _home], 1];
		_home set [A_home_var_ownership_action, _action_id];
		_A_home_var_locked = _home select A_home_var_locked;

		if (_home_locked) then {
			_action_id = _home_object addAction ["Unlock house", "Awesome\Houses\homeactions.sqf", ["unlock", _home], 1];
			_home set [A_home_var_locking_action, _action_id];
		}else{
			_action_id = _home_object addAction ["Lock house", "Awesome\Houses\homeactions.sqf", ["lock", _home], 1];
			_home set [A_home_var_locking_action, _action_id];
		};
	};
};
_home
