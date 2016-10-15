// A_defaultSave_fnc_getLogicName
// gets save variable prefix, for use on server

#include "header.h"


private["_uid","_logicName"];
_uid = _this select 0;
_logicName = format["%1_%2", VAR_PREFIX, _uid];

_logicName