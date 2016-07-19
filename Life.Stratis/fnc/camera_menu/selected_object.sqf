// A_camera_menu_fnc_selected_object

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


private["_object", "_object_netid"];
_object_netid = (lbData [camera_menu_object_field_idc, lbCurSel camera_menu_object_field_idc]);
if (undefined(_object_netid)) exitWith {objNull};
if (typeName _object_netid != "STRING") exitWith {objNull};
_object = objectFromNetId(_object_netid);
_object
