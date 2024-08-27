import crafttweaker.item.IItemStack;



import mods.thermalexpansion.Imbuer as TEImbuer; 
import mods.thermalexpansion.Transposer;



function add2x2Recipe(brick as IItemStack, block as IItemStack){
    recipes.addShaped(
        "ia_" + brick.name + "_" + block.name + "_compression",
        block,
        [[brick, brick],[brick, brick]]
    );
    recipes.addShapeless(
        "ia_" + brick.name + "_" + block.name + "_uncompression",
        brick * 4,
        [block]
    );
}
function add3x3Recipe(ingot as IItemStack, block as IItemStack){
    recipes.addShaped(
        "ia_" + ingot.displayName + "_" + block.displayName + "_compression",
        block,
        [[ingot, ingot, ingot],[ingot, ingot, ingot],[ingot, ingot, ingot]]
    );
    recipes.addShapeless(
        "ia_" + ingot.displayName + "_" + block.displayName + "_uncompression",
        ingot * 9,
        [block]
    );
}
function addNuggetIngotBlockRecipe(nugget as IItemStack, ingot as IItemStack, block as IItemStack){
    add3x3Recipe(nugget, ingot);
    add3x3Recipe(ingot, block);
}

//brick dust in Ore proccesing


{//clay
    //fireclay
    recipes.addShapeless(<contenttweaker:fireclay> * 2, [<minecraft:clay_ball>, <contenttweaker:brick_dust>, <minecraft:blaze_powder>, <minecraft:flint>]);
    //firebrick
    furnace.addRecipe(<contenttweaker:firebrick>, <contenttweaker:fireclay>);
    
    add2x2Recipe(<contenttweaker:firebrick>, <contenttweaker:firebrick_block>);
    add2x2Recipe(<contenttweaker:kaolin_clay>, <contenttweaker:kaolin_clay_block>);


    //industrial clay
    recipes.addShapeless("ai_industrail_clay", 
        <contenttweaker:industrial_clay>, 
        [<contenttweaker:fireclay>, <contenttweaker:fireclay>, <prodigytech:inferno_crystal>, <ore:dustConstantan>, <exnihilocreatio:item_material:1>]
    );

    add2x2Recipe(<contenttweaker:forest_clay>, <contenttweaker:forest_clay_block>);

    //elastic clay
    recipes.addShapeless("ia_elastic_clay1", 
        <contenttweaker:elastic_clay>, 
        [<contenttweaker:industrial_clay>, <contenttweaker:solar_silicon>, <contenttweaker:steeleaf_mush>, <erebus:materials:9>]
    );
    recipes.addShapeless("ia_elastic_clay2", 
        <contenttweaker:elastic_clay> * 2, 
        [<contenttweaker:industrial_clay>, <contenttweaker:solar_silicon>, <contenttweaker:steeleaf_mush>, <erebus:materials:9>, <contenttweaker:kaolin_clay>]
    );


    add2x2Recipe(<contenttweaker:manaclay>, <contenttweaker:manaclay_block>);
    add2x2Recipe(<contenttweaker:manabrick>, <contenttweaker:manabrick_block>);
}

