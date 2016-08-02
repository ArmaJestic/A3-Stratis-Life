// A_paint_fnc_dialog_setup



private ["_DFML", "_shop", "_shop_change", "_P_1", "_P_2", "_cb_1", "_cb_2", "_index"];

_DFML = findDisplay 3004;


// Titles Texts
(_DFML displayCtrl 1001) ctrlSetText format['Camera Control'];
(_DFML displayCtrl 1002) ctrlSetText format ['Textures'];

(_DFML displayCtrl 1008) ctrlSetText format ['Custom Texture'];
(_DFML displayCtrl 1003) ctrlSetText format ['Style'];
(_DFML displayCtrl 1004) ctrlSetText format ['Format'];
(_DFML displayCtrl 1005) ctrlSetText format ['Width'];
(_DFML displayCtrl 1006) ctrlSetText format ['Height'];
(_DFML displayCtrl 1007) ctrlSetText format ['Minimaps'];

(_DFML displayCtrl 1009) ctrlSetText format ['Custom 1'];
(_DFML displayCtrl 1010) ctrlSetText format ['Custom 2'];
(_DFML displayCtrl 1011) ctrlSetText format ['Custom 3'];
(_DFML displayCtrl 1012) ctrlSetText format ['Custom 4'];
(_DFML displayCtrl 1013) ctrlSetText format ['Custom 5'];

// Button Texts
(_DFML displayCtrl 1700) ctrlSetText format ['Buy $%1', A_paint_var_cost];
(_DFML displayCtrl 1702) ctrlSetText format ['Reset $%1', A_paint_var_cost];
(_DFML displayCtrl 1701) ctrlSetText format ['Cancel - Close'];

(_DFML displayCtrl 1706) ctrlSetText format ['Zoom In'];
(_DFML displayCtrl 1707) ctrlSetText format ['Zoom Out'];

(_DFML displayCtrl 1708) ctrlSetText format ['Camera Front'];
(_DFML displayCtrl 1709) ctrlSetText format ['Camera Back'];
(_DFML displayCtrl 1710) ctrlSetText format ['Camera Left'];
(_DFML displayCtrl 1711) ctrlSetText format ['Camera Right'];

(_DFML displayCtrl 1713) ctrlSetText format ['Apply Texture'];
(_DFML displayCtrl 1712) ctrlSetText format ['Reset Slot'];
(_DFML displayCtrl 1705) ctrlSetText format ['Reset All'];

// Button actions
(_DFML displayCtrl 1700) buttonsetaction format ['[] call A_paint_fnc_buy'];
(_DFML displayCtrl 1702) buttonsetaction format ['[] call A_paint_fnc_r_buy'];
(_DFML displayCtrl 1701) buttonsetaction format ['closeDialog 0'];

(_DFML displayCtrl 1706) buttonsetaction format ['[1] call A_paint_fnc_preview_zoom;'];
(_DFML displayCtrl 1707) buttonsetaction format ['[2] call A_paint_fnc_preview_zoom;'];

(_DFML displayCtrl 1708) buttonsetaction format ['[1] call A_paint_fnc_preview_camera;'];
(_DFML displayCtrl 1709) buttonsetaction format ['[2] call A_paint_fnc_preview_camera;'];
(_DFML displayCtrl 1710) buttonsetaction format ['[3] call A_paint_fnc_preview_camera;'];
(_DFML displayCtrl 1711) buttonsetaction format ['[4] call A_paint_fnc_preview_camera;'];

(_DFML displayCtrl 1713) buttonsetaction format ['[] call A_paint_fnc_t_apply'];
(_DFML displayCtrl 1712) buttonsetaction format ['[] call A_paint_fnc_t_r_slot'];
(_DFML displayCtrl 1705) buttonsetaction format ['[] call A_paint_fnc_t_r_all'];


{
	_index	= lbAdd [2100, format["%1", (_x)]];
	lbSetData [2100, _index, _x];
} foreach A_paint_var_t_styles;

{
	_index	= lbAdd [2101, format["%1", (_x)]];
	lbSetData [2101, _index, _x];
} foreach A_paint_var_t_formats;

{
	_index	= lbAdd [2102, format["%1", (_x)]];
	lbSetData [2102, _index, format["%1", (_x)]];
} foreach A_paint_var_t_width;

{
	_index	= lbAdd [2103, format["%1", (_x)]];
	lbSetData [2103, _index, format["%1", (_x)]];
} foreach A_paint_var_t_height;

{
	_index	= lbAdd [2104, format["%1", (_x)]];
	lbSetData [2104, _index, format["%1", (_x)]];
} foreach A_paint_var_t_minimap;

{
	_index	= lbAdd [2105, format["%1", (_x select 1)]];
	lbSetData [2105, _index, format["%1", (_x select 0)]];
} foreach A_paint_var_t_custom;
