#priority 5
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.entity.IEntityDefinition;

import mods.modularmachinery.RecipeBuilder;

import scripts.mob_jei.addJEIentityHint;

import loottweaker.LootTweaker;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;
import loottweaker.vanilla.loot.Functions;
import loottweaker.vanilla.loot.Conditions;

function addEggHint(ent as string, drops as IItemStack[]){
    addJEIentityHint(
        [], null, ent,
        [<minecraft:diamond_sword>.withDisplayName(game.localize("ia.egg_hint.sword"))], null,
        drops, null, ""
    );
}

function addRootsSummoning_jei(ent as IEntityDefinition, inps as IIngredient[]){
    addJEIentityHint(
        inps, null, "",
        [<roots:ritual_summon_creatures>, <roots:catalyst_plate>], null,
        [], null, ent.id
    );
}
function addRootsSummoning(ent as IEntityDefinition, inps as IIngredient[]){
    mods.roots.SummonCreatures.addEntity(
        ent, inps
    );

    addRootsSummoning_jei(ent, inps);
}
function readdRootsSummoning(ent as IEntityDefinition, inps as IIngredient[]){
    mods.roots.SummonCreatures.removeEntity(ent);
    mods.roots.SummonCreatures.addEntity(
        ent, inps
    );

    addRootsSummoning_jei(ent, inps);
}


static pool as int = 0;
function addLoot(ent as string, ent_table as string, items as IItemStack[], stats as int[][]){
    pool += 1;
    var lt = LootTweaker.getTable(ent_table);
    var lp = lt.addPool("autopool" ~ pool, 1, 1, 0, 0);
    for i,item in items{
        lp.addItemEntry(item, 1, 1, [
            //Functions.lootingEnchantBonus(stats[i][1], stats[i][2], stats[i][3])
        ], [
            Conditions.randomChanceWithLooting((stats[i][0] as float) / 100.0, (stats[i][1] as float) / 100.0)
        ]);
    }

    addJEIentityHint(
        [], null, ent,
        [<minecraft:diamond_sword>.withDisplayName(game.localize("ia.egg_hint.sword"))], null,
        items, null, ""
    );
}


{//minecraft
    //zombie
    readdRootsSummoning(<entity:minecraft:zombie>, [
        <mysticalagriculture:storage>, <xreliquary:mob_ingredient:6>, <contenttweaker:potato_block1>, 
        <harvestcraft:zombiejerkyitem> | <tconstruct:edible:10>
    ]);

    mods.prodigytech.heatsawmill.addRecipe(<minecraft:skull:2>, <minecraft:rotten_flesh> * 4);
    scripts.helper.addSawRecipeWByproduct(<minecraft:skull:2>, <minecraft:rotten_flesh> * 6, <minecraft:rotten_flesh> * 2, 10);
    recipes.addShapeless("ia_zombie_skull_to_bone", <minecraft:rotten_flesh> * 3, [
        <harvestcraft:cuttingboarditem>.reuse(), <minecraft:skull:2>
    ]);


    //skeleton
    readdRootsSummoning(<entity:minecraft:skeleton>, [
        <mysticalagriculture:storage>, <xreliquary:mob_ingredient>, <tconstruct:materials:20>, <minecraft:bow:*>
    ]);

    mods.prodigytech.heatsawmill.addRecipe(<minecraft:skull>, <minecraft:bone> * 3);
    scripts.helper.addSawRecipeWByproduct(<minecraft:skull>, <minecraft:bone> * 4, <minecraft:bone>, 10);
    recipes.addShapeless("ia_skull_to_bone", <minecraft:bone> * 2, [
        <harvestcraft:cuttingboarditem>.reuse(), <minecraft:skull>
    ]);

    scripts.helper.addSawRecipeWByproduct(<minecraft:skull:1>, <tconstruct:materials:17> * 4, <tconstruct:materials:17>, 10);

    //creeper
    mods.prodigytech.heatsawmill.addRecipe(<minecraft:skull:4>, <minecraft:gunpowder> * 4);
    scripts.helper.addSawRecipeWByproduct(<minecraft:skull:4>, <minecraft:gunpowder> * 6, <minecraft:gunpowder> * 2, 10);
    recipes.addShapeless("ia_creepr_skull_to_bone", <minecraft:gunpowder> * 3, [
        <harvestcraft:cuttingboarditem>.reuse(), <minecraft:skull:4>
    ]);

    //witch
    readdRootsSummoning(<entity:minecraft:witch>, [
        <mysticalagriculture:storage>, <minecraft:redstone>, <minecraft:glowstone_dust>, <minecraft:sugar>, <minecraft:glass_bottle>
    ]);

    //golem
    addRootsSummoning(<entity:minecraft:villager_golem>, [
        <mysticalagriculture:storage>, <minecraft:iron_block>, <minecraft:pumpkin>
    ]);
    <entity:minecraft:villager_golem>.addDrop(<contenttweaker:iron_heart> % 50);

    //mooshroom
    //mods.roots.SummonCreatures.removeEntity(<entity:minecraft:mooshroom>);
    readdRootsSummoning(<entity:minecraft:mooshroom>, [<mysticalagriculture:storage>, <quark:glowshroom>, <contenttweaker:mushroomite_block>, <minecraft:cooked_beef>]);
}

