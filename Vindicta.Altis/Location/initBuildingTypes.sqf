/*
Building positions suitable for specific roles.

Each building position is structered:
	[_buildingPosID, _direction]
		_buildingPosID - number of the building position returned by buildingPos command.
		_direction - hte direction where the unit must be heading relative to the building's position.
	OR it can be specified in cylindrical coordinates relative to building's center:
	[_offset, _offsetDirection, _offsetHeight, _direction]
		_offset - the magnitude of the offset projected onto horizontal plane.
		_offsetDirection - the direction of the offset.
		_offsetHeight - the height of the offset.
		_direction - direction where the unit must be heading relative to the building's position.

The structure of each array with positions for specific type is:
	[[_typesArray, _positionArray], [_typesArray, _positionArray], ...]
		_typesArray - the array of types (typeOf ...) of this building sharing the same building positions. For example, different variants of the same watchtower.
		_positioArray - the array of positions in the form [_buildingPosID, _direction] or [_offset, _offsetDirection, _offsetHeight, _direction]
*/

//Positions where a high GMG or a high HMG can be placed and operated from.
location_bp_HGM_GMG_high =
[
	[ //The giant military tower
		["Land_Cargo_Tower_V1_F", "Land_Cargo_Tower_V2_F", "Land_Cargo_Tower_V3_F"],
		[[11, 90], [13, 0], [14, 0], [16, 180], [17, 180]]
	],
	[ //The small military watchtower
		["Land_Cargo_Patrol_V1_F", "Land_Cargo_Patrol_V2_F", "Land_Cargo_Patrol_V3_F"],
		[[1.9, 220, 4.4, 180], [1.9, 130, 4.4, 180]]
	]

	/*
	[ //The military HQ
		["Land_Cargo_HQ_V1_F", "Land_Cargo_HQ_V2_F", "Land_Cargo_HQ_V3_F"],
		[[4, 90], [5, 0], [6, -45], [7, 225], [8, 180]]
	]
	*/
];

//Positions where soldiers can freely shoot from.
//Note that soldiers can also shoot well from HMG positions.
location_bp_sentry =
[
	[ //The giant military tower
		["Land_Cargo_Tower_V1_F", "Land_Cargo_Tower_V2_F", "Land_Cargo_Tower_V3_F"],
		[[0, 0], [1, 0], [10, 180], [12, 0], [15, 270], [2, 0], [4, 180], [7, 90], [8, 270]]
	],
	[ //The small military watchtower
		["Land_Cargo_Patrol_V1_F", "Land_Cargo_Patrol_V2_F", "Land_Cargo_Patrol_V3_F"],
		[[0, 180], [1, 180]]
	],
	[ //The military HQ
		["Land_Cargo_HQ_V1_F", "Land_Cargo_HQ_V2_F", "Land_Cargo_HQ_V3_F"],
		[[4, 90], [5, 0], [6, -45], [7, 225], [8, 180]]
	]
];

// Capacities of buildings for infantry
// Typically a building's inf capacity is amount of its buildingPos, however for some buildings we can override that here
location_b_capacity =
[
	[ //The giant military tower
		["Land_Cargo_Tower_V1_F", "Land_Cargo_Tower_V2_F", "Land_Cargo_Tower_V3_F"],
		14
	],
	[ //The small military watchtower
		["Land_Cargo_Patrol_V1_F", "Land_Cargo_Patrol_V2_F", "Land_Cargo_Patrol_V3_F"],
		2
	],
	[ //The military HQ
		["Land_Cargo_HQ_V1_F", "Land_Cargo_HQ_V2_F", "Land_Cargo_HQ_V3_F"],
		10
	],
	[ //The military metal box
		["Land_Cargo_House_V1_F", "Land_Cargo_House_V2_F", "Land_Cargo_House_V3_F"],
		4
	],
	// Tents
	[
		["Land_MedicalTent_01_wdl_generic_inner_F",
		"Land_MedicalTent_01_aaf_generic_inner_F",
		"Land_MedicalTent_01_CSAT_brownhex_generic_inner_F",
		"Land_MedicalTent_01_NATO_generic_inner_F",
		"Land_MedicalTent_01_CSAT_greenhex_generic_inner_F",
		"Land_MedicalTent_01_NATO_tropic_generic_inner_F"],
		8
	]
];

