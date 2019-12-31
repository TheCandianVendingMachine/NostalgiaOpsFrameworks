
/* Common Special Forces Gear */
#include "sf_common.sqf"

/* Primary Magazine Slots */
ADD_MAGAZINE("30Rnd_556x45_Stanag", 7);
/*ADD_MAGAZINE("30Rnd_556x45_StanagSD", 7);*/
ADD_MAGAZINE("ACE_30Rnd_556x45_T_Stanag", 1);

/* ACE Ruck Magazine Slots */
ADD_MAGAZINE_RUCK("SmokeShellGreen", 2);
ADD_MAGAZINE_RUCK("SmokeShellPurple", 2);
ADD_MAGAZINE_RUCK("SmokeShellBlue", 2);

/* ACE Ruck Medical Slots */
ADD_MAGAZINE_RUCK("ACE_Tourniquet", 2);
ADD_MAGAZINE_RUCK("ACE_Bandage", 16);
ADD_MAGAZINE_RUCK("ACE_LargeBandage", 6);
ADD_MAGAZINE_RUCK("ACE_Morphine", 8);
ADD_MAGAZINE_RUCK("ACE_Epinephrine", 6);
ADD_MAGAZINE_RUCK("ACE_Medkit", 10);

/* Weapon Slots */
/*Standard HK416 Red-Dot*/
ADD_WEAPON("ACE_HK416_D10_COMPM3");
/*Suppressed HK416 Red-Dot*/
/*ADD_WEAPON("ACE_HK416_D10_COMPM3_SD");*/

#include "sf_pistol.sqf"