{//metals
    addNuggetIngotBlockRecipe(<contenttweaker:zinc_nugget>, <contenttweaker:zinc_ingot>, <contenttweaker:zinc_block>);

    add3x3Recipe(<contenttweaker:ancient_ingot>, <contenttweaker:ancient_block>);
    add3x3Recipe(<contenttweaker:nial_ingot>, <contenttweaker:nial_block>);
    addNuggetIngotBlockRecipe(<contenttweaker:duraluminum_nugget>, <contenttweaker:duraluminum_ingot>, <contenttweaker:duraluminum_block>);

    add3x3Recipe(<contenttweaker:flower_steel_ingot>, <contenttweaker:flower_steel_block>);

    addNuggetIngotBlockRecipe(<contenttweaker:wear_resistant_alloy_nugget>, <contenttweaker:wear_resistant_alloy_ingot>, <contenttweaker:wear_resistant_alloy_block>);
    addNuggetIngotBlockRecipe(<contenttweaker:lesmium_nugget>, <contenttweaker:lesmium_ingot>, <contenttweaker:lesmium_block>);
    addNuggetIngotBlockRecipe(<contenttweaker:watertight_steel_nugget>, <contenttweaker:watertight_steel_ingot>, <contenttweaker:watertight_steel_block>);

    addNuggetIngotBlockRecipe(<contenttweaker:electric_manyullyn_base_nugget>, <contenttweaker:electric_manyullyn_base_ingot>, <contenttweaker:electric_manyullyn_base_block>);
    addNuggetIngotBlockRecipe(<contenttweaker:electric_manyullyn_nugget>, <contenttweaker:electric_manyullyn_ingot>, <contenttweaker:electric_manyullyn_block>);
    addNuggetIngotBlockRecipe(<contenttweaker:angel_nugget>, <contenttweaker:angel_ingot>, <contenttweaker:angel_block>);
    addNuggetIngotBlockRecipe(<contenttweaker:thermal_nugget>, <contenttweaker:thermal_ingot>, <contenttweaker:thermal_block>);
    addNuggetIngotBlockRecipe(<contenttweaker:mushroomite_nugget>, <contenttweaker:mushroomite_ingot>, <contenttweaker:mushroomite_block>);
    addNuggetIngotBlockRecipe(<contenttweaker:mekanized_steel_nugget>, <contenttweaker:mekanized_steel_ingot>, <contenttweaker:mekanized_steel_block>);

    add3x3Recipe(<contenttweaker:relic_ingot>, <contenttweaker:relic_block>);

    addNuggetIngotBlockRecipe(<contenttweaker:fluix_steel_nugget>, <contenttweaker:fluix_steel_ingot>, <contenttweaker:fluix_steel_block>);
    addNuggetIngotBlockRecipe(<contenttweaker:menril_steel_nugget>, <contenttweaker:menril_steel_ingot>, <contenttweaker:menril_steel_block>);

    addNuggetIngotBlockRecipe(<contenttweaker:black_bronze_nugget>, <contenttweaker:black_bronze_ingot>, <contenttweaker:black_bronze_block>);
    add3x3Recipe(<contenttweaker:tinezo_ingot>, <contenttweaker:tinezo_block>);
    

    <contenttweaker:osgloridium_ingot>.addTooltip("Made of mostly osmium");
    addNuggetIngotBlockRecipe(<contenttweaker:osgloridium_nugget>, <contenttweaker:osgloridium_ingot>, <contenttweaker:osgloridium_block>);
    addNuggetIngotBlockRecipe(<contenttweaker:titanium_nugget>, <contenttweaker:titanium_ingot>, <contenttweaker:titanium_block>);
    add3x3Recipe(<exnihilocreatio:item_ore_tungsten:3>, <contenttweaker:tungsten_block>);
    <contenttweaker:tungsten_block>.addTooltip("I wasn't the one to start it");
    addNuggetIngotBlockRecipe(<contenttweaker:medical_alloy_nugget>, <contenttweaker:medical_alloy_ingot>, <contenttweaker:medical_alloy_block>);

    addNuggetIngotBlockRecipe(<contenttweaker:gastight_steel_nugget>, <contenttweaker:gastight_steel_ingot>, <contenttweaker:gastight_steel_block>);

    scripts.helper.addSimpleCrushingRecipe(<tconstruct:ingots:2>, <contenttweaker:manyullyn_dust>);
    furnace.addRecipe(<tconstruct:ingots:2>, <contenttweaker:manyullyn_dust>);

    add3x3Recipe(<contenttweaker:relic_nugget>, <contenttweaker:relic_ingot>);

    add3x3Recipe(<contenttweaker:coppra>, <contenttweaker:coppra_block>);
    add3x3Recipe(<contenttweaker:ecoppra>, <contenttweaker:ecoppra_block>);
    add3x3Recipe(<contenttweaker:nittin>, <contenttweaker:nittin_block>);
    add3x3Recipe(<contenttweaker:enittin>, <contenttweaker:enittin_block>);
    add3x3Recipe(<contenttweaker:goold>, <contenttweaker:goold_block>);
    add3x3Recipe(<contenttweaker:egoold>, <contenttweaker:egoold_block>);

    add3x3Recipe(<contenttweaker:arkenium_ingot>, <contenttweaker:arkenium_block>);
    add3x3Recipe(<contenttweaker:gallium_ingot>, <contenttweaker:gallium_block>);
    add3x3Recipe(<contenttweaker:stoneleaf>, <contenttweaker:stoneleaf_clump>);

    add3x3Recipe(<contenttweaker:calitunti_ingot>, <contenttweaker:calitunti_block>);
    add3x3Recipe(<contenttweaker:amethyst_nugget>, <contenttweaker:amethyst_ingot>);
    add3x3Recipe(<contenttweaker:chrome_ingot>, <contenttweaker:chrome_block>);
    add3x3Recipe(<contenttweaker:bedrockium_alloy_ingot>, <contenttweaker:bedrockium_alloy_block>);

    add3x3Recipe(<tconevo:metal:40>, <tconevo:metal_block:8>);

    add3x3Recipe(<contenttweaker:purple_gold_ingot>, <contenttweaker:purple_gold_block>);

    add3x3Recipe(<contenttweaker:imperial_steel_ingot>, <contenttweaker:imperial_steel_block>);

    add3x3Recipe(<contenttweaker:neodymium_ingot>, <contenttweaker:neodymium_block>);

    add3x3Recipe(<contenttweaker:explosion_resistant_ingot>, <contenttweaker:explosion_resistant_block>);
    add3x3Recipe(<contenttweaker:hot_ingot>, <contenttweaker:hot_block>);

    add3x3Recipe(<contenttweaker:tunril_dust>, <contenttweaker:tunril_dust_big>);
    add3x3Recipe(<contenttweaker:tunril_ingot>, <contenttweaker:tunril_block>);

    add3x3Recipe(<contenttweaker:tignalum_ingot>, <contenttweaker:tignalum_block>);
    add3x3Recipe(<contenttweaker:mitanium_ingot>, <contenttweaker:mitanium_block>);

    add3x3Recipe(<contenttweaker:alchemical_brass_ingot>, <contenttweaker:alchemical_brass_block>);

    add3x3Recipe(<contenttweaker:living_steel_ingot>, <contenttweaker:living_steel_block>);
    addNuggetIngotBlockRecipe(<contenttweaker:crystal_metal_nugget>, <contenttweaker:crystal_metal_ingot>, <contenttweaker:crystal_metal_block>);
    add3x3Recipe(<contenttweaker:conductive_alloy_ingot>, <contenttweaker:conductive_alloy_block>);
    add3x3Recipe(<contenttweaker:acid_resistant_steel_ingot>, <contenttweaker:acid_resistant_steel_block>);

    add3x3Recipe(<botania:manaresource:1>, <contenttweaker:manapearl_block>);
    add3x3Recipe(<contenttweaker:chlorasteel_ingot>, <contenttweaker:chlorasteel_block>);
    add3x3Recipe(<contenttweaker:gem_steel_ingot>, <contenttweaker:gem_steel_block>);
    add3x3Recipe(<contenttweaker:mirion2_ingot>, <contenttweaker:mirion2_block>);

    add3x3Recipe(<contenttweaker:light_ingot>, <contenttweaker:light_block>);
    add3x3Recipe(<contenttweaker:glowshroomite_ingot>, <contenttweaker:glowshroomite_block>);
    add3x3Recipe(<contenttweaker:orichalcum_ingot>, <contenttweaker:orichalcum_block>);
    add3x3Recipe(<contenttweaker:vibralcum_ingot>, <contenttweaker:vibralcum_block>);
    add3x3Recipe(<contenttweaker:nitinol_ingot>, <contenttweaker:nitinol_block>);
    add3x3Recipe(<contenttweaker:neuronium_ingot>, <contenttweaker:neuronium_block>);
    add3x3Recipe(<contenttweaker:fluxed_invar_ingot>, <contenttweaker:fluxed_invar_block>);
    add3x3Recipe(<contenttweaker:moon_ingot>, <contenttweaker:moon_block>);
    
    add3x3Recipe(<contenttweaker:awaken_uru_ingot>, <contenttweaker:awaken_uru_block>);

    add3x3Recipe(<astralsorcery:itemcraftingcomponent:1>, <contenttweaker:starmetal_block>);
    add3x3Recipe(<contenttweaker:star_alloy_ingot>, <contenttweaker:star_alloy_block>);
    add3x3Recipe(<contenttweaker:zirconium_gem>, <contenttweaker:zirconium_block>);

    add3x3Recipe(<contenttweaker:death_metal_ingot>, <contenttweaker:death_metal_block>);

    add3x3Recipe(<contenttweaker:space_ice_crystal>, <contenttweaker:space_ice_crystal_block>);
    add3x3Recipe(<alchemistry:ingot:4>, <contenttweaker:beryllium_block>);
    add3x3Recipe(<alchemistry:ingot:84>, <contenttweaker:polonium_block>);

    add3x3Recipe(<contenttweaker:lucky_alloy_ingot>, <contenttweaker:lucky_alloy_block>);

    add3x3Recipe(<contenttweaker:ssa_ingot>, <contenttweaker:ssa_block>);


    add3x3Recipe(<contenttweaker:ice_shard>, <contenttweaker:ice_shard_block>);
    
    add3x3Recipe(<contenttweaker:wormium_ingot>, <contenttweaker:wormium_block>);
}