// Positions for cargo boxes
location_bp_cargo_medium =
[
	[
		["Land_i_House_Small_01_V3_F", "Land_i_House_Small_01_V1_F", "Land_i_House_Small_01_V2_F", "Land_u_House_Small_01_V1_F"],
		[[2.07516,262.755,0.29788], [3.47262,218.056,0.29805]]
	],
	[
		["Land_i_House_Big_01_V1_F", "Land_i_House_Big_01_V2_F", "Land_i_House_Big_01_V3_F", "Land_u_House_Big_01_V1_F"],
		[[1.64695,117.933,0.498999], [5.47226,166.207,0.498999]]
	],
	[
		["Land_i_Stone_HouseBig_V1_F", "Land_i_Stone_HouseBig_V2_F", "Land_i_Stone_HouseBig_V3_F", "Land_u_Stone_HouseBig_V3_F"],
		[[0.439735,11.0105,3.059], [3.10748,83.2502,3.059]]
	],
	[
		["Land_i_Stone_HouseSmall_V1_F", "Land_i_Stone_HouseSmall_V2_F", "Land_i_Stone_HouseSmall_V3_F", "Land_u_Stone_HouseSmall_V1_F"],
		[[7.5625,69.7211,1.26548], [4.66482,54.9392,1.2517]]
	],
	[
		["Land_i_House_Small_02_V1_F", "Land_i_House_Small_02_V2_F", "Land_i_House_Small_02_V3_F", "Land_u_House_Small_02_V1_F"],
		[[3.10205,87.7267,0.418344], [5.15135,88.892,0.420984]]
	],
	[
		["Land_i_Shop_01_V1_F", "Land_i_Shop_01_V2_F", "Land_i_Shop_01_V3_F", "Land_u_Shop_01_V1_F"],
		[[1.14865,286.802,0.302086], [3.6354,341.39,0.302084]]
	],
	[
		["Land_i_House_Big_02_V1_F", "Land_i_House_Big_02_V2_F", "Land_i_House_Big_02_V3_F", "Land_u_House_Big_02_V1_F"],
		[[3.55678,42.062,0.258254], [3.1946,326.951,0.258255]]
	],
	//Livonia
	[
		["Land_House_2B04_F"],
		[[5.99253,59.4126,0.864166], [3.9745,38.706,0.691895], [4.59203,319.578,0.42363]]
	],
	[
		["Land_PoliceStation_01_F"],
		[[2.60131,61.8427,1.29491], [7.02257,323.042,0.777817], [4.66018,296.356,0.788269], [7.448,319.591,4.42163], [8.1648,252.885,4.26756]]
	],
	//RHSPKL
	[
		["Land_blud_hut6"],
		//[[0,0,3], [3.6,15,3]]
		[[1.30745,140.394,3.52625,0],[2.78827,300.346,3.52625,0],[4.64172,189.959,1.33185,0]]
	]
];

// Buildings which can be used as police stations
location_bt_police = 
[
	// Altis
	"Land_i_Shop_01_V2_F",
	"Land_i_Shop_01_V3_F",
	"Land_u_Shop_01_V1_F",
	"Land_i_House_Small_01_V3_F",
	"Land_u_House_Small_01_V1_F",
	"Land_i_House_Small_01_V2_F",
	"Land_u_House_Big_02_V1_F",
	"Land_i_Stone_HouseBig_V3_F",
	"Land_i_Stone_HouseBig_V2_F",
	"Land_i_Stone_HouseBig_V1_F",
	"Land_u_House_Small_02_V1_F",
	"Land_i_House_Small_02_V1_F",
	"Land_i_House_Small_02_V3_F",
	"Land_i_House_Small_02_V2_F",
	"Land_i_House_Big_02_V3_F",
	"Land_i_House_Big_02_V2_F",
	"Land_i_House_Big_02_V1_F",
	"Land_i_Stone_HouseSmall_V3_F",
	"Land_i_Stone_HouseSmall_V1_F",
	"Land_i_Stone_HouseSmall_V2_F",
	"Land_i_House_Big_01_V1_F",
	"Land_i_House_Big_01_V2_F",
	"Land_u_House_Big_01_V1_F",
	"Land_i_House_Big_01_V3_F",

	//Livonia
	"Land_PoliceStation_01_F",
	"Land_House_2B04_F",

	//RHSPKL
	//"Land_blud_hut3",
	//"Land_blud_hut7",
	"Land_blud_hut6",

	//Sahrani
	"Land_Dum_mesto2",
	"Land_Dum_olez_istan1",
	"Land_Sara_Domek_sedy"
];

