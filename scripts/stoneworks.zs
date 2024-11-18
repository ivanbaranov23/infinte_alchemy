import mods.modularmachinery.RecipeBuilder;

import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;




{//umber
    <ore:stone>.remove(<erebus:umberstone>);
    <ore:cobblestone>.remove(<erebus:umberstone:1>);
    mods.thermalexpansion.Transposer.addFillRecipe(
        <erebus:umberstone>, 
        <minecraft:stone:1>, <liquid:beetle_juice> * 100, 
        1000
    );

    mods.exnihilocreatio.Hammer.addRecipe(<erebus:umberstone>, <erebus:umberstone:1>, 0, 1.0, 1.0);
    mods.exnihilocreatio.Hammer.addRecipe(<erebus:umberstone:1>, <erebus:umbergravel>, 0, 1.0, 1.0);

    scripts.helper.addSimpleCrushingRecipe(<erebus:umberstone>, <erebus:umberstone:1>);
    scripts.helper.addSimpleCrushingRecipe(<erebus:umberstone:1>, <erebus:umbergravel>);
}

mods.thermalexpansion.Transposer.addFillRecipe(
    <tconstruct:seared:1>, 
    <minecraft:cobblestone>, <liquid:stone> * 216, 
    1500
);

{//lapis
    mods.prodigytech.explosionfurnace.recipes.addRecipe(
        <minecraft:cobblestone> * 4, 
        <contenttweaker:lapis_cobblestone> * 4, 
        250, 
        <enderio:item_material:32>, 
        1
    );
    mods.prodigytech.explosionfurnace.recipes.addRecipe(
        <minecraft:stone> * 16, 
        <contenttweaker:lapis_stone> * 16, 
        250, 
        <actuallyadditions:item_crystal:1>, 
        1
    );
    mods.prodigytech.explosionfurnace.recipes.addRecipe(
        <minecraft:cobblestone> * 16, 
        <contenttweaker:lapis_cobblestone> * 16, 
        250, 
        <actuallyadditions:item_crystal:1>, 
        1
    );
    
    furnace.addRecipe(<contenttweaker:lapis_stone>, <contenttweaker:lapis_cobblestone>);
    mods.exnihilocreatio.Hammer.addRecipe(<contenttweaker:lapis_stone>, <contenttweaker:lapis_cobblestone>, 0, 1.0, 1.0);
    mods.exnihilocreatio.Hammer.addRecipe(<contenttweaker:lapis_cobblestone>, <contenttweaker:lapis_gravel>, 0, 1.0, 1.0);

    scripts.helper.addSimpleCrushingRecipe(<contenttweaker:lapis_cobblestone>, <contenttweaker:lapis_gravel>);

    recipes.addShaped("ia_lapis_tile", <contenttweaker:lapis_tile> * 4, [
        [<contenttweaker:lapis_stone>, <contenttweaker:lapis_stone>],
        [<contenttweaker:lapis_stone>, <contenttweaker:lapis_stone>]
    ]);
}

{//atum
    //limestones
    <ore:stone>.remove(<atum:limestone>);
    mods.thermalexpansion.InductionSmelter.addRecipe(
        <atum:limestone> * 16, 
        <minecraft:sandstone> * 3, <chisel:limestone2:7> * 16, 
        1000
    );

    mods.exnihilocreatio.Hammer.addRecipe(<atum:limestone>, <atum:limestone_gravel>, 0, 1.0, 1.0);
    mods.exnihilocreatio.Hammer.addRecipe(<atum:limestone_gravel>, <atum:sand>, 0, 1.0, 1.0);

    scripts.helper.addSimpleCrushingRecipe(<atum:limestone>, <atum:limestone_gravel>);
    scripts.helper.addSimpleCrushingRecipe(<atum:limestone_gravel>, <atum:sand>);

    <ore:gravel>.remove(<atum:limestone_gravel>);
    recipes.addShapeless("ia_atum_gravel_to_gravel", <minecraft:gravel> * 2, [<minecraft:gravel>, <atum:limestone_gravel>]);

    <atum:sand>.displayName = "Limestone Sand";
    <ore:sand>.remove(<atum:sand>);
    recipes.addShapeless("ia_atum_sand_to_sand", <minecraft:sand> * 2, [<minecraft:sand>, <atum:sand>]);

    recipes.addShaped("ia_atum_sand", <atum:sand> * 8, [
        [<minecraft:sand>, <minecraft:sand>, <minecraft:sand>], 
        [<minecraft:sand>, <deepmoblearning:living_matter_atum>, <minecraft:sand>], 
        [<minecraft:sand>, <minecraft:sand>, <minecraft:sand>]
    ]);

    mods.thermalexpansion.Transposer.addFillRecipe(
        <atum:marl>, 
        <atum:limestone_gravel>, 
        <liquid:clay> * 144, 500
    );
    //other
    mods.thermalexpansion.InductionSmelter.addRecipe(
        <atum:alabaster> * 8, 
        <minecraft:concrete_powder> * 4, <atum:limestone_gravel> * 4, 
        4000
    );
    mods.thermalexpansion.InductionSmelter.addRecipe(
        <atum:porphyry> * 8, 
        <quark:basalt> * 4, <atum:limestone_gravel> * 4, 
        4000
    );

    //khnumite
    mods.mekanism.reaction.addRecipe(
        <appliedenergistics2:material:5> * 12, <liquid:sand> * 250, <gas:oxygen> * 450, 
        <atum:khnumite_raw>, <gas:oxygen> * 50, 1000, 60
    );

    recipes.addShaped("ia_mud", <biomesoplenty:mud> * 16, [
        [<atum:coin_dirty>, <atum:coin_dirty>, <atum:coin_dirty>],
        [<atum:coin_dirty>, <minecraft:clay>, <atum:coin_dirty>],
        [<atum:coin_dirty>, <atum:coin_dirty>, <atum:coin_dirty>]
    ]);
    
}

