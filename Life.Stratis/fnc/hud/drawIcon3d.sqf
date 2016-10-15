// A_hud_fnc_drawIcon3d__

#include "header.h"


params["_position","_dimension","_text"];

if (UNDEFINED(_position)) exitWith {};
if (UNDEFINED(_text)) exitWith {};

private _pos = (worldToScreen _position);
if (count(_pos) == 0) exitWIth {
	drawicon3d_text_field ctrlShow false;
};
_pos = _pos  + _dimension;
_pos set[0, ((_pos select 0) - (_dimension select 0)/2)];
_pos set[1, ((_pos select 1) - (_dimension select 1)/2)];

drawicon3d_text_field ctrlShow true;
//drawicon3d_text_field ctrlSetBackgroundColor [1,0,0,0];
drawicon3d_text_field ctrlSetStructuredText (parseText _text);
drawicon3d_text_field ctrlSetPosition _pos;
drawicon3d_text_field ctrlCommit 0;