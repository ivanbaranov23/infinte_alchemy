import crafttweaker.item.IItemStack;
import mods.modularmachinery.RecipeBuilder;


recipes.addShaped("ia_red_flower", <minecraft:red_flower> * 2, [
    [<minecraft:dye:15>, <minecraft:tallgrass:1>, <minecraft:dye:15>]
]);
recipes.addShaped("ia_yellow_flower", <minecraft:yellow_flower> * 2, [
    [<minecraft:dye:15>],
    [<minecraft:tallgrass:1>],
    [<minecraft:dye:15>]
]);

{//glass
    {    
        var rec = RecipeBuilder.newBuilder("glass", "tree_powered_compressor", 40);

        rec.addItemInput(<minecraft:quartz>);
        rec.addItemInput(<appliedenergistics2:material>);
        rec.addItemInput(<minecraft:flint> * 3);

        rec.addItemInput(<minecraft:sand> * 8);

        rec.addItemInput(<ore:treeSapling>);
        rec.addItemInput(<minecraft:dye:15>);
        
        rec.addFluidInput(<liquid:lava> * 2000);
        
        rec.addItemOutput(<minecraft:glass> * 8);
        rec.build();
    }
    {    
        var rec = RecipeBuilder.newBuilder("slimy_glass", "high_oven", 100);
        rec.addEnergyPerTickInput(32);

        rec.addItemInput(<contenttweaker:slimy_sand>);
        
        rec.addFluidInput(<liquid:lava> * 2000);
        
        rec.addItemOutput(<contenttweaker:slimy_glass>);
        rec.build();
    }
    
}

//bauxite
/*mods.exnihilocreatio.Hammer.addRecipe(
	<minecraft:iron_ore>, <exnihilocreatio:item_ore_iron> * 5,
	0, 1.0, 1.0
);
mods.exnihilocreatio.Hammer*/

//andesite magma
recipes.addShapeless("orslime", <minecraft:magma_cream>, [<tconstruct:edible:4>, <tconstruct:edible:4>, <ore:slimeball>]);
mods.tconstruct.Alloy.addRecipe(<liquid:andesite_magma> * 250, [<liquid:andesite> * 250, <liquid:magma_fluid> * 288, <liquid:sky_stone> * 36]);
scripts.content_machines.addFluidMixerRecipe(
    <liquid:andesite_magma> * 400, 
    <liquid:andesite> * 250, <liquid:magma_fluid> * 288, <appliedenergistics2:material:45>, 
    20, 100
);


//cactus
mods.immersiveengineering.BlastFurnace.addRecipe(
	<contenttweaker:cactus_charcoal>, <harvestcraft:bakedcactusitem>, 
	20 * 10, 
	<thermalfoundation:material:864>
);
mods.immersiveengineering.CokeOven.addRecipe(
	<immersiveengineering:material:6>, 0, 
	<contenttweaker:cactus_charcoal>,
    20 * 10
);
{//cactus in tingalum oven
    var rec = RecipeBuilder.newBuilder("cactus", "tignalum_oven", 20);

    rec.addEnergyPerTickInput(1024);

    rec.addItemOutput(<contenttweaker:cactus_charcoal> * 3);
    rec.addItemOutput(<contenttweaker:cactus_charcoal>);
    rec.setChance(0.5);
    rec.addItemOutput(<contenttweaker:cactus_charcoal>);
    rec.setChance(0.25);

    rec.addItemInput(<minecraft:cactus> * 2);
    
    
    rec.addHotAirInput(250, 250, 1001);

    rec.build();
}

//slime
furnace.addRecipe(<contenttweaker:slime_shard> * 2, <contenttweaker:slimy_sand>);
scripts.helper.addSimpleCrushingRecipeWByproduct(<contenttweaker:burned_slimedirt>, <contenttweaker:slime_shard>, <contenttweaker:fire_shard>, 100);

//
recipes.addShaped("glowcrystal", <contenttweaker:glowcrystal> * 2, [
    [null, <contenttweaker:fire_shard>, <contenttweaker:fire_shard>], 
    [<contenttweaker:fire_shard>, <minecraft:glowstone_dust>, <contenttweaker:fire_shard>], 
    [<contenttweaker:fire_shard>, <contenttweaker:fire_shard>, null]
]);

