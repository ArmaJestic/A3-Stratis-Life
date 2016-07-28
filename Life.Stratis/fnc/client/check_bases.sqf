// A_client_fnc_check_bases

#include "..\..\includes\macro.h"


private["_vehicle"];
_vehicle = vehicle player;
if (admin_camera_on) exitWith {null};

{
	private["_base_check", "_faction_bool", "_trigger_area", "_teleport_height", "_teleport_marker", "_teleport_message"];
	_base_check = _x;
	
	_faction_bool = missionNamespace getVariable (_base_check select A_client_var_bases_check_faction_bool);
	_trigger_area = missionNamespace getVariable (_base_check select A_client_var_bases_check_trigger_area);
	_teleport_height = _base_check select A_client_var_bases_check_teleport_height;
	_teleport_marker = _base_check select A_client_var_bases_check_teleport_marker;
	_teleport_message = _base_check select A_client_var_bases_check_teleport_message;
	
	private["_altitude"];
	_altitude = (getPosATL _vehicle) select 2;
	
	if (_vehicle in (list _trigger_area) && (_altitude < _teleport_height) && not(_faction_bool)) exitWith {
		_vehicle setVelocity [0,0,0];
		_vehicle setPos (getMarkerPos _teleport_marker);
		player groupChat _teleport_message;
	};
} forEach A_client_var_bases_checks;
