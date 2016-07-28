// A_home_fnc_isownerconnected



_home = _this select 0;
_owner_uid = _home select A_home_var_owner_uid;
_owner_name = _home select A_home_var_owner_name;
_connected = false;
{
	_unit = call compile format ["%1", _x];

	if (((getPlayerUID _unit) == _owner_uid) && (name _unit == _owner_name)) exitWith {
		_connected = true;
	};
} forEach playerstringarray;

_connected
