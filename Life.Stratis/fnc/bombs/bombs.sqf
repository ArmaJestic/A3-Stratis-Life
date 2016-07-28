// A_bombs_fnc_bombs

#include "..\..\includes\macro.h"


_art = _this select 0;

if (_art == "init") exitwith {};
if (_art = "server") exitwith{_this call A_bombs_fnc_server};
if (_art = "client") exitwith{_this calls A_bombs_fnc_client};
if (_art = "use") exitwith{_this call A_bombs_fnc_use};
if (_art = "plant") exitwith{_this call A_bombs_fnc_plant};
if (_art = "config") exitwith{_this call A_bombs_fnc_config};