{//erebus
    addEggHint("erebus:erebus.chameleon_tick", [<erebus:materials:18>]);
    addEggHint("erebus:erebus.praying_mantis", [<erebus:materials:18>]);
    addRootsSummoning(
        <entity:erebus:erebus.praying_mantis>, // the entity to be summoned
        [<roots:baffle_cap_mushroom>, <contenttweaker:malachite_polycrystal>, <erebus:grandmas_shoes_mushroom>] // a list of ingredients used for the summoning
    );

    addEggHint("erebus:erebus.centipede", [<erebus:materials:8>]);
    addRootsSummoning(
        <entity:erebus:erebus.centipede>, // the entity to be summoned
        [<roots:baffle_cap_mushroom>, <contenttweaker:malachite_polycrystal>, <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:conveyor"})] // a list of ingredients used for the summoning
    );

    addEggHint("erebus:erebus.glow_worm", [<erebus:materials:12>]);
    addRootsSummoning(
        <entity:erebus:erebus.glow_worm>, // the entity to be summoned
        [<roots:baffle_cap_mushroom>, <contenttweaker:malachite_polycrystal>, <minecraft:glowstone>] // a list of ingredients used for the summoning
    );
    
    addEggHint("erebus:erebus.glow_worm", [<erebus:erebus_food:2>]);
    addRootsSummoning(
        <entity:erebus:erebus.grasshopper>, // the entity to be summoned
        [<roots:baffle_cap_mushroom>, <contenttweaker:malachite_polycrystal>, <minecraft:hopper>, <minecraft:tallgrass:1>] // a list of ingredients used for the summoning
    );

    addEggHint("erebus:erebus.locust", [<erebus:materials:9>]);
    addRootsSummoning(
        <entity:erebus:erebus.locust>, // the entity to be summoned
        [<roots:baffle_cap_mushroom>, <contenttweaker:malachite_polycrystal>, <erebus:erebus_food:2>] // a list of ingredients used for the summoning
    );

    addEggHint("erebus:erebus.mosquito", [<erebus:life_blood>]);
    addRootsSummoning(
        <entity:erebus:erebus.mosquito>, // the entity to be summoned
        [<roots:baffle_cap_mushroom>, <contenttweaker:malachite_polycrystal>, <tconstruct:edible:3>] // a list of ingredients used for the summoning
    );
    
    addEggHint("erebus:erebus.tarantula", [<erebus:erebus_food:4>]);
    addRootsSummoning(
        <entity:erebus:erebus.tarantula>, // the entity to be summoned
        [<roots:baffle_cap_mushroom>, <contenttweaker:malachite_polycrystal>, <immersiveengineering:material:1>] // a list of ingredients used for the summoning
    );
    addRootsSummoning(
        <entity:erebus:erebus.velvet_worm>, // the entity to be summoned
        [<roots:baffle_cap_mushroom>, <contenttweaker:malachite_polycrystal>, <harvestcraft:redvelvetcupcakeitem>] // a list of ingredients used for the summoning
    );

    addEggHint("erebus:erebus.fungal_weevil", [
        <erebus:dark_capped_mushroom>,
        <erebus:sarcastic_czech_mushroom>,
        <erebus:grandmas_shoes_mushroom>,
        <erebus:dutch_cap_mushroom>,
        <erebus:kaizers_fingers_mushroom>
    ]);
    addRootsSummoning(
        <entity:erebus:erebus.fungal_weevil>, // the entity to be summoned
        [<roots:baffle_cap_mushroom>, <contenttweaker:malachite_polycrystal>, <alchemistry:element:68>] // a list of ingredients used for the summoning
    );

    addEggHint("erebus:erebus.cicada", [<erebus:materials:28>]);
    addRootsSummoning(
        <entity:erebus:erebus.cicada>, // the entity to be summoned
        [<roots:baffle_cap_mushroom>, <contenttweaker:malachite_polycrystal>, <minecraft:poisonous_potato>] // a list of ingredients used for the summoning
    );

    addEggHint("erebus:erebus.pond_skater", [<erebus:materials:57>]);
    addRootsSummoning(
        <entity:erebus:erebus.pond_skater>, // the entity to be summoned
        [<roots:baffle_cap_mushroom>, <contenttweaker:malachite_polycrystal>, <enderio:block_reservoir>] // a list of ingredients used for the summoning
    );
}

{//atum
    addEggHint("atum:wraith", [<atum:ectoplasm>]);
    recipes.addShapeless("ia_evil_desert_dust", <contenttweaker:evil_desert_dust> * 3, [
        <atum:ectoplasm>,
        <contenttweaker:sphalerite_dust>,
        <mod_lavacow:cursed_fabric> | <atum:cloth_scrap>,
        <mod_lavacow:cursed_fabric> | <atum:cloth_scrap>
    ]);

    for en in [<entity:atum:mummy>, <entity:atum:wraith>, <entity:atum:forsaken>, <entity:minecraft:husk>] as IEntityDefinition[]{
        en.addDrop(<atum:loot_dirty_ring> % 5);
        en.addDrop(<atum:loot_dirty_broach> % 5);
        en.addDrop(<atum:loot_dirty_necklace> % 3);
        en.addDrop(<atum:loot_dirty_scepter> % 2);
        en.addDrop(<atum:loot_dirty_idol> % 1);

        addEggHint(en.id, [
            <atum:loot_dirty_ring>,
            <atum:loot_dirty_broach>,
            <atum:loot_dirty_necklace>,
            <atum:loot_dirty_scepter>,
            <atum:loot_dirty_idol>
        ]);
    }

    {//khnumite
        addEggHint("atum:stoneguard", [<contenttweaker:khnumite_heart>]);
        addEggHint("atum:stonewarden", [<contenttweaker:khnumite_heart>]);
        
        //<entity:atum:stoneguard>.addDrop(<contenttweaker:khnumite_heart> % 50);
        addLoot("atum:stoneguard", "atum:entities/stoneguard", [<contenttweaker:khnumite_heart>], [[30, 10, 1]]);
        //<entity:atum:stonewarden>.addDrop(<contenttweaker:khnumite_heart> % 75);
        addLoot("atum:stonewarden", "atum:entities/stonewarden", [<contenttweaker:khnumite_heart>], [[60, 15, 1]]);


        addJEIentityHint(
            [<atum:khnumite_face>, <atum:khnumite_block> * 2], null, "",
            [<openblocks:glyph:73>], null,
            [], null, "atum:stoneguard"
        );
        addJEIentityHint(
            [<atum:khnumite_face>, <atum:khnumite_block> * 4], null, "",
            [<openblocks:glyph:84>], null,
            [], null, "atum:stonewarden"
        );

        

        //heart proc
        scripts.helper.addSawRecipeWByproduct(<contenttweaker:khnumite_heart>, <atum:khnumite> * 3, <atum:khnumite>, 30);
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:khnumite> * 2000, <atum:khnumite_face>, <liquid:chloroauric_acid> * 1000, 10000);
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:khnumite> * 2000, <contenttweaker:khnumite_heart>, <liquid:chloroauric_acid> * 1000, 10000);
        
        //liquid proc
        mods.thermalexpansion.Refinery.addRecipe(<liquid:sand> * 1000, <contenttweaker:sphalerite_dust> % 40, <liquid:khnumite> * 500, 6000);
        mods.immersivepetroleum.Distillation.addRecipe([<liquid:sand> * 1000], [
            <contenttweaker:sphalerite_dust>,
            <exnihilocreatio:item_ore_osmium> * 8,
            <atum:khnumite>,
            <taiga:duranite_dust>
        ], <liquid:khnumite> * 500, 5000, 40, [
            0.4,
            0.8,
            0.3,
            0.1
        ]);

        scripts.content_machines.addFluidSieveRecipeRandom(
            [
                <contenttweaker:sphalerite_dust> % 50,
                <exnihilocreatio:item_ore_osmium> * 12,
                <atum:khnumite> % 40,
                <taiga:duranite_dust> % 20,
                <taiga:vibranium_dust> % 10
            ], <liquid:sand> * 1000, 
            <liquid:khnumite> * 500, <contenttweaker:witherite>,
            null,
            40, 1000
        );
        scripts.content_machines.addFluidSieveRecipeRandom(
            [
                <contenttweaker:sphalerite_dust> * 2 % 75,
                <exnihilocreatio:item_ore_osmium> * 16,
                <atum:khnumite> % 70,
                <taiga:duranite_dust> % 50,
                <taiga:vibranium_dust> % 40
            ], <liquid:sand> * 1000, 
            <liquid:khnumite> * 300, <contenttweaker:awaken_witherite>,
            null,
            40, 1000
        );

        //block alt
        recipes.addShaped("ia_khnumite_block", <atum:khnumite_block> * 3, [
            [<atum:khnumite>, <atum:khnumite>, <atum:khnumite>],
            [<atum:khnumite>, <contenttweaker:khnumite_heart>, <atum:khnumite>],
            [<atum:khnumite>, <atum:khnumite>, <atum:khnumite>]
        ]);
        //face
        recipes.remove(<atum:khnumite_face>);
        recipes.addShaped("ia_khnumite_face1", <atum:khnumite_face>, [
            [<atum:khnumite>, <minecraft:diamond>, <atum:khnumite>],
            [<atum:khnumite>, <atum:khnumite>, <atum:khnumite>],
            [<atum:khnumite>, <atum:khnumite>, <atum:khnumite>]
        ]);
        recipes.addShaped("ia_khnumite_face2", <atum:khnumite_face> * 2, [
            [<atum:khnumite>, <minecraft:diamond>, <atum:khnumite>],
            [<atum:khnumite>, <contenttweaker:khnumite_heart>, <atum:khnumite>],
            [<atum:khnumite>, <atum:khnumite>, <atum:khnumite>]
        ]);
    }
}
{//twilight
    addEggHint("twilightforest:skeleton_druid", [<contenttweaker:druid_bone>]);
    addEggHint("twilightforest:skeleton_druid", [<contenttweaker:lich_bone>.withLore(["Rare"])]);
    <entity:twilightforest:skeleton_druid>.addDrop(<contenttweaker:druid_bone> % 80);
    <entity:twilightforest:skeleton_druid>.addDrop(<contenttweaker:lich_bone> % 3);
    
    {//lich
        addEggHint("twilightforest:lich", [<contenttweaker:lich_bone> * 4]);
        <entity:twilightforest:lich>.addDrop(<contenttweaker:lich_bone> * 4);
        scripts.content_machines.addBioAssemblerRecipe(
            [<contenttweaker:lich_bone>], null, 
            [
                <ore:boneWithered> * 4,
                <thermalfoundation:material:1028> * 32
            ], [<liquid:slimebone> * 1000], <twilightforest:trophy:1>,
            200, 1000
        );
    }

    <entity:twilightforest:slime_beetle>.addDrop(<contenttweaker:bug_slimeball> % 75);
    <entity:twilightforest:slime_beetle>.addDrop(<contenttweaker:bug_slimeball> % 75);
    <ore:slimeball>.add(<contenttweaker:bug_slimeball>);
    recipes.addShapeless("ia_bug_slimeball_slimeball", <minecraft:slime_ball>, [<contenttweaker:bug_slimeball>]);
    mods.thermalexpansion.Centrifuge.addRecipe([
        <minecraft:slime_ball> % 100, <minecraft:slime_ball> % 50, 
        <erebus:materials> % 25, <mod_lavacow:chitin> % 25], 
        <contenttweaker:bug_slimeball>, null, 
        2000
    );


    //cube
    addRootsSummoning(<entity:twilightforest:roving_cube>, [
        <thermalfoundation:storage:3>,
        <forge:bucketfilled>.withTag({FluidName: "notmilk", Amount: 1000}),
        <harvestcraft:beanitem>
    ]);
}

