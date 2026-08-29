import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.oredict.IOreDictEntry;

import crafttweaker.data.IData;
import crafttweaker.util.Math;


import mods.modularmachinery.RecipeBuilder;


//fish tank
static counter as int = 1;
function addCoralGrowthRec(coral as IItemStack, cat as IItemStack){
    print("coral" ~ counter);
    var rec = RecipeBuilder.newBuilder("coral" ~ counter, "fish_tank", 8 * 20);
    counter += 1;
    rec.setMaxThreads(1);
    rec.addEnergyPerTickInput(100);

    //rec.addDimensionRequirement([66]);

    //rec.addFluidOutput(<liquid:bugs> * tier_bugs[tier]);
    rec.addItemInput(coral);
    rec.addItemInput(cat);
    rec.addItemInput(<ore:coralFeed> * 3);
    rec.addFluidInput(<liquid:seaweed_rich_water> * 1500);
    
            
    for i in 0 to 9{
        rec.addItemOutput(coral);
        rec.setChance( 0.7 - (0.05 * i) );
    }
    

    rec.build();
}

<ore:coralFeed>.addItems([<minecraft:dye:15>, <prodigytech:meat_ground>, <mekanism:biofuel>, <enderio:item_material:46>, <enderio:item_material:47>]);
addCoralGrowthRec(<biomesoplenty:coral>, <tconstruct:edible:3>);
addCoralGrowthRec(<biomesoplenty:coral:1>, <minecraft:gold_nugget> * 3);
addCoralGrowthRec(<biomesoplenty:coral:2>, <harvestcraft:blueberryitem>);
addCoralGrowthRec(<biomesoplenty:coral:3>, <minecraft:glowstone_dust>);
addCoralGrowthRec(<biomesoplenty:seaweed>, <minecraft:glowstone_dust>);

addCoralGrowthRec(<contenttweaker:zanite_coral>, <contenttweaker:manyullyn_dust>);
addCoralGrowthRec(<contenttweaker:terra_coral>, <contenttweaker:fertilizer7>);


function addFishRec1(fout as IItemStack, cat as IItemStack){
    print("fish" ~ counter);
    var rec = RecipeBuilder.newBuilder("fish" ~ counter, "fish_tank", 8 * 20);
    counter += 1;
    rec.setMaxThreads(1);
    rec.addEnergyPerTickInput(100);

    
    rec.addItemInput(fout);
    rec.addItemInput(cat);
    rec.addItemInput(<ore:fishFeed> * 2);
    rec.addFluidInput(<liquid:seaweed_rich_water> * 1000);
    
            
    for i in 0 to 6{
        rec.addItemOutput(fout);
        rec.setChance( 0.75 - (0.05 * i) );
    }
    

    rec.build();
}
function addFishRec2(fout as IItemStack, cat as IItemStack, fluid as ILiquidStack, feed as int){
    print("fish" ~ counter);
    var rec = RecipeBuilder.newBuilder("fish" ~ counter, "fish_tank", 8 * 20);
    counter += 1;
    rec.setMaxThreads(1);
    rec.addEnergyPerTickInput(100);

    
    rec.addItemInput(fout);
    rec.addItemInput(cat);
    rec.addItemInput(<ore:fishFeed> * feed);
    rec.addFluidInput(fluid);
    
            
    for i in 0 to 6{
        rec.addItemOutput(fout);
        rec.setChance( 0.75 - (0.05 * i) );
    }
    

    rec.build();
}
<ore:fishFeed>.addItems([<thermalfoundation:bait>, <harvestcraft:fishtrapbaititem>, <prodigytech:meat_ground>]);
//vaninlla
addFishRec1(<minecraft:fish>, <thermalfoundation:material:816>);
addFishRec1(<minecraft:fish:1>, <thermalfoundation:material:816>);
addFishRec1(<minecraft:fish:2>, <thermalfoundation:material:816>);
addFishRec1(<minecraft:fish:3>, <thermalfoundation:material:816>);

//pam
addFishRec1(<harvestcraft:musselrawitem>, <biomesoplenty:coral:2>);
addFishRec1(<harvestcraft:scalloprawitem>, <biomesoplenty:coral:2>);
addFishRec1(<harvestcraft:clamrawitem>, <biomesoplenty:coral:2>);
addFishRec1(<harvestcraft:oysterrawitem>, <biomesoplenty:coral:2>);

addFishRec1(<harvestcraft:crabrawitem>, <biomesoplenty:coral>);
addFishRec1(<harvestcraft:shrimprawitem>, <biomesoplenty:coral>);
addFishRec1(<harvestcraft:crayfishrawitem>, <biomesoplenty:coral>);

addFishRec1(<harvestcraft:greenheartfishitem>, <minecraft:dye:2>);

//atum
addFishRec1(<atum:fish_forsaken>, <harvestcraft:tacoitem>);

//my
addFishRec2(<contenttweaker:obsidian_trout>, <mekanism:nugget> * 3, <liquid:andesite_magma> * 100, 3);







//proc
mods.exnihilocreatio.Sieve.addFlintMeshRecipe(<alchemistry:wet_sand>, <biomesoplenty:coral>, 0.1);
mods.exnihilocreatio.Sieve.addFlintMeshRecipe(<alchemistry:wet_sand>, <biomesoplenty:coral:1>, 0.1);
mods.exnihilocreatio.Sieve.addFlintMeshRecipe(<alchemistry:wet_sand>, <biomesoplenty:coral:2>, 0.1);
mods.exnihilocreatio.Sieve.addFlintMeshRecipe(<alchemistry:wet_sand>, <biomesoplenty:coral:3>, 0.1);

