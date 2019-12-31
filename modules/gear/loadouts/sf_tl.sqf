
/* Common Special Forces Gear */
#include "sf_common.sqf"

/* Item Slots */
ADD_WEAPON("ACE_HuntIR_monitor");

/* Primary Magazine Slots */
ADD_MAGAZINE("30Rnd_556x45_Stanag", 5);
/*ADD_MAGAZINE("30Rnd_556x45_StanagSD", 7);*/
ADD_MAGAZINE("ACE_30Rnd_556x45_T_Stanag", 2);
ADD_MAGAZINE("1Rnd_HE_M203", 4);
ADD_MAGAZINE("ACE_HuntIR_M203", 1);
ADD_MAGAZINE("1Rnd_Smoke_M203", 2);

/* ACE Ruck Magazine Slots */
ADD_MAGAZINE_RUCK("1Rnd_HE_M203", 4);
ADD_MAGAZINE_RUCK("1Rnd_Smoke_M203", 2);
ADD_MAGAZINE_RUCK("ACE_30Rnd_556x45_T_Stanag", 2);
ADD_MAGAZINE_RUCK("SmokeShellGreen", 2);

/* Weapon Slots */
/*Standard HK416 Red-Dot*/
ADD_WEAPON("ACE_HK416_D14_COMPM3_M320");
/*Suppressed HK416 Red-Dot*/
/*ADD_WEAPON("ACE_HK416_D10_COMPM3_SD");*/

#include "sf_pistol.sqf"