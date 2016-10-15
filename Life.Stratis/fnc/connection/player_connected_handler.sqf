// A_connection_fnc_player_connected_handler

#include "..\..\includes\macro.h"


diag_log format['A_connection_fnc_player_connected_handler (%1): start, isServer(%2)',_this,isServer];
params["_id","_uid","_name","_jip","_owner"];

// don't need to do this, game handles public variable
// not all of these are PVed though
_owner publicVariableClient "legislation_laws";
_owner publicVariableClient "A_inv_var_ItemStocks";
_owner publicVariableClient "A_inv_var_ItemMaxStocks";

diag_log format['A_connection_fnc_player_connected_handler (%1): end',_this];