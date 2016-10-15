// A_eh_fnc_player_connected
// event handler for player connected (only for server)

#include "header.h"


diag_log format['A_eh_fnc_player_connected (%1): start, isServer(%2)',_this,isServer];

params["_id","_uid","_name","_jip","_owner"];

_this call A_connection_fnc_player_connected_handler;


diag_log format['A_eh_fnc_player_connected (%1): end',_this];