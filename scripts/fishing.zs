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

    rec.addEnergyPerTickInput(100);

    //rec.addDimensionRequirement([66]);

    //rec.addFluidOutput(<liquid:bugs> * tier_bugs[tier]);
    rec.addItemInput(coral);
    rec.addItemInput(cat);
    rec.addItemInput(<ore:coralFeed>, 3);
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

addCoralGrowthRec(<contenttweaker:zanite_coral>, <contenttweaker:manyullyn_dust>);
addCoralGrowthRec(<contenttweaker:terra_coral>, <contenttweaker:fertilizer7>);


function addFishRec(fout as IItemStack, cat as IItemStack){
    print("fish" ~ counter);
    var rec = RecipeBuilder.newBuilder("fish" ~ counter, "fish_tank", 8 * 20);
    counter += 1;

    rec.addEnergyPerTickInput(100);

    //rec.addDimensionRequirement([66]);

    //rec.addFluidOutput(<liquid:bugs> * tier_bugs[tier]);
    //rec.addItemInput(fin);
    rec.addItemInput(fout);
    rec.addItemInput(cat);
    rec.addItemInput(<ore:fishFeed>, 2);
    rec.addFluidInput(<liquid:seaweed_rich_water> * 1000);
    
            
    for i in 0 to 6{
        rec.addItemOutput(fout);
        rec.setChance( 0.75 - (0.05 * i) );
    }
    

    rec.build();
}
<ore:fishFeed>.addItems([<thermalfoundation:bait>, <harvestcraft:fishtrapbaititem>, <prodigytech:meat_ground>]);
addFishRec(<minecraft:fish>, <thermalfoundation:material:816>);
addFishRec(<minecraft:fish:1>, <thermalfoundation:material:816>);
addFishRec(<minecraft:fish:2>, <thermalfoundation:material:816>);
addFishRec(<minecraft:fish:3>, <thermalfoundation:material:816>);

addFishRec(<harvestcraft:musselrawitem>, <biomesoplenty:coral:2>);
addFishRec(<harvestcraft:scalloprawitem>, <biomesoplenty:coral:2>);
addFishRec(<harvestcraft:clamrawitem>, <biomesoplenty:coral:2>);
addFishRec(<harvestcraft:oysterrawitem>, <biomesoplenty:coral:2>);

addFishRec(<harvestcraft:crabrawitem>, <biomesoplenty:coral>);
addFishRec(<harvestcraft:shrimprawitem>, <biomesoplenty:coral>);
addFishRec(<harvestcraft:crayfishrawitem>, <biomesoplenty:coral>);

addFishRec(<harvestcraft:greenheartfishitem>, <minecraft:dye:2>);








//proc
mods.exnihilocreatio.Sieve.addFlintMeshRecipe(<alchemistry:wet_sand>, <biomesoplenty:coral>, 0.1);
mods.exnihilocreatio.Sieve.addFlintMeshRecipe(<alchemistry:wet_sand>, <biomesoplenty:coral:1>, 0.1);
mods.exnihilocreatio.Sieve.addFlintMeshRecipe(<alchemistry:wet_sand>, <biomesoplenty:coral:2>, 0.1);
mods.exnihilocreatio.Sieve.addFlintMeshRecipe(<alchemistry:wet_sand>, <biomesoplenty:coral:3>, 0.1);

//pink coral
mods.thermalexpansion.Centrifuge.addRecipe([
    <thermalfoundation:material:816> % 10
], <biomesoplenty:coral> * 4, <liquid:blood> * 100, 2000);
recipes.addShaped("ia_pink_cloud", <aether_legacy:aercloud:3>,[
    [<biomesoplenty:coral>, <biomesoplenty:coral>, <biomesoplenty:coral>],
    [<biomesoplenty:coral>, <ore:aercloud>, <biomesoplenty:coral>],
    [<biomesoplenty:coral>, <biomesoplenty:coral>, <biomesoplenty:coral>]
]);

//blue coral
mods.thermalexpansion.Centrifuge.addRecipe([
    <mekores:mekanismore:38> % 5,
    <thermalfoundation:material:816> % 10
], <biomesoplenty:coral:2> * 4, <liquid:electrotine> * 100, 2000);


//glowing coral
mods.thermalexpansion.Centrifuge.addRecipe([
    <minecraft:glowstone_dust> % 50,
    <minecraft:glowstone_dust> % 30,
    <thermalfoundation:material:816> % 10
], <biomesoplenty:coral:3> * 4, null, 2000);


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