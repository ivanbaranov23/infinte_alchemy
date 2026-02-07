import mods.mekanism.enrichment;
import mods.thermalexpansion.Transposer;

{//raw malachite
    val malachite_ore = <erebus:ore_copper>;
    malachite_ore.displayName = "Raw Malachite Ore";
    

    //addSimpleCrushingRecipe(malachite_ore, <contenttweaker:malachite_ore_dust> * 4); //todo crushing byproducts
    
    furnace.addRecipe(<contenttweaker:malachite_polycrystal>, <contenttweaker:malachite_dust>);
    furnace.addRecipe(<thermalfoundation:material:128>, <contenttweaker:malachite_dust>);

    mods.alchemistry.Evaporator.addRecipe(<contenttweaker:malachite_polycrystal>, <liquid:malachite_solution> * 1000);
    mods.alchemistry.Evaporator.addRecipe(<contenttweaker:malachite_crystal_seed>, <liquid:malachite_slury> * 500);
    
    mods.thermalexpansion.Transposer.addFillRecipe(
        <contenttweaker:malachite_monocrystal>, 
        <contenttweaker:malachite_crystal_seed>, <liquid:malachite_solution> * 1000, 
        5000
    );
    scripts.helper.addSawRecipe(<contenttweaker:malachite_monocrystal>, <contenttweaker:malachite_polycrystal> * 4);

    mods.mekanism.thermalevaporation.addRecipe(<liquid:malachite_solution> * 4, <liquid:rich_malachite_solution>);
    mods.alchemistry.Evaporator.addRecipe(<contenttweaker:malachite_crystal_seed>, <liquid:rich_malachite_solution> * 200);
    scripts.content_machines.addFluidSieveRecipeRandom(
        [
            <contenttweaker:filter_empty>,
            <contenttweaker:malachite_crystal_seed> % 30,
            <contenttweaker:malachite_dust> % 40
        ], <liquid:malachite_solution> * 100, 
        <liquid:rich_malachite_solution> * 1000, <contenttweaker:filter_charcoal>,//todo filter
        <exnihilocreatio:item_mesh:4>,
        20, 500
    );
}

{//flolit
    <ore:dustFlolit>.add(<contenttweaker:flolit>);
}

{//cincinnasite
    <ore:dustCincinnasite>.add(<betternether:cincinnasite>);
    enrichment.addRecipe(<contenttweaker:cincinnasite_dirty_dust>, <betternether:cincinnasite>);
    
    
}

//coal

//quartz
<ore:dustNetherQuartz>.remove(<enderio:item_material:33>);
<enderio:item_material:33>.displayName = "Dirty Nether Quartz Dust";
mods.jei.JEI.addItem(<enderio:item_material:33>);
mods.botania.PureDaisy.addRecipe(<netherendingores:ore_other_1>, <mysticalworld:quartz_ore>);
//certus
mods.botania.PureDaisy.addRecipe(<appliedenergistics2:quartz_ore>, <appliedenergistics2:charged_quartz_ore>);
mods.botania.PureDaisy.addRecipe(<netherendingores:ore_nether_modded_1:9>, <netherendingores:ore_nether_modded_1:10>);
mods.botania.PureDaisy.addRecipe(<netherendingores:ore_end_modded_1:9>, <netherendingores:ore_end_modded_1:10>);
mods.prodigytech.magneticreassembler.addRecipe(<appliedenergistics2:material:2>, <appliedenergistics2:material>);



//lapis
<ore:dustLapis>.remove(<actuallyadditions:item_dust:4>);
<actuallyadditions:item_dust:4>.displayName = "Dirty Lapis Dust";
mods.jei.JEI.addItem(<actuallyadditions:item_dust:4>);
mods.mekanism.crusher.addRecipe(<minecraft:dye:4>, <enderio:item_material:32>);
mods.immersiveengineering.Crusher.removeRecipe(<actuallyadditions:item_dust:4>);
mods.immersiveengineering.Crusher.addRecipe( <enderio:item_material:32>, <minecraft:dye:4>, 4000);