{//primitive
    <entity:primitivemobs:treasure_slime>.addDrop(<contenttweaker:gold_slimeball> % 55);
    <entity:primitivemobs:treasure_slime>.addDrop(<contenttweaker:gold_slimeball> % 25);
    mods.thermalexpansion.Centrifuge.addRecipe([
            <extendedcrafting:material:128> % 30, <extendedcrafting:material:129> % 20,
            <contenttweaker:relic_nugget> % 30, <taiga:meteorite_nugget> % 5
        ], 
        <contenttweaker:gold_slimeball> * 4, null, 
        2000
    );

    <entity:primitivemobs:brain_slime>.addDrop(<contenttweaker:brain_slimeball> % 75);
    <entity:primitivemobs:brain_slime>.addDrop(<contenttweaker:brain_slimeball> % 75);
    scripts.content_machines.addBioAssemblerRecipeRandom(
        [<prodigytech:meat_ground> % 40, <contenttweaker:basic_neuron> % 10], <liquid:blood> * 400,
        [<contenttweaker:brain_slimeball>], [],
        <thermalexpansion:machine:10>,
        10, 256
    );
    mods.thermalexpansion.Centrifuge.addRecipe([
            <prodigytech:meat_ground> % 40
        ], 
        <contenttweaker:brain_slimeball>, <liquid:blood> * 400, 
        2000
    );

    scripts.helper.addSimpleCrushingRecipe(<minecraft:firework_charge>, <minecraft:gunpowder>);


    <entity:primitivemobs:void_eye>.addDrop(<contenttweaker:primitive_eyes> % 25);



    addRootsSummoning(<entity:primitivemobs:dodo>, // the entity to be summoned
        [<primitivemobs:dodo_egg>, <excompressum:chicken_stick>.withTag({IsAngry: 1 as byte}), <tconstruct:edible:12>] // a list of ingredients used for the summoning
    );
}



