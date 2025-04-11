import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;


import mods.enderio.AlloySmelter;

import mods.enderio.Vat;
//mods.enderio.Vat.addRecipe(ILiquidStack output, ILiquidStack input, IIngredient[] slot1Solids, float[] slot1Mults, IIngredient[] slot2Solids, float[] slot2Mults, @Optional int energyCost);

import mods.thermalexpansion.Transposer;
import mods.thermalexpansion.Refinery;


static gem_parts as IItemStack[string][string] = {
    ruby: {
        gem: <biomesoplenty:gem:1>,
        delicate: <projectred-core:resource_item:200>,

        dust: <contenttweaker:gem_ruby_dust>,
        seed: <contenttweaker:gem_ruby_seed>,

        i1: <actuallyadditions:item_crystal>,
        i2: <erebus:materials:11>
    },
    topaz: {
        gem: <biomesoplenty:gem:3>,
        i1: <contenttweaker:coppra>,
        i2: <prodigytech:inferno_crystal>,
        dust: <contenttweaker:gem_topaz_dust>,
        seed: <contenttweaker:gem_topaz_seed>,
        delicate: <contenttweaker:delicate_topaz>
    },
    amber: {
        gem: <biomesoplenty:gem:7>,
        i1: <contenttweaker:goold>,
        i2: <aether_legacy:golden_amber>,
        dust: <contenttweaker:gem_amber_dust>,
        seed: <contenttweaker:gem_amber_seed>,
        delicate: <contenttweaker:delicate_amber>
    },
    peridot: {
        gem: <biomesoplenty:gem:2>,
        i1: <actuallyadditions:item_crystal:4>,
        i2: <erebus:materials:1>,
        dust: <contenttweaker:gem_peridot_dust>,
        seed: <contenttweaker:gem_peridot_seed>,
        delicate: <projectred-core:resource_item:202>
    },
    malachite: {
        gem: <biomesoplenty:gem:5>,
        i1: <contenttweaker:nittin>,
        i2: <contenttweaker:malachite_monocrystal>,
        dust: <contenttweaker:gem_malachite_dust>,
        seed: <contenttweaker:gem_malachite_seed>,
        delicate: <contenttweaker:delicate_malachite>
    },
    sapphire: {
        gem: <biomesoplenty:gem:6>,
        i1: <actuallyadditions:item_crystal:1>,
        i2: <tconstruct:materials:10>,
        dust: <contenttweaker:gem_sapphire_dust>,
        seed: <contenttweaker:gem_sapphire_seed>,
        delicate: <projectred-core:resource_item:201>
    },
    tanzanite: {
        gem: <biomesoplenty:gem:4>,
        i1: <actuallyadditions:item_crystal:3>,
        i2: <appliedenergistics2:material:12>,
        dust: <contenttweaker:gem_tanzanite_dust>,
        seed: <contenttweaker:gem_tanzanite_seed>,
        delicate: <contenttweaker:delicate_tanzanite>
    }
};
static gem_solution as ILiquidStack[string] = {
    ruby: <liquid:ruby_slury>,
    topaz: <liquid:topaz_slury>,
    amber: <liquid:amber_slury>,
    peridot: <liquid:peridot_slury>,
    malachite: <liquid:malachite_slury>,
    sapphire: <liquid:sapphire_slury>,
    tanzanite: <liquid:tanzanite_slury>,
};
static gem_growing_reagent as IItemStack[] = [
    <contenttweaker:supersalt>,
    <moretcon:dustrunesteel>,
    <thermalfoundation:material:1028>
];
static gem_growing_reagent_mult as float[] = [
    1.0,
    1.0,
    1.0
];