location_decorations_police =
[
	[
		["Land_i_House_Small_02_V1_F","Land_u_House_Small_02_V1_F","Land_i_House_Small_02_V3_F","Land_i_House_Small_02_V2_F"],
		// Array of [_offset, _vectorDirAndUp]
		[[[2.3125,-3.76367,1.24133],[[0,1,0],[0,0,1]]],[[-4.01563,-0.691406,0.952689],[[0.999999,-0.00148479,0],[0,0,1]]],[[1.54102,3.30469,1.36593],[[-0.000931589,-1,0],[0,0,1]]]]
	],
	[
		["Land_u_Shop_01_V1_F"],
		[[[-0.4375,-2.74609,-0.0292983],[[0.0156359,0.999878,0],[0,0,1]]],[[-0.916016,7.36133,-0.708581],[[-0.0169196,-0.999857,0],[0,0,1]]]]
	],
	[
		["Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_01_V1_F"],
		[[[1.24414,-3.11523,0.059587],[[0,1,0],[0,0,1]]],[[1.15625,7.02734,-1.00797],[[-8.74228e-008,-1,0],[0,0,1]]]]
	],
	[
		["Land_u_House_Big_02_V1_F","Land_i_House_Big_02_V3_F","Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F"],
		[[[1.64258,5.54883,-0.478913],[[-0.0169196,-0.999857,0],[0,0,1]]],[[3.3125,-4.49414,-0.789048],[[0.012478,0.999922,0],[0,0,1]]]]
	],
	[
		["Land_i_Stone_HouseSmall_V2_F","Land_i_Stone_HouseSmall_V1_F","Land_i_Stone_HouseSmall_V3_F"],
		[[[0.0566406,-1.37891,0.052608],[[0.012478,0.999922,0],[0,0,1]]],[[0.00585938,5.63672,-0.168258],[[-0.00766302,-0.999971,0],[0,0,1]]]]
	],
	[
		["Land_i_Stone_HouseBig_V3_F","Land_i_Stone_HouseBig_V2_F","Land_i_Stone_HouseBig_V1_F"],
		[[[0.625,-2.00195,0.0724616],[[0.012478,0.999922,0],[0,0,1]]],[[-2.53711,3.22266,2.22565],[[0.99987,-0.0161541,0],[0,0,1]]]]
	],
	[
		["Land_i_House_Big_01_V3_F","Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_u_House_Big_01_V1_F"],
		[[[-4.81445,2.83203,-1.1514],[[0.999867,-0.0163374,0],[0,0,1]]],[[5.1543,0.775391,-0.706075],[[-0.999981,0.00623509,0],[0,0,1]]]]
	],
	[
		["Land_u_House_Small_01_V1_F","Land_i_House_Small_01_V3_F","Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F"],
		[[[-1.12695,-4.81641,1.56931],[[0.012478,0.999922,0],[0,0,1]]],[[1.53125,5.28711,1.06545],[[-0.01174,-0.999931,0],[0,0,1]]]]
	],
	// RHSPKL
	[
		["Land_blud_hut6"],
		[[[4.35303,3.89502,2.12814],[[-1,0,0],[0,0,1]]],[[-3.9939,3.84729,2.12864],[[1,0,0],[0,0,1]]],[[-1.37402,5.09265,2.1285],[[0,-1,0],[0,0,1]]]]
	]
];

// Buildings which add radio functionality to the location
location_bt_radio =
[
	"Land_TBox_F",				// Transmitter box which can be created through build UI
	// "Land_TTowerSmall_1_F",	// Not sure, looks like some small mobile phone antenna
	"Land_TTowerSmall_2_F",		// Verticall array of small dipoles
	"Land_TTowerBig_1_F",		// A-like transmitter tower
	"Land_TTowerBig_2_F",		// Tall I-like transmitter tower
	"Land_Communication_F"		// Tall tower with antennas on top, often found at military outposts
];

