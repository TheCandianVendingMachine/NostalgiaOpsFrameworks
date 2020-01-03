#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Sets AI GVARs
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call nos_ai_fnc_preInit
 *
 * Public: No
 */
 
PREP(setSkills);

GVAR(generalMin)            = 1.0;
GVAR(generaMaxl)            = 1.0;

GVAR(enduranceMin)          = 1.0;
GVAR(enduranceMax)          = 1.0;

GVAR(aimingAccuracyMin)     = 0.4;
GVAR(aimingAccuracyMax)     = 0.4;

GVAR(aimingShakeMin)        = 0.8;
GVAR(aimingShakeMax)        = 0.8;

GVAR(aimingSpeedMin)        = 0.9;
GVAR(aimingSpeedMax)        = 0.9;

GVAR(commandingMin)         = 1.0;
GVAR(commandingMax)         = 1.0;

GVAR(courageMin)            = 1.0;
GVAR(courageMax)            = 1.0;

GVAR(reloadSpeedMin)        = 0.7;
GVAR(reloadSpeedMax)        = 0.7;

GVAR(spotDistanceMin)       = 1.0;
GVAR(spotDistanceMax)       = 1.0;

GVAR(spotTimeMin)           = 0.8;
GVAR(spotTimeMax)           = 0.8;

