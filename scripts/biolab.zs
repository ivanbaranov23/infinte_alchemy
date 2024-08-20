import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;

import mods.thermalexpansion.Transposer;


static  counter as int = 0;
function addBiolabRecipe(
        out as IItemStack[], inp as IItemStack[], fluids as ILiquidStack[], cats as IItemStack[], 
        sec as int, rft as int, temp as int = 0
    ){
    var rec = RecipeBuilder.newBuilder("biolab_rec_" ~ counter, "biolab", sec * 20);
    counter += 1;

    if (rft != 0) {rec.addEnergyPerTickInput(rft);}

    for o in out{
        rec.addItemOutput(o);
    }

    for i in inp{
        rec.addItemInput(i);
    }
    for f in fluids{
        rec.addFluidInput(f);
    }
    
    for cat in cats{
        rec.addItemInput(cat);
        rec.setChance(0.0);
    }

    if (temp != 0) {rec.addHotAirInput(temp, temp - 1.0, 1.0 / 0.0);}

    rec.build();
}

//->biomass
addBiolabRecipe(
    [<contenttweaker:biomass_cell>], 
    [
        <contenttweaker:biocell>,
        <extendedcrafting:singularity_custom:100> * 4,
        <contenttweaker:plant_sample> * 64,
        <mekanism:biofuel> * 64,
        <aether_legacy:healing_stone> * 16,
        <contenttweaker:life> * 3
    ], [
        <liquid:meat> * 25000,
        <liquid:blood> * 25000
    ], [],
    60, 1000, 250
);
{//biomass->grown biomass
    addBiolabRecipe(
        [<contenttweaker:grown_biomass_cell>], 
        [
            <contenttweaker:biomass_cell>,
            <prodigytech:meat_ground> * 4,
            <mekanism:biofuel> * 4,

        ], [
            <liquid:blood> * 1000
        ], [],
        45, 500, 125
    );
    addBiolabRecipe(
        [<contenttweaker:grown_biomass_cell>], 
        [
            <contenttweaker:biomass_cell>,
            <prodigytech:meat_patty> * 4,
            <contenttweaker:plant_sample> * 4,

        ], [
            <liquid:if.protein> * 1000
        ], [],
        30, 500, 250
    );
    addBiolabRecipe(
        [<contenttweaker:grown_biomass_cell>], 
        [
            <contenttweaker:biomass_cell>,
            <tconevo:edible:1> * 8,
            <contenttweaker:biomix> * 8,

        ], [
            <liquid:bacteria_broth> * 1000
        ], [<contenttweaker:research_bacteria1>],
        15, 500, 400
    );
    addBiolabRecipe(
        [<contenttweaker:grown_biomass_cell>], 
        [
            <contenttweaker:biomass_cell>,
            <tconevo:edible:1> * 8,
            <contenttweaker:biomix> * 8,

        ], [
            <liquid:bacteria_waste> * 1000
        ], [<contenttweaker:research_bacteria1>],
        10, 500, 400
    );
}
{//grown biomass->more biomass
    addBiolabRecipe(
        [<contenttweaker:biomass_cell> * 2], 
        [
            <contenttweaker:grown_biomass_cell>,
            <contenttweaker:biocell>,
            <prodigytech:meat_ground> * 8

        ], [
            <liquid:mushroom_stew> * 2000,
            <liquid:meat> * 2000
        ], [],
        30, 500
    );
    addBiolabRecipe(
        [<contenttweaker:biomass_cell> * 3], 
        [
            <contenttweaker:grown_biomass_cell>,
            <contenttweaker:biocell> * 2,
            <prodigytech:meat_ground> * 12

        ], [
            <liquid:mushroom_stew> * 2000,
            <liquid:pheromones> * 1000
        ], [],
        30, 500, 125
    );
    addBiolabRecipe(
        [<contenttweaker:biomass_cell> * 6], 
        [
            <contenttweaker:grown_biomass_cell>,
            <contenttweaker:biocell> * 5,
            <prodigytech:meat_ground> * 16,
            <contenttweaker:activated_biopower>
        ], [
            <liquid:glowshroom_stew> * 2000,
            <liquid:pheromones> * 2000
        ], [],
        30, 500, 300
    );
    addBiolabRecipe(
        [<contenttweaker:biomass_cell> * 16], 
        [
            <contenttweaker:grown_biomass_cell>,
            <contenttweaker:biocell> * 15,
            <prodigytech:meat_ground> * 32,
            <contenttweaker:activated_biopower> * 3,
            <contenttweaker:life>

        ], [
            <liquid:glowshroom_stew> * 20000,
            <liquid:refined_pheromones> * 10000
        ], [],
        30, 2500, 1200
    );

    addBiolabRecipe(
        [<contenttweaker:bacteria> * 24, <contenttweaker:dirty_biocell>], 
        [
            <contenttweaker:grown_biomass_cell>,
            <contenttweaker:glucose> * 4

        ], [
        ], [<contenttweaker:research_bacteria1>],
        30, 500, 250
    );
}
{//biomats
    {//1
        addBiolabRecipe(
            [<contenttweaker:biomaterial1>], 
            [
                <contenttweaker:grown_biomass_cell>,
                <contenttweaker:whitened_biomass> * 8,
                <mod_lavacow:chitin> * 4,
                <twilightforest:fiery_blood>
            ], [
                <liquid:speed_potion> * 1500
            ], [],
            60, 1000, 250
        );
        addBiolabRecipe(
            [<contenttweaker:biomaterial1>], 
            [
                <contenttweaker:grown_biomass_cell>,
                <contenttweaker:coaled_bioash> * 8,
                <mod_lavacow:chitin> * 6,
                <twilightforest:fiery_blood> * 2,
                <prodigytech:primordium> * 4
            ], [
                <liquid:speed_potion> * 2500
            ], [],
            45, 2000, 500
        );
        addBiolabRecipe(
            [<contenttweaker:biomaterial1>], 
            [
                <contenttweaker:grown_biomass_cell>,
                <contenttweaker:ashen_biocoal> * 8,
                <biomesoplenty:ash> * 16,
                <mod_lavacow:chitin> * 12,
                <twilightforest:fiery_blood> * 4,
                <prodigytech:primordium> * 16
            ], [
                <liquid:speed_potion> * 5000,
                <liquid:refined_pheromones> * 4000
            ], [],
            10, 4000, 1000
        );
    }
    {//2
        addBiolabRecipe(
            [<contenttweaker:biomaterial2>], 
            [
                <contenttweaker:biomaterial1>,
                <contenttweaker:activated_biopower> * 4,
                <contenttweaker:nether_star_dust>,
                <contenttweaker:basic_neuron> * 8,
                <bloodmagic:component:5> * 4,
                <contenttweaker:life>
            ], [
                <liquid:cool_soup> * 3000,
                <liquid:sentient_metal> * 72
            ], [],
            60, 3000, 1200
        );
        addBiolabRecipe(
            [<contenttweaker:biomaterial2>], 
            [
                <contenttweaker:biomaterial1>,
                <contenttweaker:activated_biopower> * 4,
                <contenttweaker:nether_star_dust>,
                <contenttweaker:basic_neuron> * 8,
                <bloodmagic:component:8>,
                <contenttweaker:life>
            ], [
                <liquid:cool_soup> * 3000,
                <liquid:sentient_metal> * 72
            ], [],
            40, 3000, 1200
        );
        addBiolabRecipe(
            [<contenttweaker:biomaterial2>], 
            [
                <contenttweaker:biomaterial1>,
                <contenttweaker:activated_biopower> * 4,
                <contenttweaker:nether_star_dust>,
                <contenttweaker:basic_neuron> * 8,
                <bloodmagic:component:30>,
                <contenttweaker:life>
            ], [
                <liquid:cool_soup> * 3000,
                <liquid:sentient_metal> * 72
            ], [],
            60, 3000, 1200
        );
        addBiolabRecipe(
            [<contenttweaker:biomaterial2>], 
            [
                <contenttweaker:biomaterial1>,
                <contenttweaker:activated_biopower> * 4,
                <contenttweaker:nether_star_dust>,
                <contenttweaker:basic_neuron> * 8,
                <contenttweaker:reagent_wood> * 2,
                <contenttweaker:life>
            ], [
                <liquid:cool_soup> * 3000,
                <liquid:sentient_metal> * 72
            ], [],
            60, 3000, 1200
        );
        addBiolabRecipe(
            [<contenttweaker:biomaterial2>], 
            [
                <contenttweaker:biomaterial1>,
                <contenttweaker:activated_biopower> * 4,
                <contenttweaker:nether_star_dust>,
                <contenttweaker:basic_neuron> * 8,
                <contenttweaker:reagent_oil> * 12,
                <contenttweaker:life>
            ], [
                <liquid:cool_soup> * 3000,
                <liquid:sentient_metal> * 72
            ], [],
            60, 3000, 1200
        );
        addBiolabRecipe(
            [<contenttweaker:biomaterial2>], 
            [
                <contenttweaker:biomaterial1>,
                <contenttweaker:activated_biopower> * 4,
                <contenttweaker:nether_star_dust>,
                <contenttweaker:basic_neuron> * 8,
                <bloodmagic:component:31> * 6,
                <contenttweaker:life>
            ], [
                <liquid:cool_soup> * 3000,
                <liquid:sentient_metal> * 72
            ], [],
            60, 3000, 1200
        );
        addBiolabRecipe(
            [<contenttweaker:biomaterial2>], 
            [
                <contenttweaker:biomaterial1>,
                <contenttweaker:activated_biopower> * 4,
                <contenttweaker:nether_star_dust>,
                <contenttweaker:basic_neuron> * 8,
                <contenttweaker:reagent_mushroom>,
                <contenttweaker:life>
            ], [
                <liquid:cool_soup> * 3000,
                <liquid:sentient_metal> * 72
            ], [],
            40, 3000, 1200
        );
        
    }
}
{//biomat1 -> things
    {//neuromass mk1    
        addBiolabRecipe(
            [<contenttweaker:neuromass1>], 
            [
                <contenttweaker:biomaterial1>,
                <prodigytech:primordium> * 8,
                <contenttweaker:electric_manyullyn_dust> * 12,
                <immersiveengineering:metal:14> * 4

            ], [
                <liquid:witchwater> * 4000
            ], [],
            30, 500
        );

        addBiolabRecipe(
            [<contenttweaker:basic_neuron> * 4, <contenttweaker:dirty_biocell>],
            [
                <contenttweaker:neuromass1>,
                <xreliquary:mob_ingredient:6>,
                <aether_legacy:healing_stone>,
                <mekanism:compresseddiamond>
            ], [], [],
            10, 500
        );
        addBiolabRecipe(
            [<contenttweaker:basic_neuron> * 6, <contenttweaker:dirty_biocell>],
            [
                <contenttweaker:neuromass1>,
                <aether_legacy:healing_stone>,
                <mekanism:compresseddiamond>
            ], [
                <liquid:nutrient_distillation> * 2000
            ], [],
            10, 1000
        );

        addBiolabRecipe(
            [<contenttweaker:basic_neuron> * 9, <contenttweaker:dirty_biocell>],
            [
                <contenttweaker:neuromass1>,
                <contenttweaker:elastic_clay>,
                <contenttweaker:basic_neuron>,
                <mekanism:compresseddiamond> * 2
            ], [
                <liquid:nutrient_distillation> * 2000
            ], [<contenttweaker:neuro_singularity>],
            10, 1000
        );
        addBiolabRecipe(
            [<contenttweaker:basic_neuron> * 17, <contenttweaker:dirty_biocell>],
            [
                <contenttweaker:neuromass1>,
                <contenttweaker:transmut_gel>,
                <contenttweaker:basic_neuron> * 3,
                <mekanism:compresseddiamond> * 3
            ], [
                <liquid:nutrient_distillation> * 3000
            ], [<contenttweaker:neuro_singularity>],
            10, 1000
        );
    }
    {//skymass mk1
        addBiolabRecipe(
            [<contenttweaker:skymass1>], 
            [
                <contenttweaker:biomaterial1>,
                <thermalfoundation:material:1026> * 8,
                <contenttweaker:tinezo_dust> * 8,
                <quark:gravisand> * 12

            ], [
            ], [],
            60, 500, 400
        );
        addBiolabRecipe(
            [<contenttweaker:skymass1>], 
            [
                <contenttweaker:biomaterial1>,
                <contenttweaker:sky_grain> * 8,
                <contenttweaker:tinezo_dust> * 8,
                <quark:gravisand> * 12

            ], [
                <liquid:aerotheum> * 2500
            ], [],
            45, 500, 500
        );
        addBiolabRecipe(
            [<contenttweaker:skymass1>], 
            [
                <contenttweaker:biomaterial1>,
                <contenttweaker:sky_grain> * 8,
                <contenttweaker:tinezo_dust> * 8,
                <aether_legacy:enchanted_gravitite> * 2

            ], [
                <liquid:aerotheum> * 2500
            ], [],
            30, 500, 500
        );
        addBiolabRecipe(
            [<contenttweaker:skymass1>], 
            [
                <contenttweaker:biomaterial1>,
                <contenttweaker:sky_grain> * 8,
                <contenttweaker:tinezo_dust> * 6,
                <aether_legacy:enchanted_gravitite>,
                <thermalfoundation:material:1026> * 8

            ], [
                <liquid:cloud_seed_concentrated> * 2000
            ], [<extendedcrafting:singularity_custom:15>],
            10, 1500, 500
        );
    }
    {//bloodmasss mk1
        addBiolabRecipe(
            [<contenttweaker:bloodmass1>], 
            [
                <contenttweaker:biomaterial1>,
                <prodigytech:meat_ground> * 4,
                <thermalfoundation:material> * 2,
                <erebus:life_blood>

            ], [
                <liquid:liquidoxygen> * 1500
            ], [],
            60, 500
        );
        addBiolabRecipe(
            [<contenttweaker:bloodmass1> * 3], 
            [
                <contenttweaker:biomaterial1>,
                <contenttweaker:biocell> * 2,
                <prodigytech:meat_ground> * 8,
                <thermalfoundation:material> * 3,
                <twilightforest:fiery_blood>

            ], [
                <liquid:liquidoxygen> * 3500
            ], [],
            40, 1500
        );
        addBiolabRecipe(
            [<contenttweaker:bloodmass1> * 5], 
            [
                <contenttweaker:biomaterial1>,
                <contenttweaker:biocell> * 4,
                <prodigytech:meat_ground> * 12,
                <thermalfoundation:material> * 4,
                <twilightforest:fiery_blood> * 2,
                <contenttweaker:isis_godshard>

            ], [
                <liquid:ow_air> * 5000
            ], [<extendedcrafting:singularity_custom:9>],
            20, 5000, 250
        );

        addBiolabRecipe(
            [<erebus:life_blood> * 16, <contenttweaker:dirty_biocell>],
            [
                <contenttweaker:bloodmass1>,
                <tconstruct:edible:3> * 3
            ], [
                <liquid:beetle_juice> * 2000
            ], [],
            10, 500
        );
        addBiolabRecipe(
            [<twilightforest:fiery_blood> * 16, <contenttweaker:dirty_biocell>],
            [
                <contenttweaker:bloodmass1>,
                <minecraft:glass_bottle> * 16,
                <contenttweaker:firebrick> * 8,
                <contenttweaker:ra_godshard> * 4
            ], [
                <liquid:pyrotheum> * 1500
            ], [],
            10, 500
        );
    }
    {//glowmass mk1
        addBiolabRecipe(
            [<contenttweaker:glowmass1>], 
            [
                <contenttweaker:biomaterial1>,
                <minecraft:blaze_powder> * 8,
                <roots:moonglow_leaf> * 8

            ], [
                <liquid:glowstone> * 2000
            ], [],
            60, 500, 250
        );
        addBiolabRecipe(
            [<contenttweaker:glowmass1>], 
            [
                <contenttweaker:biomaterial1>,
                <minecraft:blaze_powder> * 8,
                <twilightforest:torchberries> * 2

            ], [
                <liquid:glowstone> * 2000
            ], [],
            30, 500, 250
        );
        addBiolabRecipe(
            [<contenttweaker:glowmass1>], 
            [
                <contenttweaker:biomaterial1>,
                <minecraft:blaze_powder> * 8,
                <quark:glowshroom> * 4

            ], [
                <liquid:glowstone> * 2000
            ], [],
            20, 500, 250
        );
        
        addBiolabRecipe(
            [<erebus:materials:12> * 48, <contenttweaker:dirty_biocell>], 
            [
                <contenttweaker:glowmass1>,
                <minecraft:glowstone_dust> * 8

            ], [
            ], [],
            60, 500
        );
        addBiolabRecipe(
            [<erebus:materials:12> * 48, <contenttweaker:dirty_biocell>], 
            [
                <contenttweaker:glowmass1>,
                <enderio:block_holy_fog> * 4

            ], [
            ], [],
            30, 500
        );
        addBiolabRecipe(
            [<erebus:materials:12> * 48, <contenttweaker:dirty_biocell>], 
            [
                <contenttweaker:glowmass1>,
                <biomesoplenty:coral:3> * 4

            ], [
            ], [],
            30, 500
        );
        addBiolabRecipe(
            [<erebus:materials:12> * 64, <erebus:materials:12> * 64, <contenttweaker:dirty_biocell>], 
            [
                <contenttweaker:glowmass1>,
                <thermalfoundation:material:894> * 4

            ], [
            ], [<contenttweaker:light_cell>],
            10, 5000
        );
        addBiolabRecipe(
            [<erebus:materials:12> * 64, <biomesoplenty:coral:3> * 64, <quark:glowshroom> * 64, <twilightforest:torchberries> * 64, <contenttweaker:dirty_biocell>], 
            [
                <contenttweaker:glowmass1>,
                <bloodmagic:component:11>

            ], [
            ], [<contenttweaker:light_cell>],
            10, 5000
        );
    }
}
{//biomat2 -> things
    {//muscle
        addBiolabRecipe(
            [<contenttweaker:musclemass1>], 
            [
                <contenttweaker:biomaterial2>,
                <erebus:materials:13> * 24,
                <contenttweaker:elastic_clay> * 8,
                <harvestcraft:crackeritem> * 64,
                <harvestcraft:crackeritem> * 64,
                <harvestcraft:meatfeastpizzaitem> * 12
            ], [
                <liquid:if.protein> * 10000,
                <liquid:lifeessence> * 2000
            ], [],
            60, 5000, 500
        );

        addBiolabRecipe(
            [<contenttweaker:muscle_cell> * 12, <contenttweaker:dirty_biocell>],
            [
                <contenttweaker:musclemass1>,
                <contenttweaker:blood_shard2>,
                <aether_legacy:healing_stone> * 4,
                <contenttweaker:empowered_biospice> * 3
            ], [
                <liquid:biotite> * 4000,
                <liquid:potion>.withTag({Potion: "cofhcore:strength4"}) * 10000
            ], [],
            10, 500
        );
        addBiolabRecipe(
            [<contenttweaker:muscle_cell> * 16, <contenttweaker:dirty_biocell>],
            [
                <contenttweaker:musclemass1>,
                <contenttweaker:blood_shard2>,
                <aether_legacy:healing_stone> * 4,
                <contenttweaker:food_pellet>
            ], [
                <liquid:biotite> * 4000
            ], [],
            10, 500
        );
    }
    {//neuromass mk2
        addBiolabRecipe(
            [<contenttweaker:neuromass2>], 
            [
                <contenttweaker:biomaterial2>,
                <contenttweaker:neuro_crystal>,
                <bloodmagic:component:25> * 8,
                <enderio:item_material:40> * 3,
                <harvestcraft:energydrinkitem> * 16,
                <contenttweaker:electric_stone_dust> * 32
            ], [
                <liquid:lifeessence> * 5000,
                <liquid:fluxed_electrum> * 2000
            ], [],
            60, 5000, 1000
        );
        addBiolabRecipe(
            [<contenttweaker:neuron> * 8, <contenttweaker:dirty_biocell>], 
            [
                <contenttweaker:neuromass2>,
                <contenttweaker:electricium> * 4,
                <contenttweaker:electric_wool> * 16
            ], [
                <liquid:sentient_metal> * 576
            ], [],
            60, 5000
        );
    }
}


