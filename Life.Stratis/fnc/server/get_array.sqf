// A_server_fnc_get_array

#include "../../includes/macro.h"


//player groupChat format["A_server_fnc_get_array %1", _this];
ARGV(0,_variable_name);

if (undefined(_variable_name)) exitWith {[]};

private["_variable_value"];
_variable_value = server getVariable _variable_name;
_variable_value = if (undefined(_variable_value)) then { [] } else { _variable_value };
_variable_value = if (typeName _variable_value != "ARRAY") then { [] } else {_variable_value };
_variable_value