//creosolon
recipes.addShapeless("ia_creosolon", <contenttweaker:creosolon> * 2, [
    <contenttweaker:weak_enhancer>,
    <contenttweaker:weak_enhancer> | <appliedenergistics2:material:5>,
    <liquid:creosote> * 4000,
    <contenttweaker:cactus_charcoal>,
    <immersiveengineering:wirecoil:3>
]);
recipes.addShapeless("ia_creosolon2", <contenttweaker:creosolon> * 2, [
    <contenttweaker:weak_enhancer>,
    <contenttweaker:weak_enhancer> | <appliedenergistics2:material:5>,
    <contenttweaker:cactus_charcoal>,
    <immersiveengineering:wirecoil:3>,
    <liquid:creosote> * 1000,
    <liquid:creosote> * 1000,
    <liquid:creosote> * 1000,
    <liquid:creosote> * 1000
]);

mods.immersiveengineering.Mixer.addRecipe(<liquid:grease> * 3000, <liquid:canolaoil> * 3000, [<contenttweaker:creosolon>], 2000);
mods.thermalexpansion.Imbuer.addRecipe(<liquid:grease> * 2000, <contenttweaker:creosolon>, <liquid:canolaoil> * 2000, 2000);
mods.immersiveengineering.MetalPress.addRecipe(<contenttweaker:creosolon_frame>, <contenttweaker:creosolon>, <minecraft:skull:1>, 10000, 4);

function addCreosolonRecipe(inp as IItemStack, outp as IItemStack){
    recipes.addShapeless("creosolon_enh" ~ inp.displayName, outp, [inp, <contenttweaker:creosolon>]);
}
addCreosolonRecipe(<quark:black_ash>, <minecraft:gunpowder> * 6);
addCreosolonRecipe(<darkutils:material>, <minecraft:gunpowder> * 6);
addCreosolonRecipe(<minecraft:skull:1>, <extrautils2:ingredients:10>);
addCreosolonRecipe(<extrautils2:ingredients:10>, <minecraft:skull:1>);

mods.thermalexpansion.Centrifuge.addRecipe(
    [<contenttweaker:karmesine_pieces>, <contenttweaker:ovium_pieces>, <contenttweaker:jauxum_pieces>], <contenttweaker:creosolon>, <liquid:creosote> * 500, 
    3000
);


//coke_dust
recipes.addShapeless("ia_coke_dust", <immersiveengineering:material:17> * 4, [
    <contenttweaker:creosolon>,
    <ore:fuelCoke>, <ore:fuelCoke>, <ore:fuelCoke>, <ore:fuelCoke>
]);

//organic green
mods.immersiveengineering.Mixer.addRecipe(<liquid:organic_green> * 1000, <liquid:water> * 1000, [<roots:terra_moss>, <ore:dyeGreen>], 2000);
mods.immersiveengineering.Mixer.addRecipe(<liquid:organic_green> * 2000, <liquid:milk> * 2000, [<roots:terra_moss>, <ore:dyeGreen>], 2000);
mods.alchemistry.Evaporator.addRecipe(<enderio:item_material:48>, <liquid:organic_green> * 250);

//alt t2 ore gen
mods.tconstruct.Casting.addTableRecipe(<exnihilocreatio:item_ore_osmium>, <tconstruct:edible:1>, <liquid:invar>, 32, true);
mods.tconstruct.Casting.addTableRecipe(<exnihilocreatio:item_ore_lead>, <minecraft:poisonous_potato>, <liquid:pigiron>, 16, true);

//flolit
mods.tconstruct.Casting.addTableRecipe(<contenttweaker:flolit_dust>, <contenttweaker:flolit>, <liquid:ferramic>, 288, true);
mods.thermalexpansion.Transposer.addFillRecipe(<contenttweaker:flolit_dust>, <contenttweaker:flolit>, <liquid:ferramic> * 144, 8000);
mods.thermalexpansion.InductionSmelter.addRecipe(
    <contenttweaker:flolit_dust> * 2, 
    <contenttweaker:pilkeum>, <contenttweaker:flolit> * 2, 
    8000
);