{//gems
    scripts.helper.addSimpleCrushingRecipe(<erebus:materials:1>, <contenttweaker:jade_dust>);
    furnace.addRecipe(<erebus:materials:1>, <contenttweaker:jade_dust>);

    add3x3Recipe(<contenttweaker:malachite_polycrystal>, <contenttweaker:malachite_block>);
    recipes.addShaped("ia_malachite_vase1", <contenttweaker:malachite_vase>, [
        [<ore:stickGold>, <contenttweaker:malachite_block>, <ore:stickGold>], 
        [<contenttweaker:malachite_block>, <quark:colored_flowerpot_green>, <contenttweaker:malachite_block>], 
        [null, <contenttweaker:malachite_block>, null]
    ]);
    recipes.addShaped("ia_malachite_vase2", <contenttweaker:malachite_vase>, [
        [<ore:stickGold>, <contenttweaker:malachite_monocrystal>, <ore:stickGold>], 
        [<contenttweaker:malachite_monocrystal>, <quark:colored_flowerpot_green>, <contenttweaker:malachite_monocrystal>], 
        [null, <contenttweaker:malachite_monocrystal>, null]
    ]);
}

{//godshards
    <contenttweaker:atum_godshard>.addTooltip("God of the divine.");
    <contenttweaker:ra_godshard>.addTooltip("God of sun and fire.");
    <contenttweaker:ptah_godshard>.addTooltip("God of wealth and gold.");
    <contenttweaker:geb_godshard>.addTooltip("God of earth and crops.");
    <contenttweaker:tefnuts_godshard>.addTooltip("Goddess of moisture, dew and rain.");
    <contenttweaker:shu_godshard>.addTooltip("God of air and wind.");
    <contenttweaker:horus_godshard>.addTooltip("God of the pharaohs.");
    <contenttweaker:seth_godshard>.addTooltip("God of chaos, sandstorms and poison");
    <contenttweaker:isis_godshard>.addTooltip("Goddess of motherhood and healing.");
    <contenttweaker:montu_godshard>.addTooltip("God of war.");
    <contenttweaker:anubis_godshard>.addTooltip("God of the underworld");
    <contenttweaker:nuit_godshard>.addTooltip("Goddess of the sky, stars, cosmos and the universe.");
    <contenttweaker:anput_godshard>.addTooltip("Goddess of darkness and famine.");
}

