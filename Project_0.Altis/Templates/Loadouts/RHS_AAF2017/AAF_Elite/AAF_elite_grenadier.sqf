
removeAllWeapons this;
removeAllItems this;
removeAllAssignedItems this;
removeUniform this;
removeVest this;
removeBackpack this;
removeHeadgear this;
removeGoggles this;

this forceAddUniform "FGN_AAF_M10_Type07_Summer";
this addItemToUniform "FirstAidKit";
_RandomVest = ["FGN_AAF_CIRAS_GL","FGN_AAF_CIRAS_GL_Belt","FGN_AAF_CIRAS_GL_Belt_CamB"] call BIS_fnc_selectRandom;  
  

this addVest _RandomVest;
for "_i" from 1 to 6 do {this addItemToVest "rhsgref_30rnd_556x45_m21";};
for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_f1";};
this addItemToVest "rhs_mag_an_m8hc";
this addBackpack "B_LegStrapBag_coyote_F";
for "_i" from 1 to 10 do {this addItemToBackpack "rhs_VOG25";};
for "_i" from 1 to 6 do {this addItemToBackpack "rhs_VG40OP_white";};
for "_i" from 1 to 2 do {this addItemToBackpack "rhs_VG40MD_White";};
_RandomHeadgear = ["FGN_AAF_PASGT_Type07","FGN_AAF_PASGT_Type07_ESS","FGN_AAF_PASGT_Type07_ESS_2"] call BIS_fnc_selectRandom;  
  

this addHeadgear _RandomHeadgear;
_RandomGoggles = ["FGN_AAF_Shemag_tan","FGN_AAF_Shemag","rhs_scarf","","","",""] call BIS_fnc_selectRandom;  
  

this addGoggles _RandomGoggles;

this addWeapon "rhs_weap_m21a_pbg40";

this linkItem "ItemWatch";
this linkItem "ItemRadio";