{//diamond
    recipes.addShapeless("ia_charcoal_ball", <contenttweaker:charcoal_ball>, 
        [<ore:blockCharcoal>, <immersivepetroleum:material>, <ore:crystalSlag>]
    );

    <ore:dustDiamond>.remove(<actuallyadditions:item_dust:2>);
    <actuallyadditions:item_dust:2>.displayName = "Rough Diamond Dust";
    
    mods.thermalexpansion.Centrifuge.addRecipe(
        [<mekanism:otherdust> % 100, <mekanism:otherdust> % 50, <contenttweaker:soot> % 25], 
        <actuallyadditions:item_dust:2>, null, 5000
    );

    mods.thermalexpansion.Transposer.addFillRecipe(
        <actuallyadditions:item_dust:2>, <mekanism:otherdust>, 
        <liquid:crystal_waste> * 2000, 5000
    );


    mods.thermalexpansion.Transposer.addExtractRecipe(<liquid:lava_residue> * 4000, <erebus:ore_encrusted_diamond>, 10000, (<minecraft:diamond> * 3) % 50);

    scripts.content_machines.addBioAssemblerRecipe(
        [<mekanism:otherdust> * 3, <contenttweaker:imperomite_catalyst_dust>], null, 
        [
            <thermalfoundation:material:768> * 24,
            <contenttweaker:imperomite_catalyst>
        ], [], <contenttweaker:research_chemistry3>,
        60, 1000
    );
}

//emerald
<ore:dustEmerald>.remove(<actuallyadditions:item_dust:3>);
<actuallyadditions:item_dust:3>.displayName = "Dirty Emerald Dust";
mods.jei.JEI.addItem(<actuallyadditions:item_dust:3>);

{//bop
    {//ruby
        furnace.addRecipe(<thermalfoundation:material:132> * 3, <biomesoplenty:gem:1>);
    }
    {

    }
}

{//red gem
    scripts.helper.addSawRecipe(<erebus:red_gem>, <erebus:materials:11> * 4);
    mods.thermalexpansion.Crucible.addRecipe(
        <liquid:redstone> * 300, <erebus:materials:11>, 3000
    );
}

//aquamarine
<ore:dustAquamarine>.add(<contenttweaker:aquamarine_dust>);
<ore:dustOverworldAquamarine>.add(<contenttweaker:aquamarine_dust>);
<ore:oreOverworldAquamarine>.add(<astralsorcery:blockcustomsandore>);
mods.thermalexpansion.Transposer.addFillRecipe(
    <astralsorcery:itemcraftingcomponent>, 
    <contenttweaker:aquamarine_dust>, 
    <liquid:crystal_fluid2> * 250, 
    10000
);

//spaceice
<ore:dustSpaceice>.add(<contenttweaker:space_ice>);
mods.aether_legacy.Freezer.registerFreezable(<contenttweaker:space_ice>, <contenttweaker:space_ice_crystal>, 200);

{//bastnasite
    <contenttweaker:bastnasite>.addTooltip("(Ce,La,Nd)CO₃F");
    mods.alchemistry.Dissolver.addRecipe(<contenttweaker:bastnasite>, false, 1,
        [
            [100, 
                <alchemistry:element:58> * 4, 
                <alchemistry:element:57> * 4, 
                <alchemistry:element:60> * 4,
                <alchemistry:element:6> * 8,
                <alchemistry:element:8> * 24,
                <alchemistry:element:9> * 8
            ]
        ]
    );
    mods.botania.ElvenTrade.addRecipe([<contenttweaker:bastnasite>], [
        <contenttweaker:manaclay>, <moretcon:gemerythynite>,
        <contenttweaker:rare_earth_dust>, <contenttweaker:rare_earth_dust>
    ]);


    
}

//moissanite
<ore:dustMoissanite>.add(<contenttweaker:moissanite>);

//zirconium
<ore:dustZirconium>.add(<contenttweaker:zirconium_dust>);
mods.jei.JEI.addItem(<densemetals:dense_zirconium_ore>);
mods.thermalexpansion.Transposer.addFillRecipe(
    <contenttweaker:zirconium_gem>, 
    <contenttweaker:zirconium_dust>, 
    <liquid:crystal_fluid2> * 1000, 
    16000
);


