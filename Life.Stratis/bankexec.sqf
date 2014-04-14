#include "Awesome\Functions\macro.h"

_handler = [] execVM "bankvariables.sqf";
waitUntil {scriptDone _handler};

_handler = [] execVM "interest.sqf";

