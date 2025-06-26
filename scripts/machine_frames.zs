//for frames and frame parts

recipes.addShaped("ia_machine_frame_frame", <contenttweaker:machine_frame_frame> * 4, [
    [<projectred-core:resource_item>, <immersiveengineering:material:27>, <projectred-core:resource_item>], 
    [<thermalfoundation:material:354>, null, <thermalfoundation:material:354>], 
    [<projectred-core:resource_item>, <immersiveengineering:metal_decoration0:4>, <projectred-core:resource_item>]
]);
recipes.addShaped("ia_machine_frame_frame2", <contenttweaker:machine_frame_frame> * 5, [
    [<projectred-core:resource_item>, <immersiveengineering:material:27>, <projectred-core:resource_item>], 
    [<thermalfoundation:material:354>, <contenttweaker:creosolon_frame>, <thermalfoundation:material:354>], 
    [<projectred-core:resource_item>, <immersiveengineering:metal_decoration0:4>, <projectred-core:resource_item>]
]);
mods.immersiveengineering.Blueprint.addRecipe("structure", 
	<contenttweaker:machine_frame_frame> * 12, 
	[
		<contenttweaker:creosolon_frame>,
        <contenttweaker:tube_processor>,
        <projectred-core:resource_item:1>,
        <projectred-core:resource_item:1>,
        <thermalfoundation:material:354>,
        <immersiveengineering:metal_decoration0:4>
	]
);

recipes.addShaped("ia_watertight_lead_plate", <contenttweaker:watertight_lead_plate>, [
    [<thermalfoundation:material:323>, <extrautils2:decorativesolid:7>, <thermalfoundation:material:323>], 
    [<contenttweaker:compound_metal>, null, <contenttweaker:compound_metal>], 
    [<thermalfoundation:material:323>, <extrautils2:decorativesolid:7>, <thermalfoundation:material:323>]
]);


recipes.remove(<extrautils2:machine>);
recipes.addShaped("ia_machine_frame1", <extrautils2:machine> * 4, [
	[<contenttweaker:machine_frame_frame>, <morefurnaces:furnaceblock>, <contenttweaker:machine_frame_frame>], 
	[<contenttweaker:power_core_active>, <immersiveengineering:metal_decoration0:5>, <contenttweaker:power_core_active>], 
	[<contenttweaker:machine_frame_frame>, <morefurnaces:furnaceblock>, <contenttweaker:machine_frame_frame>]
]);

recipes.remove(<thermalexpansion:frame:64>);
recipes.addShaped("ia_machine_frame2", <thermalexpansion:frame:64>, [
	[<extrautils2:decorativesolid:3>, <contenttweaker:watertight_lead_plate>, <extrautils2:decorativesolid:3>], 
	[<contenttweaker:flolit_sheet>, <extrautils2:machine>, <contenttweaker:flolit_sheet>], 
	[<extrautils2:decorativesolid:3>, <immersiveengineering:metal_device0:5>, <extrautils2:decorativesolid:3>]
]);

recipes.remove(<thermalexpansion:frame>);
recipes.addShaped("ia_machine_frame3", <thermalexpansion:frame>, [
	[<ore:plateElectricalSteel>, <prodigytech:circuit_perfected>, <ore:plateElectricalSteel>], 
	[<contenttweaker:simple_motor>, <thermalexpansion:frame:64>, <contenttweaker:simple_motor>], 
	[<ore:plateSteel>, <contenttweaker:thermal_gear>, <ore:plateSteel>]
]);

recipes.remove(<mekanism:basicblock:8>);
recipes.addShaped("ia_machine_frame4", <mekanism:basicblock:8>, [
	[<contenttweaker:mekanized_steel_plate>, <contenttweaker:eliamondin>, <contenttweaker:mekanized_steel_plate>], 
	[<contenttweaker:atum_godshard>, <thermalexpansion:frame>, <contenttweaker:atum_godshard>], 
	[<contenttweaker:mekanized_steel_plate>, <contenttweaker:mekanical_core>, <contenttweaker:mekanized_steel_plate>]
]);