{//amethyst
    recipes.remove(<mysticalworld:amethyst_gem>);
    recipes.remove(<mysticalworld:amethyst_block>);
    recipes.remove(<biomesoplenty:gem>);
    recipes.remove(<biomesoplenty:gem_block>);
    recipes.addShapeless("amethyst1", <mysticalworld:amethyst_gem> * 9, [<mysticalworld:amethyst_block>]);
    recipes.addShaped("amethyst_block1", <mysticalworld:amethyst_block>, [
        [<mysticalworld:amethyst_gem>, <mysticalworld:amethyst_gem>, <mysticalworld:amethyst_gem>],
        [<mysticalworld:amethyst_gem>, <mysticalworld:amethyst_gem>, <mysticalworld:amethyst_gem>],
        [<mysticalworld:amethyst_gem>, <mysticalworld:amethyst_gem>, <mysticalworld:amethyst_gem>]
    ]);
    recipes.addShapeless("amethyst2", <biomesoplenty:gem> * 9, [<biomesoplenty:gem_block>]);
    recipes.addShaped("amethyst_block2", <biomesoplenty:gem_block>, [
        [<biomesoplenty:gem>, <biomesoplenty:gem>, <biomesoplenty:gem>],
        [<biomesoplenty:gem>, <biomesoplenty:gem>, <biomesoplenty:gem>],
        [<biomesoplenty:gem>, <biomesoplenty:gem>, <biomesoplenty:gem>]
    ]);



    <ore:dustAmethyst>.add(<contenttweaker:amethyst_dust>);
    <ore:dustEnethyst>.add(<contenttweaker:ender_amethyst_dust>);
    
    Transposer.addFillRecipe(
        <mysticalworld:amethyst_gem>, 
        <contenttweaker:amethyst_dust>, 
        <liquid:crystal_fluid2> * 100, 
        4000
    );
    Transposer.addFillRecipe(
        <biomesoplenty:gem>, 
        <contenttweaker:ender_amethyst_dust>, 
        <liquid:crystal_fluid2> * 100, 
        8000
    );
}

{//clathrates
    mods.thermalexpansion.Crucible.addRecipe(<liquid:redstone> * 1000, <thermalfoundation:ore_fluid:2>, 6000);
    mods.thermalexpansion.Crucible.addRecipe(<liquid:glowstone> * 1000, <thermalfoundation:ore_fluid:3>, 7000);
    mods.thermalexpansion.Crucible.addRecipe(<liquid:ender> * 1000, <thermalfoundation:ore_fluid:4>, 8000);
}

{//ambrosium
    scripts.content_machines.addBioAssemblerRecipe(
        [<contenttweaker:ambrosium_dust> * 5], null, 
        [
            <thermalfoundation:material:894> * 4,
            <contenttweaker:gem_amber_dust> * 2,
            <exnihilocreatio:item_ore_ardite:2>,
            <betternether:cincinnasite>
        ], [
            <liquid:skyroot> * 500,
            <liquid:topaz_slury> * 300
        ], <contenttweaker:research_chemistry3>,
        20, 1000
    );
}

{//biotite
    <ore:dustEndBiotite>.add(<contenttweaker:biotite_dust>);
    scripts.helper.addSimpleCrushingRecipe(<quark:biotite>, <contenttweaker:biotite_dust>);
    mods.thermalexpansion.Transposer.addFillRecipe(
        <quark:biotite> * 3, 
        <contenttweaker:biotite_dust>, 
        <liquid:biotite> * 1000, 
        10000
    );
    mods.thermalexpansion.Crucible.addRecipe(<liquid:biotite> * 250, <quark:biotite>, 3000);
    mods.thermalexpansion.Crucible.addRecipe(<liquid:biotite> * 1000, <quark:biotite_block>, 3000);

    scripts.content_machines.addAdvancedMixerRecipe(
        [<contenttweaker:biotite_dust> * 4],
        [],
        [
            <taiga:astrium_dust>,
            <enderio:item_material:32> * 8,
            <contenttweaker:ender_bacteria> * 2
        ],
        [
            <liquid:coal> * 1000,
            <liquid:tanzanite_slury> * 400
        ],
        20, 1000
    );
    scripts.content_machines.addBioAssemblerRecipe(
        [<contenttweaker:biotite_dust> * 8], <liquid:biotite> * 500, 
        [
            <taiga:astrium_dust>,
            <enderio:item_material:32> * 6,
            <contenttweaker:ender_bacteria>,
            <deepmoblearning:living_matter_extraterrestrial>
        ], [
            <liquid:coal> * 900,
            <liquid:tanzanite_slury> * 300
        ], <contenttweaker:research_chemistry3>,
        20, 1000
    );

    furnace.remove(<quark:biotite>);
}

//life essence
//.add(<contenttweaker:life_essence_ore>);
<ore:dustLifeEssence>.add(<contenttweaker:blood_shard2>);




//silicon
mods.mekanism.crusher.removeRecipe(<appliedenergistics2:material:5>);

{//geode
    
}