{//components
    recipes.addShaped("ia_power_core_inactive", <contenttweaker:power_core_inactive>, [
        [null, <immersiveengineering:wirecoil:5>, null], 
        [<immersiveengineering:wirecoil:5>, <ore:gemQuartzBlack>, <immersiveengineering:wirecoil:5>], 
        [null, <immersiveengineering:wirecoil:5>, null]
    ]);
    
    scripts.content_machines.addAssemblerRecipe(
        [<contenttweaker:power_core_active>],
        [<ore:gemQuartzBlack>, <immersiveengineering:wirecoil:5> * 2],
        <liquid:napalm> * 500,
        10, 256
    );

    recipes.addShapeless("ia_electric_stone_dust1",
        <contenttweaker:electric_stone_dust> * 2,
        [<enderio:item_material:20>, <roots:runic_dust>, <tconstruct:soil>]
    );
    recipes.addShapeless("ia_electric_stone_dust2",
        <contenttweaker:electric_stone_dust> * 4,
        [<enderio:item_material:20>, <roots:runic_dust>, <tconstruct:soil>, <prodigytech:zorra_leaf>]
    );
    

    recipes.addShaped("ia_rotor_blades", <contenttweaker:rotor_blades>, [
        [null, <ore:plateSteel>, <ore:plateSteel>], 
        [null, <contenttweaker:watertight_steel_gear>, null], 
        [<ore:plateSteel>, <ore:plateSteel>, null]
    ]);
    scripts.content_machines.addAssemblerRecipe(
        [<contenttweaker:rotor_blades> * 2],
        [<contenttweaker:watertight_steel_gear>, <ore:plateSteel> * 2],
        null,
        10, 128
    );

    <contenttweaker:cursed_circuit>.addShiftTooltip("a=b", "Press shift");
    <contenttweaker:cursed_circuit>.addShiftTooltip("a²=ab");
    <contenttweaker:cursed_circuit>.addShiftTooltip("a²-b²=ab-b²");
    <contenttweaker:cursed_circuit>.addShiftTooltip("(a-b)(a+b)=(a-b)b");
    <contenttweaker:cursed_circuit>.addShiftTooltip("a+b=b");
    <contenttweaker:cursed_circuit>.addShiftTooltip("2b=b");
    <contenttweaker:cursed_circuit>.addShiftTooltip("2=1");

}

