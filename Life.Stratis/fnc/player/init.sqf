// A_player_fnc_init

#include "header.h"


private _player = [player,objNull] select isServer;
role = _player;
rolestring = [str(_player),""] select isServer;
rolenumber = [((A_player_var_playerstringarray find rolestring)+1),0] select isServer;

isciv = [_player] call A_player_fnc_civilian;
isblu = [_player] call A_player_fnc_blufor;
isopf = [_player] call A_player_fnc_opfor;
isind = [_player] call A_player_fnc_independent;

if (!isServer) then {
	_player addMPEventHandler["MPKilled", A_player_fnc_handle_mpkilled];
	_player addMPEventHandler["MPRespawn", A_player_fnc_handle_mprespawn];
};