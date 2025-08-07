

recipes.addShaped("flapper", <contenttweaker:flapper>, [
	[<contenttweaker:angel_gear>, <openblocks:generic>],
	[<immersiveengineering:cloth_device:1>, <immersiveengineering:metal_decoration0:3>]
]);
scripts.content_machines.addAssemblerRecipe(
	[<contenttweaker:flapper> * 3], 
	[
		<contenttweaker:angel_gear>, <openblocks:hang_glider>,
		<immersiveengineering:cloth_device:1>, <immersiveengineering:metal_decoration0:3>
	], <liquid:steel> * 144,
	20, 100
);

recipes.remove(<simplyjetpacks:metaitemmods:27>);
recipes.addShaped("flying_unit", <simplyjetpacks:metaitemmods:27>, [
	[<contenttweaker:tinezo_plate>, <thermalfoundation:material:894>, <contenttweaker:tinezo_plate>],
	[<thermalfoundation:material:353>, <thermalfoundation:glass:8>, <thermalfoundation:material:353>],
	[<contenttweaker:tinezo_plate>, <thermalfoundation:material:894>, <contenttweaker:tinezo_plate>]
]);
recipes.addShaped("ia_light_support", <contenttweaker:light_support>, [
	[<contenttweaker:caelumite_rod>, <contenttweaker:tinezo_plate>, <contenttweaker:caelumite_rod>], 
	[<contenttweaker:tinezo_plate>, <simplyjetpacks:metaitemmods:28>, <contenttweaker:tinezo_plate>], 
	[<contenttweaker:caelumite_rod>, <contenttweaker:tinezo_plate>, <contenttweaker:caelumite_rod>]
]);

//thermal
recipes.remove(<simplyjetpacks:metaitemmods:20>);
recipes.addShaped("ia_te_thruster1", <simplyjetpacks:metaitemmods:20>, [
	[<ore:plateLead>, <enderio:block_reservoir>, <ore:plateLead>], 
	[<immersiveengineering:metal_device0:5>, <immersiveengineering:metal_decoration0:6>, <immersiveengineering:metal_device0:5>], 
	[<ore:plateLead>, <ore:gearRedstoneAlloy>, <ore:plateLead>]
]);
recipes.remove(<simplyjetpacks:metaitemmods:21>);
recipes.addShaped("ia_te_thruster2", <simplyjetpacks:metaitemmods:21>, [
	[<moreplates:electrical_steel_plate>, <extrautils2:suncrystal>, <moreplates:electrical_steel_plate>], 
	[<contenttweaker:flolit_sheet>, <contenttweaker:flapper>, <contenttweaker:flolit_sheet>], 
	[<moreplates:electrical_steel_plate>, <simplyjetpacks:metaitemmods:20>, <moreplates:electrical_steel_plate>]
]);
recipes.remove(<simplyjetpacks:metaitemmods:22>);
recipes.addShaped("ia_te_thruster3", <simplyjetpacks:metaitemmods:22>, [
	[<contenttweaker:electric_manyullyn_gear>, <contenttweaker:caelumite_plate>, <contenttweaker:electric_manyullyn_gear>], 
	[<thermalfoundation:material:640>, <thermalexpansion:dynamo:2>, <thermalfoundation:material:640>], 
	[<thermalexpansion:augment:128>, <simplyjetpacks:metaitemmods:21>, <thermalexpansion:augment:128>]
]);
recipes.remove(<simplyjetpacks:metaitemmods:23>);
recipes.addShaped("ia_te_thruster4", <simplyjetpacks:metaitemmods:23>, [
	[<thermalfoundation:material:359>, <contenttweaker:light_support>, <thermalfoundation:material:359>], 
	[<simplyjetpacks:metaitemmods:28>, <thermalexpansion:dynamo:3>, <simplyjetpacks:metaitemmods:28>], 
	[<simplyjetpacks:metaitemmods:20>, <simplyjetpacks:metaitemmods:22>, <simplyjetpacks:metaitemmods:20>]
]);

//recipes.remove(<simplyjetpacks:itemjetpack:16>);
recipes.removeByRecipeName("simplyjetpacks:upgraderecipeshaped15");
recipes.addShaped("ia_lead_jetpack", <simplyjetpacks:itemjetpack:16>.withTag({}), [
	[<thermalfoundation:material:323>, <thermalexpansion:capacitor>, <thermalfoundation:material:323>],
	[<thermalfoundation:material:323>, <simplyjetpacks:metaitem:4>, <thermalfoundation:material:323>],
	[<simplyjetpacks:metaitemmods:20>, <thermalfoundation:armor.plate_lead>, <simplyjetpacks:metaitemmods:20>]
]);
//recipes.remove(<simplyjetpacks:itemjetpack:17>);
recipes.removeByRecipeName("simplyjetpacks:upgraderecipeshaped16");
scripts.helper.addCarryRecipe(<simplyjetpacks:itemjetpack:17>, <simplyjetpacks:itemjetpack:16>, [
	[<thermalfoundation:material:354>, <thermalexpansion:capacitor:1>, <thermalfoundation:material:354>],
	[<contenttweaker:flapper>, <contenttweaker:flapper>],
	[<simplyjetpacks:metaitemmods:21>, <thermalfoundation:armor.plate_invar>, <simplyjetpacks:metaitemmods:21>]
]);
//recipes.remove(<simplyjetpacks:itemjetpack:18>);
recipes.removeByRecipeName("simplyjetpacks:upgraderecipeshaped17");
scripts.helper.addCarryRecipe(<simplyjetpacks:itemjetpack:18>, <simplyjetpacks:itemjetpack:17>, [
	[<thermalfoundation:material:359>, <thermalexpansion:capacitor:2>, <thermalfoundation:material:359>],
	[<contenttweaker:caelumite_plate>, <contenttweaker:caelumite_plate>],
	[<simplyjetpacks:metaitemmods:22>, <contenttweaker:light_support> | <extrautils2:chickenring:1>, <simplyjetpacks:metaitemmods:22>]
]);

recipes.removeByRecipeName("simplyjetpacks:upgraderecipeshaped18");
scripts.helper.addCarryRecipe(<simplyjetpacks:itemjetpack:19>, <simplyjetpacks:itemjetpack:18>, [
	[<contenttweaker:osgloridium_plate>, <thermalexpansion:capacitor:3>, <contenttweaker:osgloridium_plate>],
	[<quantumflux:craftingpiece:5>, <quantumflux:craftingpiece:5>],
	[<simplyjetpacks:metaitemmods:23>, <mekanism:armoredjetpack>, <simplyjetpacks:metaitemmods:23>]
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