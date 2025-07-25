import mods.modularmachinery.RecipeBuilder;

import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;

import mods.thermalexpansion.InductionSmelter;


function addCobbleRecipe(out as IItemStack, cat as IItemStack, iin as WeightedItemStack[], fin as ILiquidStack[], time_sec as int, energy as int, n_cons_fl as bool){
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
        if (n_cons_fl) rec.setChance(0.0);
    }
    rec.build();
}


{//stones
    {//andesite
        mods.thermalexpansion.Crucible.removeRecipe(<minecraft:stone:5>);

        scripts.jei.addJEIhint(
            [<minecraft:stone:5>], [],
            [<exnihilocreatio:block_crucible:1>],
            [<forge:bucketfilled>.withTag({FluidName: "andesite", Amount: 1000})], [<liquid:andesite>]
        );
        scripts.jei.addJEIhint(
            [], [<liquid:witchwater>, <liquid:andesite>],
            [<minecraft:cobblestone>.withDisplayName("In world mixing")],
            [<minecraft:cobblestone>, <minecraft:stone:5>, <minecraft:netherrack>]
        );

        mods.tconstruct.Melting.addRecipe(<liquid:andesite> * 250, <minecraft:stone:5>);
        mods.thermalexpansion.Crucible.addRecipe(<liquid:andesite> * 250, <minecraft:stone:5>, 4000);

        recipes.addShaped("ia_andesite_cr", <exnihilocreatio:block_andesite_crushed>, [
            [null, <exnihilocreatio:item_pebble:3>, null],
            [<exnihilocreatio:item_pebble:3>, <exnihilocreatio:item_pebble:3>, <exnihilocreatio:item_pebble:3>],
            [null, <exnihilocreatio:item_pebble:3>, null]
        ]);
    }

    recipes.addShaped("ia_diorite_cr", <exnihilocreatio:block_diorite_crushed>, [
            [null, <exnihilocreatio:item_pebble:2>, null],
            [<exnihilocreatio:item_pebble:2>, <exnihilocreatio:item_pebble:2>, <exnihilocreatio:item_pebble:2>],
            [null, <exnihilocreatio:item_pebble:2>, null]
    ]);

    recipes.addShaped("ia_granite_cr", <exnihilocreatio:block_granite_crushed>, [
            [null, <exnihilocreatio:item_pebble:1>, null],
            [<exnihilocreatio:item_pebble:1>, <exnihilocreatio:item_pebble:1>, <exnihilocreatio:item_pebble:1>],
            [null, <exnihilocreatio:item_pebble:1>, null]
    ]);


    

    {//basalt
        //backport
        mods.chisel.Carving.addVariation("basalt", <netherblocks:basalt>);
        mods.chisel.Carving.addVariation("basalt", <netherblocks:basalt:1>);

        //dust pile
        scripts.helper.addSimpleCrushingRecipeWByproduct(
            <chisel:basalt2:7>, <contenttweaker:basalt_dust> * 2, <contenttweaker:basalt_dust>, 50
        );
        mods.prodigytech.rotarygrinder.addRecipe(<chisel:basalt2:7>, <contenttweaker:basalt_dust> * 2);

        mods.thermalexpansion.Centrifuge.addRecipe([
            <appliedenergistics2:material:5> % 10,
            <appliedenergistics2:material:5> % 5,
            <mekanism:dirtydust> % 5
            //olivine
        ], <contenttweaker:basalt_dust> * 4, null, 400);
        mods.thermalexpansion.Transposer.addFillRecipe(
            <thermalfoundation:material:2053>, 
            <contenttweaker:basalt_dust>, <liquid:petrotheum> * 50, 
            1000
        );


        mods.thermalexpansion.Transposer.addFillRecipe(
            <chisel:basalt2:7>, 
            <contenttweaker:basalt_dust>, <liquid:stone> * 576, 
            1000
        );

        //other basalt
        mods.thermalexpansion.Transposer.addFillRecipe(
            <taiga:basalt_block>, 
            <minecraft:obsidian>, 
            <liquid:thermal> * 144, 4500
        );
    }

    {//obsidian
        mods.thermalexpansion.InductionSmelter.addRecipe(
            <netherblocks:crying_obsidian>, 
            <roots:runed_obsidian>,
            <harvestcraft:onionitem> * 6,
            12000
        );
        mods.thermalexpansion.InductionSmelter.addRecipe(
            <netherblocks:crying_obsidian>, 
            <roots:runed_obsidian>,
            <minecraft:ghast_tear>,
            12000
        );
    }
}

