#loader contenttweaker
#priority 10

import crafttweaker.item.IItemStack;

import mods.contenttweaker.Color;
import mods.contenttweaker.MaterialSystem;
import mods.contenttweaker.VanillaFactory;

import crafttweaker.potions.IPotion;
import crafttweaker.potions.IPotionEffect;

import extrautilities2.Tweaker.IMachineSlot.newItemStackSlot as xtItemSlot;
import extrautilities2.Tweaker.IMachineSlot.newFluidSlot as xtFluidSlot;

import mods.contenttweaker.Commands;

import crafttweaker.player.IPlayer;


val texture_items as string = "contenttweaker:items";
val texture_blocks as string = "contenttweaker:blocks";

function registerMetal(m_name as string){
    VanillaFactory.createItem(m_name + "_ingot").register();
    VanillaFactory.createItem(m_name + "_plate").register();
    VanillaFactory.createItem(m_name + "_rod").register();
    VanillaFactory.createItem(m_name + "_gear").register();
    VanillaFactory.createBlock(m_name + "_block", <blockmaterial:rock>).register();
    VanillaFactory.createItem(m_name + "_dust").register();
    VanillaFactory.createItem(m_name + "_nugget").register();
}
function registerMoltenMetal(m_name as string, col as Color){
    var zsFluid = VanillaFactory.createFluid(m_name, col);
    zsFluid.material = <blockmaterial:lava>;
    zsFluid.colorize = true;
    zsFluid.stillLocation = 'base:fluids/molten';
    zsFluid.flowingLocation = 'base:fluids/molten_flowing';
    zsFluid.register();
}

function addItem(name as string, rar as string, msize as int){
    var item = VanillaFactory.createItem(name);
    item.rarity = rar;
    item.maxStackSize = msize;
    item.register();
}

function addGlass(name as string){
    var glass = VanillaFactory.createBlock(name, <blockmaterial:glass>);
    //chisel:cube_ctm_translucent
    //"connected_tex": "contenttweaker:blocks/high_heat_glass-ctm",

    /*
    "ctm": {
        "ctm_version": 1,
        "layer": "TRANSLUCENT",
        "type": "ctm",
        "textures": [
            "contenttweaker:blocks/high_heat_glass-ctm"
        ]
    }
    */

    glass.setBlockLayer("TRANSLUCENT");
    glass.setLightOpacity(0);
    glass.setTranslucent(true);
    glass.setFullBlock(false);
    glass.setBlockSoundType(<soundtype:glass>);
    glass.register();
}
function addGlass2(name as string){
    var glass = VanillaFactory.createBlock(name, <blockmaterial:glass>);

    glass.setBlockLayer("TRANSLUCENT");
    glass.setLightOpacity(0);
    //glass.setTranslucent(true);
    //glass.setFullBlock(false);
    glass.setBlockSoundType(<soundtype:glass>);
    glass.register();
}

function addWater(name as string){
    var fluidwaterthingyorsmtidk = VanillaFactory.createFluid(name, Color.fromHex("ea6056"));
    fluidwaterthingyorsmtidk.material = <blockmaterial:water>;
    fluidwaterthingyorsmtidk.colorize = false;
    fluidwaterthingyorsmtidk.stillLocation = 'contenttweaker:fluids/' ~ name;
    fluidwaterthingyorsmtidk.flowingLocation = 'contenttweaker:fluids/' ~ name;
    fluidwaterthingyorsmtidk.register();
}
function addLava(name as string){
    var fluidlavathingyorsmtidk = VanillaFactory.createFluid(name, Color.fromHex("ea6056"));
    fluidlavathingyorsmtidk.material = <blockmaterial:lava>;
    fluidlavathingyorsmtidk.colorize = false;
    fluidlavathingyorsmtidk.stillLocation = 'contenttweaker:fluids/' ~ name;
    fluidlavathingyorsmtidk.flowingLocation = 'contenttweaker:fluids/' ~ name;
    fluidlavathingyorsmtidk.register();
}