recipes.remove(<actuallyadditions:block_misc:9>);
recipes.addShaped("ia_frame5", <actuallyadditions:block_misc:9>, [
	[<redstonearsenal:material:128>, <contenttweaker:tube_computer>, <redstonearsenal:material:128>], 
	[<contenttweaker:titanium_rod>, <mekanism:basicblock:8>, <contenttweaker:titanium_rod>], 
	[<contenttweaker:osgloridium_plate>, <contenttweaker:gearbox_normal>, <contenttweaker:osgloridium_plate>]
]);



recipes.remove(<deepmoblearning:machine_casing>);
recipes.addShaped("ia_dml_casing", <deepmoblearning:machine_casing>, [
	[<deepmoblearning:soot_covered_plate>, <deepmoblearning:polymer_clay>, <deepmoblearning:soot_covered_plate>], 
	[<contenttweaker:neuron_inlay>, <enderio:item_material:53>, <contenttweaker:neuron_inlay>], 
	[<deepmoblearning:soot_covered_plate>, <deepmoblearning:polymer_clay>, <deepmoblearning:soot_covered_plate>]
]);


recipes.remove(<actuallyadditions:block_misc:8>);
recipes.addShaped("ia_frame10", <actuallyadditions:block_misc:8>, [
	[<extendedcrafting:material:36>, <contenttweaker:robot_arm>, <extendedcrafting:material:36>], 
	[<biomesoplenty:terrestrial_artifact>, <enderio:item_material:54>, <biomesoplenty:terrestrial_artifact>], 
	[<extendedcrafting:material:36>, <enderio:item_capacitor_crystalline>, <extendedcrafting:material:36>]
]);


recipes.addShaped("ia_frame11", <contenttweaker:soul_frame>, [
	[<tconevo:metal:33>, <contenttweaker:soul_codex8>, <tconevo:metal:33>], 
	[<contenttweaker:ev_coil>, <actuallyadditions:block_misc:8>, <contenttweaker:ev_coil>], 
	[<moreplates:crystalline_alloy_plate>, <contenttweaker:soul_codex8>, <moreplates:crystalline_alloy_plate>]
]);
<contenttweaker:soul_frame>.addTooltip("Truly a fate worse than death");


recipes.addShaped("ia_frame12", <contenttweaker:blood_frame>, [
	[<contenttweaker:blood_bronze_plate>, <bloodmagic:component:12>, <contenttweaker:blood_bronze_plate>], 
	[<bloodmagic:slate:1>, <contenttweaker:soul_frame>, <bloodmagic:slate:1>], 
	[<contenttweaker:blood_bronze_plate>, <bloodmagic:component:12>, <contenttweaker:blood_bronze_plate>]
]);


//frame 13
mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:mana_frame>, [
	[<moreplates:manasteel_gear>, <botania:managlass>, <moreplates:manasteel_plate>, <botania:managlass>, <moreplates:manasteel_gear>], 
	[<botania:managlass>, <contenttweaker:pure_cincinnasite>, <contenttweaker:rune_base>, <contenttweaker:pure_cincinnasite>, <botania:managlass>], 
	[<botania:managlass>, <contenttweaker:bloody_circuit>, <contenttweaker:blood_frame>, <contenttweaker:bloody_circuit>, <botania:managlass>], 
	[<botania:managlass>, <contenttweaker:pure_cincinnasite>, <contenttweaker:rune_base>, <contenttweaker:pure_cincinnasite>, <botania:managlass>], 
	[<moreplates:crystalline_alloy_gear>, <botania:managlass>, <moreplates:crystalline_alloy_plate>, <botania:managlass>, <moreplates:crystalline_alloy_gear>]
]);