mods.enderio.AlloySmelter.addRecipe(<contenttweaker:tignalum_blast_brick>, 
    [
		<immersiveengineering:stone_decoration:2>,
        <contenttweaker:tignalum_rod> * 4,
        <contenttweaker:thermal_plate> * 8
	], 16000
);
mods.enderio.AlloySmelter.addRecipe(<contenttweaker:high_heat_glass>, 
    [
		<engineersdecor:panzerglass_block>,
        <natura:nether_glass:1> * 32,
        <contenttweaker:thermal_plate> * 8
	], 16000
);


recipes.addShaped("ia_rainbow_crystal_cluster", <contenttweaker:rainbow_crystal_cluster>, [
	[<contenttweaker:egoold>, <contenttweaker:ecoppra>, <actuallyadditions:item_crystal_empowered>], 
	[<actuallyadditions:item_crystal_empowered:4>, <actuallyadditions:item_crystal_empowered:1>, <actuallyadditions:item_crystal_empowered:3>], 
	[<actuallyadditions:item_crystal_empowered:2>, <actuallyadditions:item_crystal_empowered:5>, <contenttweaker:enittin>]
]);


recipes.addShaped("ia_mekanical_core1", <contenttweaker:mekanical_core>, [
	[<ore:gearSignalum>, <ore:dustMana>], 
	[<ore:plateOsmium>, <ore:plateOsmium>], 
	[<thermalfoundation:material:514>, <ore:gearSignalum>]
]);
recipes.addShaped("ia_mekanical_core2", <contenttweaker:mekanical_core> * 4, [
	[<ore:gearSignalum>, <ore:dustMana>], 
	[<contenttweaker:mekanized_steel_plate>, <contenttweaker:mekanized_steel_plate>], 
	[<thermalfoundation:material:514>, <ore:gearSignalum>]
]);
scripts.content_machines.addAssemblerRecipe(
    [<contenttweaker:mekanical_core> * 6],
    [
        <thermalfoundation:material:514>,
        <ore:gearSignalum> * 2,
        <ore:dustMana> * 2
    ], <liquid:mekanized_steel> * 576, 
    20, 256
);