{//twilight
    recipes.addShaped("ia_naga_stone", <twilightforest:naga_stone:1> * 16, [
        [<tconstruct:brownstone:3>, <mysticalagriculture:soulstone>, <tconstruct:brownstone:3>], 
        [<mysticalagriculture:soulstone>, <twilightforest:naga_scale>, <mysticalagriculture:soulstone>], 
        [<tconstruct:brownstone:3>, <mysticalagriculture:soulstone>, <tconstruct:brownstone:3>]
    ]);

    recipes.addShapeless("ia_umber_soil", <twilightforest:uberous_soil>, [
        <contenttweaker:mushroomite_mud>,
        <atum:fertile_soil>,
        <roots:elemental_soil_air>,
        <erebus:mud>,
        <erebus:umbergravel>
    ]);
}

{//aether
    recipes.addShaped("ia_holystone", <aether_legacy:holystone> * 8, [
        [<minecraft:stone>, <minecraft:stone>, <minecraft:stone>], 
        [<minecraft:stone>, <deepmoblearning:living_matter_aether>, <minecraft:stone>], 
        [<minecraft:stone>, <minecraft:stone>, <minecraft:stone>]
    ]);
}


{//skystone
    scripts.content_machines.addFluidAlloyerRecipe(
        <appliedenergistics2:sky_stone_block> * 2, 
        <minecraft:netherrack> | <erebus:umberstone> | <atum:limestone>, <appliedenergistics2:material:45>, <liquid:lava> * 800, 
        10, 150
    );
    scripts.content_machines.addFluidAlloyerRecipe(
        <appliedenergistics2:sky_stone_block> * 3, 
        <aether_legacy:holystone> | <minecraft:end_stone>, <appliedenergistics2:material:45>, <liquid:lava> * 800, 
        10, 150
    );

    
    furnace.remove(<appliedenergistics2:smooth_sky_stone_block>);
    mods.enderio.AlloySmelter.addRecipe(<appliedenergistics2:smooth_sky_stone_block> * 4, 
        [
            <appliedenergistics2:sky_stone_block> * 4,
            <immersivepetroleum:stone_decoration> * 3,
            <extrautils2:compressedsand:1>
        ]
    );
    scripts.content_machines.addAdvancedMixerRecipe(
        [
            <appliedenergistics2:smooth_sky_stone_block> * 6
        ], [],
        [
            <immersivepetroleum:stone_decoration> * 2,
            <appliedenergistics2:sky_stone_block> * 4,
            <contenttweaker:sky_grain> | <contenttweaker:nuit_godshard>
        ], [
            <liquid:lubricant> * 1000
        ], 20, 512
    );
    scripts.content_machines.addAdvancedMixerRecipe(
        [
            <appliedenergistics2:smooth_sky_stone_block> * 6
        ], [],
        [
            <immersivepetroleum:stone_decoration> * 2,
            <appliedenergistics2:sky_stone_block> * 4,
            <contenttweaker:sky_grain> | <contenttweaker:nuit_godshard>
        ], [
            <liquid:skyroot> * 1000
        ], 20, 512
    );

    


    recipes.addShapeless("ia_sky_grain_to_sky_stone1", <appliedenergistics2:material:45> * 4, 
        [<contenttweaker:sky_grain>, <prodigytech:ash>, <prodigytech:ash>, <minecraft:gravel>, <minecraft:coal>]
    );
    recipes.addShapeless("ia_sky_grain_to_sky_stone2", <appliedenergistics2:material:45> * 8, 
        [<contenttweaker:sky_grain>, <prodigytech:ash>, <prodigytech:ash>, <minecraft:gravel>, <minecraft:coal>, <thermalfoundation:material:1027>]
    );
    recipes.addShapeless("ia_sky_grain_to_sky_stone3", <appliedenergistics2:material:45> * 12, 
        [
            <contenttweaker:sky_grain>, 
            <prodigytech:ash>, <prodigytech:ash>, <prodigytech:ash>, 
            <contenttweaker:gravel_wool>, <minecraft:coal>, 
            <thermalfoundation:material:1027>
        ]
    );

    mods.thermalexpansion.Centrifuge.addRecipe(
		[
            <thermalfoundation:material:768> % 15,
            <thermalfoundation:material:770> % 25,
            <contenttweaker:sky_grain> % 1
        ], 
		<appliedenergistics2:material:45>, null, 
		2000
	);
}