{//stoneworks
    VanillaFactory.createItem("brick_dust").register();

    VanillaFactory.createItem("fireclay").register();
    VanillaFactory.createItem("firebrick").register();
    var firebrick_block = VanillaFactory.createBlock("firebrick_block", <blockmaterial:rock>);
    firebrick_block.register();


    VanillaFactory.createItem("rich_clay").register();
    VanillaFactory.createItem("kaolin_clay").register();
    var kaolin_clay_block = VanillaFactory.createBlock("kaolin_clay_block", <blockmaterial:clay>);
    kaolin_clay_block.setToolClass("shovel");
    kaolin_clay_block.setBlockSoundType(<soundtype:ground>);
    kaolin_clay_block.register();

    VanillaFactory.createItem("dolomite").register();

    VanillaFactory.createBlock("lapis_stone", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("lapis_cobblestone", <blockmaterial:rock>).register();
    var lapis_gravel = VanillaFactory.createBlock("lapis_gravel", <blockmaterial:rock>);
    lapis_gravel.setToolClass("shovel");
    lapis_gravel.setBlockSoundType(<soundtype:sand>);    
    lapis_gravel.register();
    var lapis_tile = VanillaFactory.createBlock("lapis_tile", <blockmaterial:rock>);
    lapis_tile.setFullBlock(true);
    lapis_tile.register();

    VanillaFactory.createItem("industrial_clay").register();
    VanillaFactory.createItem("elastic_clay").register();
}
function addAtomicResource(name as string){
        VanillaFactory.createItem(name).register();
        VanillaFactory.createBlock(name + "_block", <blockmaterial:rock>).register();

        var eitem = VanillaFactory.createItem("e" + name);
        eitem.glowing = true;
        eitem.register();
        var eblock = VanillaFactory.createBlock("e" + name + "_block", <blockmaterial:rock>);
        //eblock.glowing = true;
        eblock.register();
}
{////////////////////////////////////metals
    VanillaFactory.createItem("dummy").register();

    var iron_sand = VanillaFactory.createBlock("iron_sand", <blockmaterial:clay>);
    iron_sand.setToolClass("shovel");
    iron_sand.setBlockSoundType(<soundtype:ground>);
    iron_sand.register();

    //iron
    VanillaFactory.createItem("iron_apple").register();
    VanillaFactory.createBlock("poor_iron_ore", <blockmaterial:rock>).register();

    //copper
    VanillaFactory.createItem("copper_seed").register();
    VanillaFactory.createItem("copper_potato").register();

    //bauxite
    VanillaFactory.createItem("bauxite_dust").register();
    VanillaFactory.createFluid("bauxite_slurry", Color.fromHex("955f28")).register();
    VanillaFactory.createFluid("bauxite_waste", Color.fromHex("6a5138")).register();
    VanillaFactory.createFluid("bauxite_waste_treated", Color.fromHex("6a5e52")).register();

    

    //modularium
    VanillaFactory.createItem("modularium_paste").register();
    VanillaFactory.createItem("basic_modularium").register();

    VanillaFactory.createItem("ferramic_base").register();
    registerMoltenMetal("ferramic", Color.fromHex("ffd2c8"));

    //zinc
    VanillaFactory.createBlock("zinc_ore", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("atum_sphalerite_ore", <blockmaterial:rock>).register();
    VanillaFactory.createItem("sphalerite_dust").register();
    registerMetal("zinc");
    VanillaFactory.createItem("zinc_wire").register();
    //molten zinc already exist

    VanillaFactory.createBlock("electrotine_ore", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("electrotine_ore_dense", <blockmaterial:rock>).register();
    VanillaFactory.createFluid("electrotine", Color.fromHex("0e73aa")).register();

    VanillaFactory.createItem("ancient_dust").register();
    VanillaFactory.createItem("ancient_ingot").register();
    VanillaFactory.createBlock("ancient_block", <blockmaterial:rock>).register();

    //gold
    VanillaFactory.createItem("gold_wire").register();
    VanillaFactory.createItem("gold_coil").register();
    VanillaFactory.createBlock("gold_sand", <blockmaterial:rock>).register();

    //lead
    VanillaFactory.createBlock("atum_lead_ore", <blockmaterial:rock>).register();
    VanillaFactory.createItem("galena_dust").register();

    //nial
    VanillaFactory.createItem("nial_ingot").register();
    VanillaFactory.createBlock("nial_block", <blockmaterial:rock>).register();
    VanillaFactory.createItem("nial_dust").register();
    registerMoltenMetal("nial", Color.fromHex("6b87c8"));

    VanillaFactory.createItem("nickel_oxide").register();

    //wear resistant alloy
    registerMetal("wear_resistant_alloy");
    VanillaFactory.createItem("wear_resistant_alloy_ball").register();
    registerMoltenMetal("wear_resistant_alloy", Color.fromHex("9b7b54"));

    //manyullyn
    VanillaFactory.createItem("manyullyn_dust").register();


    //duraluminum
    registerMetal("duraluminum");
    registerMoltenMetal("duraluminum", Color.fromHex("ea8bdd"));

    //flower steel
    VanillaFactory.createItem("flower_steel_ingot").register();
    VanillaFactory.createItem("flower_steel_plate").register();
    VanillaFactory.createItem("flower_steel_rod").register();
    VanillaFactory.createItem("flower_steel_gear").register();
    VanillaFactory.createBlock("flower_steel_block", <blockmaterial:rock>).register();

    //lesmium
    registerMetal("lesmium");
    registerMoltenMetal("lesmium", Color.fromHex("252d61"));

    //angel
    registerMetal("angel");
    registerMoltenMetal("angel", Color.fromHex("7dd2e0"));

    //thermal
    VanillaFactory.createItem("thermal_paste_base").register();
    VanillaFactory.createItem("thermal_paste").register();
    registerMetal("thermal");
    registerMoltenMetal("thermal", Color.fromHex("cc4e4c"));

    //electric manyullyn
    VanillaFactory.createItem("electric_manyullyn_base_ingot").register();
    VanillaFactory.createItem("electric_manyullyn_base_nugget").register();
    VanillaFactory.createBlock("electric_manyullyn_base_block", <blockmaterial:rock>).register();
    registerMoltenMetal("electric_manyullyn_base", Color.fromHex("333b6d"));

    registerMetal("electric_manyullyn");
    registerMoltenMetal("electric_manyullyn", Color.fromHex("333b6d"));

    //watertight steel
    registerMetal("watertight_steel");
    registerMoltenMetal("watertight_steel", Color.fromHex("2a5693"));

    //mushroomite
    //registerMetal("mushroomite");
    VanillaFactory.createItemFood("mushroomite_ingot", 2).register();
    VanillaFactory.createItem("mushroomite_plate").register();
    VanillaFactory.createItem("mushroomite_rod").register();
    VanillaFactory.createItem("mushroomite_gear").register();
    VanillaFactory.createBlock("mushroomite_block", <blockmaterial:rock>).register();
    VanillaFactory.createItem("mushroomite_dust").register();
    VanillaFactory.createItem("mushroomite_nugget").register();

    VanillaFactory.createItem("raw_mushroomite").register();
    var mushroomite_mud = VanillaFactory.createBlock("mushroomite_mud", <blockmaterial:rock>);
    mushroomite_mud.setToolClass("shovel");
    mushroomite_mud.register();

    VanillaFactory.createItem("calcium").register();

    //eliamondin
    VanillaFactory.createItem("eliamondin_dust").register();
    VanillaFactory.createItem("eliamondin").register();

    //meka steel
    VanillaFactory.createItem("mekanized_steel_base_ingot").register();
    registerMetal("mekanized_steel");
    registerMoltenMetal("mekanized_steel", Color.fromHex("6f6b83"));

    VanillaFactory.createFluid("haste_potion", Color.fromHex("928546")).register();
    VanillaFactory.createFluid("speed_potion", Color.fromHex("637c88")).register();
    VanillaFactory.createFluid("mekanization_catalyst", Color.fromHex("ad0000")).register();

    VanillaFactory.createBlock("meka_umbran", <blockmaterial:rock>).register();

    //relic
    VanillaFactory.createItem("relic_ingot").register();
    VanillaFactory.createItem("relic_nugget").register();
    VanillaFactory.createBlock("relic_block", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("treasure_block", <blockmaterial:rock>).register();

    //fluix steel
    registerMetal("fluix_steel");
    VanillaFactory.createItem("fluix_steel_wire").register();
    //menril steel
    VanillaFactory.createItem("menril_steel_ingot").register();
    VanillaFactory.createItem("menril_steel_base_ingot").register();
    VanillaFactory.createItem("menril_steel_nugget").register();
    VanillaFactory.createItem("menril_steel_dust").register();
    VanillaFactory.createItem("menril_steel_plate").register();
    VanillaFactory.createItem("menril_steel_wire").register();
    VanillaFactory.createBlock("menril_steel_block", <blockmaterial:rock>).register();
    //xnet
    VanillaFactory.createItem("xnet_ingot").register();
    VanillaFactory.createItem("xnet_plate").register();
    VanillaFactory.createItem("xnet_wire").register();
    VanillaFactory.createBlock("xnet_block", <blockmaterial:rock>).register();

    //soy
    VanillaFactory.createItem("soy_ingot").register();
    VanillaFactory.createItem("soy_plate").register();
    VanillaFactory.createItem("soy_gear").register();

    //potion_zinc
    VanillaFactory.createItem("glass_ingot").register();
    VanillaFactory.createItem("potion_zinc_ingot").register();
    VanillaFactory.createItem("potion_zinc_plate").register();
    VanillaFactory.createItem("potion_zinc_gear").register();

    //solar_potion_zinc
    VanillaFactory.createItem("solar_potion_zinc_ingot").register();
    VanillaFactory.createItem("solar_potion_zinc_plate").register();
    VanillaFactory.createItem("solar_potion_zinc_gear").register();

    VanillaFactory.createItem("platinum_wire").register();

    //osmiridium
    VanillaFactory.createItem("osmiridium_dust").register();
    VanillaFactory.createItem("osmiridium_rod").register();
    VanillaFactory.createItem("osmiridium_support").register();

    //osgloridium
    registerMetal("osgloridium");
    registerMoltenMetal("osgloridium", Color.fromHex("747c41"));

    //fiery
    VanillaFactory.createItem("fiery_ball").register();

    //titanium
    registerMetal("titanium");
    VanillaFactory.createBlock("titanium_ore", <blockmaterial:rock>).register();
    VanillaFactory.createItem("true_titanium").register();
    //tungsten
    VanillaFactory.createItem("tungsten_plate").register();
    VanillaFactory.createItem("tungsten_wire").register();
    VanillaFactory.createItem("tungsten_coil").register();
    VanillaFactory.createBlock("tungsten_block", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("tungsten_ore", <blockmaterial:rock>).register();
    VanillaFactory.createItem("tungsten_mixture").register();

    //uranium
    VanillaFactory.createItem("uranium_pieces").register();
    VanillaFactory.createItem("uranium_chunk").register();

    //medical alloy
    registerMetal("medical_alloy");
    VanillaFactory.createItem("medical_alloy_wire").register();
    VanillaFactory.createItem("medical_alloy_coil").register();
    addLava("medical_alloy");

    //gastight steel
    registerMetal("gastight_steel");

    VanillaFactory.createItem("fluxed_rod").register();

    //black bronze
    registerMetal("black_bronze");
    registerMoltenMetal("black_bronze", Color.fromHex("423468"));
    VanillaFactory.createItem("carminium_ingot").register();
    VanillaFactory.createItem("carminium_sheet").register();

    //tinezo
    VanillaFactory.createItem("tinezo_ingot").register();
    VanillaFactory.createItem("tinezo_plate").register();
    VanillaFactory.createItem("tinezo_gear").register();
    VanillaFactory.createItem("tinezo_dust").register();
    VanillaFactory.createBlock("tinezo_block", <blockmaterial:rock>).register();

    VanillaFactory.createItem("zanite_coral").register();

    addAtomicResource("coppra");
    addAtomicResource("nittin");
    addAtomicResource("goold");
    //addAtomicResource("sliver");
    //addAtomicResource("deal");
    //addAtomicResource("somium");

    var rainbow_crystal_cluster = VanillaFactory.createItem("rainbow_crystal_cluster");
    rainbow_crystal_cluster.glowing = true;
    rainbow_crystal_cluster.rarity = "rare";
    rainbow_crystal_cluster.register();

    VanillaFactory.createItem("gravity_ingot").register();
    VanillaFactory.createItem("gravity_dust").register();

    VanillaFactory.createItem("arkenium_pieces").register();
    VanillaFactory.createItem("arkenium_chunk").register();
    VanillaFactory.createItem("arkenium_ingot").register();
    VanillaFactory.createItem("arkenium_plate").register();
    VanillaFactory.createItem("arkenium_gear").register();
    VanillaFactory.createBlock("arkenium_block", <blockmaterial:rock>).register();
    VanillaFactory.createItem("arkenium_dust").register();
    VanillaFactory.createItem("arkenium_ball").register();
    registerMoltenMetal("arkenium", Color.fromHex("1b1a1e"));

    VanillaFactory.createItem("arkenium_crystal").register();
    VanillaFactory.createItem("arkenium_shard").register();
    VanillaFactory.createItem("arkenium_cluster").register();
    VanillaFactory.createItem("arkenium_dirty_dust").register();

    VanillaFactory.createItem("gallium_pieces").register();
    VanillaFactory.createItem("gallium_chunk").register();
    VanillaFactory.createItem("gallium_ingot").register();
    VanillaFactory.createItem("gallium_sheet").register();
    VanillaFactory.createBlock("gallium_block", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("gallium_ore", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("gallium_dense_ore", <blockmaterial:rock>).register();
    VanillaFactory.createItem("gallium_dust").register();
    registerMoltenMetal("gallium", Color.fromHex("b5ceea"));

    VanillaFactory.createItem("gallium_crystal").register();
    VanillaFactory.createItem("gallium_shard").register();
    VanillaFactory.createItem("gallium_clump").register();
    VanillaFactory.createItem("gallium_dirty_dust").register();

    

    VanillaFactory.createItem("algan").register();

    VanillaFactory.createItem("stoneleaf").register();
    VanillaFactory.createItem("stoneleaf_clump").register();
    VanillaFactory.createBlock("stoneleaf_ore", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("stoneleaf_dense_ore", <blockmaterial:rock>).register();

    //fluxed line
    VanillaFactory.createItem("gilded_soot").register();
    VanillaFactory.createItem("gold_crystal").register();
    VanillaFactory.createItem("prefluxed_electrum_blend").register();

    //
    VanillaFactory.createItem("energized_compound").register();

    VanillaFactory.createItem("calitunti_ingot").register();
    VanillaFactory.createItem("calitunti_plate").register();
    VanillaFactory.createItem("calitunti_gear").register();
    VanillaFactory.createBlock("calitunti_block", <blockmaterial:rock>).register();

    VanillaFactory.createItem("amethyst_ingot").register();
    VanillaFactory.createItem("amethyst_nugget").register();
    VanillaFactory.createItem("amethyst_dust").register();
    VanillaFactory.createItem("amethyst_dirty_dust").register();
    VanillaFactory.createItem("ender_amethyst_dust").register();
    VanillaFactory.createItem("ender_amethyst_dirty_dust").register();
    registerMoltenMetal("ender_amethyst_dirty", Color.fromHex("8a2394"));

    //celestial
    VanillaFactory.createItem("celestial_seed").register();
    VanillaFactory.createItem("celestial_corn").register();
    VanillaFactory.createItem("celestial_cluster").register();
    VanillaFactory.createFluid("celestial_oil", Color.fromHex("8257b6")).register();
    registerMoltenMetal("hot_celestial_oil", Color.fromHex("d6b8fa"));

    VanillaFactory.createItem("chrome_ingot").register();
    VanillaFactory.createItem("chrome_dust").register();
    VanillaFactory.createItem("chrome_pieces").register();
    VanillaFactory.createItem("chrome_chunk").register();
    VanillaFactory.createBlock("chrome_block", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("chrome_ore", <blockmaterial:rock>).register();
    registerMoltenMetal("chrome", Color.fromHex("d7c8cb"));

    VanillaFactory.createItem("chrome_crystal").register();
    VanillaFactory.createItem("chrome_shard").register();
    VanillaFactory.createItem("chrome_cluster").register();
    VanillaFactory.createItem("chrome_dirty_dust").register();



    VanillaFactory.createItem("bedrockium_chunk").register();
    VanillaFactory.createItem("bedrockium_small_chunk").register();
    VanillaFactory.createFluid("raw_bedrockium_solution", Color.fromHex("444444")).register();
    VanillaFactory.createFluid("bedrockium_solution", Color.fromHex("333333")).register();
    VanillaFactory.createFluid("refined_bedrockium_solution", Color.fromHex("222222")).register();
    VanillaFactory.createItem("bedrockium_crystal").register();
    VanillaFactory.createItem("bedrockium_fine_powder").register();
    VanillaFactory.createItem("bedrockium_alloy_mix").register();

    VanillaFactory.createItem("bedrockium_alloy_ingot").register();
    VanillaFactory.createItem("bedrockium_alloy_plate").register();
    VanillaFactory.createItem("bedrockium_alloy_gear").register();
    VanillaFactory.createBlock("bedrockium_alloy_block", <blockmaterial:rock>).register();
    VanillaFactory.createItem("bedrockium_alloy_ball").register();

    //cursed gold & gold
    VanillaFactory.createItem("cursed_gold_pieces").register();
    VanillaFactory.createItem("cursed_gold_chunk").register();
    VanillaFactory.createItem("cursed_gold_dust").register();
    VanillaFactory.createItem("cursed_gold_ingot").register();
    VanillaFactory.createItem("cursed_gold_plate").register();
    VanillaFactory.createBlock("cursed_gold_altar1", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("cursed_gold_altar2", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("cursed_gold_altar3", <blockmaterial:rock>).register();

    VanillaFactory.createItem("pure_gold_dust").register();
    VanillaFactory.createFluid("aqua_regia", Color.fromHex("ffff0b")).register();
    VanillaFactory.createFluid("chloroauric_acid", Color.fromHex("bbbb02")).register();
    VanillaFactory.createItem("unannealed_purple_gold_ingot").register();
    VanillaFactory.createItem("purple_gold_ingot").register();
    VanillaFactory.createBlock("purple_gold_block", <blockmaterial:rock>).register();

    VanillaFactory.createItem("peridotite_ingot").register();
    VanillaFactory.createItem("peridotite_sheet").register();
    VanillaFactory.createBlock("peridotite_block", <blockmaterial:rock>).register();

    VanillaFactory.createItem("imperomite_catalyst").register();
    VanillaFactory.createItem("imperomite_catalyst_dust").register();

    VanillaFactory.createItem("methyst").register();
    VanillaFactory.createItem("methyst_dirty_dust").register();
    VanillaFactory.createItem("methyst_dust").register();

    VanillaFactory.createItem("imperial_iron_ingot").register();
    VanillaFactory.createItem("imperial_steel_ingot").register();
    VanillaFactory.createItem("imperial_steel_plate").register();
    VanillaFactory.createItem("imperial_steel_gear").register();
    VanillaFactory.createBlock("imperial_steel_block", <blockmaterial:rock>).register();

    VanillaFactory.createBlock("neodymium_ore", <blockmaterial:rock>).register();
    VanillaFactory.createItem("neodymium_pieces").register();
    VanillaFactory.createItem("neodymium_chunk").register();
    VanillaFactory.createItem("neodymium_ingot").register();
    VanillaFactory.createItem("neodymium_plate").register();
    VanillaFactory.createItem("neodymium_rod").register();
    VanillaFactory.createItem("neodymium_gear").register();
    VanillaFactory.createBlock("neodymium_block", <blockmaterial:rock>).register();
    VanillaFactory.createItem("neodymium_dust").register();

    VanillaFactory.createItem("neodymium_crystal").register();
    VanillaFactory.createItem("neodymium_shard").register();
    VanillaFactory.createItem("neodymium_cluster").register();
    VanillaFactory.createItem("neodymium_dirty_dust").register();
    registerMoltenMetal("neodymium", Color.fromHex("d34aa0"));

    VanillaFactory.createItem("karmesine_pieces").register();
    VanillaFactory.createItem("karmesine_chunk").register();
    VanillaFactory.createItem("ovium_pieces").register();
    VanillaFactory.createItem("ovium_chunk").register();
    VanillaFactory.createItem("jauxum_pieces").register();
    VanillaFactory.createItem("jauxum_chunk").register();

    VanillaFactory.createItem("vibranium_pieces").register();
    VanillaFactory.createItem("vibranium_chunk").register();
    
    VanillaFactory.createItem("osram_pieces").register();
    VanillaFactory.createItem("osram_chunk").register();

    VanillaFactory.createItem("prometheum_pieces").register();
    VanillaFactory.createItem("prometheum_chunk").register();

    VanillaFactory.createItem("eezo_pieces").register();
    VanillaFactory.createItem("eezo_chunk").register();

    VanillaFactory.createItem("palladium_pieces").register();
    VanillaFactory.createItem("palladium_chunk").register();
    VanillaFactory.createItem("palladium_plate").register();
    VanillaFactory.createItem("palladium_gear").register();
    VanillaFactory.createItem("palladium_rod").register();
    VanillaFactory.createItem("palladium_mesh").register();
    VanillaFactory.createItem("palladium_mana_mesh").register();

    VanillaFactory.createItem("abyssum_pieces").register();
    VanillaFactory.createItem("abyssum_chunk").register();

    VanillaFactory.createItem("yrdeen_plate").register();
    VanillaFactory.createItem("yrdeen_gear").register();

    VanillaFactory.createItem("proxii_plate").register();
    VanillaFactory.createItem("proxii_gear").register();
    VanillaFactory.createItem("proxii_ball").register();

    VanillaFactory.createItem("uru_pieces").register();
    VanillaFactory.createItem("uru_chunk").register();

    VanillaFactory.createItem("awaken_uru_ingot").register();
    VanillaFactory.createItem("awaken_uru_plate").register();
    VanillaFactory.createItem("awaken_uru_gear").register();
    VanillaFactory.createBlock("awaken_uru_block", <blockmaterial:rock>).register();
    VanillaFactory.createItem("awaken_uru_dust").register();

    VanillaFactory.createItem("hallowsite_pieces").register();
    VanillaFactory.createItem("hallowsite_chunk").register();

    var caelumite_ore = VanillaFactory.createBlock("caelumite_ore", <blockmaterial:rock>);
    caelumite_ore.lightValue = 1;
    caelumite_ore.register();
    VanillaFactory.createItem("caelumite_ingot").register();
    VanillaFactory.createItem("caelumite_plate").register();
    VanillaFactory.createItem("caelumite_rod").register();
    var caelumite_block = VanillaFactory.createBlock("caelumite_block", <blockmaterial:rock>);
    caelumite_block.lightValue = 1;
    caelumite_block.register();
    VanillaFactory.createItem("caelumite_dust").register();
    VanillaFactory.createItem("light_support").register();

    VanillaFactory.createItem("biotite_dust").register();
    VanillaFactory.createItem("biotite_dirty_dust").register();
    VanillaFactory.createFluid("biotite", Color.fromHex("60309b")).register();

    {//bop gems stuff
        VanillaFactory.createItem("delicate_amber").register();
        VanillaFactory.createItem("delicate_malachite").register();
        VanillaFactory.createItem("delicate_tanzanite").register();
        VanillaFactory.createItem("delicate_topaz").register();

        VanillaFactory.createItem("gem_amber_dust").register();
        VanillaFactory.createItem("gem_malachite_dust").register();
        VanillaFactory.createItem("gem_peridot_dust").register();
        VanillaFactory.createItem("gem_ruby_dust").register();
        VanillaFactory.createItem("gem_sapphire_dust").register();
        VanillaFactory.createItem("gem_tanzanite_dust").register();
        VanillaFactory.createItem("gem_topaz_dust").register();

        VanillaFactory.createItem("gem_amber_seed").register();
        VanillaFactory.createItem("gem_malachite_seed").register();
        VanillaFactory.createItem("gem_peridot_seed").register();
        VanillaFactory.createItem("gem_ruby_seed").register();
        VanillaFactory.createItem("gem_sapphire_seed").register();
        VanillaFactory.createItem("gem_tanzanite_seed").register();
        VanillaFactory.createItem("gem_topaz_seed").register();


        VanillaFactory.createFluid("amber_slury", Color.fromHex("c37e00")).register();
        VanillaFactory.createFluid("malachite_slury", Color.fromHex("2bb381")).register();
        VanillaFactory.createFluid("peridot_slury", Color.fromHex("6da228")).register();
        VanillaFactory.createFluid("ruby_slury", Color.fromHex("d51523")).register();
        VanillaFactory.createFluid("sapphire_slury", Color.fromHex("3f9cc8")).register();
        VanillaFactory.createFluid("tanzanite_slury", Color.fromHex("ae59ff")).register();
        VanillaFactory.createFluid("topaz_slury", Color.fromHex("f1601e")).register();
    }
    VanillaFactory.createBlock("geode_ore", <blockmaterial:rock>).register();

    VanillaFactory.createItem("cincinnasite_dirty_dust").register();
    VanillaFactory.createFluid("cincinnasite_slurry", Color.fromHex("d3c061")).register();
    VanillaFactory.createItem("rare_earth_dust").register();
    VanillaFactory.createItem("rarer_earth_dust").register();
    VanillaFactory.createBlock("rare_earth_sand", <blockmaterial:rock>).register();
    //VanillaFactory.createFluid("rare_earth_slurry", Color.fromHex("694217")).register();

    {//ambrosium
        VanillaFactory.createItem("ambrosium_dust").register();
        VanillaFactory.createBlock("ambrosium_gravel", <blockmaterial:rock>).register();
        VanillaFactory.createItem("ambrosium_seed").register();
        VanillaFactory.createItem("ambrosium_balls").register();
        VanillaFactory.createItem("ambrosium_thing").register();
        VanillaFactory.createItem("ambrosium_crystal_seed").register();
        VanillaFactory.createItem("ambrosium_crystal").register();
        VanillaFactory.createItem("corrupted_ambrosium").register();
        VanillaFactory.createItem("gambrosium_dust").register();
        VanillaFactory.createItem("gambrosium_boule").register();
        VanillaFactory.createItem("gambrosium_wafer").register();

        VanillaFactory.createFluid("ambrosium_slury", Color.fromHex("959420")).register();
        VanillaFactory.createFluid("ambrosium_slury_clean", Color.fromHex("f9f882")).register();
        VanillaFactory.createFluid("gambrosium", Color.fromHex("87c83e")).register();
    }
    

    //VanillaFactory.createItem("explosion_resistant_dust").register();
    VanillaFactory.createItem("explosion_resistant_ingot").register();
    VanillaFactory.createItem("explosion_resistant_plate").register();
    VanillaFactory.createItem("explosion_resistant_rod").register();
    VanillaFactory.createItem("explosion_resistant_gear").register();
    VanillaFactory.createBlock("explosion_resistant_block", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("explosion_resistant_sheetmetal", <blockmaterial:rock>).register();

    VanillaFactory.createItem("hot_ingot").register();
    VanillaFactory.createItem("hot_plate").register();
    VanillaFactory.createItem("hot_gear").register();
    VanillaFactory.createBlock("hot_block", <blockmaterial:rock>).register();

    VanillaFactory.createItem("tunril_dust").register();
    VanillaFactory.createItem("tunril_dust_big").register();
    VanillaFactory.createItem("tunril_ingot").register();
    VanillaFactory.createItem("tunril_plate").register();
    VanillaFactory.createItem("tunril_rod").register();
    VanillaFactory.createBlock("tunril_block", <blockmaterial:rock>).register();
    //registerMoltenMetal("tignalum", Color.fromHex("da6a1d"));

    VanillaFactory.createItem("tignalum_ingot").register();
    VanillaFactory.createItem("tignalum_plate").register();
    VanillaFactory.createItem("tignalum_rod").register();
    VanillaFactory.createItem("tignalum_gear").register();
    VanillaFactory.createBlock("tignalum_block", <blockmaterial:rock>).register();
    registerMoltenMetal("tignalum", Color.fromHex("da6a1d"));
    VanillaFactory.createItem("tignalum_ball").register();

    VanillaFactory.createItem("mitanium_ingot").register();
    VanillaFactory.createBlock("mitanium_block", <blockmaterial:rock>).register();

    VanillaFactory.createItem("blood_bronze_plate").register();
    VanillaFactory.createItem("blood_bronze_gear").register();
    VanillaFactory.createItem("blood_bronze_ball").register();

    VanillaFactory.createItem("evil_ball").register();

    VanillaFactory.createItem("crabolion").register();

    VanillaFactory.createItem("alchemical_brass_ingot").register();
    VanillaFactory.createItem("alchemical_brass_plate").register();
    VanillaFactory.createItem("alchemical_brass_gear").register();
    VanillaFactory.createBlock("alchemical_brass_block", <blockmaterial:rock>).register();

    //living
    VanillaFactory.createItem("skeleton_ingot").register();
    VanillaFactory.createItem("living_steel_ingot").register();
    VanillaFactory.createItem("living_steel_plate").register();
    VanillaFactory.createItem("living_steel_gear").register();
    VanillaFactory.createBlock("living_steel_block", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("living_steel_sheetmetal", <blockmaterial:rock>).register();

    //crystal_metal
    VanillaFactory.createItem("crystal_metal_ingot").register();
    VanillaFactory.createItem("crystal_metal_plate").register();
    VanillaFactory.createItem("crystal_metal_gear").register();
    VanillaFactory.createBlock("crystal_metal_block", <blockmaterial:rock>).register();
    VanillaFactory.createItem("crystal_metal_nugget").register();

    //conductive_alloy
    VanillaFactory.createItem("conductive_alloy_ingot").register();
    VanillaFactory.createItem("conductive_alloy_plate").register();
    VanillaFactory.createItem("conductive_alloy_gear").register();
    VanillaFactory.createItem("conductive_alloy_wire").register();
    VanillaFactory.createItem("conductive_alloy_coil").register();
    VanillaFactory.createBlock("conductive_alloy_block", <blockmaterial:rock>).register();

    //acid_resistant_steel
    VanillaFactory.createItem("acid_resistant_steel_a").register();
    VanillaFactory.createItem("acid_resistant_steel_b").register();
    VanillaFactory.createItem("acid_resistant_steel_ingot").register();
    VanillaFactory.createItem("acid_resistant_steel_plate").register();
    VanillaFactory.createItem("acid_resistant_steel_gear").register();
    VanillaFactory.createBlock("acid_resistant_steel_block", <blockmaterial:rock>).register();

    //botania
    VanillaFactory.createItem("mana_absorbing_ingot").register();
    VanillaFactory.createItem("mana_steel_ball").register();

    VanillaFactory.createBlock("pure_metal", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("pure_sheetmetal", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("pure_cincinnasite", <blockmaterial:rock>).register();

    VanillaFactory.createItem("chlorasteel_ingot").register();
    VanillaFactory.createItem("chlorasteel_plate").register();
    VanillaFactory.createItem("chlorasteel_gear").register();
    VanillaFactory.createBlock("chlorasteel_block", <blockmaterial:rock>).register();

    VanillaFactory.createItem("gem_steel_ingot").register();
    VanillaFactory.createItem("gem_steel_plate").register();
    VanillaFactory.createItem("gem_steel_gear").register();
    VanillaFactory.createBlock("gem_steel_block", <blockmaterial:rock>).register();
    var molten_gem_steel = VanillaFactory.createFluid("gem_steel", Color.fromHex("000000"));
    molten_gem_steel.material = <blockmaterial:lava>;
    molten_gem_steel.colorize = false;
    molten_gem_steel.stillLocation = 'contenttweaker:fluids/gemmed_steel';
    molten_gem_steel.flowingLocation = 'contenttweaker:fluids/gemmed_steel_flowing';
    molten_gem_steel.register();

    VanillaFactory.createItem("mirion2_ingot").register();
    VanillaFactory.createItem("mirion2_plate").register();
    VanillaFactory.createItem("mirion2_gear").register();
    VanillaFactory.createItem("mirion2_rod").register();
    VanillaFactory.createBlock("mirion2_block", <blockmaterial:rock>).register();
    registerMoltenMetal("mirion2", Color.fromHex("97ba00"));

    


    VanillaFactory.createItem("light_clay1").register();
    VanillaFactory.createItem("light_clay2").register();
    VanillaFactory.createItem("light_ingot").register();
    VanillaFactory.createItem("light_plate").register();
    VanillaFactory.createItem("light_gear").register();
    var light_block = VanillaFactory.createBlock("light_block", <blockmaterial:rock>);
    light_block.setBlockLayer("TRANSLUCENT");
    light_block.setLightOpacity(0);
    light_block.setTranslucent(true);
    light_block.setFullBlock(false);
    light_block.lightValue = 1;
    light_block.register();

    
    VanillaFactory.createItem("glowshroomite_ingot").register();
    var glowshroomite_block = VanillaFactory.createBlock("glowshroomite_block", <blockmaterial:rock>);
    glowshroomite_block.setBlockLayer("TRANSLUCENT");
    glowshroomite_block.setLightOpacity(0);
    glowshroomite_block.setTranslucent(true);
    glowshroomite_block.setFullBlock(false);
    glowshroomite_block.lightValue = 1;
    glowshroomite_block.register();
    var glowshroomite_mud = VanillaFactory.createBlock("glowshroomite_mud", <blockmaterial:rock>);
    glowshroomite_mud.setBlockLayer("TRANSLUCENT");
    glowshroomite_mud.setLightOpacity(0);
    glowshroomite_mud.setTranslucent(true);
    glowshroomite_mud.setFullBlock(false);
    glowshroomite_mud.lightValue = 1;
    glowshroomite_mud.register();

    VanillaFactory.createBlock("orichalcum_ore", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("orichalcum_dense_ore", <blockmaterial:rock>).register();
    VanillaFactory.createItem("orichalcum_pieces").register();
    VanillaFactory.createItem("orichalcum_chunk").register();
    VanillaFactory.createItem("orichalcum_ingot").register();
    VanillaFactory.createItem("orichalcum_plate").register();
    VanillaFactory.createItem("orichalcum_gear").register();
    VanillaFactory.createBlock("orichalcum_block", <blockmaterial:rock>).register();
    VanillaFactory.createItem("orichalcum_dust").register();
    registerMoltenMetal("orichalcum", Color.fromHex("e33d73"));

    VanillaFactory.createItem("orichalcum_crystal").register();
    VanillaFactory.createItem("orichalcum_shard").register();
    VanillaFactory.createItem("orichalcum_clump").register();
    VanillaFactory.createItem("orichalcum_dirty_dust").register();

    VanillaFactory.createItem("orichalconite_ingot").register();
    VanillaFactory.createItem("orichalconite_plate").register();
    VanillaFactory.createItem("orichalconite_gear").register();
    VanillaFactory.createBlock("orichalconite_block", <blockmaterial:rock>).register();

    VanillaFactory.createItem("vibralcum_ingot").register();
    VanillaFactory.createItem("vibralcum_plate").register();
    VanillaFactory.createItem("vibralcum_gear").register();
    VanillaFactory.createBlock("vibralcum_block", <blockmaterial:rock>).register();

    VanillaFactory.createItem("nitinol_ingot").register();
    VanillaFactory.createItem("nitinol_plate").register();
    VanillaFactory.createItem("nitinol_rod").register();
    VanillaFactory.createItem("nitinol_gear").register();
    VanillaFactory.createItem("nitinol_wire").register();
    VanillaFactory.createBlock("nitinol_block", <blockmaterial:rock>).register();

    VanillaFactory.createItem("neuronium_ingot").register();
    VanillaFactory.createItem("neuronium_plate").register();
    VanillaFactory.createItem("neuronium_gear").register();
    VanillaFactory.createBlock("neuronium_block", <blockmaterial:rock>).register();

    VanillaFactory.createItem("fluxed_invar_ingot").register();
    VanillaFactory.createItem("fluxed_invar_plate").register();
    VanillaFactory.createItem("fluxed_invar_gear").register();
    VanillaFactory.createBlock("fluxed_invar_block", <blockmaterial:rock>).register();

    VanillaFactory.createItem("moon_ingot").register();
    VanillaFactory.createItem("moon_plate").register();
    VanillaFactory.createItem("moon_gear").register();
    VanillaFactory.createBlock("moon_block", <blockmaterial:rock>).register();

    VanillaFactory.createItem("preblack_ingot").register();

    VanillaFactory.createBlock("starmetal_ore", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("starmetal_space_ore", <blockmaterial:rock>).register();
    VanillaFactory.createItem("starmetal_plate").register();
    VanillaFactory.createItem("starmetal_gear").register();
    VanillaFactory.createBlock("starmetal_block", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("starmetal_sheetmetal", <blockmaterial:rock>).register();

    VanillaFactory.createItem("aquamarine_dust").register();
    VanillaFactory.createItem("aquamarine_dirty_dust").register();

    VanillaFactory.createItem("star_alloy_ingot").register();
    VanillaFactory.createItem("star_alloy_plate").register();
    VanillaFactory.createItem("star_alloy_gear").register();
    VanillaFactory.createBlock("star_alloy_block", <blockmaterial:rock>).register();

    VanillaFactory.createBlock("zirconium_ore", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("zirconium_ore_dense", <blockmaterial:rock>).register();
    VanillaFactory.createItem("zirconium_pieces").register();
    VanillaFactory.createItem("zirconium_chunk").register();
    VanillaFactory.createItem("zirconium_gem").register();
    VanillaFactory.createBlock("zirconium_block", <blockmaterial:rock>).register();
    VanillaFactory.createItem("zirconium_dust").register();
    registerMoltenMetal("zirconium", Color.fromHex("f9931b"));

    VanillaFactory.createItem("zirconium_lens").register();
    VanillaFactory.createItem("zirconium_mirror").register();

    VanillaFactory.createItem("zirconium_crystal").register();
    VanillaFactory.createItem("zirconium_shard").register();
    VanillaFactory.createItem("zirconium_clump").register();
    VanillaFactory.createItem("zirconium_dirty_dust").register();

    VanillaFactory.createBlock("moissanite_ore", <blockmaterial:rock>).register();
    VanillaFactory.createItem("moissanite_dirty").register();
    VanillaFactory.createItem("moissanite").register();
    VanillaFactory.createItem("moissanite_plate").register();

    VanillaFactory.createBlock("space_ice_raw", <blockmaterial:rock>).register();
    VanillaFactory.createItem("space_ice").register();
    VanillaFactory.createItem("space_ice_crystal").register();
    VanillaFactory.createBlock("space_ice_crystal_block", <blockmaterial:rock>).register();
    VanillaFactory.createFluid("radioactive_water", Color.fromHex("28ea8d")).register();

    VanillaFactory.createItem("vortexed_base").register();
    VanillaFactory.createItem("vortexed_ingot").register();

    VanillaFactory.createItem("polonium_dust").register();
    VanillaFactory.createBlock("polonium_block", <blockmaterial:rock>).register();

    VanillaFactory.createItem("beryllium_dust").register();
    VanillaFactory.createItem("beryllium_sheet").register();
    VanillaFactory.createBlock("beryllium_block", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("beryllium_ore", <blockmaterial:rock>).register();

    VanillaFactory.createItem("lucky_alloy_ingot").register();
    VanillaFactory.createItem("lucky_alloy_plate").register();
    VanillaFactory.createItem("lucky_alloy_gear").register();
    VanillaFactory.createBlock("lucky_alloy_block", <blockmaterial:rock>).register();

    
    VanillaFactory.createItem("death_metal_ingot").register();
    VanillaFactory.createItem("death_metal_plate").register();
    VanillaFactory.createItem("death_metal_gear").register();
    VanillaFactory.createBlock("death_metal_block", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("death_metal_ore", <blockmaterial:rock>).register();

    VanillaFactory.createItem("death_metal_dust").register();
    VanillaFactory.createItem("death_metal_pieces").register();
    VanillaFactory.createItem("death_metal_chunk").register();
    
    VanillaFactory.createItem("death_metal_crystal").register();
    VanillaFactory.createItem("death_metal_shard").register();
    VanillaFactory.createItem("death_metal_clump").register();
    VanillaFactory.createItem("death_metal_dirty_dust").register();

    VanillaFactory.createBlock("emc_ore", <blockmaterial:rock>).register();

    VanillaFactory.createItem("pandemonium_ingot").register();
    VanillaFactory.createItem("pandemonium_plate").register();

    VanillaFactory.createItem("super_alloy_base_ingot").register();

    VanillaFactory.createItem("neutronium_element").register();
    VanillaFactory.createItem("neutronium_dust").register();
    VanillaFactory.createItem("neutronium_hammer").register();
    VanillaFactory.createBlock("neutronium_sand", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("neutronium_sheetmetal", <blockmaterial:rock>).register();
    VanillaFactory.createItem("neutronium_ball").register();

    VanillaFactory.createItem("ssa_ingot").register();
    VanillaFactory.createBlock("ssa_block", <blockmaterial:rock>).register();
}
VanillaFactory.createItem("jade_dust").register();
{//malachite
    VanillaFactory.createItem("malachite_ore_dust").register();
    VanillaFactory.createItem("malachite_crystal_seed").register();
    VanillaFactory.createItem("malachite_dust").register();
    VanillaFactory.createItem("malachite_monocrystal").register();
    VanillaFactory.createItem("malachite_polycrystal").register();
    VanillaFactory.createBlock("malachite_block", <blockmaterial:rock>).register();
    VanillaFactory.createFluid("malachite_solution", Color.fromHex("498998")).register();
    VanillaFactory.createFluid("rich_malachite_solution", Color.fromHex("28825e")).register();

    var malachite_vase = VanillaFactory.createItem("malachite_vase");
    malachite_vase.maxStackSize = 16;
    malachite_vase.register();
}

{
    VanillaFactory.createItem("ore_cube_spent").register();
    VanillaFactory.createItem("ore_cube1").register();
    VanillaFactory.createItem("ore_cube2").register();
    VanillaFactory.createItem("ore_cube3").register();
    VanillaFactory.createItem("ore_cube4").register();
    VanillaFactory.createItem("ore_cube5").register();
}

{//denorm
    VanillaFactory.createItem("denorm_dust").register();
    var denorm = VanillaFactory.createFluid("denorm", Color.fromHex("ea6056"));
    denorm.material = <blockmaterial:water>;
    denorm.colorize = false;
    denorm.stillLocation = 'contenttweaker:fluids/denorm';
    denorm.flowingLocation = 'contenttweaker:fluids/denorm';
    denorm.register();
}

VanillaFactory.createFluid("solar_silicon_solution", Color.fromHex("a48360")).register();
VanillaFactory.createItem("solar_silicon").register();

VanillaFactory.createItem("aluminum_silicon").register();
VanillaFactory.createItem("insulation_base").register();
VanillaFactory.createItem("insulation_strand").register();
VanillaFactory.createItem("insulation_fabric").register();

VanillaFactory.createItem("insulated_rod").register();
VanillaFactory.createItem("electromagnet_core").register();
VanillaFactory.createBlock("ev_coil", <blockmaterial:rock>).register();
VanillaFactory.createBlock("iv_coil", <blockmaterial:rock>).register();

VanillaFactory.createItem("gravel_wool").register();
VanillaFactory.createItem("electric_wool").register();
VanillaFactory.createItem("electric_wool2_base").register();
VanillaFactory.createItem("electric_wool2").register();

VanillaFactory.createItem("sky_grain").register();

VanillaFactory.createItem("crystal_coal").register();

{
    VanillaFactory.createItem("reinforced_cell").register();
    VanillaFactory.createItem("lightning_cell").register();
    VanillaFactory.createItem("fire_cell").register();
    VanillaFactory.createItem("light_cell").register();
    VanillaFactory.createItem("ice_cell").register();
    VanillaFactory.createItem("rock_cell").register();
    VanillaFactory.createItem("slime_cell").register();
}

VanillaFactory.createItem("raw_photovoltaic").register();

VanillaFactory.createItem("zorra_dust").register();

VanillaFactory.createItem("guarding_crystal").register();



//godshards
function add_godshard(name as string){
    var atum_shard = VanillaFactory.createItem(name + "_godshard");
    atum_shard.glowing = true;
    atum_shard.rarity = "rare";
    atum_shard.register();
}
{//godshards
    VanillaFactory.createBlock("atum_godshardium_ore", <blockmaterial:rock>).register();
    add_godshard("atum");
    add_godshard("ra");
    add_godshard("ptah");
    add_godshard("geb");
    add_godshard("tefnuts");
    add_godshard("shu");
    add_godshard("horus");
    add_godshard("seth");
    add_godshard("isis");
    add_godshard("montu");
    add_godshard("anubis");
    add_godshard("nuit");
    add_godshard("anput");

    var atum_ingot = VanillaFactory.createItem("atum_ingot");
    atum_ingot.glowing = true;
    atum_ingot.rarity = "rare";
    atum_ingot.register();

    //VanillaFactory.createItem("godshardium").register();
    var godshardium = VanillaFactory.createItem("godshardium");
    godshardium.glowing = true;
    godshardium.rarity = "rare";
    godshardium.register();

    var nuit_fuel = VanillaFactory.createFluid("nuit_fuel", Color.fromHex("ea6056"));
    nuit_fuel.material = <blockmaterial:lava>;
    nuit_fuel.colorize = false;
    nuit_fuel.stillLocation = 'contenttweaker:fluids/nuit_fuel';
    nuit_fuel.flowingLocation = 'contenttweaker:fluids/nuit_fuel';
    nuit_fuel.register();
}

registerMoltenMetal("fire", Color.fromHex("f8dcf8"));
VanillaFactory.createFluid("luminessence", Color.fromHex("faffb7")).register();

{//mesh
    var uranium_mesh = VanillaFactory.createItem("uranium_mesh");
    uranium_mesh.rarity = "rare";
    uranium_mesh.register();
    var weather_chrome_mesh = VanillaFactory.createItem("weather_chrome_mesh");
    weather_chrome_mesh.rarity = "epic";
    weather_chrome_mesh.register();
}
{//filter
    VanillaFactory.createItem("filter_empty").register();
    VanillaFactory.createItem("filter_charcoal").register();
    VanillaFactory.createItem("filter_solar").register();
    VanillaFactory.createItem("filter_blood").register();
}

{//components
    VanillaFactory.createItem("glass_hull").register();
    
    var greenhouse_lamps = VanillaFactory.createBlock("greenhouse_lamps", <blockmaterial:rock>);
    //greenhouse_lamps.setBlockLayer("TRANSLUCENT");
    greenhouse_lamps.setLightOpacity(0);
    //greenhouse_lamps.setTranslucent(true);
    greenhouse_lamps.setFullBlock(false);
    greenhouse_lamps.lightValue = 1;
    greenhouse_lamps.register();

    VanillaFactory.createItem("power_core_inactive").register();
    VanillaFactory.createItem("power_core_active").register();
    VanillaFactory.createItem("electric_stone_dust").register();

    VanillaFactory.createItem("rotor_blades").register();

    VanillaFactory.createItem("plant_sample").register();

    VanillaFactory.createItem("mekanical_core").register();
    VanillaFactory.createItem("power_tap_empty").register();
    VanillaFactory.createItem("power_tap").register();

    VanillaFactory.createItem("gearbox_empty").register();
    VanillaFactory.createItem("gearbox_normal").register();
    VanillaFactory.createItem("gearbox_funky").register();
    VanillaFactory.createItem("gearbox_good").register();
    VanillaFactory.createItem("gearbox_great").register();

    VanillaFactory.createFluid("mekanized_lubricant", Color.fromHex("5c0056")).register();

    

    VanillaFactory.createItem("fine_wooden_board").register();
    VanillaFactory.createItem("soggy_wooden_board").register();
    VanillaFactory.createItem("wired_wooden_board").register();
    VanillaFactory.createItem("advanced_circuit_plate_base").register();
    VanillaFactory.createItem("advanced_circuit_plate").register();

    VanillaFactory.createItem("compact_empowerer").register();

    VanillaFactory.createItem("creeper_component").register();
    VanillaFactory.createItem("explosion_device").register();
    VanillaFactory.createItem("explosion_device_full").register();

    VanillaFactory.createItem("soul_codex1").register();
    VanillaFactory.createItem("soul_codex2").register();
    VanillaFactory.createItem("soul_codex3").register();
    VanillaFactory.createItem("soul_codex4").register();
    VanillaFactory.createItem("soul_codex5").register();
    VanillaFactory.createItem("soul_codex6").register();
    VanillaFactory.createItem("soul_codex7").register();
    var sc8 = VanillaFactory.createItem("soul_codex8");
    sc8.glowing = true;
    sc8.rarity = "rare";
    sc8.register();

    VanillaFactory.createItem("super_vibrant_plate").register();

    VanillaFactory.createItem("robot_arm").register();
    VanillaFactory.createItem("bio_injector").register();
    VanillaFactory.createItem("sewing_unit").register();

    VanillaFactory.createItem("lens_in").register();
    VanillaFactory.createItem("lens_out").register();

    VanillaFactory.createItem("tank").register();
    VanillaFactory.createItem("tank2").register();
    VanillaFactory.createItem("tank_oxygen").register();
    VanillaFactory.createItem("tank_nitrogen").register();
    VanillaFactory.createItem("tank_nitrogen_dense").register();
    VanillaFactory.createItem("crucible").register();

    VanillaFactory.createItem("pump").register();
    VanillaFactory.createItem("cooling_system").register();

    VanillaFactory.createItem("pressure_cutter").register();
    VanillaFactory.createItem("laser").register();

    VanillaFactory.createItem("rtg").register();
    VanillaFactory.createItem("rtg2").register();
    VanillaFactory.createItem("nuke").register();
    VanillaFactory.createItem("rocket_engine").register();

    VanillaFactory.createItem("pulse_generator").register();
    VanillaFactory.createItem("signal_reciever").register();

    var stomper = VanillaFactory.createBlock("stomper", <blockmaterial:rock>);
    stomper.setBlockLayer("TRANSLUCENT");
    stomper.setLightOpacity(0);
    stomper.setTranslucent(true);
    stomper.setFullBlock(false);
    stomper.register();

    {//satellites
        
        VanillaFactory.createItem("satellite_plating_base1").register();
        VanillaFactory.createItem("satellite_plating_base2").register();
        VanillaFactory.createItem("satellite_plating").register();
        VanillaFactory.createItem("satellite_plating2").register();

        VanillaFactory.createItem("satellite1").register();
        VanillaFactory.createItem("satellite2").register();
        VanillaFactory.createItem("satellite3").register();

        VanillaFactory.createItem("satellite_chip").register();
        VanillaFactory.createItem("satellite_computer").register();

        VanillaFactory.createItem("drone_base").register();
        VanillaFactory.createItem("drone").register();

        VanillaFactory.createItem("crawler").register();
        VanillaFactory.createItem("webbing_unit").register();

        VanillaFactory.createItem("neutronium_mirror").register();
        VanillaFactory.createItem("neutronium_mirror2").register();

        VanillaFactory.createItem("space_navigator").register();

        VanillaFactory.createItem("rocket_engine2").register();

        VanillaFactory.createFluid("hydrogen_mix", Color.fromHex("13224c")).register();
        addWater("dense_hydrogen");
    }

    VanillaFactory.createItem("moon_dust").register();
    addWater("data");

    VanillaFactory.createItem("entangled_particles").register();
    VanillaFactory.createItem("entangled_matter_a").register();
    VanillaFactory.createItem("entangled_matter_b").register();

    
    VanillaFactory.createItem("prism").register();
    VanillaFactory.createItem("information_crystal").register();

    VanillaFactory.createItem("circuit1").register();
    VanillaFactory.createItem("circuit2").register();
    VanillaFactory.createItem("circuit3").register();
}


{//singularity
    var singularity_dust = VanillaFactory.createItem("singularity_dust");
    singularity_dust.setRarity("epic");
    singularity_dust.register();
    var meta_singularity = VanillaFactory.createItem("meta_singularity");
    meta_singularity.setRarity("epic");
    meta_singularity.register();
    VanillaFactory.createItem("mushroomite_singularity").register();
    VanillaFactory.createItem("mana_dust_singularity").register();
    VanillaFactory.createItem("fiery_singularity").register();
    VanillaFactory.createItem("evil_singularity").register();
    VanillaFactory.createItem("neodymium_singularity").register();
    VanillaFactory.createItem("solar_silicon_singularity").register();
    VanillaFactory.createItem("neuro_singularity").register();
    VanillaFactory.createItem("neutronium_singularity").register();
}


{//biomess
    VanillaFactory.createItem("activated_biopower").register();
    VanillaFactory.createItem("ashen_biocoal").register();
    VanillaFactory.createItem("biocoal").register();
    VanillaFactory.createItem("biomix").register();
    VanillaFactory.createItem("bioslag").register();
    VanillaFactory.createItem("coaled_bioash").register();
    VanillaFactory.createItem("coaled_biocoal").register();
    VanillaFactory.createItem("empowered_biospice").register();
    VanillaFactory.createItem("enmaned_biomass").register();
    VanillaFactory.createItem("enriched_biocoal").register();
    VanillaFactory.createItem("enriched_bioslag").register();
    VanillaFactory.createItem("enspiced_spicy_bioblend").register();
    VanillaFactory.createItem("spicy_bioblend").register();
    VanillaFactory.createItem("spicy_enriched_bioblend").register();
    VanillaFactory.createItem("whitened_biomass").register();
}

function add_mech_part(name as string){
        var mech_part = VanillaFactory.createItem(name);
        mech_part.maxStackSize = 16;
        mech_part.rarity = "rare";
        mech_part.register();
}
{//mechs
    
    {//mech plates
        VanillaFactory.createItem("advanced_plating1_1").register();
        VanillaFactory.createItem("advanced_plating1_2").register();
        VanillaFactory.createItem("advanced_plating1_3").register();
        VanillaFactory.createItem("advanced_plating1_4").register();
        VanillaFactory.createItem("advanced_plating1_5").register();

        VanillaFactory.createItem("tincan_target_ore1").register();
        VanillaFactory.createItem("tincan_target_ore2").register();
        VanillaFactory.createItem("tincan_target_gem").register();
        VanillaFactory.createItem("tincan_target_mob").register();

        var irradiated_compound = VanillaFactory.createItem("irradiated_compound");
        irradiated_compound.rarity = "rare";
        irradiated_compound.onItemUpdate = function(itemStack, world, owner, slot, isSelected) {
            if (owner instanceof IPlayer) {
                val player as IPlayer = owner;
                Commands.call("effect @p minecraft:poison 2 2 true", player, world, false, true);
                Commands.call("effect @p minecraft:nausea 5 1 true", player, world, false, true);
            }
            return;
        };
        irradiated_compound.register();
        var banana = VanillaFactory.createItem("banana");
        banana.rarity = "rare";
        banana.onItemUpdate = function(itemStack, world, owner, slot, isSelected) {
            if (owner instanceof IPlayer) {
                val player as IPlayer = owner;
                Commands.call("effect @p minecraft:poison 2 2 true", player, world, false, true);
                Commands.call("effect @p minecraft:nausea 5 1 true", player, world, false, true);
            }
            return;
        };
        banana.register();

        VanillaFactory.createItem("advanced_plating2_1").register();
        VanillaFactory.createItem("advanced_plating2_2").register();
        VanillaFactory.createItem("advanced_plating2_3").register();
        VanillaFactory.createItem("advanced_plating2_4").register();

        VanillaFactory.createItem("nether_boat_plating").register();

        VanillaFactory.createItem("nether_boat_osram").register();
        VanillaFactory.createItem("nether_boat_ores").register();
        VanillaFactory.createItem("nether_boat_quartz").register();

        
        VanillaFactory.createItem("robodruid_plating1").register();
        VanillaFactory.createItem("robodruid_plating2").register();
        VanillaFactory.createItem("robodruid_plating3").register();

        VanillaFactory.createItem("robodruid_target_gems").register();
        VanillaFactory.createItem("robodruid_target_wood").register();
        VanillaFactory.createItem("robodruid_target_metal").register();

        VanillaFactory.createItem("advanced_plating3_1").register();
        VanillaFactory.createItem("advanced_plating3_2").register();
        VanillaFactory.createItem("advanced_plating3_3").register();
        VanillaFactory.createItem("advanced_plating3_4").register();
        var ap3_5 = VanillaFactory.createItem("advanced_plating3_5");
        ap3_5.glowing = true;
        ap3_5.register();

        VanillaFactory.createItem("goldscarab_target_ore").register();
        VanillaFactory.createItem("goldscarab_target_shard").register();
        VanillaFactory.createItem("goldscarab_target_water").register();
        VanillaFactory.createItem("goldscarab_target_oil").register();

        VanillaFactory.createItem("advanced_plating4_1").register();
        VanillaFactory.createItem("advanced_plating4_2").register();
        VanillaFactory.createItem("advanced_plating4_3").register();
        VanillaFactory.createItem("advanced_plating4_4").register();

        VanillaFactory.createItem("advanced_plating5_1").register();
        VanillaFactory.createItem("advanced_plating5_2").register();
        VanillaFactory.createItem("advanced_plating5_3").register();
        VanillaFactory.createItem("advanced_plating5_4").register();
        VanillaFactory.createItem("advanced_plating5_5").register();

        VanillaFactory.createItem("bloodhunter_target_blood").register();
        VanillaFactory.createItem("bloodhunter_target_slate").register();
        VanillaFactory.createItem("bloodhunter_target_fairy").register();
        VanillaFactory.createItem("bloodhunter_target_wither").register();

        VanillaFactory.createItem("mute_eye").register();
        VanillaFactory.createItem("eye").register();
        VanillaFactory.createItem("mechanical_eye").register();

        VanillaFactory.createItem("robot_brain").register();
    }
    VanillaFactory.createItem("flight_computer").register();
    VanillaFactory.createItem("mech_taxi_wing").register();
    VanillaFactory.createItem("mech_taxi").register();

    VanillaFactory.createItem("mech_taxi2").register();
    VanillaFactory.createItem("mech_taxi3").register();
    VanillaFactory.createItem("mech_taxi4").register();

    VanillaFactory.createItem("empowered_shard").register();
    VanillaFactory.createFluid("dense_steam", Color.fromHex("dedede")).register();
    addWater("empowered_steam");


    add_mech_part("stone_idol");

    {//mech parts
        add_mech_part("tincan_sawhand");
        add_mech_part("tincan_drillhand");
        add_mech_part("tincan_legs");
        add_mech_part("tincan_body");
        add_mech_part("tincan_head");
        add_mech_part("tincan_mech");

        add_mech_part("radiotoad_arm");
        add_mech_part("radiotoad_legs");
        add_mech_part("radiotoad_body");
        add_mech_part("radiotoad_head");
        add_mech_part("radiotoad_mech");

        add_mech_part("nether_boat");

        add_mech_part("robodruid_arm");
        add_mech_part("robodruid_leg");
        add_mech_part("robodruid_body");
        add_mech_part("robodruid_head");
        add_mech_part("robodruid_mech");

        add_mech_part("goldscarab_arm");
        add_mech_part("goldscarab_leg");
        add_mech_part("goldscarab_body");
        add_mech_part("goldscarab_head");
        add_mech_part("goldscarab_sun");
        add_mech_part("goldscarab_mech");

        add_mech_part("bloodhunter_arm");
        add_mech_part("bloodhunter_leg");
        add_mech_part("bloodhunter_body");
        add_mech_part("bloodhunter_head");
        add_mech_part("bloodhunter_mech");

        add_mech_part("skyfinder_leg");
        add_mech_part("skyfinder_body");
        add_mech_part("skyfinder_head");
        add_mech_part("skyfinder_mech");
    }
}


VanillaFactory.createItem("secure_switch").register();
{//wither
    var cursed_frame = VanillaFactory.createItem("cursed_frame");
    cursed_frame.glowing = true;
    cursed_frame.rarity = "rare";
    cursed_frame.register();
    var cursed_skull = VanillaFactory.createItem("cursed_skull");
    cursed_skull.glowing = true;
    cursed_skull.rarity = "rare";
    cursed_skull.register();

    

    var cursed_wither = VanillaFactory.createItem("cursed_wither");
    cursed_wither.glowing = true;
    cursed_wither.rarity = "rare";
    cursed_wither.onItemUpdate = function(itemStack, world, owner, slot, isSelected) {
        if (owner instanceof IPlayer) {
            val player as IPlayer = owner;

            Commands.call("effect @p minecraft:poison 5 3 true", player, world, false, true);
            Commands.call("effect @p minecraft:wither 5 2 true", player, world, false, true);
            player.setFire(5);
            Commands.call("effect @p minecraft:nausea 5 1 true", player, world, false, true);
            Commands.call("effect @p minecraft:hunger 5 3 true", player, world, false, true);

        }
        return;
    };
    cursed_wither.register();
    var cursed_star = VanillaFactory.createItem("cursed_star");
    cursed_star.glowing = true;
    cursed_star.rarity = "rare";
    cursed_star.onItemUpdate = function(itemStack, world, owner, slot, isSelected) {
        if (owner instanceof IPlayer) {
            val player as IPlayer = owner;

            Commands.call("effect @p minecraft:poison 5 2 true", player, world, false, true);
            Commands.call("effect @p minecraft:wither 5 1 true", player, world, false, true);
            player.setFire(4);
            Commands.call("effect @p minecraft:nausea 5 1 true", player, world, false, true);
            Commands.call("effect @p minecraft:hunger 5 1 true", player, world, false, true);

        }
        return;
    };
    cursed_star.register();
}


VanillaFactory.createItem("holy_thing").register();

function add_living(lname as string){
    var it = VanillaFactory.createItemFood(lname, 4);

    it.onItemFoodEaten = function(stack, world, player) {
            if (!world.isRemote())
                if (player) {
                    player.addPotionEffect(<potion:minecraft:poison>.makePotionEffect(20 * 15, 1));
                }
    };
    
    it.maxStackSize = 1;
    
    it.register();
}
function add_living_food(name as string, food as int, potions as IPotion[]){
    var it = VanillaFactory.createItemFood(name, food);

    it.register();
}
var knife = VanillaFactory.createItem("butcher_knife");
knife.maxStackSize = 1;
knife.maxDamage = 100;
knife.register();

{//bloods
    VanillaFactory.createFluid("worm_blood", Color.fromHex("7c9761")).register();
    VanillaFactory.createFluid("rot", Color.fromHex("4e2414")).register();
    VanillaFactory.createFluid("ender_blood", Color.fromHex("951ae0")).register();
    {//evil_blood
        var evil_blood = VanillaFactory.createFluid("evil_blood", Color.fromHex("ea6056"));
        evil_blood.material = <blockmaterial:water>;
        evil_blood.colorize = false;
        evil_blood.stillLocation = 'contenttweaker:fluids/evil_blood';
        evil_blood.flowingLocation = 'contenttweaker:fluids/evil_blood';
        evil_blood.register();
    }
    //VanillaFactory.createFluid("", Color.fromHex("")).register();
    //VanillaFactory.createFluid("", Color.fromHex("")).register();
    //VanillaFactory.createFluid("", Color.fromHex("")).register();
}

{//worm pit
    VanillaFactory.createItem("sandy_spice").register();
    //VanillaFactory.createItem("chewed_meat").register();
    var chewed_meat = VanillaFactory.createItemFood("chewed_meat", 6);
        chewed_meat.onItemFoodEaten = function(stack, world, player) {
            if (!world.isRemote())
                if (player) {
                    player.addPotionEffect(<potion:minecraft:hunger>.makePotionEffect(20 * 30, 1));
                }
        };

    chewed_meat.register();
    
    VanillaFactory.createItem("ancient_sandstone").register();
    VanillaFactory.createItem("fear").register();
    
    //VanillaFactory.createItem("gemmed_spice").register();
    {
        var gemmed_spice = VanillaFactory.createItemFood("gemmed_spice", 2);
        gemmed_spice.alwaysEdible = true;
        gemmed_spice.onItemFoodEaten = function(stack, world, player) {
            if (!world.isRemote())
                if (player) {
                    //player.addPotionEffect(<potion:minecraft:strength>.makePotionEffect(20 * 30, 1));
                    player.addPotionEffect(<potion:minecraft:speed>.makePotionEffect(20 * 30, 5));
                    //player.addPotionEffect(<potion:minecraft:resistance>.makePotionEffect(20 * 30, 1));
                    //player.addPotionEffect(<potion:minecraft:regeneration>.makePotionEffect(20 * 30, 1));
                }
        };

        gemmed_spice.register();
    }

    VanillaFactory.createItem("wormweave").register();
    VanillaFactory.createItemFood("wormium_ingot", 4).register();
    VanillaFactory.createBlock("wormium_block", <blockmaterial:rock>).register();

    VanillaFactory.createItem("wormholium").register();

    VanillaFactory.createItem("centipedium").register();

    VanillaFactory.createItem("sick_worm").register();
}


{//living

    add_living("lv_sandworm");
    VanillaFactory.createItem("sandworm_molt").register();

    add_living_food("sandworm_corpse", 4, [<potion:minecraft:poison>]);
    VanillaFactory.createItem("worm_feed").register();
    var worm_feed2 = VanillaFactory.createItem("worm_feed2");
    worm_feed2.glowing = true;
    worm_feed2.register();
    VanillaFactory.createItem("sandworm_gut").register();
    VanillaFactory.createItem("dry_fibre").register();
    VanillaFactory.createItem("sandworm_chitin").register();
    addWater("wormy_sand");
    addGlass2("worm_glass");

    add_living("lv_draco_lizard");
    VanillaFactory.createItemFood("draco_lizard_corpse", 4).register();
    VanillaFactory.createItem("draco_lizard_feed").register();
    VanillaFactory.createItem("draco_lizard_spit").register();
    VanillaFactory.createItemFood("draco_lizard_egg", 4).register();
    VanillaFactory.createItem("draco_lizard_shells").register();
    VanillaFactory.createFluid("lizard_spit", Color.fromHex("a83f8d")).register();
    VanillaFactory.createFluid("dragon_spit", Color.fromHex("d46293")).register();

    add_living("lv_bedrock_golem");

    add_living("lv_hair_thing");
    add_living_food("hair_ball", 1, [<potion:minecraft:poison>, <potion:minecraft:wither>]);
    add_living_food("hair_thing_corpse", 3, [<potion:minecraft:poison>, <potion:minecraft:wither>]);

    add_living("lv_baby_hair_thing");

    add_living("lv_zanite_frog");
    VanillaFactory.createItem("zanite_frog_feed").register();
    VanillaFactory.createItem("zanite_frog_leg").register();

    add_living("lv_blood_slime");

    add_living("spice_rabbit");
    add_living_food("spice_egg", 3, []);
}
var life = VanillaFactory.createItem("life");
life.setRarity("epic");
life.register();
var hyper_life = VanillaFactory.createItem("hyper_life");
hyper_life.setRarity("epic");
hyper_life.register();

{//sprook
    VanillaFactory.createItemFood("sprook1", 2).register();
    VanillaFactory.createItemFood("sprook2", 2).register();
    VanillaFactory.createItemFood("sprook3", 2).register();
    VanillaFactory.createItemFood("sprook4", 2).register();
    VanillaFactory.createItem("sprooks1").register();
    VanillaFactory.createItem("sprooks2").register();
    VanillaFactory.createItem("sprooks3").register();

    VanillaFactory.createBlock("sprook_wheel1", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("sprook_wheel2", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("sprook_wheel3", <blockmaterial:rock>).register();

    addWater("sprook_mush");
}

VanillaFactory.createItem("ophidian_extract").register();
VanillaFactory.createItem("soul_poison").register();

//ash line
//VanillaFactory.createItem("soaked_ash").register();
VanillaFactory.createFluid("ash_solution", Color.fromHex("a8a8a8")).register();

VanillaFactory.createItem("soot").register();

//chocoate
VanillaFactory.createFluid("chocolate", Color.fromHex("321c19")).register();

//diamond line
VanillaFactory.createItem("charcoal_ball").register();



//steeleaf
VanillaFactory.createItem("steeleaf_mush").register();

{//fertilizer
    VanillaFactory.createItem("fertilizer1").register();
    VanillaFactory.createItem("fertilizer2").register();
    VanillaFactory.createItem("fertilizer2_5").register();
    VanillaFactory.createItem("fertilizer3").register();
    VanillaFactory.createItem("fertilizer4").register();
    VanillaFactory.createItem("fertilizer4_5").register();
    VanillaFactory.createItem("fertilizer5").register();
    VanillaFactory.createItem("fertilizer6").register();
    VanillaFactory.createItem("fertilizer7").register();
}



//fluids
VanillaFactory.createFluid("sea_water", Color.fromHex("2c72c8")).register();
VanillaFactory.createFluid("seaweed_rich_water", Color.fromHex("1b8053")).register();

VanillaFactory.createFluid("nectar_solution", Color.fromHex("88856e")).register();
VanillaFactory.createFluid("corn_solution", Color.fromHex("e5de0a")).register();
VanillaFactory.createFluid("rich_corn_solution", Color.fromHex("787409")).register();

VanillaFactory.createFluid("pure_water", Color.fromHex("53b3d5")).register();
VanillaFactory.createFluid("ultrapure_water", Color.fromHex("8ed3e5")).register();
VanillaFactory.createItem("ion_beads").register();
VanillaFactory.createItem("ion_beads_spent").register();
VanillaFactory.createFluid("holy_water", Color.fromHex("eae4a9")).register();
{
    var holy_water2 = VanillaFactory.createFluid("holy_water2", Color.fromHex("ea6056"));
    holy_water2.colorize = false;
    holy_water2.stillLocation = 'contenttweaker:fluids/holy_water2';
    holy_water2.flowingLocation = 'contenttweaker:fluids/holy_water2';
    holy_water2.register();
}

VanillaFactory.createFluid("ore_drill", Color.fromHex("342e2e")).register();
VanillaFactory.createFluid("ore_make", Color.fromHex("9c7448")).register();
VanillaFactory.createFluid("ore_waste", Color.fromHex("071f07")).register();


registerMoltenMetal("ore_waste_ref1", Color.fromHex("ba301f"));
VanillaFactory.createFluid("ore_waste1", Color.fromHex("7d433b")).register();
registerMoltenMetal("ore_waste_ref2", Color.fromHex("9c1125"));
VanillaFactory.createFluid("ore_waste2", Color.fromHex("581c25")).register();
registerMoltenMetal("ore_waste_ref3", Color.fromHex("5e042b"));
VanillaFactory.createFluid("ore_waste3", Color.fromHex("340e1e")).register();

addWater("muddy_sludge");
addWater("radioactive_waste");

{//oil things
    VanillaFactory.createFluid("kerosene", Color.fromHex("874723")).register();
    
    registerMoltenMetal("tar", Color.fromHex("16131a"));
    registerMoltenMetal("enriched_tar", Color.fromHex("0c0a0f"));
    VanillaFactory.createFluid("enriched_diesel1", Color.fromHex("50192c")).register();
    registerMoltenMetal("enriched_diesel2", Color.fromHex("780e75"));

    VanillaFactory.createFluid("naphthalene", Color.fromHex("ac6533")).register();
    VanillaFactory.createFluid("concrete_reinforcer", Color.fromHex("635d6d")).register();

    VanillaFactory.createItem("ldpe").register();
}

VanillaFactory.createFluid("fertilizer", Color.fromHex("4e3a29")).register();


{//mob
    VanillaFactory.createItem("iron_heart").register();
    VanillaFactory.createItem("gold_slimeball").register();
    VanillaFactory.createItemFood("brain_slimeball", 1).register();

    VanillaFactory.createItem("bug_slimeball").register();

    VanillaFactory.createItem("witherite").register();
    VanillaFactory.createItem("awaken_witherite").register();

    VanillaFactory.createItem("illagerite").register();
    VanillaFactory.createItem("illagerite_dust").register();
    VanillaFactory.createFluid("illagerite", Color.fromHex("474b4b")).register();

    VanillaFactory.createItem("khnumite_heart").register();
    addLava("khnumite");

    VanillaFactory.createItem("druid_bone").register();
    VanillaFactory.createItem("lich_bone").register();
}
{//food
    //soy line
    VanillaFactory.createFluid("soy_extract", Color.fromHex("c5e0ca")).register();
    VanillaFactory.createFluid("soy_milk", Color.fromHex("e3efe5")).register();

    VanillaFactory.createFluid("grape_juice", Color.fromHex("9622a0")).register();
    VanillaFactory.createFluid("vinegar", Color.fromHex("582727")).register();

    //cheese
    var cheese = VanillaFactory.createFluid("cheese", Color.fromHex("f1ee50"));
    cheese.stillLocation = 'contenttweaker:fluids/cheese_still';
    cheese.flowingLocation = 'contenttweaker:fluids/cheese';
    cheese.register();

    //yeast
    VanillaFactory.createItem("yeast").register();
    VanillaFactory.createItem("yeast_rich").register();
    VanillaFactory.createFluid("sugary_solution", Color.fromHex("f3efdc")).register();
    VanillaFactory.createFluid("yeast", Color.fromHex("c1af4e")).register();
    VanillaFactory.createFluid("yeast_rich", Color.fromHex("635216")).register();

    //gummy
    VanillaFactory.createFluid("colagen_solution", Color.fromHex("745e43")).register();
    VanillaFactory.createFluid("impure_colagen", Color.fromHex("717a68")).register();
    VanillaFactory.createFluid("salty_colagen", Color.fromHex("717a68")).register();
    VanillaFactory.createFluid("colagen", Color.fromHex("6da6a0")).register();
    VanillaFactory.createItem("gelatin_noodle").register();
    VanillaFactory.createItem("gelatin").register();

    //msg
    VanillaFactory.createFluid("glutamic_acid", Color.fromHex("bd3ca0")).register();
    VanillaFactory.createItem("msg").register();
}
{//plant 'n stuff
    VanillaFactory.createBlock("potato_block1", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("potato_block2", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("potato_block3", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("potato_block4", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("potato_block5", <blockmaterial:rock>).register();
    
    //nether eye
    VanillaFactory.createItem("flowering_nether_eye").register();
    VanillaFactory.createItem("flower_nether_eye").register();
    VanillaFactory.createItemFood("primitive_eyes", 2).register();

    VanillaFactory.createFluid("glowshroom_stew", Color.fromHex("00ffff")).register();
    VanillaFactory.createItem("bamboo_dust").register();
    VanillaFactory.createItem("bamboo_dough").register();
    VanillaFactory.createItemFood("bamboo_cookie", 2).register();

    VanillaFactory.createFluid("amaranth_juice", Color.fromHex("8e3885")).register();
    VanillaFactory.createFluid("amethesting", Color.fromHex("8e3885")).register();

    VanillaFactory.createItem("enbiotic").register();

    VanillaFactory.createFluid("coffee", Color.fromHex("825116")).register();
    VanillaFactory.createFluid("caffeine", Color.fromHex("330f05")).register();

    VanillaFactory.createItem("activated_green_fish").register();

    VanillaFactory.createItem("coral_dust").register();
    VanillaFactory.createItem("terra_coral").register();

    VanillaFactory.createItem("pectin").register();
    VanillaFactory.createFluid("tamarind_juice", Color.fromHex("c7b08a")).register();
    VanillaFactory.createFluid("tartaric_acid", Color.fromHex("c1b298")).register();
    
    VanillaFactory.createItem("wine_diamond").register();
    VanillaFactory.createItem("wine_diamond_cluster").register();
}
{//vitamins
    //hexane
    VanillaFactory.createFluid("ethylbenzene", Color.fromHex("496315")).register();

    VanillaFactory.createItem("bacteria").register();
    VanillaFactory.createItem("ender_bacteria").register();
    VanillaFactory.createItem("alien_bacteria").register();
    VanillaFactory.createFluid("bacteria_broth", Color.fromHex("0d3613")).register();
    VanillaFactory.createFluid("ender_bacteria_broth", Color.fromHex("9c32d7")).register();
    addWater("alien_polymer");

    //vitamin a
    VanillaFactory.createItem("carrot_pulp").register();
    VanillaFactory.createFluid("carotene_solution", Color.fromHex("6b940d")).register();
    VanillaFactory.createItem("impure_carotene").register();
    VanillaFactory.createItem("carotene").register();
    VanillaFactory.createFluid("carotene", Color.fromHex("c8620c")).register();
    VanillaFactory.createItem("vitamin_a").register();
    //vitamin b
    VanillaFactory.createFluid("fermented_bacteria_broth", Color.fromHex("202e11")).register();
    VanillaFactory.createFluid("cobalamin", Color.fromHex("f32525")).register();
    VanillaFactory.createItem("vitamin_b").register();
    //vitamin c
    VanillaFactory.createItem("starch").register();
    VanillaFactory.createItem("glucose").register();
    VanillaFactory.createFluid("glucose", Color.fromHex("eae8e8")).register();
    VanillaFactory.createFluid("sorbitol", Color.fromHex("eacfcf")).register();
    VanillaFactory.createFluid("sorbose", Color.fromHex("e5b5b5")).register();
    VanillaFactory.createFluid("gulonic_acid", Color.fromHex("c0b028")).register();
    VanillaFactory.createItem("vitamin_c").register();

    //VanillaFactory.createItem("vitamins").register();
    var vitamins = VanillaFactory.createItemFood("vitamins", 6);
        vitamins.alwaysEdible = true;
        vitamins.onItemFoodEaten = function(stack, world, player) {
            if (!world.isRemote())
                if (player) {
                    player.addPotionEffect(<potion:minecraft:regeneration>.makePotionEffect(20 * 30, 1));
                }
        };

    vitamins.register();
}

VanillaFactory.createFluid("bacteria_waste", Color.fromHex("0b241b")).register();



{//glass fiber
    VanillaFactory.createItem("fluospar").register();
    VanillaFactory.createItem("fluospar_dust").register();

    VanillaFactory.createItem("glass_fiber_materials").register();

    VanillaFactory.createFluid("glass_fiber_mixture", Color.fromHex("878fa2")).register();
    VanillaFactory.createItem("glass_fiber_clump").register();
    VanillaFactory.createItem("glass_fiber").register();
    VanillaFactory.createItem("glass_cloth").register();

    VanillaFactory.createItem("layered_glass").register();
    VanillaFactory.createItem("perfect_mirror").register();
    VanillaFactory.createItem("perfect_mirror_array").register();
}

VanillaFactory.createItem("gem_catalyst").register();
VanillaFactory.createItem("ore_catalyst").register();

VanillaFactory.createItem("flesh_bits").register();



VanillaFactory.createItem("flesh_piece").register();
VanillaFactory.createItem("flesh_spurt").register();
VanillaFactory.createItem("flesh_rod").register();
VanillaFactory.createItem("flesh_support").register();
VanillaFactory.createItem("flesh_spurt_activated").register();






{//air lines
    VanillaFactory.createFluid("ow_air", Color.fromHex("9ae6ef")).register();
    VanillaFactory.createFluid("nether_air", Color.fromHex("cbbb3c")).register();
    VanillaFactory.createFluid("end_air", Color.fromHex("af73b6")).register();
    VanillaFactory.createFluid("erebus_air", Color.fromHex("5c8d60")).register();
    VanillaFactory.createFluid("atum_air", Color.fromHex("aca964")).register();
    VanillaFactory.createFluid("twilight_air", Color.fromHex("334435")).register();
    VanillaFactory.createFluid("aether_air", Color.fromHex("6ee5e1")).register();

    //ow
    VanillaFactory.createFluid("noble_gases", Color.fromHex("65abe0")).register();
    VanillaFactory.createItem("noble_gases_ingot").register();
    //erebus
    VanillaFactory.createFluid("pheromones", Color.fromHex("a741a7")).register();
    VanillaFactory.createFluid("refined_pheromones", Color.fromHex("572572")).register();
    
    {
        var insecticide = VanillaFactory.createFluid("insecticide", Color.fromHex("ea6056"));
        insecticide.colorize = false;
        insecticide.stillLocation = 'contenttweaker:fluids/insecticide';
        insecticide.flowingLocation = 'contenttweaker:fluids/insecticide';
        insecticide.register();
    }
    
    //nether
    registerMoltenMetal("lava_residue", Color.fromHex("493b2f"));
    
}

{//lava 2
    //registerMoltenMetal("high_heat_lava", Color.fromHex("ea6056"));
    var high_heat_lava = VanillaFactory.createFluid("high_heat_lava", Color.fromHex("ea6056"));
    high_heat_lava.material = <blockmaterial:lava>;
    high_heat_lava.colorize = false;
    high_heat_lava.stillLocation = 'contenttweaker:fluids/high_heat_lava_still';
    high_heat_lava.flowingLocation = 'contenttweaker:fluids/high_heat_lava_flow';
    high_heat_lava.register();
    //registerMoltenMetal("super_heat_lava", Color.fromHex("fa1100"));
    var super_heat_lava = VanillaFactory.createFluid("super_heat_lava", Color.fromHex("fa1100"));
    super_heat_lava.material = <blockmaterial:lava>;
    super_heat_lava.colorize = false;
    super_heat_lava.stillLocation = 'contenttweaker:fluids/super_heat_lava_still';
    super_heat_lava.flowingLocation = 'contenttweaker:fluids/super_heat_lava_flow';
    super_heat_lava.register();
}

VanillaFactory.createItemFood("food_pellet", 40).register();

{//glue
    VanillaFactory.createItem("nacn").register();
    VanillaFactory.createItem("superglue").register();
}
{//indium
    registerMoltenMetal("indium_mixture", Color.fromHex("6a3f82"));
    VanillaFactory.createItem("indium_mixture").register();
    VanillaFactory.createItem("indium_oxides").register();

    VanillaFactory.createFluid("indium_leach", Color.fromHex("715382")).register();
    VanillaFactory.createFluid("indium_salty", Color.fromHex("5c2c78")).register();

    VanillaFactory.createFluid("indium_hydroxide", Color.fromHex("6f398d")).register();

    VanillaFactory.createItem("indium_oxide").register();
    VanillaFactory.createItem("indium_dust").register();

    VanillaFactory.createItem("layered_boule").register();
    VanillaFactory.createItem("layered_wafer").register();
    VanillaFactory.createItem("layered_circuit").register();
    VanillaFactory.createItem("layered_processor").register();
}

VanillaFactory.createItem("honeyspice_ingot").register();

{//early game
    VanillaFactory.createItem("sticky_bucket").register();
    VanillaFactory.createFluid("sticky_water", Color.fromHex("3dcf8c")).register();
    VanillaFactory.createFluid("rotten_slime", Color.fromHex("4c6a13")).register();

    VanillaFactory.createBlock("burned_slimedirt", <blockmaterial:rock>).register();
    var slimy_sand = VanillaFactory.createBlock("slimy_sand", <blockmaterial:clay>);
    slimy_sand.setToolClass("shovel");
    slimy_sand.setBlockSoundType(<soundtype:ground>);
    slimy_sand.register();

    addGlass("slimy_glass");

    var dried_gravel = VanillaFactory.createBlock("dried_gravel", <blockmaterial:clay>);
    dried_gravel.setToolClass("shovel");
    dried_gravel.setBlockSoundType(<soundtype:ground>);
    dried_gravel.register();


    VanillaFactory.createItem("fire_shard").register();
    VanillaFactory.createItem("slime_shard").register();

    VanillaFactory.createItem("simple_motor").register();

    VanillaFactory.createItem("weak_enhancer").register();

    registerMoltenMetal("andesite", Color.fromHex("53534c"));
}
{//roots
    VanillaFactory.createItem("burn_powder").register();

    VanillaFactory.createItem("forest_clay").register();
    //VanillaFactory.createBlock("forest_clay_block", <blockmaterial:rock>).register();
    var forest_clay_block = VanillaFactory.createBlock("forest_clay_block", <blockmaterial:clay>);
    forest_clay_block.setToolClass("shovel");
    forest_clay_block.setBlockSoundType(<soundtype:ground>);
    forest_clay_block.register();

    VanillaFactory.createItem("organic_glue").register();
    

    VanillaFactory.createItem("wildwood_pulp").register();
    VanillaFactory.createItem("steelwood_ingot").register();
    VanillaFactory.createItem("duraluminumwood_ingot").register();
    {
        var pereskia_soup = VanillaFactory.createItemFood("pereskia_soup", 8);
        pereskia_soup.alwaysEdible = true;
        pereskia_soup.onItemFoodEaten = function(stack, world, player) {
            if (!world.isRemote())
                if (player) {
                    player.addPotionEffect(<potion:minecraft:strength>.makePotionEffect(20 * 30, 1));
                    player.addPotionEffect(<potion:minecraft:speed>.makePotionEffect(20 * 30, 1));
                    player.addPotionEffect(<potion:minecraft:resistance>.makePotionEffect(20 * 30, 1));
                    player.addPotionEffect(<potion:minecraft:regeneration>.makePotionEffect(20 * 30, 1));
                }
        };

        pereskia_soup.register();
    }

    {//leaves
        var leaves_vanilla = VanillaFactory.createBlock("leaves_vanilla", <blockmaterial:rock>);
        leaves_vanilla.setToolClass("axe");
        leaves_vanilla.register();
        var leaves_twilight = VanillaFactory.createBlock("leaves_twilight", <blockmaterial:rock>);
        leaves_twilight.setToolClass("axe");
        leaves_twilight.register();
        var leaves_erebus = VanillaFactory.createBlock("leaves_erebus", <blockmaterial:rock>);
        leaves_erebus.setToolClass("axe");
        leaves_erebus.register();
        var leaves_crystal = VanillaFactory.createBlock("leaves_crystal", <blockmaterial:rock>);
        leaves_crystal.setToolClass("axe");
        leaves_crystal.register();
        
    }

    VanillaFactory.createItem("druidic_dust").register();
    VanillaFactory.createItem("entwood").register();
    VanillaFactory.createItemFood("entwood_dust", 8).register();
    var entwood_block = VanillaFactory.createBlock("entwood_block", <blockmaterial:rock>);
    entwood_block.setToolClass("axe");
    //entwood_block.setBlockSoundType(<soundtype:ground>);
    entwood_block.register();

    VanillaFactory.createItem("transmut_gel").register();
    VanillaFactory.createItem("elemental_reduction").register();
    


    

    VanillaFactory.createItem("runewood").register();//todo evilwood?
    VanillaFactory.createItem("runewood_enchanted").register();

    VanillaFactory.createItem("runewood_rune1").register();
    VanillaFactory.createItem("runewood_rune2").register();
    VanillaFactory.createItem("runewood_rune3").register();

    VanillaFactory.createItem("ancient_wood").register();

    
    VanillaFactory.createBlock("divine_mud", <blockmaterial:rock>).register();

    {//pereskia_soup
        var pereskia_soup = VanillaFactory.createFluid("pereskia_soup", Color.fromHex("ea6056"));
        pereskia_soup.material = <blockmaterial:water>;
        pereskia_soup.colorize = false;
        pereskia_soup.stillLocation = 'contenttweaker:fluids/pereskia_soup';
        pereskia_soup.flowingLocation = 'contenttweaker:fluids/pereskia_soup';
        pereskia_soup.register();
    }
    {//druid_soup
        var druid_soup = VanillaFactory.createFluid("druid_soup", Color.fromHex("ea6056"));
        druid_soup.material = <blockmaterial:water>;
        druid_soup.colorize = false;
        druid_soup.stillLocation = 'contenttweaker:fluids/druid_soup';
        druid_soup.flowingLocation = 'contenttweaker:fluids/druid_soup';
        druid_soup.register();
    }

    VanillaFactory.createItem("bonsai_sapling").register();
    VanillaFactory.createItem("bonsai_mushroom_brown").register();
    VanillaFactory.createItem("bonsai_mushroom_red").register();
    VanillaFactory.createItem("bonsai_baffle_cap").register();
    VanillaFactory.createItem("sus_sapling").register();

    VanillaFactory.createItem("nether_pest").register();
    add_living("nitrall");
    VanillaFactory.createItem("nitrall_feed").register();
    VanillaFactory.createItem("dry_dewgonia").register();

    var forest_fire = VanillaFactory.createBlock("forest_fire", <blockmaterial:rock>);
    forest_fire.setFullBlock(false);
    forest_fire.setPassable(true);
    forest_fire.setBlockLayer("TRANSLUCENT");
    forest_fire.setLightOpacity(0);
    forest_fire.setTranslucent(true);
    forest_fire.register();
}
{//prodigy tech
    VanillaFactory.createBlock("ferramic_gravel", <blockmaterial:rock>).register();

    VanillaFactory.createItem("pt_crude_chip").register();
    VanillaFactory.createItem("pt_refined_chip").register();

    VanillaFactory.createItem("bocuit").register();

    VanillaFactory.createItem("hot_energion").register();

    VanillaFactory.createItem("pilkeum").register();
    add_living("pilkon");
    VanillaFactory.createItem("pilkon_corpse").register();
    VanillaFactory.createFluid("pilkon_blood", Color.fromHex("e59797")).register();
    registerMoltenMetal("andesite_magma", Color.fromHex("9d603c"));

    VanillaFactory.createFluid("organic_green", Color.fromHex("83a854")).register();

    VanillaFactory.createItem("uu_base1").register();
    VanillaFactory.createItem("uu_base2").register();
    VanillaFactory.createItem("uu_base3").register();

    VanillaFactory.createItem("zorra_steel_gem").register();
}
{//immers
    VanillaFactory.createFluid("fish_oil", Color.fromHex("a3925a")).register();

    VanillaFactory.createItem("cactus_charcoal").register();
    VanillaFactory.createItem("cacti_foci").register();
    VanillaFactory.createItem("fungi_cacti_foci").register();

    VanillaFactory.createItem("glowcrystal").register();
    VanillaFactory.createItem("diode1").register();
    VanillaFactory.createItem("diode2").register();
    VanillaFactory.createItemFood("fishy_capacitor", 4).register();

    VanillaFactory.createItem("tube_processor").register();
    VanillaFactory.createItem("tube_computer").register();

    VanillaFactory.createItem("creosolon").register();
    VanillaFactory.createItem("creosolon_frame").register();
    VanillaFactory.createItem("machine_frame_frame").register();
    VanillaFactory.createFluid("grease", Color.fromHex("bdbb35")).register();
}
{//erebus  
    VanillaFactory.createItem("formic_acid_dust").register();
    VanillaFactory.createItem("formic_acid_form").register();

    {//bughill
        var bugs = VanillaFactory.createFluid("bugs", Color.fromHex("ea6056"));
        bugs.colorize = false;
        bugs.stillLocation = 'contenttweaker:fluids/bugs';
        bugs.flowingLocation = 'contenttweaker:fluids/bugs';
        bugs.register();

        var bug_hill_exit1 = VanillaFactory.createBlock("bug_hill_exit1", <blockmaterial:rock>);
        bug_hill_exit1.setBlockLayer("TRANSLUCENT");
        bug_hill_exit1.setLightOpacity(0);
        bug_hill_exit1.setTranslucent(true);
        bug_hill_exit1.setFullBlock(false);
        bug_hill_exit1.register();

        var bug_hill_exit2 = VanillaFactory.createBlock("bug_hill_exit2", <blockmaterial:rock>);
        bug_hill_exit2.setBlockLayer("TRANSLUCENT");
        bug_hill_exit2.setLightOpacity(0);
        bug_hill_exit2.setTranslucent(true);
        bug_hill_exit2.setFullBlock(false);
        bug_hill_exit2.register();

        var bug_hill_exit3 = VanillaFactory.createBlock("bug_hill_exit3", <blockmaterial:rock>);
        bug_hill_exit3.setBlockLayer("TRANSLUCENT");
        bug_hill_exit3.setLightOpacity(0);
        bug_hill_exit3.setTranslucent(true);
        bug_hill_exit3.setFullBlock(false);
        bug_hill_exit3.register();
    }
    
    {//bughill fuels
        
    }

    addWater("claymud");
    addWater("chocolate_mud");
}
{//extra u
    var flolit_ore = VanillaFactory.createBlock("flolit_ore", <blockmaterial:rock>);
    flolit_ore.setFullBlock(true);
    flolit_ore.register();
    VanillaFactory.createItemFood("flolit", 5).register();
    VanillaFactory.createItem("flolit_plant").register();
    VanillaFactory.createItem("flolit_dust").register();
    VanillaFactory.createItem("flolit_sheet").register();

    VanillaFactory.createFluid("flolit_water", Color.fromHex("d7aaed")).register();

    var malachite_glue = VanillaFactory.createFluid("malachite_glue", Color.fromHex("4f7f50"));
    malachite_glue.material = <blockmaterial:water>;
    malachite_glue.colorize = false;
    malachite_glue.stillLocation = 'contenttweaker:fluids/malachite_glue_still';
    malachite_glue.flowingLocation = 'contenttweaker:fluids/malachite_glue_flow';
    malachite_glue.register();
    //VanillaFactory.createFluid(").register();

    

    VanillaFactory.createItem("compound_metal_stack").register();
    VanillaFactory.createItem("compound_metal").register();
    VanillaFactory.createItem("compound_metal2").register();
    VanillaFactory.createItem("watertight_lead_plate").register();
}
{//thermal
    VanillaFactory.createItem("excited_powder").register();
    var excited_mud = VanillaFactory.createBlock("excited_mud", <blockmaterial:clay>);
    excited_mud.setToolClass("shovel");
    excited_mud.setBlockSoundType(<soundtype:ground>);
    excited_mud.register();
    VanillaFactory.createItem("excited_crop").register();
    VanillaFactory.createItem("sanded_rod").register();
}
{//atum
    VanillaFactory.createItem("ra_burner").register();

    VanillaFactory.createItem("desert_pollen").register();
    VanillaFactory.createFluid("air_gold", Color.fromHex("f5f0ba")).register();
    VanillaFactory.createFluid("air_gold2", Color.fromHex("ea9b0e")).register();
    VanillaFactory.createFluid("desert_water", Color.fromHex("30553c")).register();
    {//desert soup
        var desert_soup = VanillaFactory.createFluid("desert_soup", Color.fromHex("ea6056"));
        desert_soup.material = <blockmaterial:water>;
        desert_soup.colorize = false;
        desert_soup.stillLocation = 'contenttweaker:fluids/desert_soup';
        desert_soup.flowingLocation = 'contenttweaker:fluids/desert_soup';
        desert_soup.register();
    }
    VanillaFactory.createItem("evil_desert_dust").register();
}
{//ae2
    VanillaFactory.createItem("ae2_chip_core").register();

    {//circuits and processors
        VanillaFactory.createItem("redstone_inlay").register();
        VanillaFactory.createItem("neuron_inlay").register();
        VanillaFactory.createItem("neuron2_inlay").register();

        //t1
        VanillaFactory.createItem("fluid_circuit").register();
        VanillaFactory.createItem("fluid_processor").register();
        VanillaFactory.createItem("gas_circuit").register();
        VanillaFactory.createItem("gas_processor").register();

        //t2
        VanillaFactory.createItem("fiery_circuit").register();
        VanillaFactory.createItem("fiery_processor").register();
        VanillaFactory.createItem("enderium_circuit").register();
        VanillaFactory.createItem("enderium_processor").register();
        VanillaFactory.createItem("osgloridium_circuit").register();
        VanillaFactory.createItem("osgloridium_processor").register();
        VanillaFactory.createItem("fluxed_circuit").register();
        VanillaFactory.createItem("fluxed_processor").register();
        
        //t3
        VanillaFactory.createItem("cursed_circuit").register();
        VanillaFactory.createItem("cursed_processor").register();
        VanillaFactory.createItem("potion_circuit").register();
        VanillaFactory.createItem("potion_processor").register();
        VanillaFactory.createItem("palladium_circuit").register();
        VanillaFactory.createItem("palladium_processor").register();
        VanillaFactory.createItem("peridotite_circuit").register();
        VanillaFactory.createItem("peridotite_processor").register();
        
        //t4
        VanillaFactory.createItem("living_circuit").register();
        VanillaFactory.createItem("living_processor").register();
        VanillaFactory.createItem("gambrosium_circuit").register();
        VanillaFactory.createItem("gambrosium_processor").register();
        
        
        
        VanillaFactory.createItem("elementium_circuit").register();
        VanillaFactory.createItem("elementium_processor").register();
    }
}
{//meka
    VanillaFactory.createItem("dark_shard").register();
    VanillaFactory.createFluid("blackish_slurp", Color.fromHex("202020")).register();
    VanillaFactory.createFluid("black_slurp", Color.fromHex("000000")).register();

    VanillaFactory.createItem("emolachite").register();
    VanillaFactory.createFluid("emolachite", Color.fromHex("16804c")).register();

    VanillaFactory.createItem("supersalt").register();

    var tar_light = VanillaFactory.createBlock("tar_light", <blockmaterial:rock>);
    //tar_light.setFullBlock(false);
    //tar_light.setPassable(true);
    //tar_light.setBlockLayer("TRANSLUCENT");
    //tar_light.setLightOpacity(0);
    //tar_light.setTranslucent(true);
    tar_light.lightValue = 1;
    tar_light.register();

    VanillaFactory.createItemFood("cheesy_capacitor", 5).register();

    VanillaFactory.createItemFood("big_burger1", 5).register();
    VanillaFactory.createItemFood("big_burger2", 500).register();
    VanillaFactory.createItemFood("big_burger3", 50000).register();
    addWater("burger");

    VanillaFactory.createItemFood("cheesy_circuit", 20).register();
    VanillaFactory.createItem("gold_circuit").register();

    VanillaFactory.createItem("soapart_dust").register();
    VanillaFactory.createItem("soapart").register();
}
{//twili
    var power_core = VanillaFactory.createBlock("power_core", <blockmaterial:rock>);
    power_core.axisAlignedBB = mods.contenttweaker.AxisAlignedBB.create(0.25, 0.25, 0.25, 0.75, 0.75, 0.75);
    power_core.setBlockLayer("TRANSLUCENT");
    power_core.setLightOpacity(0);
    power_core.setTranslucent(true);
    power_core.setFullBlock(false);
    power_core.register();

    VanillaFactory.createFluid("strawberry_juice", Color.fromHex("f15353")).register();
    VanillaFactory.createFluid("strawberry_wine", Color.fromHex("890000")).register();

    addWater("slimebone");
}
{//actually addition
    VanillaFactory.createItem("coil_core1").register();
    VanillaFactory.createItem("coil_core2").register();

    VanillaFactory.createItem("laser_mirror").register();

    {//biolab
        VanillaFactory.createItem("soap").register();
        VanillaFactory.createFluid("sterile_water", Color.fromHex("e5d1d1")).register();

        VanillaFactory.createItem("biocell").register();
        VanillaFactory.createItem("dirty_biocell").register();
        VanillaFactory.createItem("biomass_cell").register();
        VanillaFactory.createItem("grown_biomass_cell").register();

        VanillaFactory.createItem("biomaterial1").register();
        VanillaFactory.createItem("neuromass1").register();
        VanillaFactory.createItem("gemmed_biomass").register();
        
        VanillaFactory.createItem("skymass1").register();
        VanillaFactory.createItem("bloodmass1").register();
        VanillaFactory.createItem("glowmass1").register();

        VanillaFactory.createItem("biomaterial2").register();
        VanillaFactory.createItem("musclemass1").register();
        VanillaFactory.createItem("neuromass2").register();

        VanillaFactory.createItem("biomaterial3").register();

        //VanillaFactory.createItem("advanced_biomass_cell").register();
        //VanillaFactory.createItem("neuro_biomass_cell").register();
        //VanillaFactory.createItem("flying_biomass_cell").register();
        //VanillaFactory.createItem("fiery_biomass_cell").register();
        //VanillaFactory.createItem("glowing_biomass_cell").register();

        VanillaFactory.createItem("basic_neuron").register();
        VanillaFactory.createItem("neuron").register();
        VanillaFactory.createItem("advanced_neuron").register();
    }

    addGlass("flower_glass");

}
{//myst agric
    VanillaFactory.createItem("base_seeds").register();
    VanillaFactory.createItem("potential_seeds").register();
    VanillaFactory.createFluid("essence_slurp", Color.fromHex("748e00")).register();

    VanillaFactory.createBlock("essence_pump1", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("essence_pump2", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("essence_pump3", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("essence_pump4", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("essence_pump5", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("essence_pump6", <blockmaterial:rock>).register();
}
{//aether
    {//icestone & cold
        VanillaFactory.createItem("ice_dust").register();
        VanillaFactory.createItem("ice_shard").register();
        VanillaFactory.createBlock("ice_shard_block", <blockmaterial:rock>).register();

        var cold_liquid = VanillaFactory.createFluid("cold_liquid", Color.fromHex("ea6056"));
        cold_liquid.colorize = false;
        cold_liquid.stillLocation = 'contenttweaker:fluids/cold_liquid';
        cold_liquid.flowingLocation = 'contenttweaker:fluids/cold_liquid';
        cold_liquid.register();
    }

    VanillaFactory.createItem("aether_bug").register();
    VanillaFactory.createFluid("skyroot", Color.fromHex("5d5d45")).register();
}
{//enderio
    VanillaFactory.createItem("uv_lamp").register();

    VanillaFactory.createItem("porous_dust").register();
    VanillaFactory.createItem("grinding_wheel").register();

    VanillaFactory.createItem("soul_dye_base").register();

    VanillaFactory.createFluid("crystal_fluid1", Color.fromHex("6fc674")).register();
    VanillaFactory.createFluid("crystal_fluid2", Color.fromHex("4f9c6d")).register();
    //VanillaFactory.createFluid("crystal_fluid3", Color.fromHex("357876")).register();
    addWater("crystal_fluid3");
    VanillaFactory.createFluid("crystal_waste", Color.fromHex("2f1c23")).register();

    VanillaFactory.createItem("neuro_crystal").register();
    VanillaFactory.createItem("eio_slab").register();
    VanillaFactory.createItem("melodic_paste").register();
    VanillaFactory.createItem("melodic_reagent").register();

    VanillaFactory.createItem("mana_wire").register();
    VanillaFactory.createItem("mana_focus").register();

    VanillaFactory.createItem("plant_unit").register();

    VanillaFactory.createItem("undead_essence").register();
}


{//blood magic
    VanillaFactory.createItem("deep_dark_core").register();
    VanillaFactory.createItem("blood_runic_dust").register();
    
    VanillaFactory.createItem("blood_gem").register();

    VanillaFactory.createItem("tartaric_dust").register();
    addWater("tartaric_gel");

    VanillaFactory.createItem("soul_reflector_base").register();
    VanillaFactory.createItem("soul_reflector").register();
    VanillaFactory.createItem("will_absorbing_ingot").register();

    VanillaFactory.createBlock("soul_frame", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("blood_frame", <blockmaterial:rock>).register();

    VanillaFactory.createItem("blood_matter").register();

    {//buckets
        VanillaFactory.createItem("bucket_obsidian").register();
        var residue = VanillaFactory.createItem("bucket_obsidian_residue");
        residue.maxStackSize = 1;
        residue.itemGetContainerItem = function(item){ return <item:contenttweaker:bucket_obsidian>; };
        residue.register();
        var voidf = VanillaFactory.createItem("bucket_obsidian_void");
        voidf.maxStackSize = 1;
        voidf.itemGetContainerItem = function(item){ return <item:contenttweaker:bucket_obsidian>; };
        voidf.register();

        VanillaFactory.createItem("bucket_water").register();
        var heavy = VanillaFactory.createItem("bucket_water_heavy");
        heavy.maxStackSize = 1;
        heavy.itemGetContainerItem = function(item){ return <item:contenttweaker:bucket_water>; };
        heavy.register();
        var seaweed = VanillaFactory.createItem("bucket_water_seaweed");
        seaweed.maxStackSize = 1;
        seaweed.itemGetContainerItem = function(item){ return <item:contenttweaker:bucket_water>; };
        seaweed.register();

        VanillaFactory.createItem("bucket_cursed").register();
        var sand = VanillaFactory.createItem("bucket_cursed_sand");
        sand.maxStackSize = 1;
        sand.itemGetContainerItem = function(item){ return <item:contenttweaker:bucket_cursed>; };
        sand.register();

        VanillaFactory.createItem("bucket_valk").register();
        var cloud = VanillaFactory.createItem("bucket_valk_cloud");
        cloud.maxStackSize = 1;
        cloud.itemGetContainerItem = function(item){ return <item:contenttweaker:bucket_valk>; };
        cloud.register();

        VanillaFactory.createItem("bucket_bio").register();
        var diesel = VanillaFactory.createItem("bucket_bio_diesel");
        diesel.maxStackSize = 1;
        diesel.itemGetContainerItem = function(item){ return <item:contenttweaker:bucket_bio>; };
        diesel.register();

        VanillaFactory.createItem("bucket_acid").register();
        var chitin = VanillaFactory.createItem("bucket_acid_chitin");
        chitin.maxStackSize = 1;
        chitin.itemGetContainerItem = function(item){ return <item:contenttweaker:bucket_acid>; };
        chitin.register();

        var tree_oil = VanillaFactory.createItem("bucket_tree_oil");
        tree_oil.maxStackSize = 1;
        tree_oil.itemGetContainerItem = function(item){ return <item:aether_legacy:skyroot_bucket>; };
        tree_oil.register();
    }
    addItem("alchemical_clay", "rare", 64);

    {//clays
        var fr = VanillaFactory.createItem("alchemical_clay_fr");
        fr.maxStackSize = 1;
        fr.itemGetContainerItem = function(item){ return <item:contenttweaker:alchemical_clay>; };
        fr.register();

        var wb = VanillaFactory.createItem("alchemical_clay_wb");
        wb.maxStackSize = 1;
        wb.itemGetContainerItem = function(item){ return <item:contenttweaker:alchemical_clay>; };
        wb.register();

        var h = VanillaFactory.createItem("alchemical_clay_h");
        h.maxStackSize = 1;
        h.itemGetContainerItem = function(item){ return <item:contenttweaker:alchemical_clay>; };
        h.register();

        var jb = VanillaFactory.createItem("alchemical_clay_jb");
        jb.maxStackSize = 1;
        jb.itemGetContainerItem = function(item){ return <item:contenttweaker:alchemical_clay>; };
        jb.register();

        var st = VanillaFactory.createItem("alchemical_clay_st");
        st.maxStackSize = 1;
        st.itemGetContainerItem = function(item){ return <item:contenttweaker:alchemical_clay>; };
        st.register();
    }

    VanillaFactory.createItem("reagent_acid").register();
    VanillaFactory.createItem("reagent_wood").register();
    VanillaFactory.createItem("reagent_oil").register();
    VanillaFactory.createItem("reagent_bug").register();
    VanillaFactory.createItem("reagent_mushroom").register();
    VanillaFactory.createItem("reagent_glass").register();
    VanillaFactory.createItem("reagent_crystal").register();
    VanillaFactory.createItem("reagent_potion").register();
    VanillaFactory.createItem("reagent_space").register();

    VanillaFactory.createItem("mixed_will_crystal").register();

    {//nether star dup & starry polymer
    
        VanillaFactory.createItem("nether_star_dust").register();
        VanillaFactory.createItem("nether_star_catalyst").register();
        VanillaFactory.createItem("nether_star_waste").register();

        VanillaFactory.createFluid("nether_star_inert", Color.fromHex("272d68")).register();
        VanillaFactory.createFluid("nether_star_solution", Color.fromHex("fcfbee")).register();

        VanillaFactory.createItem("glass_star").register();

        VanillaFactory.createItem("star_polymer_base_hot").register();
        VanillaFactory.createItem("star_polymer_base").register();
        VanillaFactory.createItem("star_polymer").register();

        VanillaFactory.createItem("mana_star").register();
    }

    addItem("blood_spike", "rare", 64);

    VanillaFactory.createItem("blood_shard1").register();
    VanillaFactory.createItem("blood_shard2").register();
    VanillaFactory.createItem("blood_shard3").register();
    VanillaFactory.createItem("blood_shard4").register();
    VanillaFactory.createBlock("life_essence_ore", <blockmaterial:rock>).register();

    addItem("slate_6", "rare", 64);
    addItem("slate_7", "rare", 64);
    addItem("slate_8", "epic", 64);
    addItem("slate_9", "epic", 64);
    addItem("slate_10", "epic", 64);

    addItem("advanced_pyrotheum", "epic", 64);
    addItem("advanced_cryotheum", "epic", 64);
    addItem("advanced_petrotheum", "epic", 64);
    addItem("advanced_aerotheum", "epic", 64);

    addItem("elemental_clay", "epic", 64);

    VanillaFactory.createBlock("bloody_sheetmetal", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("bloody_gearbox_inactive", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("bloody_gearbox", <blockmaterial:rock>).register();

    addGlass("high_heat_glass");
    VanillaFactory.createBlock("tignalum_blast_brick", <blockmaterial:rock>).register();

    addItem("bouncy_matter", "rare", 64);
    addItem("very_bouncy_matter", "epic", 64);

    addItem("bouncy_matter_small", "rare", 64);

    addItem("poisotheum", "rare", 64);
    addItem("electricium", "rare", 64);

    addItem("tablet_empty", "rare", 64);
    addItem("tablet_engraved", "rare", 64);
    addItem("tablet_good", "rare", 64);
    addItem("tablet_evil", "rare", 64);
    
    VanillaFactory.createItem("muscle_cell").register();
    VanillaFactory.createItem("muscle").register();
    VanillaFactory.createItem("muscle_green").register();

    addItem("living_motor", "rare", 64);
    addItem("neuro_crystal2", "rare", 64);
    addItem("bloody_circuit", "rare", 64);

    VanillaFactory.createFluid("cool_soup", Color.fromHex("8ca127")).register();
        
    {//metallic chitin

        VanillaFactory.createFluid("raw_chitin", Color.fromHex("724610")).register();

        VanillaFactory.createFluid("acidic_chitin", Color.fromHex("75925a")).register();
        VanillaFactory.createFluid("salty_chitin", Color.fromHex("7b8770")).register();

        VanillaFactory.createFluid("chitin_grade1", Color.fromHex("90d1ab")).register();
        VanillaFactory.createFluid("chitin_grade2", Color.fromHex("90c1b4")).register();
        VanillaFactory.createFluid("chitin_grade3", Color.fromHex("90afbf")).register();
        VanillaFactory.createFluid("chitin_grade4", Color.fromHex("7e8dc1")).register();
        VanillaFactory.createFluid("chitin_grade5", Color.fromHex("6d6dc2")).register();

        VanillaFactory.createItem("hot_chitin").register();
        VanillaFactory.createItem("chitin").register();

        VanillaFactory.createItem("chitin_ball").register();
        VanillaFactory.createItem("chitin_mirror").register();
    }

    addWater("circuit");

    var rotor = VanillaFactory.createBlock("rotor", <blockmaterial:rock>);
    rotor.axisAlignedBB = mods.contenttweaker.AxisAlignedBB.create(0.25, 0.0, 0.25, 0.75, 1.0, 0.75);
    rotor.setBlockLayer("TRANSLUCENT");
    rotor.setLightOpacity(0);
    rotor.setTranslucent(true);
    rotor.setFullBlock(false);
    rotor.register();

    VanillaFactory.createItem("bug_chip").register();
}
{//botania
    addItem("revived_bush", "rare", 16);
    VanillaFactory.createBlock("revived_log", <blockmaterial:rock>).register();
    VanillaFactory.createFluid("premana_juice", Color.fromHex("2f3244")).register();
    VanillaFactory.createFluid("mana_juice", Color.fromHex("354072")).register();

    var mana_frame = VanillaFactory.createBlock("mana_frame", <blockmaterial:glass>);
    mana_frame.setBlockLayer("TRANSLUCENT");
    mana_frame.setLightOpacity(0);
    mana_frame.setTranslucent(true);
    mana_frame.setFullBlock(false);
    mana_frame.setBlockSoundType(<soundtype:glass>);
    mana_frame.register();

    VanillaFactory.createBlock("manapearl_block", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("terracrux", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("terrastem", <blockmaterial:rock>).register();

    {
        var lazy_soup = VanillaFactory.createItemFood("lazy_soup", 8);
        lazy_soup.alwaysEdible = true;
        lazy_soup.onItemFoodEaten = function(stack, world, player) {
            if (!world.isRemote())
                if (player) {
                    player.addPotionEffect(<potion:minecraft:slowness>.makePotionEffect(20 * 30, 3));
                    player.addPotionEffect(<potion:minecraft:blindness>.makePotionEffect(20 * 30, 1));
                }
        };

        lazy_soup.register();
    }

    VanillaFactory.createItem("rune_string").register();
    VanillaFactory.createItem("rune_boule_core").register();
    VanillaFactory.createItem("rune_boule").register();
    addItem("rune_boule1", "rare", 16);
    addItem("rune_boule2", "rare", 16);
    addItem("rune_boule3", "epic", 16);
    addItem("rune_boule4", "epic", 16);

    addItem("rune_base", "rare", 64);
    addItem("improved_rune_base", "rare", 64);
    addItem("advanced_rune_base", "epic", 64);
    addItem("terra_rune_base", "epic", 64);
    VanillaFactory.createItem("rune_lightning").register();
    VanillaFactory.createItem("rune_acid").register();
    VanillaFactory.createItem("rune_mushroom").register();
    VanillaFactory.createItem("rune_bug").register();
    VanillaFactory.createItem("rune_glass").register();
    
    VanillaFactory.createFluid("rune_acid", Color.fromHex("369c45")).register();

    addItem("rune_mana_chip", "rare", 64);   
    addItem("ultimate_rune", "epic", 64);
    
    VanillaFactory.createBlock("rune_water_block", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("rune_fire_block", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("rune_earth_block", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("rune_air_block", <blockmaterial:rock>).register();

    VanillaFactory.createItem("manaclay").register();
    var manaclay_block = VanillaFactory.createBlock("manaclay_block", <blockmaterial:clay>);
    manaclay_block.blockSoundType = <soundtype:ground>;
    manaclay_block.dropHandler = function(drops, world, position, state, fortune) {
        drops.clear();
        drops.add(<item:contenttweaker:manaclay> * 4);
        return;
    };
    manaclay_block.register();

    VanillaFactory.createItem("manabrick").register();
    VanillaFactory.createBlock("manabrick_block", <blockmaterial:rock>).register();

    VanillaFactory.createItem("mana_circuit").register();

    VanillaFactory.createItem("very_advanced_circuit_base").register();
    VanillaFactory.createItem("very_advanced_circuit").register();
    VanillaFactory.createItem("very_advanced_mana_circuit").register();

    VanillaFactory.createItem("elf_mana_circuit").register();

    VanillaFactory.createItem("elemental_essence_base").register();
    VanillaFactory.createItem("elemental_essence").register();


    VanillaFactory.createItem("rune_water_cracked").register();
    VanillaFactory.createItem("rune_fire_cracked").register();
    VanillaFactory.createItem("rune_earth_cracked").register();
    VanillaFactory.createItem("rune_air_cracked").register();

    VanillaFactory.createItem("rune_mana_cracked").register();
    VanillaFactory.createItem("rune_acid_cracked").register();
    VanillaFactory.createItem("rune_lightning_cracked").register();

    VanillaFactory.createItem("rune_spring_cracked").register();
    VanillaFactory.createItem("rune_summer_cracked").register();
    VanillaFactory.createItem("rune_autumn_cracked").register();
    VanillaFactory.createItem("rune_winter_cracked").register();

    VanillaFactory.createItem("terra_base").register();
    VanillaFactory.createItem("terra_base_dust").register();
    VanillaFactory.createBlock("terrasteel_ore", <blockmaterial:rock>).register();

    VanillaFactory.createItem("terrabit").register();

    VanillaFactory.createItem("impure_mana_dust").register();
    VanillaFactory.createItem("terragem").register();

    {//enchantium
        var enchantium_chunk = VanillaFactory.createItem("enchantium_chunk");
        enchantium_chunk.register();

        var enchantium = VanillaFactory.createFluid("enchantium", Color.fromHex("fa1100"));
        enchantium.material = <blockmaterial:lava>;
        enchantium.colorize = false;
        enchantium.stillLocation = 'contenttweaker:fluids/enchantium';
        enchantium.flowingLocation = 'contenttweaker:fluids/enchantium';
        enchantium.register();
    }

    {//chitigic
        VanillaFactory.createItem("chitigic").register();
        VanillaFactory.createItem("chitigicum").register();
        VanillaFactory.createItem("chitigic_food1").register();
        VanillaFactory.createItem("chitigic_food2").register();
        VanillaFactory.createItem("chitigic_food3").register();
        VanillaFactory.createItem("chitigic_egg").register();
        VanillaFactory.createItem("chewed_guts").register();
        add_living("chitigic_drone");
        add_living("chitigic_hunter");
        add_living("chitigic_scout");
        VanillaFactory.createItem("chitigic_party").register();
        add_living("chitigic_refinery");
        add_living("chitigic_engineer");
        add_living("chitigic_chef");
        add_living("chitigic_chewer");
        add_living("chitigic_nursery");
        add_living("chitigic_queen");
        add_living("chitigic_empress");
        
        VanillaFactory.createItem("titanakor_flesh").register();
    }

    addWater("flowers");

    VanillaFactory.createItem("dim_stable_plate1").register();
    VanillaFactory.createItem("dim_stable_plate2").register();

}
{//astral
    addGlass("star_frame");
    addGlass("night_glass");

    addGlass("starry_glass");
    
    addWater("starlight_lubricant");

    VanillaFactory.createItem("conveyor").register();
    addGlass("conveyor_block");
    //VanillaFactory.createBlock("arm_block", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("computer", <blockmaterial:rock>).register();

    VanillaFactory.createBlock("particle1", <blockmaterial:rock>).register();
    //VanillaFactory.createBlock("particle2", <blockmaterial:rock>).register();
    //VanillaFactory.createBlock("particle3", <blockmaterial:rock>).register();
    //VanillaFactory.createBlock("particle4", <blockmaterial:rock>).register();
    addGlass("magnetic_glass");

    VanillaFactory.createFluid("sunnarium_base", Color.fromHex("f5ad33")).register();
    VanillaFactory.createItem("sunnarium_chunk").register();
    var sunnarium_core = VanillaFactory.createBlock("sunnarium_core", <blockmaterial:rock>);
    sunnarium_core.setFullBlock(false);
    sunnarium_core.setBlockLayer("TRANSLUCENT");
    sunnarium_core.setLightOpacity(0);
    sunnarium_core.setTranslucent(true);
    sunnarium_core.register();

    {
        VanillaFactory.createItem("chad").register();
        VanillaFactory.createItem("chad2").register();
        VanillaFactory.createItem("space_paper_base").register();
        VanillaFactory.createItem("space_paper").register();
        VanillaFactory.createItem("space_data").register();
        //VanillaFactory.createItem("engraved_space_data").register();
    }
    VanillaFactory.createItem("c14_dust").register();
    VanillaFactory.createItem("c14_gem").register();

    var antenna_mk1 = VanillaFactory.createBlock("antenna_mk1", <blockmaterial:rock>);
    antenna_mk1.axisAlignedBB = mods.contenttweaker.AxisAlignedBB.create(0.25, 0.0, 0.25, 0.75, 1.0, 0.75);
    antenna_mk1.setBlockLayer("TRANSLUCENT");
    antenna_mk1.setLightOpacity(0);
    antenna_mk1.setTranslucent(true);
    antenna_mk1.setFullBlock(false);
    antenna_mk1.register();
    var antenna_mk2 = VanillaFactory.createBlock("antenna_mk2", <blockmaterial:rock>);
    antenna_mk2.axisAlignedBB = mods.contenttweaker.AxisAlignedBB.create(0.3125, 0.0, 0.3125, 0.6875, 1.0, 0.6875);
    antenna_mk2.setBlockLayer("TRANSLUCENT");
    antenna_mk2.setLightOpacity(0);
    antenna_mk2.setTranslucent(true);
    antenna_mk2.setFullBlock(false);
    antenna_mk2.register();
    var antenna_mk3 = VanillaFactory.createBlock("antenna_mk3", <blockmaterial:rock>);
    antenna_mk3.axisAlignedBB = mods.contenttweaker.AxisAlignedBB.create(0.375, 0.0, 0.375, 0.625, 1.0, 0.625);
    antenna_mk3.setBlockLayer("TRANSLUCENT");
    antenna_mk3.setLightOpacity(0);
    antenna_mk3.setTranslucent(true);
    antenna_mk3.setFullBlock(false);
    antenna_mk3.register();

    VanillaFactory.createItem("zblank").register();
    VanillaFactory.createItem("inverted_gem_ingot").register();

    VanillaFactory.createItem("fuel_coral").register();

    VanillaFactory.createItem("alien_wreck").register();
    VanillaFactory.createItem("alien_electrode").register();
    VanillaFactory.createItem("alien_motor").register();

    {//dark catalyst
        var dark_catalyst = VanillaFactory.createFluid("dark_catalyst", Color.fromHex("ea6056"));
        dark_catalyst.material = <blockmaterial:lava>;
        dark_catalyst.colorize = false;
        dark_catalyst.stillLocation = 'contenttweaker:fluids/dark_catalyst';
        dark_catalyst.flowingLocation = 'contenttweaker:fluids/dark_catalyst';
        dark_catalyst.register();
    }

    VanillaFactory.createBlock("mana_pipe", <blockmaterial:rock>).register();
    //VanillaFactory.createBlock("electric_core", <blockmaterial:rock>).register();
    var electric_core = VanillaFactory.createBlock("electric_core", <blockmaterial:rock>);
    electric_core.setFullBlock(false);
    electric_core.setBlockLayer("TRANSLUCENT");
    electric_core.setLightOpacity(0);
    electric_core.setTranslucent(true);
    electric_core.register();
    //VanillaFactory.createBlock("manapearl_block", <blockmaterial:rock>).register();
}
{//draconic
    VanillaFactory.createItem("electron").register();
    VanillaFactory.createItem("positron").register();
    VanillaFactory.createItem("proton").register();
    VanillaFactory.createItem("anti_proton").register();
    VanillaFactory.createItem("neutron").register();
    VanillaFactory.createItem("deathon").register();
    VanillaFactory.createItem("manathon").register();

    VanillaFactory.createItem("positronium").register();

    VanillaFactory.createItem("electron_emitter").register();
    VanillaFactory.createItem("positron_emitter").register();

    VanillaFactory.createItem("barion1").register();
    VanillaFactory.createItem("barion2").register();
    VanillaFactory.createItem("barion3").register();
    VanillaFactory.createItem("barion4").register();
    VanillaFactory.createItem("barion5").register();
    
    VanillaFactory.createItem("vacuum").register();
}
{//project e
    VanillaFactory.createItem("tribute").register();
}
{//alchemistry
    addGlass("chemical_core");
    addGlass("inert_glass");


}

{//inf line
    VanillaFactory.createBlock("galastem", <blockmaterial:rock>).register();
}
{//endgame
    VanillaFactory.createBlock("portal", <blockmaterial:rock>).register();

    VanillaFactory.createItem("luck_chip").register();
    VanillaFactory.createItem("luck_crystal_base").register();
    addItem("luck_crystal", "rare", 1);
    addItem("luck_particle", "rare", 64);

    VanillaFactory.createBlock("lucky_gearbox", <blockmaterial:rock>).register();

    VanillaFactory.createBlock("eye_corner", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("eye_side", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("eye_center", <blockmaterial:rock>).register();

    VanillaFactory.createBlock("brain_matter_block", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("sf_assembler_block", <blockmaterial:rock>).register();
    VanillaFactory.createBlock("sf_infuser_block", <blockmaterial:rock>).register();

    addItem("very_very_bouncy_matter", "epic", 64);
    VanillaFactory.createBlock("space_stabilization_frame", <blockmaterial:rock>).register();
    addGlass("cosmic_prism");


    VanillaFactory.createItem("final_frame").register();

    //addItem("infinity_treat", "epic", 64);
    {
        var infinity_treat = VanillaFactory.createItemFood("infinity_treat", 100000);
        infinity_treat.alwaysEdible = true;
        infinity_treat.onItemFoodEaten = function(stack, world, player) {
            if (!world.isRemote())
                if (player) {
                    Commands.call("effect @p extrautils2:effect.xu2.doom 1 0", player, world, false, true);
                }                                   
        };
        infinity_treat.register();
    }
}

//research
VanillaFactory.createItem("glass_cutter_research_token").register();
VanillaFactory.createItem("research_glass_making").register();

VanillaFactory.createItem("tink_research_token1").register();
VanillaFactory.createItem("tink_research_token2").register();
VanillaFactory.createItem("research_tinker").register();
VanillaFactory.createItem("apatite").register();

VanillaFactory.createItem("concrete_token").register();
VanillaFactory.createItem("research_structure").register();

VanillaFactory.createItem("research_weapons1").register();

VanillaFactory.createItem("steel_hoe_research_token").register();
VanillaFactory.createItem("research_plants1").register();
VanillaFactory.createItem("research_plants2").register();

VanillaFactory.createItem("blueslime_bucket").register();
VanillaFactory.createItem("purpleslime_bucket").register();
VanillaFactory.createItem("research_plants3").register();

VanillaFactory.createItem("research_mushroom1").register();

VanillaFactory.createItem("organic_green_token").register();
VanillaFactory.createItem("residue_token").register();
VanillaFactory.createItem("malachite_token").register();
VanillaFactory.createItem("sand_token").register();
VanillaFactory.createItem("sludge_token").register();
VanillaFactory.createItem("research_cobblegen").register();

VanillaFactory.createFluid("sludge_cg", Color.fromHex("2d092d")).register();
VanillaFactory.createFluid("organic_cg", Color.fromHex("83a854")).register();
registerMoltenMetal("residue_cg", Color.fromHex("493b2f"));

VanillaFactory.createItem("research_circuit1").register();
VanillaFactory.createItem("research_circuit2").register();

VanillaFactory.createItem("grass_bucket").register();
VanillaFactory.createItem("research_sieving").register();

VanillaFactory.createItem("glow_bucket").register();
VanillaFactory.createItem("research_flight1").register();

VanillaFactory.createItem("research_chemistry1").register();
VanillaFactory.createItem("polymer_bucket").register();
VanillaFactory.createItem("book_token").register();
VanillaFactory.createItem("research_chemistry2").register();
VanillaFactory.createItem("research_chemistry3").register();

VanillaFactory.createItem("demon_bucket").register();
VanillaFactory.createItem("research_fluids").register();
VanillaFactory.createItem("research_magic1").register();
VanillaFactory.createItem("research_magic2").register();

VanillaFactory.createItem("research_soul").register();

VanillaFactory.createItem("research_bacteria1").register();

VanillaFactory.createItem("research_heat").register();

VanillaFactory.createItem("research_terra").register();
VanillaFactory.createItem("research_luck").register();
VanillaFactory.createItem("research_chitigic").register();

VanillaFactory.createItem("research_enchanting").register();

VanillaFactory.createItem("research_singularity").register();



VanillaFactory.createItem("empty_ingot").register();

VanillaFactory.createItem("plate_mold").register();
VanillaFactory.createItem("rod_mold").register();
VanillaFactory.createItem("gear_mold").register();

VanillaFactory.createItem("press_fluid").register();
VanillaFactory.createItem("press_gas").register();

VanillaFactory.createItem("quest_coin").register();
