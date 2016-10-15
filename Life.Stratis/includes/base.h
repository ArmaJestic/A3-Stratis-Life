#define MAIN_PREFIX A

#define QUOTE(X) #X

#define FNC_CL_NAME(X) ##MAIN_PREFIX##_##X
#define FNC_CFG_CL_START() class FNC_CL_NAME(PREFIX){class functions{
#define FNC_CFG_CL_END() };};

// path to function file
#define FNC_PATH(X) fnc\##PREFIX\##X.sqf

// fnc attributes
#define FNC_CFG_ATR_DEF(X) file = QUOTE(FNC_PATH(X));
#define FNC_CFG_ATR_PRE(X) FNC_CFG_ATR_DEF(X) preInit=1;
#define FNC_CFG_ATR_PST(X) FNC_CFG_ATR_DEF(X) postInit=1;
// cfg entries
#define FNC_CFG_ENTRY_EXT(X,A) class X {A};
#define FNC_CFG_ENTRY(X) FNC_CFG_ENTRY_EXT(X,FNC_CFG_ATR_DEF(X))
#define FNC_CFG_ENTRY_PRE(X) FNC_CFG_ENTRY_EXT(X,FNC_CFG_ATR_PRE(X))
#define FNC_CFG_ENTRY_PST(X) FNC_CFG_ENTRY_EXT(X,FNC_CFG_ATR_PST(X))