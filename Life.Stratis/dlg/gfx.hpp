class GFX_GrafikEinstellungenDialog {

	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {
		sichtweite_text, 
		sichtweite_button1, 
		Sichtweite_button2, 
		terrain_text, 
		terrain_button1, 
		terrain_button2,
		button_close, 
		dummybutton
	};

	class DLG_BACK1: Rscbackground {
		x = 0.38; y = 0.17;
		w = 0.24; h = 0.38;
	};

	class background : RscBgRahmen {
		x = 0.38; y = 0.17;
		w = 0.24; h = 0.38;
		text = $STRD_grafikeinstellungen_header;
	};

	class sichtweite_text : RscText {
		x = 0.40; y = 0.21;
		w = 0.20; h = 0.04;
		style = ST_CENTER;
		SizeEX = 0.04;
		text = $STRD_grafikeinstellungen_header_viewdistance;
	};

	class sichtweite_button1 : RscButton {
		x = 0.41; y = 0.27;
		w = 0.07; h = 0.04;
		text = "-100";
		action = "if (A_settings_var_gfx_armaviewdistance >= 100) then {A_settings_var_gfx_armaviewdistance = A_settings_var_gfx_armaviewdistance - 100; setViewDistance A_settings_var_gfx_armaviewdistance; player groupChat format['Viewdistance: %1', A_settings_var_gfx_armaviewdistance];};";
	};

	class Sichtweite_button2 : RscButton {
		x = 0.51; y = 0.27;
		w = 0.07; h = 0.04;
		text = "+100";
		action = "if (A_settings_var_gfx_armaviewdistance <= 5000) then {A_settings_var_gfx_armaviewdistance = A_settings_var_gfx_armaviewdistance + 100; setViewDistance A_settings_var_gfx_armaviewdistance; player groupChat format['Viewdistance: %1', A_settings_var_gfx_armaviewdistance];};";
	};

	class terrain_text : RscText {
		x = 0.40; y = 0.33;
		w = 0.20; h = 0.04;
		style = ST_CENTER;
		SizeEX = 0.04;
		text = $STRD_grafikeinstellungen_header_terrain;
	};

	class terrain_button1 : RscButton {
		x = 0.45; y = 0.38;
		w = 0.03; h = 0.04;
		text = "-";
		action = "if (A_settings_var_gfx_armaterraingridssel > 0) then {A_settings_var_gfx_armaterraingridssel = A_settings_var_gfx_armaterraingridssel - 1; setTerrainGrid(A_settings_var_gfx_armaterraingrids select A_settings_var_gfx_armaterraingridssel); player groupChat format['Terrain Detail: %1/%2.', (A_settings_var_gfx_armaterraingridssel+1), (count A_settings_var_gfx_armaterraingrids)];};";
	};

	class terrain_button2 : RscButton {
		x = 0.51; y = 0.38;
		w = 0.03; h = 0.04;
		text = "+";
		action = "if (A_settings_var_gfx_armaterraingridssel < ((count A_settings_var_gfx_armaterraingrids)-1)) then {A_settings_var_gfx_armaterraingridssel = A_settings_var_gfx_armaterraingridssel + 1; setTerrainGrid(A_settings_var_gfx_armaterraingrids select A_settings_var_gfx_armaterraingridssel); player groupChat format['Terrain Detail: %1/%2.', (A_settings_var_gfx_armaterraingridssel+1), (count A_settings_var_gfx_armaterraingrids)];};";
	};

	class button_close : RscButton {
		x = 0.40; y = 0.48;
		w = 0.20; h = 0.04;
		idc = 10;
		text = $STRD_grafikeinstellungen_close;
		action = "closedialog 0;";
	};
	class dummybutton : RscDummy {idc = 1004;};
};