recipes.addShaped("ia_stone_idol", <contenttweaker:stone_idol>, [
	[<minecraft:stone>, <minecraft:stone>, <minecraft:stone>], 
	[<minecraft:stone>, <ore:nuggetDiamond>, <ore:nuggetDiamond>], 
	[<minecraft:stone>, <minecraft:stone>, <minecraft:stone>]
]);


/*todo radition protection plating
mods.extendedcrafting.TableCrafting.addShaped(0, <>, [
	[null, <ore:plateLead>, <contenttweaker:malachite_monocrystal>], 
	[<ore:plateLead>, <contenttweaker:irradiated_compound>, <contenttweaker:titanium_plate>], 
	[<contenttweaker:malachite_monocrystal>, <contenttweaker:titanium_plate>, null]
]);
*/

{//silicon
    scripts.helper.addFluidMixerRecipe(<liquid:solar_silicon_solution> * 100, <liquid:liquidchlorine> * 100, <liquid:liquid_sunshine> * 50, <appliedenergistics2:material:5>, 128, 40);
    scripts.helper.addFluidMixerRecipe(<liquid:solar_silicon_solution> * 120, <liquid:liquidchlorine> * 100, <liquid:liquid_sunshine> * 50, <mysticalagriculture:silicon_essence>, 128, 40);
    mods.alchemistry.Evaporator.addRecipe(<contenttweaker:solar_silicon>, <liquid:solar_silicon_solution> * 1000);

    recipes.remove(<projectred-core:resource_item:250>);
    recipes.addShapeless("ia_sandy_coal1", <projectred-core:resource_item:250>, [<contenttweaker:charcoal_ball>, <extrautils2:decorativesolid:4>, <extrautils2:decorativesolid:4>, <contenttweaker:crystal_coal>]);
    recipes.addShapeless("ia_sandy_coal2", <projectred-core:resource_item:250> * 3, [<contenttweaker:charcoal_ball>, <extrautils2:decorativesolid:4>, <extrautils2:decorativesolid:4>, <contenttweaker:crystal_coal>, <contenttweaker:sandworm_chitin>]);

    furnace.remove(<projectred-core:resource_item:300>);
    mods.enderio.AlloySmelter.addRecipe(<projectred-core:resource_item:300>, 
        [<projectred-core:resource_item:250> * 4, <appliedenergistics2:material:5> * 32, <contenttweaker:solar_silicon> * 4], 
        8000
    );

    recipes.remove(<projectred-core:resource_item:301>);
    scripts.helper.addSawRecipe(<projectred-core:resource_item:300>, <projectred-core:resource_item:301> * 8);
}

recipes.addShapeless("ia_crystal_coal", <contenttweaker:crystal_coal>, [<actuallyadditions:item_misc:22>, <minecraft:coal>, <thermalfoundation:material:802>, <extrautils2:ingredients:4>, <actuallyadditions:item_crystal:3>]);
furnace.setFuel(<contenttweaker:crystal_coal>, 200 * 512);


recipes.addShapeless("ia_lazy_soup", <contenttweaker:lazy_soup>, [
    <natura:empty_bowls>, 
    <contenttweaker:primitive_eyes>, 
    <harvestcraft:pizzasliceitem>, 
    <harvestcraft:pizzasliceitem>, 
    <natura:edibles:8>, 
    <natura:edibles:8>,
    <liquid:if.protein> * 1000
]);