{//illager
    addLoot("minecraft:vindication_illager", "minecraft:entities/vindication_illager", [<contenttweaker:illagerite>], [[30, 10, 1]]);
    addLoot("minecraft:evocation_illager", "minecraft:entities/evocation_illager", [<contenttweaker:illagerite>], [[50, 20, 1]]);


    addLoot("illagers_plus:archer", "illagers_plus:entity/entity_archer", [<contenttweaker:illagerite>], [[20, 10, 1]]);
    addLoot("illagers_plus:furantur", "illagers_plus:entity/entity_furantur", [<contenttweaker:illagerite>], [[20, 10, 1]]);
    addLoot("illagers_plus:enchanter", "illagers_plus:entity/entity_enchanter", [<contenttweaker:illagerite>], [[20, 10, 1]]);
    addLoot("illagers_plus:illager_king", "illagers_plus:entity/entity_illager_king", [<contenttweaker:illagerite> * 3], [[70, 30, 1]]);

/* 
illagers_plus:illager_king",
      "illagers_plus:necromancer",
      "illagers_plus:furantur",
      "illagers_plus:archer",
      "illagers_plus:enchanter",
      "illagers_plus:hoarder",
      "minecraft:vindication_illager",
      "minecraft:evocation_illager",
      "primitivemobs:trollager",
      "minecraft:illusion_illager
*/

}




