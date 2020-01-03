#define PREFIX nos
#include "\x\cba\addons\main\script_macros_mission.hpp"

#define NOS_isHC (!hasInterface && !isDedicated)
#define EGVAR(var1,var2) TRIPLES(PREFIX,var1,var2)
#define QEGVAR(var1,var2) QUOTE(EGVAR(var1,var2))
#define QQEGVAR(var1,var2) QUOTE(QEGVAR(var1,var2))

#define EFUNC(var1,var2) FUNC_INNER(var1,var2)
#define QEFUNC(var1,var2) QUOTE(EFUNC(var1,var2))
#define QQEFUNC(var1,var2) QUOTE(QEFUNC(var1,var2))

#define EPREP(var1,var2) PREP_SYS(PREFIX,var1,var2)
