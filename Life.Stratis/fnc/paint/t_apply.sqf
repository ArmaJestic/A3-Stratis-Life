// A_paint_fnc_t_apply



private ["_exit"];

P_T_SSlot = parseNumber (lbData [1502, (lbCurSel 1502)]);
P_T_SStyle = lbData [2100, (lbCurSel 2100)];
P_T_SFormat = lbData [2101, (lbCurSel 2101)];
P_T_SWidth = parseNumber (lbData [2102, (lbCurSel 2102)]);
P_T_SHeight = parseNumber (lbData [2103, (lbCurSel 2103)]);
P_T_SMap = parseNumber (lbData [2104, (lbCurSel 2104)]);
P_T_SCustom = lbData [2105, (lbCurSel 2105)];

P_T_C_1_1 = ctrlText 1400;
P_T_C_2_1 = ctrlText 1401;
P_T_C_3_1 = ctrlText 1402;
P_T_C_4_1 = ctrlText 1403;
P_T_C_5_1 = ctrlText 1404;

P_T_C_1	= ((parseNumber(P_T_C_1_1)) + 0);
P_T_C_2	= ((parseNumber(P_T_C_2_1)) + 0);
P_T_C_3	= ((parseNumber(P_T_C_3_1)) + 0);
P_T_C_4	= ((parseNumber(P_T_C_4_1)) + 0);

P_Texture = "";

_exit = false;

if ( (C_T_SStyle != "") && (C_T_SStyle != "custom") ) then {
	if ( (P_T_SWidth <= 0) || ((typeName P_T_SWidth) != "SCALAR") ) then {
		player groupchat "C ERROR: Incorrect Width Value";
		_exit = true;
	};
	if ( (P_T_SHeight <= 0) || ((typeName P_T_SHeight) != "SCALAR") ) then {
		player groupchat "C ERROR: Incorrect Height Value";
		_exit = true;
	};
	if ( (P_T_SMap <= 0) || ((typeName P_T_SMap) != "SCALAR") ) then {
		player groupchat "C ERROR: Incorrect Minimaps Value";
		_exit = true;
	};
};

if (_exit) exitWith {null};

switch P_T_SStyle do {
	case "color": {
		if ( (P_T_C_1) < 0 ) then { player groupchat "P ERROR: Red must be higher than or equal to 0"; _exit = true;};
		if ( (P_T_C_1) > 1  ) then { player groupchat "P ERROR: Red must be less than or equal to 1"; _exit = true; };
		
		if ( (P_T_C_2) < 0 ) then { player groupchat "P ERROR: Green must be higher than or equal to 0"; _exit = true; };
		if ( (P_T_C_2) > 1  ) then { player groupchat "P ERROR: Green must be less than or equal to 1"; _exit = true; };
		
		if ( (P_T_C_3) < 0 ) then { player groupchat "P ERROR: Blue must be higher than or equal to 0"; _exit = true; };
		if ( (P_T_C_3) > 1  ) then { player groupchat "P ERROR: Blue must be less than or equal to 1"; _exit = true; };
		
		if ( (P_T_C_4) < 0.5 ) then { player groupchat "P ERROR: Alpha must be higher than or equal to 0.5"; _exit = true; };
		if ( (P_T_C_4) > 1  ) then { player groupchat "P ERROR: Alpha must be less than or equal to 1"; _exit = true; };
		
		if ( _exit ) exitWith {null};
		
		P_Texture = format['#(%1,%2,%3,%4)color(%5,%6,%7,%8)', P_T_SFormat, P_T_SWidth, P_T_SHeight, P_T_SMap, P_T_C_1, P_T_C_2, P_T_C_3, P_T_C_4];
	};
	
	case "perlinNoise":{
		if ( (P_T_C_1) < 0 ) then { player groupchat "P ERROR: Specular must be higher than or equal to 0"; _exit = true;};
		
		if ( _exit ) exitWith {null};
		
		P_Texture = format['#(%1,%2,%3,%4)perlinNoise(%5,%6,%7,%8)', P_T_SFormat, P_T_SWidth, P_T_SHeight, P_T_SMap, P_T_C_1, P_T_C_2, P_T_C_3, P_T_C_4];
	};
	
	case "irradiance":{
		if ( (P_T_C_1) < 0 ) then { player groupchat "P ERROR: Specular must be higher than or equal to 0"; _exit = true;};
		
		if ( _exit ) exitWith {null};
		
		P_Texture = format['#(%1,%2,%3,%4)irradiance(%5)', P_T_SFormat, P_T_SWidth, P_T_SHeight, P_T_SMap, P_T_C_1];
	};
	
	case "fresnelGlass": {
		P_Texture = format['#(%1,%2,%3,%4)fresnelGlass()', P_T_SFormat, P_T_SWidth, P_T_SHeight, P_T_SMap];
	};
	
	case "waterIrradiance": {
		if ( (P_T_C_1) < 0 ) then { player groupchat "P ERROR: Specular must be higher than or equal to 0"; _exit = true;};
		
		if ( _exit ) exitWith {null};
		
		P_Texture = format['#(%1,%2,%3,%4)waterIrradiance(%5)', P_T_SFormat, P_T_SWidth, P_T_SHeight, P_T_SMap, P_T_C_1];
	};
	
	case "treeCrown":{
		if ( (P_T_C_1) < 0 ) then { player groupchat "P ERROR: Density must be higher than or equal to 0"; _exit = true;};
		
		if ( _exit ) exitWith {null};
		
		P_Texture = format['#(%1,%2,%3,%4)treeCrown(%5)', P_T_SFormat, P_T_SWidth, P_T_SHeight, P_T_SMap, P_T_C_1];
	};

	case "custom": {
		P_Texture = P_T_SCustom;
	};
};

if ( _exit ) exitWith {null};

if (P_Texture != "") then {
	player groupchat "Texture Applied";
	P_Preview_Unit setObjectTexture [P_T_SSlot, P_Texture];
	A_paint_var_t_p set [P_T_SSlot, P_Texture];
	P_T_Change = true;
};