{//fish undead rising
    //shatered ice
    recipes.addShapeless("ia_frozenthigh", <mod_lavacow:shattered_ice> * 3, [<mod_lavacow:frozenthigh>]);

    //sludge
    <ore:slimeball>.remove(<mod_lavacow:silky_sludge>);
    <ore:stickWood>.remove(<mod_lavacow:mossy_stick>);

    mods.roots.SummonCreatures.addEntity(
        <entity:mod_lavacow:sludgelord>, // the entity to be summoned
        [<minecraft:slime>, <forge:bucketfilled>.withTag({FluidName: "sludge", Amount: 1000}), <minecraft:log>] // a list of ingredients used for the summoning
    );

    //mods.MobStages.addStage("postWither", "mod_lavacow:sludgelord", 66);
    //mods.MobStages.addStage("postSludgeLord", "mod_lavacow:sludgelord", 0);

    //<minecraft:spawn_egg>.withTag({EntityTag: {id: "mod_lavacow:sludgelord"}})

    //foul
    scripts.helper.addSawRecipe(<mod_lavacow:foul_hide>, <mod_lavacow:foul_bristle> * 3);


    <entity:mod_lavacow:boneworm>.addDrop(<contenttweaker:primitive_eyes> % 90);
}

{//reliquary
    mods.thermalexpansion.Centrifuge.addRecipe(
        [(<mod_lavacow:shattered_ice> * 3) % 75, <mod_lavacow:shattered_ice> % 50, <minecraft:snowball> % 50], 
        <xreliquary:mob_ingredient:10>, 
        <liquid:cryotheum> * 100, 
        2000
    );
}

