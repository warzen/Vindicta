
removeAllWeapons this;
removeAllItems this;
removeAllAssignedItems this;
removeUniform this;
removeVest this;
removeBackpack this;
removeHeadgear this;
removeGoggles this;

this forceAddUniform "FGN_AAF_M93_Lizard";
this addItemToUniform "FirstAidKit";
this addVest "FGN_AAF_M99Vest_Lizard_Rifleman";
for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_rgd5";};
for "_i" from 1 to 5 do {this addItemToVest "rhs_30Rnd_762x39mm";};
this addBackpack "B_LegStrapBag_coyote_F";
for "_i" from 1 to 10 do {this addItemToBackpack "rhs_VOG25";};
for "_i" from 1 to 6 do {this addItemToBackpack "rhs_VG40OP_white";};
for "_i" from 1 to 2 do {this addItemToBackpack "rhs_GRD40_White";};
_RandomHeadgear = ["FGN_AAF_Cap_Lizard","FGN_AAF_PASGT_Lizard","FGN_AAF_PASGT_Lizard_ESS","FGN_AAF_PASGT_Lizard_ESS_2","rhsgref_helmet_pasgt_olive"] call BIS_fnc_selectRandom;  
  

this addHeadgear _RandomHeadgear;
_RandomGoggles = ["FGN_AAF_Shemag_tan","FGN_AAF_Shemag","rhs_scarf","","","",""] call BIS_fnc_selectRandom;  
  

this addGoggles _RandomGoggles;

this addWeapon "rhs_weap_akm_gp25";
this addPrimaryWeaponItem "rhs_acc_dtkakm";

this linkItem "ItemWatch";
