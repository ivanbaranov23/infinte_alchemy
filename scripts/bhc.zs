
recipes.remove(<bhc:canister>);
recipes.addShaped("ia_bhc_canister1", <bhc:canister> * 2, [
	[<thermalfoundation:storage_alloy:2>, <thermalfoundation:storage_alloy:2>, <thermalfoundation:storage_alloy:2>], 
	[<thermalfoundation:storage_alloy:2>, <contenttweaker:singularity_dust>, <thermalfoundation:storage_alloy:2>], 
	[<thermalfoundation:storage_alloy:2>, <thermalfoundation:storage_alloy:2>, <thermalfoundation:storage_alloy:2>]
]);
recipes.addShaped("ia_bhc_canister2", <bhc:canister> * 4, [
	[null, <thermalfoundation:material:327>, null], 
	[<thermalfoundation:material:327>, <contenttweaker:life>, <thermalfoundation:material:327>], 
	[null, <thermalfoundation:material:327>, null]
]);

recipes.remove(<bhc:red_heart_canister>);
recipes.addShaped("ia_bhc_red_heart_canister1", <bhc:red_heart_canister>, [
	[<moreplates:pig_iron_plate>, <bhc:red_heart>, <moreplates:pig_iron_plate>], 
	[<moreplates:knightslime_gear>, <bhc:canister>, <moreplates:knightslime_gear>], 
	[<moreplates:pig_iron_plate>, <bhc:red_heart>, <moreplates:pig_iron_plate>]
]);
scripts.content_machines.addAssemblerRecipe(
    [<bhc:red_heart_canister>],
    [
        <bhc:canister>,
        <bhc:red_heart>,
        <moreplates:knightslime_gear>,
        <contenttweaker:superglue> * 2
    ], <liquid:pigiron> * (144 * 8),
    40, 1000
);


recipes.remove(<bhc:yellow_heart_canister>);
recipes.addShaped("ia_bhc_yellow_heart_canister1", <bhc:yellow_heart_canister>, [
	[<contenttweaker:potion_zinc_plate>, <bhc:yellow_heart>, <contenttweaker:potion_zinc_plate>], 
	[<bhc:red_heart_canister>, <bhc:relic_apple>, <bhc:red_heart_canister>], 
	[<contenttweaker:potion_zinc_plate>, <bhc:yellow_heart>, <contenttweaker:potion_zinc_plate>]
]);
scripts.content_machines.addAssemblerRecipe(
    [<bhc:yellow_heart_canister> * 2],
    [
        <bhc:red_heart_canister> * 3,
        <contenttweaker:solar_potion_zinc_plate> * 2,
        <bhc:yellow_heart> * 2,
        <bhc:relic_apple>
    ], null,
    40, 1000
);


recipes.remove(<bhc:green_heart_canister>);
recipes.addShaped("ia_bhc_green_heart_canister1", <bhc:green_heart_canister>, [
	[<minecraft:golden_apple:1>, <bhc:green_heart>, <minecraft:golden_apple:1>], 
	[<bhc:yellow_heart_canister>, <actuallyadditions:item_misc:8>, <bhc:yellow_heart_canister>], 
	[<minecraft:golden_apple:1>, <bhc:green_heart>, <minecraft:golden_apple:1>]
]);
scripts.content_machines.addAssemblerRecipe(
    [<bhc:green_heart_canister> * 2],
    [
        <bhc:yellow_heart_canister> * 3,
        <minecraft:golden_apple:1> * 4,
        <bhc:green_heart> * 2,
        <actuallyadditions:item_misc:8>
    ], null,
    40, 1000
);


recipes.remove(<bhc:blue_heart_canister>);
recipes.addShaped("ia_bhc_blue_heart_canister1", <bhc:blue_heart_canister>, [
	[<contenttweaker:blood_bronze_gear>, <bhc:blue_heart>, <contenttweaker:blood_bronze_gear>], 
	[<bhc:green_heart_canister>, <enderio:item_capacitor_totemic>, <bhc:green_heart_canister>], 
	[<contenttweaker:blood_bronze_gear>, <bhc:blue_heart>, <contenttweaker:blood_bronze_gear>]
]);
scripts.content_machines.addAssemblerRecipe(
    [<bhc:blue_heart_canister> * 2],
    [
        <bhc:green_heart_canister> * 3,
        <contenttweaker:blood_bronze_gear> * 4,
        <bhc:blue_heart> * 2,
        <enderio:item_capacitor_totemic>
    ], null,
    40, 1000
);