// Objects which heal units
location_bt_medical =
[
	"Land_MedicalTent_01_digital_closed_F",
	"Land_MedicalTent_01_brownhex_closed_F"
];

/*
_newdir = direction b + 180;
(vehicle player) setDir _newDir;
vehicle player setPos ((b getPos [1.5, (direction b) + 240]) vectorAdd [0, 0, 4.4]);
*/

/*
// Code to get the coordinates in cylindrical form
_b = gBuilding;
_o = cursorObject;

_bPos = getPosATL _b;
_oPos = getPosATL _o;

_dirRel = (_bPos getDir _oPos) - (direction _b);
_zRel = _oPos#2 - _bPos#2;
_distRel = _bPos distance2D _oPos;

[_distRel, _dirRel, _zRel]
*/

/*
// Same code as above, also gives the direction of object relative to direction of house
_b = gBuilding;
_o = cursorObject;

_bPos = getPosATL _b;
_oPos = getPosATL _o;

_dirRel = (_bPos getDir _oPos) - (direction _b);
_zRel = _oPos#2 - _bPos#2;
_distRel = _bPos distance2D _oPos;

_objDir = (direction _o) - (direction _b);

[_distRel, _dirRel, _zRel, _objDir]
*/


/*
// Code to export texture offsets right from the editor, in cylindrical coordinates
// Must select house and texture objects

_objects = get3DENSelected "object";
_house = _objects select {_x isKindOf "House"} select 0;
_textures = _objects select {_x isKindOf "UserTexture1m_F"};

_arrayExport = []; // dist, posDir, zrel, dir

{
_b = _house; 
_o = _x; 
 
_bPos = getPosATL _b; 
_oPos = getPosATL _o; 
 
_dirRel = (_bPos getDir _oPos) - (direction _b); 
_zRel = _oPos#2 - _bPos#2; 
_distRel = _bPos distance2D _oPos; 
 
_objDir = (direction _o) - (direction _b); 
 
_arrayExport pushBack [_distRel, _dirRel, _zRel, round _objDir];
} forEach _textures;

_arrayExport
*/



/*
// Code to export objects from editor in [_pos, [_vectorDir, _vectorUp]]

_objects = get3DENSelected "object"; 
_house = _objects select {_x isKindOf "House"} select 0; 
_textures = _objects select {_x isKindOf "UserTexture1m_F"}; 
 
_arrayExport = []; // dist, posDir, zrel, dir 
 
{ 
_b = _house;  
_o = _x;  
_posModel = _b worldToModel (position _o);
_vdir = vectorDir _o;
_vup = vectorUp _o;
_arrayExport pushBack [_posModel, [_b vectorWorldToModel _vdir, _b vectorWorldToModel _vup]]; 
} forEach _textures; 
 
_arrayExport
*/



/*
//Code to get class names of all selected eden objects
(get3DENSelected "object") apply {typeof _x}
*/

/* code to get the coordinates in cylindrical form
based on selection the house and ammo box in 3DEN

objects = get3DENSelected "object"; 
_b = objects select {_x isKindOf "House"} select 0; 
_o = objects select {_x isKindOf "ReammoBox_F"} select 0; 
   
_bPos = getPosATL _b; 
_oPos = getPosATL _o; 
 
_dirRel = (_bPos getDir _oPos) - (direction _b); 
_zRel = _oPos#2 - _bPos#2; 
_distRel = _bPos distance2D _oPos; 
 
_objDir = (direction _o) - (direction _b); 
 
[_distRel, _dirRel, _zRel, _objDir]
*/

/* code to place a black dot on every house from a specific type
used to test possible building classname for police station

_i=0;
{
createMarker ["marker"+str(_i), _x];
"marker"+str(_i) setMarkerType "hd_dot";
"marker"+str(_i) setMarkerColor "ColorBlack";
_i=_i+1;
} forEach nearestObjects [(getpos player), ["Land_blud_hut3"], 25000];
*/