// A_connection_fnc_player_connected_handler

#include "..\..\includes\macro.h"


private["_id", "_name", "_uid"];
_id = _this select 0;
_name = _this select 1;
_uid = _this select 2;

publicVariable "legislation_laws";
publicVariable "INV_ItemTypenArray";
publicVariable "INV_ItemStocks";
publicVariable "INV_ItemMaxStocks";
