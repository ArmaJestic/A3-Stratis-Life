// A_paint_fnc_init2


private ["_h", "_n"];
_n = count A_paint_var_t_width;

for [{_c = 1}, {_c <= 128}, {_c=_c * 2}] do
{
	A_paint_var_t_width set [_n, _c];
	_n = _n + 1;
};

_n = count A_paint_var_t_height;
for [{_c = 1}, {_c <= 128}, {_c=_c * 2}] do
{
	
	A_paint_var_t_height set [_n, _c];
	_n = _n + 1;
};

_n = count A_paint_var_t_minimap;
for [{_c = 1}, {_c <= 8}, {_c=_c+1}] do
{
	A_paint_var_t_minimap set [_n, _c];
	_n = _n + 1;
};