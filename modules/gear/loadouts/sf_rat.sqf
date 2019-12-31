
/* Common Special Forces Gear */
#include "sf_common.sqf"

/* Primary Magazine Slots */
ADD_MAGAZINE("30Rnd_556x45_Stanag", 7);
/*ADD_MAGAZINE("30Rnd_556x45_StanagSD", 7);*/
ADD_MAGAZINE("ACE_30Rnd_556x45_T_Stanag", 1);
ADD_MAGAZINE("HandGrenade_West", 2);
ADD_MAGAZINE("SmokeShell", 2);


/* Weapon Slots */
/*Standard HK416 Red-Dot*/
ADD_WEAPON("ACE_HK416_D10_COMPM3");
/*Suppressed HK416 Red-Dot*/
/*ADD_WEAPON("ACE_HK416_D10_COMPM3_SD");*/
ADD_WEAPON("ACE_M136_CSRS"); /*Confined Space M136 for reduced backblast in CQB evironments*/

#include "sf_pistol.sqf"
