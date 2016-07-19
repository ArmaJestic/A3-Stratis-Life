// A_camera_fnc_export_tracked

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


    //player groupChat format["A_camera_fnc_export_tracked %1", _this];
    ARGV(0,_player);
   

private["_reference", "_roffset"];
_reference = A_camera_var_export_reference_object;
_roffset = [_reference, "offset", (_reference modelToWorld [0,0,0])] call A_object_fnc_getVariable;;
private["_objects"];
_objects = [(getPosASL _player), 500] call A_camera_fnc_near_tracked_objects;
player grouPChat format["_reference = %1", _reference];

    _str = 
"
//reference object 
private[""_ref""];
_ref = createVehicle [""Sign_Sphere10cm_F"", [0,0,0], [], 0, ""NONE""];
_ref setPos [0,0,0];
[_ref, [0,0,0]] call A_object_fnc_set_heading;

private[""_id""];
_id = """";

private[""_cv""];
//generic function for placing composition objects
_cv = A_object_fnc_editor_create;

";

private["_zref"];
_zref = (_reference == camera_setPos_reference);
    
    {
        private["_object", "_heading", "_offset", "_damage", "_simulation", "_class", "_attached", "_hidden"];
        _object = _x;
        _heading = [_object, "heading", [-1,-1,-1]] call A_object_fnc_getVariable;
	_offset =  [_object, "offset", [-1,-1,-1]] call A_object_fnc_getVariable;
	_offset = [((_offset select 0) - (_roffset select 0)), ((_offset select 1) - (_roffset select 1)), ((_offset select 2) - (_roffset select 2))];
	_damage  = [_object, "damage", false] call A_object_fnc_getVariable;
	_simulation = simulationEnabled _object;
	_attached = [_object, "attached", false] call A_object_fnc_getVariable;
	_name = [_object, "name", ""] call A_object_fnc_getVariable;
	_hidden = [_object, "hidden", false] call A_object_fnc_getVariable;
	
        _class = typeOf _object;
        _str = _str + '[' + str(_class) + ',' + str(_offset) + ',' + str(_heading) + ',' + str(_damage) + ',' + str(_simulation) + ',' + str(_attached) + ',' + str(_name) + ',' + str(_hidden) + ',_id,' +  str(_zref) + ',_ref] call _cv;' + toString[13,10];        
    } forEach _objects;

    "stdio" callExtension ("write(composition.sqf)" + _str);
    player groupChat format["%1 object exported", count(_objects)];
