// A_jip_fnc_execute

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

_this spawn {
	ARGV(0,_arguments);
	ARGV(1,_method);
	if (undefined(_arguments)) exitWith {};
	if (undefined(_method)) exitWith {};
	if (typeName _method != "CODE") exitWith {};

	_arguments call _method;
};