TEImbuer.addRecipe(<liquid:haste_potion> * 500, <appliedenergistics2:material:2>, <liquid:potion>.withTag({Potion: "cofhcore:haste4"}) * 500, 3000);
TEImbuer.addRecipe(<liquid:speed_potion> * 500, <appliedenergistics2:material:3>, <liquid:potion>.withTag({Potion: "cofhcore:swiftness4"}) * 500, 3000);
scripts.helper.addFluidMixerRecipe(<liquid:mekanization_catalyst> * 200, 
    <liquid:haste_potion> * 100,
    <liquid:speed_potion> * 100,
    <actuallyadditions:item_dust:7>,
    32, 80
);
scripts.helper.addFluidMixerRecipe(<liquid:sea_water> * 1000,
    <liquid:water> * 1000,
    <liquid:witchwater> * 100,
    <alchemistry:mineral_salt>, 
    32, 80
);



scripts.helper.addFluidAlloyerRecipe(
    <contenttweaker:irradiated_compound>, 
    <immersiveengineering:metal:5> * 2, <bigreactors:ingotyellorium>, <liquid:emerald> * 2000, 
    128, 40
);
scripts.helper.addFluidAlloyerRecipe(
    <contenttweaker:medical_alloy_ingot> * 3,
    <contenttweaker:titanium_ingot>, <contenttweaker:angel_ingot> * 8, <liquid:sterile_water> * 1000,
    512, 200
);

//TEImbuer.addRecipe(<liquid:ore_drill> * 500, <contenttweaker:wear_resistant_alloy_dust>, <liquid:petrotheum> * 1000, 5000);

// angel

//blocks


recipes.addShapeless(
    "ia_soap1",
    <contenttweaker:soap> * 3,
    [<harvestcraft:coconutmilkitem>, <harvestcraft:coconutmilkitem>,
    <harvestcraft:limeitem> | <harvestcraft:lemonitem>,
    <prodigytech:ash>, <prodigytech:primordium>, <contenttweaker:naoh>]
);
recipes.addShapeless(
    "ia_soap2",
    <contenttweaker:soap> * 5,
    [<harvestcraft:coconutmilkitem>, <harvestcraft:coconutmilkitem>,
    <harvestcraft:lemonaideitem>,
    <prodigytech:ash>, <prodigytech:primordium>, <contenttweaker:naoh>]
);
<contenttweaker:soap>.addTooltip("Kills 99% of bacteria");

recipes.addShaped("ia_palladium_mesh", <contenttweaker:palladium_mesh>, [
	[<contenttweaker:palladium_rod>, <contenttweaker:palladium_rod>, <contenttweaker:palladium_rod>], 
	[<contenttweaker:palladium_rod>, <exnihilocreatio:item_mesh:4>, <contenttweaker:palladium_rod>], 
	[<contenttweaker:palladium_rod>, <contenttweaker:palladium_rod>, <contenttweaker:palladium_rod>]
]);


recipes.addShapeless("ia_food_pellet", <contenttweaker:food_pellet>, 
    [
        <fluid:nutrient_distillation> * 1000, 
        <fluid:mushroom_stew> * 1000, 
        <fluid:honey> * 1000, 
        <fluid:meat> * 1000, 
        <fluid:syrup> * 1000, 
        <contenttweaker:enspiced_spicy_bioblend>
    ]
);