function addSeedGemRecipes(gem as string){
    //+gem + i1 + i2 -> dust
    //+dust -> seed
    //+seed + cf12 -> gem
    //+seed + cf3 -> l gem
    //l gem + seed ->d gem
    AlloySmelter.addRecipe(gem_parts[gem].dust * 2, 
        [gem_parts[gem].gem,
        gem_parts[gem].i1,
        gem_parts[gem].i2],
        10000
    );
    recipes.addShapeless("ia_" ~ gem ~ "_seed", gem_parts[gem].seed,
        [<appliedenergistics2:material:45>, <biomesoplenty:white_sand>, gem_parts[gem].dust, <mekanism:saltblock>]
    );


    
    Transposer.addFillRecipe(
        gem_parts[gem].gem, 
        gem_parts[gem].seed, <liquid:crystal_fluid2> * 50, 
        4000
    );

    Vat.addRecipe(
        gem_solution[gem] * 1000, 1.0, <liquid:crystal_fluid3> * 1000, 
        [gem_parts[gem].dust], [1.0], 
        gem_growing_reagent, gem_growing_reagent_mult, 
        30000
    );
    

    Refinery.addRecipe(<liquid:crystal_waste> * 200, gem_parts[gem].delicate % 5, gem_solution[gem] * 400, 4000);
    /*
    Transposer.addFillRecipe(
        gem_parts[gem].delicate, 
        gem_parts[gem].gem * 4, gem_solution[gem] * 4000, 
        30000
    );*/
}
addSeedGemRecipes("ruby");
addSeedGemRecipes("topaz");
addSeedGemRecipes("amber");
addSeedGemRecipes("peridot");
addSeedGemRecipes("malachite");
addSeedGemRecipes("sapphire");
addSeedGemRecipes("tanzanite");

mods.thermalexpansion.Centrifuge.addRecipe([<thermalfoundation:material> % 75, <contenttweaker:chrome_dust> % 25], <contenttweaker:gem_ruby_dust>, null, 5000);


recipes.remove(<biomesoplenty:terrestrial_artifact>);
recipes.addShaped("ia_terrestrial_artifact", <biomesoplenty:terrestrial_artifact>, [
	[<projectred-core:resource_item:200>, <contenttweaker:delicate_topaz>, <contenttweaker:delicate_amber>], 
	[<contenttweaker:delicate_tanzanite>, <contenttweaker:rainbow_crystal_cluster>, <projectred-core:resource_item:202>], 
	[<projectred-core:resource_item:201>, <extrautils2:decorativesolid:8>, <contenttweaker:delicate_malachite>]
]);

<enderio:item_material:14>.displayName = "Vivid Crystal";
recipes.remove(<enderio:item_material:14>);
mods.tconstruct.Casting.removeTableRecipe(<enderio:item_material:14>);
recipes.addShaped("ia_vivid_crystal", <enderio:item_material:14>, [
	[<enderio:item_alloy_endergy_ingot:6>, <enderio:item_alloy_endergy_ingot:6>, <enderio:item_alloy_endergy_ingot:6>], 
	[<enderio:item_alloy_endergy_ingot:6>, <contenttweaker:delicate_malachite>, <enderio:item_alloy_endergy_ingot:6>], 
	[<enderio:item_alloy_endergy_ingot:6>, <enderio:item_alloy_endergy_ingot:6>, <enderio:item_alloy_endergy_ingot:6>]
]);

recipes.remove(<enderio:item_material:15>);
mods.tconstruct.Casting.removeTableRecipe(<enderio:item_material:15>);
recipes.addShaped("ia_vibrant_crystal", <enderio:item_material:15>, [
	[<enderio:item_alloy_ingot:2>, <enderio:item_alloy_ingot:2>, <enderio:item_alloy_ingot:2>], 
	[<enderio:item_alloy_ingot:2>, <projectred-core:resource_item:202>, <enderio:item_alloy_ingot:2>], 
	[<enderio:item_alloy_ingot:2>, <enderio:item_alloy_ingot:2>, <enderio:item_alloy_ingot:2>]
]);

recipes.addShaped("ia_weather_crystal1", <enderio:item_material:18> * 4, [
    [<contenttweaker:mixed_will_crystal>, <enderio:item_material:14>, <contenttweaker:mixed_will_crystal>], 
    [<enderio:item_material:15>, <enderio:item_material:16>, <enderio:item_material:15>], 
    [<contenttweaker:mixed_will_crystal>, <enderio:item_material:14>, <contenttweaker:mixed_will_crystal>]
]);
recipes.addShaped("ia_weather_crystal2", <enderio:item_material:18> * 4, [
    [<contenttweaker:crystal_metal_nugget>, <enderio:item_material:14>, <contenttweaker:crystal_metal_nugget>], 
    [<enderio:item_material:15>, <enderio:item_material:16>, <enderio:item_material:15>], 
    [<contenttweaker:crystal_metal_nugget>, <enderio:item_material:14>, <contenttweaker:crystal_metal_nugget>]
]);




