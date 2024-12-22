#priority 5
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;

function addEggHint(ent as string, drops as IItemStack[]){
    scripts.jei.addJEIhint(
        [<minecraft:spawn_egg>.withTag({EntityTag: {id: ent}})], [],
        [<minecraft:diamond_sword>.withDisplayName(game.localize("ia.egg_hint.sword"))],
        drops
    );
}

<entity:minecraft:villager_golem>.addDrop(<contenttweaker:iron_heart> % 50);

{//atum
    addEggHint("atum:wraith", [<atum:ectoplasm>]);
    recipes.addShapeless("ia_evil_desert_dust", <contenttweaker:evil_desert_dust>, [
        <atum:ectoplasm>,
        <contenttweaker:sphalerite_dust>,
        <mod_lavacow:cursed_fabric> | <atum:cloth_scrap>,
        <mod_lavacow:cursed_fabric> | <atum:cloth_scrap>
    ]);

    {//khnumite
        addEggHint("atum:stoneguard", [<contenttweaker:khnumite_heart>]);
        addEggHint("atum:stonewarden", [<contenttweaker:khnumite_heart>]);
        <entity:atum:stoneguard>.addDrop(<contenttweaker:khnumite_heart> % 50);
        <entity:atum:stonewarden>.addDrop(<contenttweaker:khnumite_heart> % 75);
        scripts.jei.addJEIhint([<atum:khnumite_face>, <atum:khnumite_block> * 2], [], [], [
            <minecraft:spawn_egg>.withTag({EntityTag: {id: "atum:stoneguard"}})
        ]);
        scripts.jei.addJEIhint([<atum:khnumite_face>, <atum:khnumite_block> * 4], [], [], [
            <minecraft:spawn_egg>.withTag({EntityTag: {id: "atum:stonewarden"}})
        ]);


        mods.thermalexpansion.Imbuer.addRecipe(<liquid:khnumite> * 2000, <atum:khnumite_face>, <liquid:chloroauric_acid> * 1000, 10000);
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:khnumite> * 2000, <contenttweaker:khnumite_heart>, <liquid:chloroauric_acid> * 1000, 10000);
        
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
    }
}
{
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
}

<entity:primitivemobs:treasure_slime>.addDrop(<contenttweaker:gold_slimeball> % 55);
<entity:primitivemobs:treasure_slime>.addDrop(<contenttweaker:gold_slimeball> % 25);
mods.thermalexpansion.Centrifuge.addRecipe([
        <extendedcrafting:material:128> % 30, <extendedcrafting:material:129> % 20,
        <contenttweaker:relic_nugget> % 30, <taiga:meteorite_nugget> % 5
    ], 
    <contenttweaker:gold_slimeball>, null, 
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

<entity:primitivemobs:void_eye>.addDrop(<contenttweaker:primitive_eyes> % 25);
<entity:mod_lavacow:boneworm>.addDrop(<contenttweaker:primitive_eyes> % 90);

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

{//erebus
    
    
    //addVialProcess("erebus:erebus.solifuge", [<erebus:materials:8> * 4], [], poison);
    
    
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





mods.roots.SummonCreatures.addEntity(
    <entity:primitivemobs:dodo>, // the entity to be summoned
    [<primitivemobs:dodo_egg>, <excompressum:chicken_stick>.withTag({IsAngry: 1 as byte}), <tconstruct:edible:12>] // a list of ingredients used for the summoning
);
/*mods.roots.SummonCreatures.addEntity(
  <entity:primitivemobs:dodo>, // the entity to be summoned
  [<primitivemobs:dodo_egg>, <excompressum:chicken_stick>, <tconstruct:edible:12>] // a list of ingredients used for the summoning
);*/


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
}

{//reliquary
    mods.thermalexpansion.Centrifuge.addRecipe(
        [(<mod_lavacow:shattered_ice> * 3) % 75, <mod_lavacow:shattered_ice> % 50, <minecraft:snowball> % 50], 
        <xreliquary:mob_ingredient:10>, 
        <liquid:cryotheum> * 100, 
        2000
    );
}

{//erebus
    
}