function addIncubatorRecipe(out as IItemStack[], inp as IItemStack[], cat as IItemStack, sec as int, energy as int){
    var rec = RecipeBuilder.newBuilder("incubation_" + out[0].name, "biolab", sec * 20);

    if (energy != 0) {rec.addEnergyPerTickInput(energy);}

    for o in out{
        rec.addItemOutput(o);
    }

    for i in inp{
        rec.addItemInput(i);
    }
    
    if (cat){
        rec.addItemInput(cat);
        rec.setChance(0.0);
    }
    rec.addHotAirInput(250, 250, 1001);

    rec.build();
}
function addSemenationRecipe(out as IItemStack[], inp as IItemStack[], cat as IItemStack, sec as int, energy as int, tier as int){
    var rec = RecipeBuilder.newBuilder("semenation_" + out[0].name, "biolab", sec * 20);

    if (energy != 0) {rec.addEnergyPerTickInput(energy);}

    for o in out{
        rec.addItemOutput(o);
    }

    for i in inp{
        rec.addItemInput(i);
    }
    
    if (cat){
        rec.addItemInput(cat);
        rec.setChance(0.0);
    }

    rec.addFluidInput(<liquid:meat> * (1500 * tier));
    rec.addFluidInput(<liquid:blood> * (1000 * tier));

    rec.build();
}
function addReproductionRecipe(out as IItemStack[], inp as IItemStack[], cat as IItemStack, sec as int, energy as int, tier as int){
    var rec = RecipeBuilder.newBuilder("reproduction_" + out[0].name, "biolab", sec * 20);

    if (energy != 0) {rec.addEnergyPerTickInput(energy);}

    for o in out{
        rec.addItemOutput(o);
    }

    for i in inp{
        rec.addItemInput(i);
    }
    
    if (cat){
        rec.addItemInput(cat);
        rec.setChance(0.0);
    }

    rec.addFluidInput(<liquid:meat> * (1500 * tier));
    rec.addFluidInput(<liquid:blood> * (1000 * tier));

    rec.build();
}
function addItemLabRecipe(out as IItemStack[], inp as IItemStack[], cat as IItemStack, sec as int, energy as int){
    var rec = RecipeBuilder.newBuilder("item_" + out[0].name, "biolab", sec * 20);

    if (energy != 0) {rec.addEnergyPerTickInput(energy);}

    for o in out{
        rec.addItemOutput(o);
    }

    for i in inp{
        rec.addItemInput(i);
    }
    
    if (cat){
        rec.addItemInput(cat);
        rec.setChance(0.0);
    }

    rec.build();
}

val empty_cell as IItemStack = <contenttweaker:biocell>;

recipes.addShaped("ia_biocell", <contenttweaker:biocell>, [
	[<actuallyadditions:item_crystal_empowered:2>, <mekanism:plasticblock:15>, <actuallyadditions:item_crystal_empowered:2>], 
	[<contenttweaker:medical_alloy_wire>, <aether_legacy:skyroot_bucket:3>, <contenttweaker:medical_alloy_wire>], 
	[<actuallyadditions:item_crystal_empowered:2>, <mekanism:plasticblock:15>, <actuallyadditions:item_crystal_empowered:2>]
]);
scripts.content_machines.addAssemblerRecipe(
    [<contenttweaker:biocell>, <aether_legacy:skyroot_bucket>],
    [
        <aether_legacy:skyroot_bucket:3>,
        <contenttweaker:medical_alloy_wire>,
        <mekanism:plasticblock:15>,
        <actuallyadditions:item_crystal_empowered:2> * 2
    ], null,
    20, 250
);
Transposer.addFillRecipe(
	<contenttweaker:biocell>,
	<contenttweaker:dirty_biocell>, <liquid:sterile_water> * 250,
	1000
);

