#include "macro.h"
#include "constants.h"


if (not(undefined(hud_functions_defined))) exitWith {};


drawIcon3d__ = {
	//player groupChat format["drawIcon3d__ %1", _this];
	ARGV(0,_position);
	ARGV(1,_dimension);
	ARGV(2,_text);
	
	if (undefined(_position)) exitWith {};
	if (undefined(_text)) exitWith {};
	
	private["_pos"];
	_pos = (worldToScreen _position);
	if (count(_pos) == 0) exitWIth {
		drawicon3d_text_field ctrlShow false;
	};
	_pos = _pos  + _dimension;
	_pos set [0, ((_pos select 0) - (_dimension select 0)/2)];
	_pos set [1, ((_pos select 1) - (_dimension select 1)/2)];

	drawicon3d_text_field ctrlShow true;
	//drawicon3d_text_field ctrlSetBackgroundColor [1,0,0,0];
	drawicon3d_text_field ctrlSetStructuredText (parseText _text);
	drawicon3d_text_field ctrlSetPosition _pos;
	drawicon3d_text_field ctrlCommit 0;
};


hud_setup_drawicon3d = {
	10 cutRsc ["drawIcon3d_hud", "PLAIN"];
};


[] call hud_setup_drawicon3d;

hud_functions_defined = true;