/*
mods.immersiveengineering.Mixer.addRecipe(<liquid:slimebone> * 500, <liquid:water> * 500, [
        <mysticalagriculture:slimy_bone_essence>,
        <minecraft:gunpowder> * 8,
        <mod_lavacow:intestine> * 4
    ], 2000
);
mods.immersiveengineering.Mixer.addRecipe(<liquid:slimebone> * 2000, <liquid:organic_green> * 2000, [
        <mysticalagriculture:slimy_bone_essence>,
        <minecraft:gunpowder> * 8,
        <mod_lavacow:intestine> * 4
    ], 2000
);
*/


//ow
mods.tconstruct.Melting.addRecipe(<liquid:slimebone> * 200, <mysticalagriculture:slimy_bone_essence>, 1000);
mods.thermalexpansion.Crucible.addRecipe(<liquid:slimebone> * 250, <mysticalagriculture:slimy_bone_essence>, 3000);

var ow_mob_drops as float[IItemStack] = {
    //zombie
    <minecraft:skull:2>: 0.01,
    <minecraft:rotten_flesh>: 0.1,
    <xreliquary:mob_ingredient:6>: 0.03,

    //skeleton
    <minecraft:skull>: 0.01,
    <minecraft:bone>: 0.1,
    <xreliquary:mob_ingredient>: 0.03,
    
    //creeper
    <minecraft:skull:4>: 0.01,
    <minecraft:gunpowder>: 0.1,
    <xreliquary:mob_ingredient:3>: 0.03,

    //spider
    <minecraft:spider_eye>: 0.1,
    <minecraft:string>: 0.15,
    <xreliquary:mob_ingredient:2>: 0.03,

    //enderman
    <enderio:block_enderman_skull>: 0.005,
    <minecraft:ender_pearl>: 0.05,
    <xreliquary:mob_ingredient:11>: 0.01,


    //guardian
    <minecraft:prismarine_shard>: 0.01,
    <minecraft:prismarine_crystals>: 0.01,
    <xreliquary:mob_ingredient:16>: 0.003,
    //slime
    <minecraft:slime_ball>: 0.03,
    <xreliquary:mob_ingredient:4>: 0.01,
    //witch
    <xreliquary:witch_hat>: 0.001,
    <contenttweaker:illagerite>: 0.0001

};
mods.immersivepetroleum.Distillation.addRecipe(
    [<liquid:xpjuice> * 50, <liquid:blood> * 25, <liquid:sludge> * 125], 
    ow_mob_drops.keys, 
    <liquid:slimebone> * 200, 1000, 20, 
    ow_mob_drops.values
);

//erebus
scripts.content_machines.addFluidMixerRecipe(
    <liquid:slimebone_erebus> * 1000, 
    <liquid:slimebone> * 500, <liquid:bugs> * 200, <erebus:materials:55>, 
    80, 128
);