{
    recipes.addShapeless("ia_cutting_oil_fish", <immersivepetroleum:material> * 2, [
        <harvestcraft:cuttingboarditem>.reuse(),
        <contenttweaker:oil_fish>
    ]);
    scripts.helper.addSawRecipe(<contenttweaker:oil_fish>, <immersivepetroleum:material> * 4);
}
{
    recipes.addShapeless("ia_cutting_diamond_crab", <minecraft:diamond>, [
        <harvestcraft:cuttingboarditem>.reuse(),
        <contenttweaker:diamond_crab>
    ]);
    scripts.helper.addSawRecipe(<contenttweaker:diamond_crab>, <mekanism:otherdust> * 3);


}
{
    recipes.addShapeless("ia_cutting_obsidian_trout", <thermalfoundation:material:770> * 2, [
        <harvestcraft:cuttingboarditem>.reuse(),
        <contenttweaker:obsidian_trout>
    ]);
    scripts.helper.addSawRecipe(<contenttweaker:obsidian_trout>, <thermalfoundation:material:770> * 4);
    mods.mekanism.compressor.addRecipe(
        <contenttweaker:obsidian_trout>, 
        <mekanism:ingot> * 2
    );


    recipes.addShapeless("ia_cutting_basalt_anchovy", <contenttweaker:basalt_dust> * 2, [
        <harvestcraft:cuttingboarditem>.reuse(),
        <contenttweaker:basalt_anchovy>
    ]);
    scripts.helper.addSawRecipe(<contenttweaker:basalt_anchovy>, <contenttweaker:basalt_dust> * 4);
}



{//coral
    mods.roots.Mortar.addRecipe("coral", 
        <contenttweaker:coral_dust>,
        [<biomesoplenty:coral>, <biomesoplenty:coral:1>, <biomesoplenty:coral:2>, <biomesoplenty:coral:3>, <ore:coralFeed>]
    );
    mods.roots.Mortar.addRecipe("coral2", 
        <contenttweaker:coral_dust> * 2,
        [<biomesoplenty:coral>, <biomesoplenty:coral:1>, <biomesoplenty:coral:2>, <biomesoplenty:coral:3>, <contenttweaker:plant_sample>]
    );
    <contenttweaker:coral_dust>.addTooltip("You are the second worst thing to happen to the corals");

    //pink coral
    mods.thermalexpansion.Centrifuge.addRecipe([
        <thermalfoundation:material:816> % 10
    ], <biomesoplenty:coral> * 1, <liquid:blood> * 100, 2000);
    recipes.addShaped("ia_pink_cloud", <aether_legacy:aercloud:3>,[
        [<biomesoplenty:coral>, <biomesoplenty:coral>, <biomesoplenty:coral>],
        [<biomesoplenty:coral>, <ore:aercloud>, <biomesoplenty:coral>],
        [<biomesoplenty:coral>, <biomesoplenty:coral>, <biomesoplenty:coral>]
    ]);
    mods.thermalexpansion.InductionSmelter.addRecipe(
        <contenttweaker:coral_dust>, 
        <biomesoplenty:coral>, <contenttweaker:plant_sample>, 
        1000
    );

    //orange coral
    mods.thermalexpansion.InductionSmelter.addRecipe(
        <contenttweaker:coral_dust>, 
        <biomesoplenty:coral:1>, <contenttweaker:plant_sample>, 
        1000
    );

    //blue coral
    mods.thermalexpansion.Centrifuge.addRecipe([
        <mekores:mekanismore:38> % 5,
        <thermalfoundation:material:816> % 10
    ], <biomesoplenty:coral:2> * 4, <liquid:electrotine> * 100, 2000);
    mods.thermalexpansion.InductionSmelter.addRecipe(
        <contenttweaker:coral_dust>, 
        <biomesoplenty:coral:2>, <contenttweaker:plant_sample>, 
        1000
    );


    //glowing coral
    mods.thermalexpansion.Centrifuge.addRecipe([
        <minecraft:glowstone_dust> % 50,
        <minecraft:glowstone_dust> % 30,
        <thermalfoundation:material:816> % 10
    ], <biomesoplenty:coral:3> * 4, null, 2000);
    mods.thermalexpansion.InductionSmelter.addRecipe(
        <contenttweaker:coral_dust>, 
        <biomesoplenty:coral:3>, <contenttweaker:plant_sample>, 
        1000
    );

    
}

//zanite coral
mods.thermalexpansion.Centrifuge.addRecipe([
    <aether_legacy:zanite_gemstone> % 40,
    <biomesoplenty:gem:4> % 20
], <contenttweaker:zanite_coral>, null, 2000);

//crab
recipes.addShapeless("ia_crab_shell", <quark:crab_shell>, [
    <harvestcraft:crabrawitem>, <harvestcraft:crabrawitem>
]);
recipes.addShapeless("ia_crab_shell2", <quark:crab_shell> * 2, [
    <mod_lavacow:mimic_claw>, <mod_lavacow:mimic_claw>
]);

//green fish
recipes.addShaped("ia_activated_green_fish", <contenttweaker:activated_green_fish>, [
    [null, <prodigytech:energion_dust>, null], 
    [<prodigytech:energion_dust>, <harvestcraft:greenheartfishitem>, <prodigytech:energion_dust>], 
    [null, <prodigytech:energion_dust>, null]
]);
<contenttweaker:activated_green_fish>.addTooltip("Activate yourself");

scripts.content_machines.addFluidSieveRecipeRandom(
    [
        <taiga:jauxum_dust> % 40,
        <contenttweaker:jade_dust> % 50
    ], <liquid:emerald> * 75,
    <liquid:mushroom_stew> * 500, <contenttweaker:activated_green_fish>,
    <exnihilocreatio:item_mesh:4>, 20, 250
);