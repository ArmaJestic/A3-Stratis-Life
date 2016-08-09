#define MAIN_PREFIX A

#define QUOTE(X) #X

#define FNC_CL_NAME(X) ##MAIN_PREFIX##_##X
#define FNC_CFG_CL_START() class FNC_CL_NAME(PREFIX){class functions{
#define FNC_CFG_CL_END() };};

#define FNC_PATH(X) fnc\##PREFIX\##X.sqf
#define FNC_CFG_ENTRY(X) class X {file = QUOTE(FNC_PATH(X));};