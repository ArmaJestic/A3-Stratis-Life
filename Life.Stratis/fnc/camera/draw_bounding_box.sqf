// A_camera_fnc_draw_bounding_box

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


ARGV(0,_o);
ARGV(1,_color);


if (UNDEFINED(_o) || {isNull _o}) exitWith {};

private["_bb"];
_bb = boundingBoxReal _o;

private["_p1", "_p2", "_p3", "_p4"];
_p1 = (_bb select 0);
_p2 = (_bb select 1);
private["_p1x", "_p1y", "_p1z", "_p2x", "_p2y", "_p2z", "_w", "_h", "_d"];
_p1x = _p1 select 0;
_p1y = _p1 select 1;
_p1z = _p1 select 2;
_p2x = _p2 select 0;
_p2y = _p2 select 1;
_p2z = _p2 select 2;
_h = _p2z - _p1z;
_w = _p2y - _p1y;
_d = _p2x - _p1x;

private["_p3", "_p4", "_p5", "_p6", "_p7", "_p8"];
_p3 = [_p1x, (_p1y + _w), (_p1z)];
_p4 = [(_p1x + _d), (_p1y + _w), _p1z];
_p5 = [_p1x, (_p1y + _w), (_p1z + _h)];
_p6 = [_p1x, _p1y, (_p1z + _h)];
_p7 = [(_p1x + _d), _p1y, (_p1z + _h)];
_p8 = [(_p1x + _d), _p1y, _p1z];


drawLine3D [ (_o modelToWOrld _p3), (_o modelToWorld _p1), _color];
drawLine3D [ (_o modelToWOrld _p1), (_o modelToWorld _p6), _color];
drawLine3D [ (_o modelToWOrld _p6), (_o modelToWorld _p7), _color];
drawLine3D [ (_o modelToWOrld _p7), (_o modelToWorld _p2), _color];
drawLine3D [ (_o modelToWOrld _p2), (_o modelToWorld _p4), _color];
drawLine3D [ (_o modelToWOrld _p4), (_o modelToWorld _p3), _color];
drawLine3D [ (_o modelToWOrld _p3), (_o modelToWorld _p5), _color];
drawLine3D [ (_o modelToWOrld _p5), (_o modelToWorld _p2), _color];
drawLine3D [ (_o modelToWOrld _p5), (_o modelToWorld _p6), _color];
drawLine3D [ (_o modelToWOrld _p1), (_o modelToWorld _p8), _color];
drawLine3D [ (_o modelToWOrld _p8), (_o modelToWorld _p4), _color];
drawLine3D [ (_o modelToWOrld _p8), (_o modelToWorld _p7), _color];