{//bloodmagic buckets
    //i hate bloodmagic
    recipes.addShaped("bucket_obsidian", <contenttweaker:bucket_obsidian>, [
        [<ore:plateRefinedObsidian>, <minecraft:bucket>, <ore:plateRefinedObsidian>], 
        [null, <ore:obsidian>, null]
    ]);
    Transposer.addFillRecipe(
        <contenttweaker:bucket_obsidian_residue>,
        <contenttweaker:bucket_obsidian>, <liquid:lava_residue> * 1000,
        1000
    );
    Transposer.addFillRecipe(
        <contenttweaker:bucket_obsidian_void>,
        <contenttweaker:bucket_obsidian>, <liquid:ender_distillation> * 1000,
        1000
    );

    <contenttweaker:bucket_water>.addTooltip("One would imagine that any bucket is watertight.");
    recipes.addShaped("bucket_water", <contenttweaker:bucket_water>, [
        [<contenttweaker:watertight_steel_plate>, <minecraft:bucket>, <contenttweaker:watertight_steel_plate>], 
        [null, <contenttweaker:watertight_steel_plate>, null]
    ]);
    Transposer.addFillRecipe(
        <contenttweaker:bucket_water_heavy>,
        <contenttweaker:bucket_water>, <liquid:heavywater> * 1000,
        1000
    );
    Transposer.addFillRecipe(
        <contenttweaker:bucket_water_seaweed>,
        <contenttweaker:bucket_water>, <liquid:seaweed_rich_water> * 1000,
        1000
    );

    recipes.addShaped("bucket_cursed", <contenttweaker:bucket_cursed>, [
        [<contenttweaker:cursed_gold_plate>, <minecraft:bucket>, <contenttweaker:cursed_gold_plate>], 
        [null, <contenttweaker:cursed_gold_plate>, null]
    ]);
    Transposer.addFillRecipe(
        <contenttweaker:bucket_cursed_sand>,
        <contenttweaker:bucket_cursed>, <liquid:sand> * 1000,
        1000
    );
    
    recipes.addShaped("bucket_valk", <contenttweaker:bucket_valk>, [
        [<ore:ingotValkyrie>, <minecraft:bucket>, <ore:ingotValkyrie>], 
        [null, <ore:ingotValkyrie>, null]
    ]);
    Transposer.addFillRecipe(
        <contenttweaker:bucket_valk_cloud>,
        <contenttweaker:bucket_valk>, <liquid:cloud_seed> * 1000,
        1000
    );

    recipes.addShaped("bucket_bio", <contenttweaker:bucket_bio>, [
        [<contenttweaker:flower_steel_plate>, <minecraft:bucket>, <contenttweaker:flower_steel_plate>], 
        [null, <contenttweaker:flower_steel_plate>, null]
    ]);
    Transposer.addFillRecipe(
        <contenttweaker:bucket_bio_diesel>,
        <contenttweaker:bucket_bio>, <liquid:biodiesel> * 1000,
        1000
    );

    recipes.addShaped("bucket_acid", <contenttweaker:bucket_acid>, [
        [<contenttweaker:acid_resistant_steel_plate>, <minecraft:bucket>, <contenttweaker:acid_resistant_steel_plate>], 
        [null, <contenttweaker:acid_resistant_steel_gear>, null]
    ]);
    Transposer.addFillRecipe(
        <contenttweaker:bucket_acid_chitin>,
        <contenttweaker:bucket_acid>, <liquid:acidic_chitin> * 1000,
        10000
    );

    Transposer.addFillRecipe(
        <contenttweaker:bucket_tree_oil>,
        <aether_legacy:skyroot_bucket>, <liquid:tree_oil> * 2000,
        10000
    );
    Transposer.addFillRecipe(
        <contenttweaker:bucket_tree_oil>,
        <aether_legacy:skyroot_bucket>, <liquid:skyroot> * 250,
        1000
    );
}

//research
recipes.addShapeless(
    "ia_glass_cutter_research_token",
    <contenttweaker:glass_cutter_research_token>,
    [<extrautils2:glasscutter>.noReturn()]
);
recipes.addShapeless(
    "ia_steel_hoe_research_token",
    <contenttweaker:steel_hoe_research_token>,
    [<immersiveengineering:hoe_steel>.noReturn()]
);

recipes.addShapeless(
    "ia_empty_ingot", <contenttweaker:empty_ingot> * 8,
    [<minecraft:brick>]
);








<contenttweaker:dummy>.addTooltip("Pay this no mind");
furnace.remove(<contenttweaker:dummy>);