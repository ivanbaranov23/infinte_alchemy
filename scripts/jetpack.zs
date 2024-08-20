

recipes.remove(<simplyjetpacks:metaitemmods:27>);
recipes.addShaped("flying_unit", <simplyjetpacks:metaitemmods:27>, [
	[<thermalfoundation:glass:8>, <contenttweaker:tinezo_plate>, <thermalfoundation:glass:8>],
	[<redstonearsenal:material:128>, <actuallyadditions:item_misc:8>, <redstonearsenal:material:128>],
	[<thermalfoundation:glass:8>, <contenttweaker:tinezo_plate>, <thermalfoundation:glass:8>]
]);


//thermal
recipes.remove(<simplyjetpacks:metaitemmods:20>);
recipes.addShaped("ia_te_thruster1", <simplyjetpacks:metaitemmods:20>, [
	[<ore:plateLead>, <enderio:block_reservoir>, <ore:plateLead>], 
	[<thermalfoundation:material:513>, <thermalexpansion:dynamo>, <thermalfoundation:material:513>], 
	[<ore:plateLead>, <ore:gearRedstoneAlloy>, <ore:plateLead>]
]);
recipes.remove(<simplyjetpacks:metaitemmods:21>);
recipes.addShaped("ia_te_thruster2", <simplyjetpacks:metaitemmods:21>, [
	[<contenttweaker:mekanized_steel_plate>, <contenttweaker:fluix_steel_gear>, <contenttweaker:mekanized_steel_plate>], 
	[<contenttweaker:mekanical_core>, <thermalexpansion:dynamo:1>, <contenttweaker:mekanical_core>], 
	[<contenttweaker:mekanized_steel_plate>, <simplyjetpacks:metaitemmods:20>, <contenttweaker:mekanized_steel_plate>]
]);
recipes.remove(<simplyjetpacks:metaitemmods:22>);
recipes.addShaped("ia_te_thruster3", <simplyjetpacks:metaitemmods:22>, [
	[<redstonearsenal:material:128>, <contenttweaker:skymass1>, <redstonearsenal:material:128>], 
	[<thermalfoundation:material:640>, <thermalexpansion:dynamo:2>, <thermalfoundation:material:640>], 
	[<simplyjetpacks:metaitemmods:28>, <simplyjetpacks:metaitemmods:21>, <simplyjetpacks:metaitemmods:28>]
]);
recipes.remove(<simplyjetpacks:metaitemmods:23>);
recipes.addShaped("ia_te_thruster4", <simplyjetpacks:metaitemmods:23>, [
	[<extendedcrafting:material:36>, <contenttweaker:skymass1>, <extendedcrafting:material:36>], 
	[<simplyjetpacks:metaitemmods:28>, <thermalexpansion:dynamo:3>, <simplyjetpacks:metaitemmods:28>], 
	[<simplyjetpacks:metaitemmods:20>, <simplyjetpacks:metaitemmods:22>, <simplyjetpacks:metaitemmods:20>]
]);

recipes.remove(<simplyjetpacks:itemjetpack:16>);
recipes.addShaped("ia_lead_jetpack", <simplyjetpacks:itemjetpack:16>.withTag({}), [
	[<thermalfoundation:material:323>, <thermalexpansion:capacitor>, <thermalfoundation:material:323>],
	[<thermalfoundation:material:323>, <simplyjetpacks:metaitem:4>, <thermalfoundation:material:323>],
	[<simplyjetpacks:metaitemmods:20>, null, <simplyjetpacks:metaitemmods:20>]
]);
recipes.remove(<simplyjetpacks:itemjetpack:17>);
scripts.helper.addCarryRecipe(<simplyjetpacks:itemjetpack:17>, <simplyjetpacks:itemjetpack:16>, [
	[<thermalfoundation:material:354>, <thermalexpansion:capacitor:1>, <thermalfoundation:material:354>],
	[<contenttweaker:tinezo_plate>, <contenttweaker:tinezo_plate>],
	[<simplyjetpacks:metaitemmods:21>, <thermalfoundation:armor.plate_invar>, <simplyjetpacks:metaitemmods:21>]
]);


//enderio
recipes.remove(<simplyjetpacks:metaitemmods:7>);
recipes.addShaped("ia_eio_thruster1", <simplyjetpacks:metaitemmods:7>, [
	[<ore:plateConductiveIron>, <enderio:block_reservoir>, <ore:plateConductiveIron>], 
	[<enderio:item_basic_capacitor>, <thermalexpansion:dynamo>, <enderio:item_basic_capacitor>], 
	[<ore:plateConductiveIron>, <ore:gearRedstoneAlloy>, <ore:plateConductiveIron>]
]);


mods.jei.JEI.addItem(<simplyjetpacks:metaitemmods:20>);
mods.jei.JEI.addItem(<simplyjetpacks:metaitemmods:21>);
mods.jei.JEI.addItem(<simplyjetpacks:metaitemmods:22>);
mods.jei.JEI.addItem(<simplyjetpacks:metaitemmods:23>);