mods.thermalexpansion.Transposer.addFillRecipe(
    <biomesoplenty:dirt:1>, 
    <minecraft:dirt>, <liquid:sand> * 100, 
    1500
);


{//quark stone
    <ore:blockSeared>.remove(<tconstruct:seared:1>);
    mods.thermalexpansion.InductionSmelter.addRecipe(
        <quark:biome_cobblestone:1>, 
        <tconstruct:seared:1>, <minecraft:snowball>, 
        1000
    );
    mods.thermalexpansion.InductionSmelter.addRecipe(
        <quark:biome_cobblestone>, 
        <tconstruct:seared:1>, <thermalfoundation:material:771>, 
        1000
    );

    recipes.addShaped("ia_permafrost_alt", <quark:biome_cobblestone:1> * 2, [
        [<tconstruct:seared:1>, <mod_lavacow:shattered_ice>], 
        [<mod_lavacow:shattered_ice>, <tconstruct:seared:1>,]
    ]);

    

    //jasper
    mods.thermalexpansion.Transposer.addFillRecipe(
        <quark:jasper> * 8, 
        <quark:hardened_clay_tiles> * 2, 
        <liquid:clay> * 144, 500
    );
    scripts.jei.addJEIhint(
        [], [<liquid:creosote>, <liquid:witchwater>],
        [<minecraft:cobblestone>.withDisplayName("In world mixing")],
        [<quark:jasper>]
    );

    //marble
    scripts.jei.addJEIhint(
        [], [<liquid:ash_solution>, <liquid:witchwater>],
        [<minecraft:cobblestone>.withDisplayName("In world mixing")],
        [<quark:marble>]
    );
}

function addCobbleRecipe(out as IItemStack, cat as IItemStack, iin as WeightedItemStack[], fin as ILiquidStack[], time_sec as int, energy as int){
    var rec = RecipeBuilder.newBuilder(out.name, "large_cobblegen", time_sec * 20);
    if (energy != 0) {rec.addEnergyPerTickInput(energy);}

    rec.addItemOutput(out);
    
    if (cat){
        rec.addItemInput(cat);
        rec.setChance(0.0);
    }

    for i in iin{
        rec.addItemInput(i.stack);
		rec.setChance(i.chance);
    }
    for fi in fin{
        rec.addFluidInput(fi);
    }
    rec.build();
}