{//erebus
    {//umber
        <ore:stone>.remove(<erebus:umberstone>);
        <ore:cobblestone>.remove(<erebus:umberstone:1>);

        mods.tconstruct.Casting.addBasinRecipe(
            <erebus:umberstone>, 
            <minecraft:stone:1>, <liquid:beetle_juice>, 250, 
            true, 400
        );
        mods.thermalexpansion.Transposer.addFillRecipe(
            <erebus:umberstone>, 
            <minecraft:stone:1>, <liquid:beetle_juice> * 100, 
            1000
        );

        mods.immersiveengineering.AlloySmelter.addRecipe(
            <erebus:umberstone>, 
            <minecraft:stone:1> * 16,
            <extrautils2:magicapple> * 4,
            200
        );
        mods.thermalexpansion.InductionSmelter.addRecipe(
            <erebus:umberstone>, 
            <minecraft:stone:1> * 16,
            <extrautils2:magicapple> * 4,
            400
        );

        mods.exnihilocreatio.Hammer.addRecipe(<erebus:umberstone>, <erebus:umberstone:1>, 0, 1.0, 1.0);
        mods.exnihilocreatio.Hammer.addRecipe(<erebus:umberstone:1>, <erebus:umbergravel>, 0, 1.0, 1.0);

        scripts.helper.addSimpleCrushingRecipe(<erebus:umberstone>, <erebus:umberstone:1>);
        scripts.helper.addSimpleCrushingRecipe(<erebus:umberstone:1>, <erebus:umbergravel>);

        recipes.addShapeless("ia_umberpebble", <contenttweaker:umberstone_dust> * 2, [<erebus:umbergravel>]);
        recipes.addShapeless("ia_umberstone_dust", <erebus:umbergravel>, [
            <contenttweaker:umberstone_dust>, <contenttweaker:umberstone_dust>,
            <contenttweaker:umberstone_dust>, <contenttweaker:umberstone_dust>
        ]);
        mods.thermalexpansion.Centrifuge.addRecipe([
            <thermalfoundation:material:64> % 5,
            <contenttweaker:jade_dust> % 3,
            <thermalfoundation:material:768> % 4,
            <appliedenergistics2:material:2> % 3
        ], <contenttweaker:umberstone_dust> * 4, null, 400);

        addCobbleRecipe(
            <erebus:umberstone> * 16, <erebus:umberstone>, 
            [<minecraft:stone:1> * 16], 
            [<liquid:beetle_juice> * 1000], 
            1, 1024, true
        );
    }

    //mud
    mods.thermalexpansion.Transposer.addFillRecipe(
        <erebus:mud>, 
        <biomesoplenty:mud>, <liquid:claymud> * 100, 
        1000
    );
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
    //recipes.addShapeless("ia_atum_sand_to_sand", <minecraft:sand> * 2, [<minecraft:sand>, <atum:sand>]);

    recipes.addShaped("ia_atum_sand", <atum:sand> * 16, [
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

    //dust pile
    recipes.addShapeless("ia_atum_sand_to_pile", <contenttweaker:limestone_dust> * 4, [<atum:sand>, <atum:sand>]);
    recipes.addShapeless("ia_limestone_dust", <atum:sand>, [
        <contenttweaker:limestone_dust>, <contenttweaker:limestone_dust>,
        <contenttweaker:limestone_dust>, <contenttweaker:limestone_dust>
    ]);
    mods.thermalexpansion.Centrifuge.addRecipe([
        <minecraft:sand>,
        <contenttweaker:relic_nugget> % 4,
        <thermalfoundation:material:892> % 1,
        <appliedenergistics2:material:3> % 10
    ], <contenttweaker:limestone_dust> * 4, null, 400);
    scripts.content_machines.addFluidSieveRecipeRandom(
        [
            <contenttweaker:relic_nugget> % 6,
            <thermalfoundation:material:892> % 3,
            <appliedenergistics2:material:3> % 15,
            <mekanism:dirtydust:1> % 3
        ], <liquid:sand> * 50, 
        <liquid:pure_water> * 250, <contenttweaker:limestone_dust> * 2,
        <exnihilocreatio:item_mesh:4>,
        80, 500
    );
}

{//nether
    recipes.addShaped("ia_blackstone1", <netherblocks:blackstone> * 2, [
        [<minecraft:cobblestone>, <ore:dyeBlack>],
        [<ore:dyeBlack>, <minecraft:cobblestone>]
    ]);
    recipes.addShaped("ia_blackstone2", <netherblocks:blackstone> * 4, [
        [<minecraft:cobblestone>, <minecraft:obsidian> | <appliedenergistics2:sky_stone_block>],
        [<minecraft:obsidian> | <appliedenergistics2:sky_stone_block>, <minecraft:cobblestone>]
    ]);
    
    {//netherrack
        scripts.helper.addSimpleCrushingRecipe(<minecraft:netherrack>, <exnihilocreatio:block_netherrack_crushed>);

        recipes.addShapeless("ia_netherrack", <minecraft:netherrack> * 2, [
            <ore:cobblestone>, <ore:cobblestone>, <minecraft:soul_sand>, <minecraft:blaze_powder>
        ]);

        recipes.addShapeless("ia_netherrack_dust", <contenttweaker:netherrack_dust> * 2, [<exnihilocreatio:block_netherrack_crushed>]);
        recipes.addShapeless("ia_netherrack_stone_dust", <exnihilocreatio:block_netherrack_crushed>, [
            <contenttweaker:netherrack_dust>, <contenttweaker:netherrack_dust>,
            <contenttweaker:netherrack_dust>, <contenttweaker:netherrack_dust>
        ]);
        mods.thermalexpansion.Centrifuge.addRecipe([
            <minecraft:blaze_powder> % 10,
            <contenttweaker:cincinnasite_dirty_dust> % 1,
            <minecraft:redstone> % 4,
            <thermalfoundation:material:771> % 5
        ], <contenttweaker:netherrack_dust> * 4, null, 400);
    }
}

{//twilight
    recipes.addShaped("ia_aurora_block", <twilightforest:aurora_block>, [
        [<tconstruct:brownstone:3>, <mysticalagriculture:soulstone>, <tconstruct:brownstone:3>], 
        [<mysticalagriculture:soulstone>, <contenttweaker:sky_grain>, <mysticalagriculture:soulstone>], 
        [<tconstruct:brownstone:3>, <mysticalagriculture:soulstone>, <tconstruct:brownstone:3>]
    ]);
    recipes.addShaped("ia_aurora_block2", <twilightforest:aurora_block> * 5, [
        [<mysticalagriculture:soulstone> | <appliedenergistics2:sky_stone_block>, <mysticalagriculture:soulstone> | <appliedenergistics2:sky_stone_block>, <mysticalagriculture:soulstone> | <appliedenergistics2:sky_stone_block>], 
        [<mysticalagriculture:soulstone> | <appliedenergistics2:sky_stone_block>, <twilightforest:aurora_block>, <mysticalagriculture:soulstone> | <appliedenergistics2:sky_stone_block>], 
        [<mysticalagriculture:soulstone> | <appliedenergistics2:sky_stone_block>, <mysticalagriculture:soulstone> | <appliedenergistics2:sky_stone_block>, <mysticalagriculture:soulstone> | <appliedenergistics2:sky_stone_block>]
    ]);

    recipes.addShaped("ia_underbrick", <twilightforest:underbrick> * 2, [
        [<twilightforest:dark_planks>, <engineersdecor:slag_brick_block> | <prodigytech:ash_bricks>],
        [<engineersdecor:slag_brick_block> | <prodigytech:ash_bricks>, <twilightforest:dark_planks>]
    ]);

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

    mods.actuallyadditions.AtomicReconstructor.addRecipe(<twilightforest:giant_cobblestone>, <extrautils2:compressedcobblestone:4>, 100000);
}

{//aether
    recipes.addShaped("ia_holystone", <aether_legacy:holystone> * 8, [
        [<minecraft:stone>, <minecraft:stone>, <minecraft:stone>], 
        [<minecraft:stone>, <deepmoblearning:living_matter_aether>, <minecraft:stone>], 
        [<minecraft:stone>, <minecraft:stone>, <minecraft:stone>]
    ]);
}


{//skystone
    scripts.helper.addSimpleCrushingRecipeWByproduct(
        <appliedenergistics2:sky_stone_block>, <exnihilocreatio:block_skystone_crushed>, <appliedenergistics2:material:45>, 4
    );
    mods.prodigytech.rotarygrinder.addRecipe(<appliedenergistics2:sky_stone_block>, <exnihilocreatio:block_skystone_crushed>);

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
    mods.thermalexpansion.InductionSmelter.addRecipe(
        <appliedenergistics2:smooth_sky_stone_block>, 
        <appliedenergistics2:sky_stone_block>, <immersivepetroleum:stone_decoration> * 2, 
        8000
    );
    mods.enderio.AlloySmelter.addRecipe(<appliedenergistics2:smooth_sky_stone_block> * 4, 
        [
            <appliedenergistics2:sky_stone_block> * 4,
            <immersivepetroleum:stone_decoration> * 3,
            <minecraft:glass>
        ]
    );
    scripts.content_machines.addAdvancedMixerRecipe(
        [
            <appliedenergistics2:smooth_sky_stone_block> * 12
        ], [],
        [
            <immersivepetroleum:stone_decoration> * 2,
            <appliedenergistics2:sky_stone_block> * 4,
            <contenttweaker:sky_grain> | <contenttweaker:nuit_godshard>,
            <minecraft:glass> | <atum:crystal_glass>
        ], [
            <liquid:lubricant> * 1000
        ], 20, 512
    );
    scripts.content_machines.addAdvancedMixerRecipe(
        [
            <appliedenergistics2:smooth_sky_stone_block> * 16
        ], [],
        [
            <immersivepetroleum:stone_decoration> * 2,
            <appliedenergistics2:sky_stone_block> * 4,
            <contenttweaker:sky_grain> | <contenttweaker:nuit_godshard>,
            <minecraft:glass> | <atum:crystal_glass>
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

{//umberrack
    recipes.addShaped("ia_umberrack_dust", <contenttweaker:umberrack_dust>, [
        [<contenttweaker:umberstone_dust>, <contenttweaker:netherrack_dust>],
        [<contenttweaker:netherrack_dust>, <contenttweaker:umberstone_dust>]
    ]);
    furnace.addRecipe(<contenttweaker:umberrack>, <contenttweaker:umberrack_dust>);

    recipes.addShaped("ia_umberrack_bricks", <contenttweaker:umberrack_bricks>, [
        [<contenttweaker:umberrack>, <contenttweaker:umberrack>],
        [<contenttweaker:umberrack>, <contenttweaker:umberrack>]
    ]);

    scripts.content_machines.addFluidAlloyerRecipe(
        <contenttweaker:awakened_umberrack> * 4, 
        <contenttweaker:umberrack> * 4, <taiga:duranite_ingot>, <liquid:cryotheum> * 2000, 
        40, 1000
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
        <quark:jasper> * 12, 
        <quark:hardened_clay_tiles> * 2, 
        <liquid:clay> * 144, 400
    );
    

    //marble
    mods.thermalexpansion.Compactor.addStorageRecipe(<quark:marble>, <quark:limestone>, 400);
}
{//bop
    recipes.addShaped("ia_mud", <biomesoplenty:mud> * 16, [
        [null, <atum:coin_dirty>, null],
        [<atum:coin_dirty>, <minecraft:clay>, <atum:coin_dirty>],
        [null, <atum:coin_dirty>, null]
    ]);
    recipes.addShapeless("ia_mud_balls", <biomesoplenty:mudball> * 4,[
        <biomesoplenty:mud>
    ]);

    mods.tconstruct.Drying.addRecipe(<biomesoplenty:dried_sand>, <minecraft:sand>, 20 * 60 * 10);
    mods.tconstruct.Drying.addRecipe(<biomesoplenty:dried_sand>, <alchemistry:wet_sand>, 20 * 30);
}
{//soul stone
    InductionSmelter.addRecipe(
        <mysticalagriculture:soulstone>, 
        <minecraft:sandstone>, <enderio:item_alloy_nugget:7>, 
        1000
    );
}


{//compressed cobble
    addCobbleRecipe(<extrautils2:compressedcobblestone>, <extrautils2:compressedcobblestone>, 
        [<minecraft:stone:5>],
        [<liquid:water> * 100, <liquid:lava> * 100],
        1, 32, true
    );
    addCobbleRecipe(<extrautils2:compressedcobblestone:1>, <extrautils2:compressedcobblestone:1>, 
        [<contenttweaker:soot>, <erebus:umberstone>, <minecraft:stone:5> * 4],
        [<liquid:water> * 400, <liquid:lava> * 400, <liquid:glass> * 200, <liquid:stone> * 400],
        3, 32 * 6, false
    );
    addCobbleRecipe(<extrautils2:compressedcobblestone:2>, <extrautils2:compressedcobblestone:2>, 
        [<contenttweaker:soot> * 2, <twilightforest:naga_stone:1>, <erebus:umberstone> * 4, <minecraft:stone:5> * 16],
        [<liquid:water> * 1600, <liquid:lava> * 1600, <liquid:glass> * 800, <liquid:stone> * 1600],
        9, 32 * 36, false
    );
    addCobbleRecipe(<extrautils2:compressedcobblestone:3>, <extrautils2:compressedcobblestone:3>, 
        [<contenttweaker:soot> * 4, <engineersdecor:rebar_concrete>, <twilightforest:naga_stone:1> * 4, <erebus:umberstone> * 16, <minecraft:stone:5> * 64],
        [<liquid:water> * 6400, <liquid:lava> * 6400, <liquid:glass> * 3200, <liquid:stone> * 6400, <liquid:sand> * 1000],
        27, 32 * 216, false
    );

    addCobbleRecipe(<extrautils2:compressedcobblestone:4>, <extrautils2:compressedcobblestone:4>, 
        [<contenttweaker:soot> * 8, <contenttweaker:bedrockium_small_chunk>, <engineersdecor:rebar_concrete> * 4, <twilightforest:naga_stone:1> * 16, <erebus:umberstone> * 64],
        [<liquid:water> * 25600, <liquid:lava> * 25600, <liquid:glass> * 12800, <liquid:stone> * 25600, <liquid:sand> * 4000],
        81, 32 * 1296, false
    );
    addCobbleRecipe(<extrautils2:compressedcobblestone:5>, <extrautils2:compressedcobblestone:5>, 
        [<contenttweaker:soot> * 16, <extendedcrafting:singularity_custom:2>, <contenttweaker:bedrockium_small_chunk> * 4, <engineersdecor:rebar_concrete> * 16, <twilightforest:naga_stone:1> * 64],
        [<liquid:water> * 102400, <liquid:lava> * 102400, <liquid:glass> * 51200, <liquid:stone> * 102400, <liquid:sand> * 16000, <liquid:concrete> * 20000],
        243, 32 * 1296 * 6, false
    );
    addCobbleRecipe(<extrautils2:compressedcobblestone:6>, <extrautils2:compressedcobblestone:6>, 
        [<contenttweaker:soot> * 32, <thermalexpansion:machine:15>, <extendedcrafting:singularity_custom:2> * 4, <contenttweaker:bedrockium_small_chunk> * 16, <engineersdecor:rebar_concrete> * 64],
        [<liquid:water> * 409600, <liquid:lava> * 409600, <liquid:glass> * 204800, <liquid:stone> * 409600, <liquid:sand> * 64000, <liquid:petrotheum> * 64000, <liquid:concrete> * 80000],
        729, 32 * 1296 * 36, false
    );
    //todo: add botania, blood magic or alchemistry thing
    addCobbleRecipe(<extrautils2:compressedcobblestone:7>, <extrautils2:compressedcobblestone:7>, 
        [<contenttweaker:soot> * 64, <extendedcrafting:singularity_custom:35>, <thermalexpansion:machine:15> * 4, <extendedcrafting:singularity_custom:2> * 16, <contenttweaker:bedrockium_small_chunk> * 64],
        [<liquid:water> * 1638400, <liquid:lava> * 1638400, <liquid:glass> * 819200, <liquid:stone> * 1638400, <liquid:sand> * 256000, <liquid:petrotheum> * 256000, <liquid:concrete> * 320000, <liquid:ore_make> * 256000],
        729 * 3, 32 * 1296 * 216, false
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
    [<liquid:water> * 1000, <liquid:blood> * 1000],
    1, 128, true
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





mods.roots.Fey.addRecipe("wet_sand", <alchemistry:wet_sand> * 2, [
    <ore:sand>, <ore:sand>,
    <minecraft:melon>, <harvestcraft:seaweeditem>, <minecraft:water_bucket>
]);