recipes.addShapeless("ia_gem_cat", <contenttweaker:gem_catalyst> * 8, 
    [
        <contenttweaker:research_chemistry1>.reuse(), 
        <contenttweaker:malachite_polycrystal>, <tconevo:material:1>, <thermalfoundation:material:1027>, <bigreactors:dustgraphite>
    ]
);
mods.thermalexpansion.Imbuer.addRecipe(<liquid:crystal_fluid1> * 500, <contenttweaker:gem_catalyst>, <liquid:crystal_waste> * 1000, 4000);
mods.immersivepetroleum.Distillation.addRecipe(
    [
        <liquid:tanzanite_slury> * 15,
        <liquid:sapphire_slury> * 15,
        <liquid:malachite_slury> * 15,
        <liquid:peridot_slury> * 15,
        <liquid:amber_slury> * 15, 
        <liquid:topaz_slury> * 15, 
        <liquid:ruby_slury> * 15
    ], [<actuallyadditions:item_dust:2>, <taiga:dilithium_dust>, <taiga:tiberium_dust>], 
    <liquid:crystal_fluid1> * 100, 
    40 * 1000, 40, 
    [0.05, 0.025, 0.02]
);

scripts.helper.addFluidMixerRecipe(
    <liquid:crystal_fluid2> * 500, 
    <liquid:ethanol> * 1000, <liquid:crystaloil> * 200, <actuallyadditions:item_dust:2>, 
    1024, 20
);
scripts.helper.addFluidMixerRecipe(
    <liquid:crystal_fluid2> * 1000, 
    <liquid:ammonia> * 1000, <liquid:crystaloil> * 250, <actuallyadditions:item_dust:2>, 
    720, 20
);
scripts.helper.addFluidMixerRecipe(
    <liquid:crystal_fluid2> * 2000, 
    <liquid:hexane> * 500, <liquid:crystaloil> * 300, <actuallyadditions:item_dust:2>, 
    512, 20
);
scripts.helper.addFluidMixerRecipe(
    <liquid:crystal_fluid2> * 1500, 
    <liquid:hexane> * 500, <liquid:crystaloil> * 300, <contenttweaker:coral_dust> * 8, 
    512, 20
);


scripts.content_machines.addFluidSieveRecipeRandom(
    [
        <contenttweaker:biocell>,
        <aether_legacy:zanite_gemstone> % 30
    ], <liquid:crystal_fluid3> * 400, 
    null, <contenttweaker:gemmed_biomass>,
    <exnihilocreatio:item_mesh:4>,
    40, 3000
);




<ore:gems>.addItems([
    <extrautils2:suncrystal>,
    <tconstruct:materials:9>,
    <minecraft:diamond>,
    <minecraft:emerald>,
    <thermalfoundation:material:893>,
    <thermalfoundation:material:894>,
    <thermalfoundation:material:895>,
    <aether_legacy:ambrosium_shard>,
    <thermalfoundation:material:866>,
    <appliedenergistics2:material:10>,
    <appliedenergistics2:material:12>,
    <extrautils2:ingredients>,
    <erebus:materials:1>,
    <darkutils:shulker_pearl>,
    <biomesoplenty:gem:7>,
    <extrautils2:ingredients:5>,
    <moretcon:gemvoidspar>,
    <mysticalworld:amethyst_gem>,
    <tinkersaether:swet_crystal>,
    <tconstruct:materials:10>,
    <biomesoplenty:gem:3>,
    <biomesoplenty:gem:4>,
    <biomesoplenty:gem:5>,
    <biomesoplenty:gem:6>,
    <taiga:dilithium_crystal>,
    <moretcon:gemelectarite>,
    <mysticalworld:pearl>,
    <tconstruct:materials:11>,
    <tconevo:material:1>,
    <astralsorcery:itemcraftingcomponent>,
    <biomesoplenty:gem>,
    <biomesoplenty:gem:1>,
    <biomesoplenty:gem:2>,
    <taiga:tiberium_crystal>,
    <quark:biotite>,
    <aether_legacy:zanite_gemstone>
]);