var erebus_mob_drops as float[IItemStack] = {
    <erebus:materials>: 0.05,
    <erebus:materials:21>: 0.03,
    <erebus:materials:4>: 0.01,
    <erebus:materials:6>: 0.01,
    <erebus:materials:9>: 0.001,

    <erebus:life_blood>: 0.005,
    <erebus:materials:18>: 0.005,
    <erebus:materials:28>: 0.005,
    <erebus:materials:57>: 0.005,
    <erebus:materials:37>: 0.005,
    <erebus:materials:12>: 0.005,

    <erebus:materials:23>: 0.004,
    <erebus:materials:8>: 0.004,
    <erebus:materials:13>: 0.004,
    
    <erebus:materials:23>: 0.003,
    <erebus:materials:60>: 0.003,
    <erebus:materials:10>: 0.003,
    <erebus:materials:17>: 0.003,
    <erebus:erebus_food:2>: 0.003,
    <erebus:erebus_food:4>: 0.003,

    <erebus:erebus_food:12>: 0.001,
    <erebus:materials:35>: 0.001,
    <erebus:materials:36>: 0.001
};
mods.immersivepetroleum.Distillation.addRecipe(
    [<liquid:xpjuice> * 50, <liquid:blood> * 25, <liquid:beetle_juice> * 25], 
    erebus_mob_drops.keys, 
    <liquid:slimebone_erebus> * 75, 1000, 20, 
    erebus_mob_drops.values
);













//0     otherworld
//-1    nether
//1     end
//17    atum
//66    erebus

static otherworld_mobs as string[] = [
    "mekanism:babyskeleton",
    "minecraft:cave_spider",
    "minecraft:evocation_illager",
    "illagers_plus:archer",
    "illagers_plus:enchanter",
    "illagers_plus:furantur",
    "illagers_plus:hoarde",
    "illagers_plus:necromancer",
    "minecraft:illusion_illager",
    "minecraft:guardian",
    "minecraft:stray",
    "minecraft:vindication_illager",
    "minecraft:wither_skeleton",
    "mowziesmobs:foliaath",
    "primitivemobs:skeleton_warrior",
    "quark:pirate",
    "thermalfoundation:basalz",
    "thermalfoundation:blitz",
    "thermalfoundation:blizz",
    "trumpetskeleton:trumpet_skeleton"
];
static nether_mobs as string[] = [
    "biomesoplenty:wasp",
    "erebus:erebus.black_widow",
    "minecraft:blaze",
    "minecraft:ghast",
    "minecraft:magma_cube",
    "mysticalworld:entity_lava_cat",
    "mysticalworld:entity_hell_sprout",
    "natura:imp",
    "natura:nitrocreeper",
    "primitivemobs:blazing_juggernaut",
    "quark:wraith",
    "quark:foxhound",
    "realmrpg_wyrms:red_wyrm"
];
static end_mobs as string[] = [
    "minecraft:enderman",
    "minecraft:endermite",
    "minecraft:shulker",
    "mysticalworld:entity_endermini",
    "primitivemobs:void_eye",
    "realmrpg_wyrms:ender_wyrm"
];
static atum_mobs as string[] = [
    "atum:assassin",
    "atum:barbarian",
    "atum:bonestorm",
    "atum:brigand",
    "atum:forsaken",
    "atum:mummy",
    "atum:nomad",
    "atum:stoneguard",
    "atum:stonewarden",
    "atum:sunspeaker",
    "atum:tarantula",
    "atum:wraith"
];
static erebus_mobs as string[] = [
    "erebus:erebus.antlion",
    "erebus:erebus.beetle",
    "erebus:erebus.black_ant",
    "erebus:erebus.bombardier_beetle",
    "erebus:erebus.centipede",
    "erebus:erebus.cicada",
    "erebus:erebus.crop_weevil",
    "erebus:erebus.dragon_fly",
    "erebus:erebus.fire_ant",
    "erebus:erebus.fire_ant_soldier",
    "erebus:erebus.fly",
    "erebus:erebus.fungal_weevil",
    "erebus:erebus.glow_worm",
    "erebus:erebus.grasshopper",
    "erebus:erebus.honey_pot_ant",
    "erebus:erebus.jumping_spider",
    "erebus:erebus.lava_web_spider",
    "erebus:erebus.locust",
    "erebus:erebus.mosquito",
    "erebus:erebus.moth",
    "erebus:erebus.pond_skater",
    "erebus:erebus.praying_mantis",
    "erebus:erebus.rhino_beetle",
    "erebus:erebus.scorpion",
    "erebus:erebus.scytodes",
    "erebus:erebus.solifuge",
    "erebus:erebus.stag_beetle",
    "erebus:erebus.tarantula",
    "erebus:erebus.titan_beetle",
    "erebus:erebus.velvet_worm",
    "erebus:erebus.wasp",
    "erebus:erebus.woodlouse",
    "erebus:erebus.zombie_ant",
    "erebus:erebus.zombie_ant_soldier"
];
static twilight_mobs as string[] = [
    "twilightforest:armored_giant",
    "twilightforest:death_tome",
    "twilightforest:fire_beetle",
    "twilightforest:slime_beetle",
    "twilightforest:giant_miner",
    "twilightforest:helmet_crab",
    "twilightforest:maze_slime",
    "twilightforest:minotaur ",
    "twilightforest:skeleton_druid",
    "twilightforest:tower_golem",
    "twilightforest:tower_termite",
    "twilightforest:troll",
    "twilightforest:yeti"
];
static aether_mobs as string[] = [
    "aether_legacy:swet",
    "aether_legacy:zephyr",
    "aether_legacy:aechor_plant"
];




