// A_trunk_fnc_get_uuid

#include "..\..\includes\macro.h"


_name = (name player);
_uid = (getPlayerUID player);
_result = format["%1_%2", _name, _uid];
_result
