#include "constants.h"

class free_camera {
    idd = free_camera_dialog_idd;
    movingEnable = true;
    controlsBackground[] = {
        DLG_BACK1, DLG_BACK2, DLG_BACK3, DLG_BACK4
    };
    
    objects[] = {};
    controls[] = { 
		free_cam_button_left, 
		free_cam_button_right, 
		free_cam_button_up, 
		free_cam_button_down, 
		free_cam_button_nv_on, 
		free_cam_butotn_nv_off, 
		free_cam_button_stop, 
		free_cam_button_close, 
		VL1, VL2, VL3, VL4, VL5, VL6, VL7, VL8, VL9,
		HL1, HL2, HL3, HL4, HL5, HL6, HL7,
		cross_horizontal, 
		cross_vertical,
		free_cam_slider_zoom, 
		free_cam_slider_light
	};
   
    class VL1: RscText{
        x = 0.100; y = 0.200;
        w = 0.001; h = 0.600;
        colorBackground[] = {1,1,1,0.1};
    };
    
    class VL2: VL1 {
        x = 0.2;
    };
    
    class VL3: VL1 {
        x = 0.3;
    };
    
    class VL4: VL1 {
        x = 0.4;
    };
    
    class VL5: VL1 {
        x = 0.5;
    };
    
    class VL6: VL1 {
        x = 0.6;
    };
    
    class VL7: VL1 {
        x = 0.7;
    };
    
    class VL8: VL1 {
        x = 0.8;
    };
    
    class VL9: VL1 {
        x = 0.9;
    };
    
    class HL1: RscText{
        x = 0.100; y = 0.200;
        w = 0.800; h = 0.001;
        colorBackground[] = {
            1,1,1,0.1
        };
    };
    
    
    class HL2: HL1 {
        y = 0.3;
    };
    
    class HL3: HL1 {
        y = 0.4;
    };
    
    class HL4: HL1 {
        y = 0.5;
    };
    
    class HL5: HL1 {
        y = 0.6;
    };
    
    class HL6: HL1 {
        y = 0.7;
    };
    
    class HL7: HL1 {
        y = 0.8;
    };
    
    class DLG_BACK1: Rscbackground {
        x = -1.00; y = 0.00;
        w =  3.00; h = 0.20;
        colorBackground[] = {0,0,0,1};
    };
	
    class DLG_BACK2: Rscbackground {
        x = -1.00; y = 0.80;
        w =  3.00; h = 0.20;
        colorBackground[] = {0,0,0,1};
    };

    class DLG_BACK3: Rscbackground{
        x = -1.00; y = -1.00;
        w = 1.10; h = 3.00;
        colorBackground[] = {0,0,0,1};
    };
    
    class DLG_BACK4: Rscbackground{
        x = 0.90; y = -1.00;
        w = 1.10; h = 3.00;
        colorBackground[] = {0,0,0,1};
    };
    
    class cross_horizontal: RscText{
        x = 0.465; y = 0.500;
        w = 0.070; h = 0.002;
        colorBackground[] = {1,0.9,0.9,0.2};
    };
    
    class cross_vertical: RscText{
        x = 0.500; y = 0.465;
		w = 0.002;h = 0.070;
        colorBackground[] = {1,0.9,0.9,0.2};
    };
    
    class free_cam_button_left: RscMenuButton {
        idc = free_camera_button_left_idc;
        x = 0.125; y = 0.140;
        w = 0.150; h = 0.040;
        colorBackground[] = {0.3,0.3,0.3,1};
        text = "100m West";
    };
    
    class free_cam_button_up: RscMenuButton {
        idc = free_camera_button_up_idc;
        x = 0.325; y = 0.140;
        w = 0.154; h = 0.040;
        colorBackground[] = {0.3,0.3,0.3,1};
        text = "100m North";
    };
    
    class free_cam_button_down: RscMenuButton {
        idc = free_camera_button_down_idc;
        x = 0.525; y = 0.140;
        w = 0.154; h = 0.040;
        colorBackground[] = {0.3,0.3,0.3,1};
        text = "100m South";
    };
    
    class free_cam_button_right: RscMenuButton {
        idc = free_camera_button_right_idc;
        x = 0.725; y = 0.140;
        w = 0.150; h = 0.040;
        colorBackground[] = { 0.3,0.3,0.3,1 };
        text = "100m East";
    };
    
    class free_cam_button_nv_on: RscMenuButton {
        idc = free_camera_button_nv_on_idc;
        x = 0.10; y = 0.82;
        w = 0.15; h = 0.04;
        colorBackground[] = { 0.3,0.3,0.3,1};
        text = "NV on";
    };
    
    class free_cam_butotn_nv_off: RscMenuButton {
        idc = free_camera_butotn_nv_off_idc;
        x = 0.30; y = 0.82;
        w = 0.15; h = 0.04;
        colorBackground[] = {0.3,0.3,0.3,1};
        text = "NV off";
    };
    
    
    class free_cam_button_stop: RscMenuButton {
        idc = free_camera_button_stop_idc;
        x = 0.50; y = 0.82;
        w = 0.15; h = 0.04;
        colorBackground[] = {0.3,0.3,0.3,1};
        text = "Stop";
    };
    
    class free_cam_button_close: RscMenuButton {
        idc = free_camera_button_close_idc;
        x = 0.70; y = 0.82;
        w = 0.15; h = 0.04;
        colorBackground[] = { 0.3,0.3,0.3,1};
        text = "Close";
    };
    
    class free_cam_slider_zoom: RscSliderV {
        idc = free_camera_slider_zoom_idc;
        x = 0.05; y = 0.20;
        w = 0.04; h = 0.70;
    };
    
    class free_cam_slider_light: RscSliderV {
        idc = free_camera_slider_light_idc;
        x = 0.92; y = 0.20;
        w = 0.04; h = 0.70;
    };
};