val regen as ILiquidStack = <liquid:potion>.withTag({Potion: "cofhcore:regeneration4"}) * 100;
val poison as ILiquidStack = <liquid:potion>.withTag({Potion: "cofhcore:poison4"}) * 100;
val water as ILiquidStack = <liquid:pure_water> * 1000;

function addVialProcess(entity as string, drops as IItemStack[], liquids as ILiquidStack[], poison_fluid as ILiquidStack){
    var rec = RecipeBuilder.newBuilder(entity, "vial_processor", 20);
	rec.addEnergyPerTickInput(2048);

	rec.addItemInput(<enderio:item_soul_vial:1>.withTag({entityId: entity}));
    rec.addItemOutput(<enderio:item_soul_vial>);

	if (poison_fluid){
        rec.addFluidInput(poison_fluid);
    }
	
    for drop in drops{
        rec.addItemOutput(drop);
    }
    for liquid in liquids{
        rec.addFluidOutput(liquid);
    }

	rec.build();
}

{//ow
    //addVialProcess("minecraft:zombie", [<minecraft:skull:2>, <xreliquary:mob_ingredient:6>, <minecraft:rotten_flesh> * 8, <minecraft:bone> * 2], [<liquid:rot> * 50], regen);
    //addVialProcess("minecraft:villager_golem", [<contenttweaker:iron_heart>, <minecraft:iron_ingot> * 16, <minecraft:pumpkin>], [], poison);


    addVialProcess("primitivemobs:treasure_slime", [<contenttweaker:gold_slimeball> * 8], [], poison);
    addVialProcess("primitivemobs:brain_slime", [<contenttweaker:brain_slimeball> * 8], [<liquid:blood> * 30], poison);

    {//undead fish
        addVialProcess("mod_lavacow:zombiemushroom", [<mod_lavacow:hyphae> * 2, <minecraft:rotten_flesh> * 8, <minecraft:bone> * 2], [<liquid:rot> * 75], regen);
    }
}

//nether
addVialProcess("minecraft:blaze", [<xreliquary:mob_ingredient:7>, <minecraft:blaze_rod> * 4, <thermalfoundation:material:771> * 8], [<liquid:fiery_essence> * 100], water);


//twilight
addVialProcess("twilightforest:slime_beetle", [<contenttweaker:bug_slimeball> * 8], [], poison);

//aether
addVialProcess("aether_legacy:swet", [<aether_legacy:aercloud:1> * 4, <aether_legacy:swetty_ball> * 4, <minecraft:glowstone> * 4], [<liquid:blueslime> * 50], poison);
addVialProcess("aether_legacy:aechor_plant", [<aether_legacy:aechor_petal> * 2, <thermalfoundation:material:816> * 2], [<liquid:poison> * 25], poison);

//end
addVialProcess("minecraft:enderman", [<enderio:block_enderman_skull>, <xreliquary:mob_ingredient:11>, <minecraft:ender_pearl> * 4], [<liquid:ender_blood> * 100], water);
addVialProcess("minecraft:endermite", [<xreliquary:mob_ingredient:11>, <minecraft:ender_pearl> * 4], [<liquid:ender_blood> * 400], water);
addVialProcess("mysticalworld:entity_endermini", [<enderio:block_enderman_skull>, <mysticalworld:unripe_pearl> * 24], [<liquid:ender_blood> * 100], water);





