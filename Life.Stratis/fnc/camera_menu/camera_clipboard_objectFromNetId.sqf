// A_camera_menu_fnc_camera_clipboard_objectFromNetId

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


private["_netId"];
_netId = camera_clipboard;
private["_source"];
_source = objectFromNetId _netId;
if (isNil "_source" || {typeName _source != "OBJECT" || {isNull _source}}) exitWith {
	player groupChat format["Could not valid a valid object for netId(%1)", _netId];
	objNull
};
_source