{//compressed cobble
    addCobbleRecipe(<extrautils2:compressedcobblestone>, <extrautils2:compressedcobblestone>, 
        [<minecraft:stone:5>],
        [<liquid:water> * 10, <liquid:lava> * 10],
        3, 0
    );
    addCobbleRecipe(<extrautils2:compressedcobblestone:1>, <extrautils2:compressedcobblestone:1>, 
        [<contenttweaker:soot>, <erebus:umberstone>, <minecraft:stone:5> * 4],
        [<liquid:water> * 40, <liquid:lava> * 40, <liquid:glass> * 10],
        6, 32
    );
    addCobbleRecipe(<extrautils2:compressedcobblestone:2>, <extrautils2:compressedcobblestone:2>, 
        [<contenttweaker:soot> * 2, <twilightforest:naga_stone:1>, <erebus:umberstone> * 4, <minecraft:stone:5> * 16],
        [<liquid:water> * 160, <liquid:lava> * 160, <liquid:glass> * 20, <liquid:stone> * 20],
        12, 128
    );
    addCobbleRecipe(<extrautils2:compressedcobblestone:3>, <extrautils2:compressedcobblestone:3>, 
        [<contenttweaker:soot> * 4, <engineersdecor:rebar_concrete>, <twilightforest:naga_stone:1> * 4, <erebus:umberstone> * 16, <minecraft:stone:5> * 64],
        [<liquid:water> * 640, <liquid:lava> * 640, <liquid:glass> * 100, <liquid:stone> * 100, <liquid:sand> * 100],
        24, 512
    );

    addCobbleRecipe(<extrautils2:compressedcobblestone:4>, <extrautils2:compressedcobblestone:4>, 
        [<contenttweaker:soot> * 8, <contenttweaker:bedrockium_small_chunk>, <engineersdecor:rebar_concrete> * 4, <twilightforest:naga_stone:1> * 16, <erebus:umberstone> * 64],
        [<liquid:water> * 2560, <liquid:lava> * 2560, <liquid:glass> * 1000, <liquid:stone> * 1000, <liquid:sand> * 1000],
        48, 2048
    );
    addCobbleRecipe(<extrautils2:compressedcobblestone:5>, <extrautils2:compressedcobblestone:5>, 
        [<contenttweaker:soot> * 16, <extendedcrafting:singularity_custom:2>, <contenttweaker:bedrockium_small_chunk> * 4, <engineersdecor:rebar_concrete> * 16, <twilightforest:naga_stone:1> * 64],
        [<liquid:water> * 10240, <liquid:lava> * 10240, <liquid:glass> * 4000, <liquid:stone> * 4000, <liquid:sand> * 4000, <liquid:concrete> * 2000],
        96, 2048 * 4
    );
    addCobbleRecipe(<extrautils2:compressedcobblestone:6>, <extrautils2:compressedcobblestone:6>, 
        [<contenttweaker:soot> * 32, <thermalexpansion:machine:15>, <extendedcrafting:singularity_custom:2> * 4, <contenttweaker:bedrockium_small_chunk> * 16, <engineersdecor:rebar_concrete> * 64],
        [<liquid:water> * 40960, <liquid:lava> * 40960, <liquid:glass> * 8000, <liquid:stone> * 8000, <liquid:sand> * 8000, <liquid:petrotheum> * 4000, <liquid:concrete> * 4000],
        192, 2048 * 16
    );
    //todo: add botania, blood magic or alchemistry thing
    addCobbleRecipe(<extrautils2:compressedcobblestone:7>, <extrautils2:compressedcobblestone:7>, 
        [<contenttweaker:soot> * 64, <extendedcrafting:singularity_custom:35>, <thermalexpansion:machine:15> * 4, <extendedcrafting:singularity_custom:2> * 16, <contenttweaker:bedrockium_small_chunk> * 64],
        [<liquid:water> * 163840, <liquid:lava> * 163840, <liquid:glass> * 32000, <liquid:stone> * 32000, <liquid:sand> * 32000, <liquid:petrotheum> * 8000, <liquid:concrete> * 8000, <liquid:ore_make> * 4000],
        384, 2048 * 64
    );
}





mods.bloodmagic.AlchemyTable.addRecipe(
    <exnihilocreatio:block_dust>, 
    [
        <bloodmagic:cutting_fluid:1>,
        <minecraft:sand>
    ], 
    50, 20, 1
);
{//single
    mods.bloodmagic.AlchemyTable.addRecipe(
        <extrautils2:compressedgravel:0>, 
        [
            <bloodmagic:cutting_fluid:1>,
            <extrautils2:compressedcobblestone:0>
        ], 
        1000, 20, 1
    );
    mods.bloodmagic.AlchemyTable.addRecipe(
        <extrautils2:compressedsand:0>, 
        [
            <bloodmagic:cutting_fluid:1>,
            <extrautils2:compressedgravel:0>
        ], 
        1000, 20, 1
    );
    mods.bloodmagic.AlchemyTable.addRecipe(
        <excompressum:compressed_block>, 
        [
            <bloodmagic:cutting_fluid:1>,
            <extrautils2:compressedsand:0>
        ], 
        1000, 20, 1
    );
}
{//double
    mods.bloodmagic.AlchemyTable.addRecipe(
        <extrautils2:compressedgravel:1>, 
        [
            <bloodmagic:cutting_fluid:1>,
            <extrautils2:compressedcobblestone:1>
        ], 
        1000, 20, 2
    );
    mods.bloodmagic.AlchemyTable.addRecipe(
        <extrautils2:compressedsand:1>, 
        [
            <bloodmagic:cutting_fluid:1>,
            <extrautils2:compressedgravel:1>
        ], 
        1000, 20, 2
    );
    mods.bloodmagic.AlchemyTable.addRecipe(
        <excompressum:compressed_block> * 9, 
        [
            <bloodmagic:cutting_fluid:1>,
            <extrautils2:compressedsand:1>
        ], 
        1000, 20, 2
    );
}
mods.bloodmagic.AlchemyTable.addRecipe(
    <extrautils2:compressedgravel:1> * 9, 
    [
        <bloodmagic:cutting_fluid:1>,
        <extrautils2:compressedcobblestone:2>
    ], 
    2000, 20, 3
);
mods.bloodmagic.AlchemyTable.addRecipe(
    <extrautils2:compressedgravel:1> * 64, 
    [
        <bloodmagic:cutting_fluid:1>,
        <extrautils2:compressedcobblestone:3>
    ], 
    10000, 20, 4
);

