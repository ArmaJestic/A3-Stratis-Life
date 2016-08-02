// Includes

// Pre checks
if (isMultiplayer) then {
	if (isDedicated) then {
		if (isServer) then {
			// Is dedicated server
		}else{
			if (hasInterface) then {
				// is player
			}else{
				// is headless client
			};
		};
	}else{
		diag_log "SL INIT ERROR: not dedicated game";
	};
}else{
	diag_log "SL INIT ERROR: not multiplayer game";
};

// isServer
// true if server

// isDedicated
// true if dedicated game

// isMultiplayer
// true if multiplayer

// hasInterface
// true if player, false if dedicated/headless


// required for function params
null = 0xe0ffffef;
null__ = {
	private["_variable_value"];
	_variable_value = _this;
	if (typeName _variable_value == "SCALAR" && {_variable_value == null}) exitWith {true};
	false
};