recipes.addShaped("ia_flolit_sheet", <contenttweaker:flolit_sheet> * 4, [
    [<moreplates:hammer>.anyDamage().transformDamage(3), <contenttweaker:angel_plate>], 
    [null, <contenttweaker:flolit_dust>], 
    [null, <moreplates:demon_plate>]
]);
mods.immersiveengineering.Blueprint.addRecipe("exotic_circuit", 
	<contenttweaker:flolit_sheet> * 8, 
	[
		<contenttweaker:flolit_dust>, <contenttweaker:flolit_dust>,
        <contenttweaker:angel_plate>,
        <moreplates:demon_plate>
	]
);
mods.enderio.AlloySmelter.addRecipe(<contenttweaker:flolit_sheet> * 4, [
    <contenttweaker:flolit_dust>,
    <extrautils2:ingredients:11> * 2,
    <contenttweaker:angel_ingot> * 2
], 15000);



{//altarless copper
    recipes.addShapeless("ia_carrot_copper", <contenttweaker:carrot_copper> * 6, [
        <contenttweaker:carrot_pulp>, <contenttweaker:carrot_pulp>,
        <minecraft:flint>, <minecraft:brown_mushroom> | <minecraft:red_mushroom>
    ]);
    recipes.addShapeless("ia_carrot_copper2", <contenttweaker:carrot_copper> * 8, [
        <contenttweaker:carrot_pulp>, <contenttweaker:carrot_pulp>,
        <minecraft:flint>, <liquid:mushroom_stew> * 1000
    ]);
    recipes.addShapeless("ia_carrot_copper3", <contenttweaker:carrot_copper> * 8, [
        <contenttweaker:carrot_pulp>, <contenttweaker:carrot_pulp>,
        <minecraft:flint>, <harvestcraft:whitemushroomitem>
    ]);

    
    mods.immersiveengineering.BottlingMachine.addRecipe(<exnihilocreatio:item_ore_copper:1>, <contenttweaker:carrot_copper>, <liquid:andesite> * 500);
    mods.thermalexpansion.Transposer.addFillRecipe(
        <exnihilocreatio:item_ore_copper:1>, 
        <contenttweaker:carrot_copper>, <liquid:andesite> * 250, 
        1500
    );
    furnace.addRecipe(<thermalfoundation:material:192> * 6, <contenttweaker:carrot_copper>);
    mods.immersiveengineering.AlloySmelter.addRecipe(
        <exnihilocreatio:item_ore_copper:1>, 
        <contenttweaker:carrot_copper>,
        <contenttweaker:basalt_dust>,
        200
    );
    mods.thermalexpansion.InductionSmelter.addRecipe(
        <exnihilocreatio:item_ore_copper:1>, 
        <contenttweaker:carrot_copper>,
        <contenttweaker:basalt_dust>,
        400
    );
}
{//tin
    recipes.addShapeless("ia_tin_very_normal_and_logical_recipe1", <contenttweaker:tinley> * 4, [
        <natura:materials:1>, 
        <natura:materials:1>, 
        <prodigytech:energion_dust>, 
        <prodigytech:ash>
    ]);
    recipes.addShapeless("ia_tin_very_normal_and_logical_recipe2", <contenttweaker:tinley> * 6, [
        <natura:materials:1>, 
        <natura:materials:1>, 
        <prodigytech:energion_dust>, 
        <ore:itemSlag> | <contenttweaker:bioslag>
    ]);
    recipes.addShapeless("ia_tin_very_normal_and_logical_recipe3", <contenttweaker:tinley> * 12, [
        <natura:materials:1>, 
        <natura:materials:1>, 
        <prodigytech:energion_dust>, 
        <thermalfoundation:material:865> | <contenttweaker:bioslag>
    ]);

    mods.prodigytech.magneticreassembler.addRecipe(<contenttweaker:tinley>, <thermalfoundation:material:129>);
    furnace.addRecipe(<thermalfoundation:material:193> * 3, <contenttweaker:tinley>);
}
{//coal alt
    mods.prodigytech.magneticreassembler.addRecipe(<prodigytech:ash>, <actuallyadditions:item_misc:10> * 3);
    
}


//creosolon
recipes.addShapeless("jade_to_flolit", <contenttweaker:flolit>, [
    <contenttweaker:creosolon>, 
    <erebus:materials:55>, <erebus:materials:55>, <erebus:materials:55>, <erebus:materials:55>,
    <liquid:grape_juice> * 1000
]);

//itemduct
mods.tconstruct.Casting.addBasinRecipe(<thermalfoundation:glass:3>, <roots:runed_obsidian>, <liquid:lead>, 288, true);
mods.tconstruct.Casting.addTableRecipe(<thermaldynamics:duct_32:2>, <thermaldynamics:duct_32>, <liquid:glowstone>, 500, true);