{//netherrack
    mods.bloodmagic.AlchemyTable.addRecipe(
        <exnihilocreatio:block_netherrack_crushed>, 
        [
            <bloodmagic:cutting_fluid:1>,
            <minecraft:netherrack>
        ], 
        1000, 20, 1
    );

    mods.bloodmagic.AlchemyTable.addRecipe(
        <excompressum:compressed_block:6>, 
        [
            <bloodmagic:cutting_fluid:1>,
            <extrautils2:compressednetherrack>
        ], 
        1000, 20, 2
    );
    mods.bloodmagic.AlchemyTable.addRecipe(
        <excompressum:compressed_block:6> * 9, 
        [
            <bloodmagic:cutting_fluid:1>,
            <extrautils2:compressednetherrack:1>
        ], 
        1000, 20, 3
    );
    mods.bloodmagic.AlchemyTable.addRecipe(
        <excompressum:compressed_block:6> * 64, 
        [
            <bloodmagic:cutting_fluid:1>,
            <extrautils2:compressednetherrack:2>
        ], 
        1000, 20, 4
    );
}
{//endstone
    mods.bloodmagic.AlchemyTable.addRecipe(
        <exnihilocreatio:block_endstone_crushed>, 
        [
            <bloodmagic:cutting_fluid:1>,
            <minecraft:end_stone>
        ], 
        1000, 20, 3
    );
    mods.bloodmagic.AlchemyTable.addRecipe(
        <excompressum:compressed_block:7>, 
        [
            <bloodmagic:cutting_fluid:1>,
            <excompressum:compressed_block:10>
        ], 
        2000, 20, 4
    );
}




addCobbleRecipe(<biomesoplenty:flesh> * 4, <biomesoplenty:flesh>, 
    [],
    [<liquid:water> * 100, <liquid:blood> * 100],
    1, 128
);
mods.thermalexpansion.Sawmill.addRecipe(<biomesoplenty:fleshchunk> * 4, <biomesoplenty:flesh>, 2500);
<biomesoplenty:fleshchunk>.displayName = "Chunk of Nether Flesh";
<biomesoplenty:flesh>.displayName = "Nether Flesh";
mods.thermalexpansion.Pulverizer.addRecipe(<prodigytech:meat_ground>, <biomesoplenty:fleshchunk>, 2000, <prodigytech:meat_ground>, 50);
mods.mekanism.crusher.addRecipe(<biomesoplenty:fleshchunk>, <prodigytech:meat_ground> * 2);
mods.enderio.SagMill.addRecipe(
    [<prodigytech:meat_ground>, <prodigytech:meat_ground>, <prodigytech:meat_ground>, <prodigytech:meat_ground>], 
    [1.0, 0.5, 0.25, 0.25], 
    <biomesoplenty:fleshchunk>, "MULTIPLY_OUTPUT"
);
scripts.jei.addJEIhint(
    [], [<liquid:water>, <liquid:blood>],
    [<minecraft:cobblestone>.withDisplayName("In world mixing")],
    [<biomesoplenty:flesh>]
);

//basalt
mods.thermalexpansion.Transposer.addFillRecipe(
    <taiga:basalt_block>, 
    <minecraft:obsidian>, 
    <liquid:thermal> * 144, 4500
);




mods.roots.Fey.addRecipe("wet_sand", <alchemistry:wet_sand> * 2, [
    <ore:sand>, <ore:sand>,
    <minecraft:melon>, <harvestcraft:seaweeditem>, <minecraft:water_bucket>
]);