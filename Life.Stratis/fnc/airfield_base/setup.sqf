// A_airfield_base_fnc_setup

#include "../../includes/constants.h"
#include "../../includes/macro.h"


//reference object 

private["_ref"];
_ref = object_attach_reference;

private["_cv"];
//generic function for placing composition objects
_cv = A_object_fnc_editor_create;

private["_id"];
_id = "";

//composition objects
["Land_TacticalBacon_F",[1706.78,5136.42,0.0722839],[84.6431,0,0],false,true,true,"cp2swatvehshopspawn",false,_id,true,_ref] call _cv;
["Land_TacticalBacon_F",[1698.26,5107.19,0.0722839],[84.6431,0,0],true,true,true,"cp2vehshopspawn",false,_id,true,_ref] call _cv;
["Land_Pier_F",[1771.13,5035.88,-0.74289],[-75.3714,0,0],true,true,false,"",false,_id,true,_ref] call _cv;
["Land_Pier_F",[1759.97,5039.81,-2.14407],[-75.3714,0,0],true,true,false,"",false,_id,true,_ref] call _cv;
["B_diver_F",[1780.52,5042.97,3.9],[95.045,0,0],false,true,true,"cp2boatshop",false,_id,true,_ref] call _cv;
["Land_Pier_F",[1754.15,5043.58,-4.21751],[-75.3714,-0.001,0],true,true,false,"",false,_id,true,_ref] call _cv;
["Land_Pier_addon",[1783.3,5036.14,1.24018],[104.629,0,0],false,true,false,"",false,_id,true,_ref] call _cv;
["Land_Pier_F",[1757.19,5027.55,-2.43335],[14.6286,0,0],true,true,false,"",false,_id,true,_ref] call _cv;
["Land_RowBoat_V3_F",[1780.17,5052.66,4.3893],[5.2741,0,0],false,true,true,"",false,_id,true,_ref] call _cv;
["Land_LampHalogen_F",[1749.08,5045.01,5.74666],[12.6757,0,0],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_Shed_Big_F",[1789.48,5037.75,4.71453],[194.629,0,0],false,false,true,"",false,_id,true,_ref] call _cv;
["Land_TacticalBacon_F",[1789.45,5032.38,0.468925],[194.775,0,0],false,true,true,"cp2boatshopspawn",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1752.99,5016.93,1.01397],[14.8958,-0.300625,17.8227],false,true,true,"",false,_id,true,_ref] call _cv;
["Land_LampHalogen_F",[1747.96,5020.12,5.71939],[151.527,0,0],false,true,true,"",false,_id,true,_ref] call _cv;
["Land_Cargo20_grey_F",[1757.62,5065.57,1.64927],[-67.4479,0,0],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_Pier_F",[1757.8,5067.28,-4.33051],[-75.3714,0,0],true,true,false,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1745.04,5017.75,0.996612],[1.06128,-0.144918,5.82614],false,true,true,"",false,_id,true,_ref] call _cv;
["Land_Pier_F",[1768.57,5072.76,-3.31985],[-75.3714,0,0],false,true,false,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1737.33,5015.92,1.12276],[336.847,0,0.811784],false,true,true,"",false,_id,true,_ref] call _cv;
["Land_Pier_F",[1781.63,5076.2,-2.11336],[-75.3714,0,0],true,true,false,"",false,_id,true,_ref] call _cv;
["Land_Cargo20_grey_F",[1770.07,5079.18,2.24032],[-40.8715,0,0],false,true,true,"",false,_id,true,_ref] call _cv;
["Land_Pier_addon",[1793.08,5073.53,1.26018],[104.629,0,0],true,true,false,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1731.62,5010.84,1.1334],[-56.2581,0,1.32504],false,true,true,"",false,_id,true,_ref] call _cv;
["Land_LampHalogen_F",[1760.72,5084.48,5.70666],[12.6757,0,0],false,true,true,"",false,_id,true,_ref] call _cv;
["Land_Pier_F",[1773.31,5090.14,-4.35308],[194.629,0,0],true,true,false,"",false,_id,true,_ref] call _cv;
["Land_Crash_barrier_F",[1715.14,5032.75,0.520596],[104.925,0,0],true,false,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1728.29,5003.43,1.14465],[-71.5255,0,0],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_Crash_barrier_F",[1711.58,5038.29,0.520596],[14.9251,0,0],true,false,true,"",false,_id,true,_ref] call _cv;
["Land_Crash_barrier_F",[1712.79,5023.99,0.520596],[104.925,0,0],true,false,true,"",false,_id,true,_ref] call _cv;
["Land_LampHalogen_F",[1725.4,5000.53,5.81022],[76.5526,0,0],false,true,true,"",false,_id,true,_ref] call _cv;
["Land_Crash_barrier_F",[1711.39,5056.78,0.520596],[104.925,0,0],true,false,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1723.6,4998.96,1.12465],[14.145,0,0],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_Crash_barrier_F",[1707.84,5043.76,0.520596],[104.925,0,0],true,false,true,"",false,_id,true,_ref] call _cv;
["Land_LampHalogen_F",[1776.21,5099.12,5.70109],[-98.4201,0,0],false,true,true,"",false,_id,true,_ref] call _cv;
["Land_Crash_barrier_F",[1710.59,5015.65,0.520596],[104.925,0,0],true,false,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1783.41,5099.13,1.09967],[195.249,0.0708394,-16.2429],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1776.1,5102.23,0.879953],[394.186,-1.86235,19.4867],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_CampingTable_F",[1703.44,5042.86,0.389465],[16.7647,0,0],false,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1715.35,5000.66,0.794646],[14.3357,0,0],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_SatellitePhone_F",[1702.97,5043,0.986206],[-196.281,0,0],false,true,true,"",false,_id,true,_ref] call _cv;
["B_Pilot_F",[1701.64,5043.29,-0.0180359],[0,0,0],false,true,true,"cp2airshop",false,_id,true,_ref] call _cv;
["Land_Crash_barrier_F",[1708.33,5007.26,0.520596],[104.925,0,0],false,false,true,"",false,_id,true,_ref] call _cv;
["B_helicrew_F",[1702.05,5020.71,-0.00963497],[-32.0478,0,0],false,true,true,"cp2helishop",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1770.43,5107.72,0.987755],[417.287,-1.4179,-4.56817],false,true,true,"",false,_id,true,_ref] call _cv;
["Land_TacticalBacon_F",[1699.9,5052.81,0.015924],[-95.9827,0,0],false,true,true,"cp2airshopspawn",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1707.12,5002.51,0.864646],[15.1057,0,0],false,true,true,"",false,_id,true,_ref] call _cv;
["Land_TacticalBacon_F",[1696.62,5031.97,0.015924],[-79.3035,0,0],true,true,true,"cp2helishopspawn",false,_id,true,_ref] call _cv;
["Land_HelipadCircle_F",[1696.62,5031.97,0.015924],[-79.3035,0,0],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_TacticalBacon_F",[1678.09,5036.16,0.00602858],[-79.3035,0,0],false,true,true,"cp2swathelishopspawn",false,_id,true,_ref] call _cv;
["B_Helipilot_F",[1676.72,5026.65,0.0019969],[-1.15833,0,0],false,true,true,"cp2swathelishop",false,_id,true,_ref] call _cv;
["Land_HelipadCircle_F",[1678.09,5036.16,0.00602858],[-79.3035,0,0],false,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1766.89,5114.74,1.06308],[432.662,-1.25248,3.84884],false,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1698.97,5004.4,0.944646],[14.4929,0,0],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1693.16,5067.3,1.18465],[195.127,0.0708394,-0.243758],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_Cargo_House_V1_F",[1695.28,5074.63,1.56688],[195.127,0.0708394,-0.243758],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1687.17,5044.34,1.18465],[198.514,0.0708394,-0.243758],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1765.77,5122.52,1.02043],[453.915,0,0.308187],false,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1690.98,5006.25,1.01465],[14.6715,0,0],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1685.32,5070.29,1.17465],[210.127,0.0708394,-0.243758],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1748.25,5125.82,1.18465],[196.4,0.0708394,-0.343444],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1678.95,5045.51,1.18465],[183.057,0.0708394,-0.243758],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1682.92,5008.09,1.08465],[14.6715,0,0],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_Cargo_House_V1_F",[1686.42,5078.23,1.56688],[210.127,0.0708394,-1.40336],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_BagBunker_Tower_F",[1758.6,5129.69,2.25614],[106.4,0.0708394,-3.33525],false,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1766.96,5130.79,1.04499],[105.261,0,-2.56122],false,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1740.81,5127.83,1.18465],[196.4,0.0708394,-0.343444],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_LampHalogen_F",[1765.51,5132.62,5.7523],[-26.2809,0,0],false,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1762.82,5135.23,0.974646],[196.4,0.0708394,-3.33525],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1677.88,5074.27,1.11465],[210.127,0.0708394,-1.40336],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_Cargo_House_V1_F",[1684.06,5087.27,1.56688],[285.204,0.0708394,0.537465],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1674.95,5010.03,1.11098],[15.3591,0,0],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1670.71,5045.81,1.18465],[184.991,0.0708394,-0.295941],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1732.79,5129.96,1.18465],[196.4,0.0708394,-0.343444],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1758.78,5136.34,1.10465],[196.688,0.0708394,-1.84645],true,true,true,"",false,_id,true,_ref] call _cv;
["Box_NATO_WpsSpecial_F",[1707.04,5115.93,1.94405],[465.204,0.0708394,0.537465],true,true,true,"cp2swatshopbox",false,_id,true,_ref] call _cv;
["Box_NATO_Wps_F",[1707.56,5117.89,1.94405],[465.204,0.0708394,0.537465],true,true,true,"cp2criminalshopbox",false,_id,true,_ref] call _cv;
["Land_Cargo_House_V1_F",[1686.29,5096.6,1.56688],[285.204,0.0708394,0.537465],false,true,true,"",false,_id,true,_ref] call _cv;
["Flag_US_F",[1753.45,5138.3,3.6285],[0,0,0],false,true,false,"",false,_id,true,_ref] call _cv;
["Land_LampHalogen_F",[1675.33,5077.6,5.8271],[161.119,0,0],false,true,true,"",false,_id,true,_ref] call _cv;
["Land_Cargo_Tower_V1_No3_F",[1667.43,5020.14,12.3784],[195.204,0.0708394,0.537465],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1674.17,5079.92,1.13465],[106.4,0.0708394,0.537465],true,true,true,"",false,_id,true,_ref] call _cv;
["B_Soldier_lite_F",[1697.69,5114.63,-0.00963497],[170.731,0,0],false,true,true,"cp2vehshop",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1664.58,5043.05,1.18465],[106.4,0.0708394,0.537465],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1676.27,5087.93,1.13465],[106.4,0.0708394,0.537465],true,true,true,"",false,_id,true,_ref] call _cv;
["Flag_US_F",[1744.03,5140.52,3.6285],[0,0,0],true,true,false,"",false,_id,true,_ref] call _cv;
["Land_Cargo_HQ_V1_F",[1701.97,5119.75,4.93837],[285.204,0.0708394,0.537465],false,true,false,"",false,_id,true,_ref] call _cv;
["Land_TacticalBacon_F",[1703.32,5121.09,1.82],[360,0,0],true,true,true,"respawn_west_proxy",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1666.8,5011.98,1.15465],[15.3591,0,0],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1662.49,5035.16,1.18465],[106.4,0.0708394,0.524731],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1678.16,5095.53,1.13465],[106.4,0.0708394,0.537465],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1738.65,5141.55,1.18465],[196.4,0.0708394,-0.343444],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1660.41,5027.15,1.17797],[105.977,0.0708394,0.418337],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1680.27,5103.56,1.15465],[106.4,0.0708394,0.537465],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_Laptop_unfolded_F",[1702.98,5126.65,2.67631],[195.473,0,0],false,true,true,"cp2atm",false,_id,true,_ref] call _cv;
["Land_CampingTable_small_F",[1702.93,5126.67,2.12089],[375.204,0.0708394,0.537465],false,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1660.67,5013.42,1.12465],[14.8351,0.0708394,-0.218947],true,true,true,"",false,_id,true,_ref] call _cv;
["Box_NATO_Wps_F",[1697.81,5124.82,2.00405],[465.204,0.0708394,0.537465],false,true,true,"cp2patrolshopbox",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1730.64,5143.62,1.18465],[196.4,0.0708394,-0.343444],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1658.36,5019.08,1.16409],[106.459,0.0708394,0.234997],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_LampHalogen_F",[1658.99,5015.43,5.78574],[160.762,0,0],false,true,true,"",false,_id,true,_ref] call _cv;
["Land_LampHalogen_F",[1684.04,5112.77,5.73449],[191.065,0,0],false,true,true,"",false,_id,true,_ref] call _cv;
["B_supplyCrate_F",[1700.94,5128.5,1.82254],[375.204,0.0708394,0.537465],false,true,true,"cp2clothesbox",false,_id,true,_ref] call _cv;
["Box_NATO_Support_F",[1698.23,5126.54,2.11405],[375.204,0.0708394,0.537465],false,true,true,"cp2basicshopbox",false,_id,true,_ref] call _cv;
["B_soldier_repair_F",[1702.46,5129.9,-0.00963497],[20.5234,0,0],false,true,true,"cp2swatvehshop",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1682.24,5111.45,1.15465],[106.4,0.0708394,0.537465],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1684.22,5119.13,1.15465],[106.4,0.0708394,0.537465],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1722.51,5145.78,1.18465],[196.4,0.0708394,-0.343444],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1686.29,5127.14,1.15465],[106.4,0.0708394,0.537465],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1714.43,5147.92,1.18465],[196.4,0.0708394,-0.343444],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1688.29,5134.81,1.15465],[106.4,0.0708394,0.537465],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1706.38,5150.1,1.18465],[196.4,0.0708394,-0.343444],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1690.37,5142.68,1.15465],[106.4,0.0708394,0.537465],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1698.34,5152.28,1.18465],[196.4,0.0708394,0.0411308],true,true,true,"",false,_id,true,_ref] call _cv;
["Land_LampHalogen_F",[1694.59,5151.4,5.82311],[-115.489,0,0],false,true,true,"",false,_id,true,_ref] call _cv;
["Land_HBarrier_Big_F",[1692.51,5150.62,1.15465],[106.4,0.0708394,0.537465],true,true,true,"",false,_id,true,_ref] call _cv;

