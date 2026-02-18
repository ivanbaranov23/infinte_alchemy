import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;

import mods.roots.Pyre;
import mods.roots.Fey;
import mods.roots.Mortar;
// Removes the recipe for stalicripe; note that the quantity is not considered
// when checking if the recipe matches.
//Pyre.removeRecipe(<roots:stalicripe>);

// Re-adds the stalicripe using an addition recipe that grants no XP,
// but with considerably greater output
//Pyre.addRecipe("stalicripe", <roots:stalicripe>*64, [<minecraft:diamond_block>, <minecraft:flint_and_steel>.anyDamage().transformDamage(1), <minecraft:iron_block>, <minecraft:emerald_block>, <minecraft:deadbush>]);

import crafttweaker.block.IBlockState;
import mods.roots.predicates.Predicates;
import mods.roots.predicates.BlockStateAbove;
import mods.roots.predicates.BlockStateBelow;
import mods.roots.predicates.PropertyPredicate;
import mods.roots.predicates.StatePredicate;

import mods.roots.Rituals;

import mods.roots.Chrysopoeia;
//addRecipe(string name, IIngredient ingredient, IItemStack output);
import mods.modularmachinery.RecipeBuilder;


import mods.roots.Transmutation;
import mods.roots.SummonCreatures;
import mods.roots.FlowerGrowth;

import mods.requious.Assembly;
import mods.requious.AssemblyRecipe;
import mods.requious.SlotVisual;

import mods.dropt.Dropt;

SummonCreatures.clearLifeEssence();

recipes.remove(<roots:fey_crafter>);
recipes.addShaped("ia_fey_crafter", <roots:fey_crafter>, [
	[<ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>], 
	[<roots:petals>, <ore:craftingTableWood>, <roots:petals>], 
	[<ore:stairWood>, <harvestcraft:applejuiceitem>, <ore:stairWood>]
]);


Mortar.removeRecipe(<mysticalworld:iron_dust>);
Mortar.removeRecipe(<mysticalworld:copper_dust>);
Mortar.removeRecipe(<mysticalworld:gold_dust>);
Mortar.removeRecipe(<mysticalworld:silver_dust>);


{//terramoss
    scripts.helper.addSawRecipeWByproduct(<minecraft:mossy_cobblestone>, <minecraft:cobblestone>, <roots:terra_moss>, 50);

    scripts.helper.addSawRecipeWByproduct(<additionalcompression:cobblestonemossy_compressed:1>, <additionalcompression:cobblestonemossy_compressed:1>, <roots:terra_moss>, 100);
    scripts.helper.addSawRecipeWByproduct(<additionalcompression:cobblestonemossy_compressed:2>, <additionalcompression:cobblestonemossy_compressed:2>, <roots:terra_moss> * 2, 100);
    scripts.helper.addSawRecipeWByproduct(<additionalcompression:cobblestonemossy_compressed:3>, <additionalcompression:cobblestonemossy_compressed:3>, <roots:terra_moss> * 4, 100);
    scripts.helper.addSawRecipeWByproduct(<additionalcompression:cobblestonemossy_compressed:4>, <additionalcompression:cobblestonemossy_compressed:4>, <roots:terra_moss> * 8, 100);
    scripts.helper.addSawRecipeWByproduct(<additionalcompression:cobblestonemossy_compressed:5>, <additionalcompression:cobblestonemossy_compressed:5>, <roots:terra_moss> * 16, 100);
    scripts.helper.addSawRecipeWByproduct(<additionalcompression:cobblestonemossy_compressed:6>, <additionalcompression:cobblestonemossy_compressed:6>, <roots:terra_moss> * 32, 100);
    scripts.helper.addSawRecipeWByproduct(<additionalcompression:cobblestonemossy_compressed:7>, <additionalcompression:cobblestonemossy_compressed:7>, <roots:terra_moss> * 64, 100);
}

{//crops
    Pyre.removeRecipe(<roots:pereskia>);
    Pyre.addRecipe("ia_pereskia",
        <roots:pereskia> * 4,
        [<minecraft:beetroot>, <minecraft:red_mushroom>, <minecraft:red_flower>, <ore:tallgrass>, <ore:rootsBark>]
    );

    Pyre.removeRecipe(<roots:cloud_berry>);
    Pyre.addRecipe("ia_cloud_berry",
        <roots:cloud_berry> * 4,
        [<ore:cropEggplant>,<minecraft:brown_mushroom>, <minecraft:yellow_flower>, <ore:tallgrass>, <ore:rootsBark>]
    );

    Pyre.removeRecipe(<roots:stalicripe>);
    Pyre.addRecipe("ia_stalicripe",
        <roots:stalicripe> * 4,
        [
            <actuallyadditions:item_misc:13>, <contenttweaker:bauxite_dust>, <thermalfoundation:material>, <thermalfoundation:material:770>,
            <contenttweaker:potato_block2> | <mysticalcreations:bilim_essence>
        ]
    );
    Pyre.removeRecipe(<roots:dewgonia>);
    Pyre.addRecipe("ia_dewgonia",
        <roots:dewgonia> * 4,
        [
            <natura:materials>, <minecraft:water_bucket>, <minecraft:waterlily>, <projectred-core:resource_item:105>,
            <contenttweaker:potato_block2> | <mysticalcreations:bilim_essence>
        ]
    );
    Pyre.removeRecipe(<roots:infernal_bulb>);
    Pyre.addRecipe("ia_infernal_bulb",
        <roots:infernal_bulb> * 4,
        [
            <roots:cooked_pereskia>, <minecraft:lava_bucket>, <tconstruct:slime:4>, <minecraft:glowstone_dust>,
            <contenttweaker:potato_block2> | <mysticalcreations:bilim_essence>
        ]
    );

    Pyre.removeRecipe(<roots:baffle_cap_mushroom>);
    Pyre.addRecipe("ia_baffle_cap_mushroom",
        <roots:baffle_cap_mushroom> * 4,
        [<contenttweaker:mushroomite_ingot> | <prodigytech:heat_capacitor_1>, <roots:moonglow_leaf>, <roots:dewgonia>, <roots:stalicripe>, <roots:infernal_bulb>]
    );
}
{//crops 2 electric boogaloo
    scripts.jei.addJEIhint(
        [<minecraft:tallgrass:1>], [], 
        [
            <minecraft:tallgrass:1>.withDisplayName("Punch to get the following items:")
        ], 
        [
            <minecraft:wheat_seeds>,
            <minecraft:melon_seeds>,
            <minecraft:pumpkin_seeds>,
            <immersiveengineering:seed>,
            <exnihilocreatio:item_seed_sugarcane>,
            <actuallyadditions:item_canola_seed>
        ]
    );
    scripts.jei.addJEIhint(
        [<minecraft:tallgrass:1>], [], 
        [
            <minecraft:tallgrass:1>.withDisplayName("Punch to get the following items:")
        ], 
        [
            <roots:wildroot>,
            <minecraft:beetroot_seeds>,
            <mysticalworld:aubergine_seed>,
            <exnihilocreatio:item_seed_potato>,
            <exnihilocreatio:item_seed_carrot>,
            <extrautils2:redorchid>.withLore(["very rare"])
        ]
    );
}


Pyre.addRecipe("modularium_paste_pyre",
    <contenttweaker:modularium_paste> * 4,
    [<contenttweaker:fireclay>, <contenttweaker:fireclay>, <appliedenergistics2:material:45>, <minecraft:poisonous_potato>, <prodigytech:ash>]
);


Mortar.addRecipe("firebloom_to_blazepoweder_mortar",
    <minecraft:blaze_powder>,
    [<erebus:small_plant:4>]
);
Mortar.addRecipe("organic_green_dye_mortar",
    <enderio:item_material:48> * 2,
    [<ore:tallgrass>, <botania:dye:13>, <roots:terra_moss>, <roots:spirit_herb>, <minecraft:dye:2>]
);
Mortar.addRecipe("ia_energion_dust_mortar", 
    <prodigytech:energion_dust>, 
    [<prodigytech:inferno_crystal>, <ore:gunpowder>, <prodigytech:fuel_pellet_16>, <ore:foodCarrotjuice>, <ore:foodApplejuice>]
);

Fey.addRecipe("ia_runic_shears",
    <roots:runic_shears:300>,
    [
        <roots:wooden_shears>, 
        <prodigytech:charred_stone>, 
        <prodigytech:charred_stone>, 
        <appliedenergistics2:material:45>, 
        <appliedenergistics2:material:45>
    ]
);

Fey.removeRecipe(<roots:runestone>);
Fey.addRecipe("ia_runestone", <roots:runestone> * 4, 
    [<prodigytech:charred_stone>, <prodigytech:charred_stone>, <prodigytech:charred_stone>,<roots:cloud_berry>, <roots:pereskia>]
);
scripts.helper.addSimpleCrushingRecipe(<roots:runestone>, <roots:runic_dust>);

Fey.removeRecipe(<roots:elemental_soil>);
Fey.addRecipe("ia_elemental_soil", <roots:elemental_soil> * 4, 
    [<ore:compressed1xDirt>, <botania:fertilizer>, <minecraft:bone_block>, <roots:stalicripe>, <ore:dustCharcoal>]
);
Fey.addRecipe("ia_elemental_soil2", <roots:elemental_soil> * 6, 
    [<mysticalagriculture:dirt_essence>, <botania:fertilizer>, <minecraft:bone_block>, <roots:stalicripe>, <ore:dustCharcoal>]
);


Fey.removeRecipe(<roots:runic_crafter>);
Fey.addRecipe("ia_runic_crafter", <roots:runic_crafter>, 
    [<roots:fey_crafter>, <roots:chiseled_runed_obsidian>, <roots:chiseled_runed_obsidian>, <contenttweaker:flower_steel_gear>, <thermalfoundation:fertilizer:2>]
);



{
    Fey.removeRecipe(<roots:living_pickaxe>);
    Fey.addRecipe("living_pick", <roots:living_pickaxe>, [
        <exnihilocreatio:hammer_iron>,
        <roots:terra_moss>,
        <minecraft:iron_pickaxe>,
        <roots:bark_wildwood>,
        <roots:bark_wildwood>
    ]);
    Fey.removeRecipe(<roots:terrastone_pickaxe>);
    Fey.addRecipe("terrastone_pick", <roots:terrastone_pickaxe>, [
        <exnihilocreatio:hammer_diamond>,
        <roots:terra_moss>,
        <roots:living_pickaxe>,
        <roots:bark_wildwood>,
        <roots:bark_wildwood>
    ]);


    recipes.addShaped("ia_arrowrootitem", <harvestcraft:arrowrootitem>, [
        [<mysticalcreations:bilim_essence>, <minecraft:arrow>, <mysticalcreations:bilim_essence>], 
        [<minecraft:arrow>, <minecraft:arrow>, <minecraft:arrow>], 
        [<mysticalcreations:bilim_essence>, <minecraft:arrow>, <mysticalcreations:bilim_essence>]
    ]);
    Fey.removeRecipe(<roots:living_arrow>);
    Fey.addRecipe("living_arrow1", <roots:living_arrow> * 4, [
        <minecraft:arrow>,
        <minecraft:arrow>,
        <harvestcraft:arrowrootitem>,
        <harvestcraft:arrowrootitem>,
        <roots:terra_moss>
    ]);
    Fey.addRecipe("living_arrow2", <roots:living_arrow> * 32, [
        <minecraft:spectral_arrow>,
        <minecraft:spectral_arrow>,
        <harvestcraft:arrowrootitem>,
        <harvestcraft:arrowrootitem>,
        <roots:terra_moss>
    ]);
    Fey.addRecipe("living_arrow3", <roots:living_arrow> * 256, [
        <aether_legacy:dart:1> | <aether_legacy:dart:2>,
        <aether_legacy:dart:1> | <aether_legacy:dart:2>,
        <harvestcraft:arrowrootitem>,
        <harvestcraft:arrowrootitem>,
        <roots:terra_moss>
    ]);
}




scripts.jei.addJEIhint(
    [<roots:wildroot>, <minecraft:farmland>], [], 
    [<roots:pyre>, <roots:ritual_wildroot_growth>], 
    [<roots:wildwood_log>]
);
{//burn powder
    Mortar.addRecipe("burn_powder1", <contenttweaker:burn_powder> * 4, [
        <mysticalworld:charred_log>, <mysticalworld:charred_log>,
        <tconstruct:edible:34>, <thermalfoundation:material:771>, <erebus:small_plant:4>
    ]);

    
}


recipes.remove(<roots:staff>);
recipes.addShaped("roots_staff", <roots:staff>.withTag({}), [
    [null, <roots:terra_moss>, <extendedcrafting:singularity_custom:100>], 
    [<mysticalcreations:bilim_essence>, <moreplates:bronze_stick>, <roots:terra_moss>], 
    [<moreplates:bronze_stick>, <mysticalcreations:bilim_essence>, null]
]);


{//transmutation
    Transmutation.addStateToStateRecipe(
        "bedrock_test", 
        StatePredicate.create(<blockstate:contenttweaker:bedrockium_alloy_block>),
        <blockstate:minecraft:bedrock>, 
        BlockStateBelow.create(StatePredicate.create(<blockstate:minecraft:bedrock>))
    );

    Transmutation.addStateToStateRecipe(
        "umbr", 
        StatePredicate.create(<blockstate:biomesoplenty:mud_brick_block>),
        <blockstate:twilightforest:uberous_soil>,
        null
    );


    {//block -> ore
        Transmutation.addStateToStateRecipe(
            "clay_to_temple", 
            StatePredicate.create(<blockstate:tconstruct:dried_clay>),
            <blockstate:erebus:ore_temple>, 
            BlockStateBelow.create(StatePredicate.create(<blockstate:erebus:temple_tile>))
        );

        Transmutation.addStateToStateRecipe(
            "silver", 
            PropertyPredicate.create(<blockstate:natura:overworld_logs:axis=y,type=silverbell>, "type"),
            <blockstate:thermalfoundation:ore:type=silver>,
            null
        );
        Transmutation.addStateToStateRecipe(
            "silver2", 
            PropertyPredicate.create(<blockstate:natura:overworld_planks:type=silverbell>, "type"),
            <blockstate:thermalfoundation:ore:type=silver>,
            null
        );
    }


    /*Transmutation.addStateToStateRecipe(
        "flower_oak1", 
        PropertyPredicate.create(<blockstate:minecraft:sapling:type=oak> as IBlockState, "type"),
        <blockstate:biomesoplenty:sapling_1:variant=flowering>, 
        BlockStateAbove.create(StatePredicate.create(<blockstate:biomesoplenty:leaves_3:1>))
    );
    Transmutation.addStateToStateRecipe(
        "flower_oak2", 
        PropertyPredicate.create(<blockstate:minecraft:sapling:type=oak> as IBlockState, "type"),
        <blockstate:biomesoplenty:sapling_1:variant=flowering>, 
        BlockStateAbove.create(StatePredicate.create(<blockstate:biomesoplenty:leaves_3:9>))
    );*/
    Transmutation.addStateToStateRecipe(
        "flower_oak2", 
        PropertyPredicate.create(<blockstate:minecraft:sapling:type=oak> as IBlockState, "type"),
        <blockstate:biomesoplenty:sapling_1:variant=flowering>, 
        BlockStateAbove.create(StatePredicate.create(<blockstate:contenttweaker:flower_steel_block>))
    );

    Transmutation.addStateToStateRecipe(
        "sulfur", 
        PropertyPredicate.create(<blockstate:minecraft:wool:color=yellow> as IBlockState, "color"),
        <blockstate:natura:clouds:type=sulfur>,
        null //BlockStateAbove.create(StatePredicate.create(<blockstate:contenttweaker:flower_steel_block>))
    );

    Transmutation.addStateToStateRecipe(
        "cordy", 
        StatePredicate.create(<blockstate:minecraft:brown_mushroom>),
        <blockstate:mod_lavacow:cordy_shroom:age=0>, 
        BlockStateAbove.create(PropertyPredicate.create(<blockstate:tconstruct:metal:type=pigiron> as IBlockState, "type"))
    );
    Transmutation.addStateToStateRecipe(
        "bloodshroom", 
        StatePredicate.create(<blockstate:minecraft:red_mushroom>),
        <blockstate:mod_lavacow:bloodtooth_shroom:age=0>, 
        BlockStateAbove.create(PropertyPredicate.create(<blockstate:tconstruct:metal:type=pigiron> as IBlockState, "type"))
    );

}
{//rituals recipes
    Rituals.modifyRitual(
        "ritual_grove_supplication",
        [<ore:slimeball>, <ore:rootsBark>, <minecraft:paper>, <minecraft:baked_potato>, <exnihilocreatio:item_material:3>] 
    );
}
{//spells recipes
    Mortar.changeSpell(
        "spell_chrysopoeia",    
        [<roots:runic_dust>, <roots:infernal_bulb>, <darkutils:material>, <tconstruct:edible:3>, <roots:bark_wildwood>]  
    );

    Mortar.changeSpell(
        "spell_radiance",    
        [<prodigytech:ferramic_handbow>, <xreliquary:glowing_water>, <projectred-core:resource_item:504>, <contenttweaker:glowcrystal>, <forge:bucketfilled>.withTag({FluidName: "glass", Amount: 1000})]  
    );

    Mortar.changeSpell(
        "spell_sky_soarer",    
        [<extrautils2:angelblock>, <forge:bucketfilled>.withTag({FluidName: "glowstone", Amount: 1000}), <roots:mystic_feather>, <mekanism:balloon:*>, <mekanism:balloon:*>]  
    );

    Mortar.changeSpell(
        "spell_growth_infusion",    
        [
            <minecraft:bone_block>, <thermalfoundation:material:865>, <thermalfoundation:material:865>, 
            <contenttweaker:fertilizer2>, <mysticalagriculture:fertilized_essence>
        ]  
    );

    Mortar.changeSpell(
        "spell_fey_light",    
        [<roots:glass_eye>, <contenttweaker:glowcrystal>, <minecraft:double_plant>, <roots:cloud_berry>, <roots:cloud_berry>]  
    );
}


Rituals.modifyRitual("ritual_summon_creatures",
    [
        <excompressum:bait:2>,
        <darkutils:material>,
        <roots:moonglow_leaf>,
        <roots:moonglow_leaf>,
        <roots:bark_wildwood>
    ]
);
Rituals.getRitual("ritual_summon_creatures").setInteger("interval", 60);

Rituals.modifyRitual("ritual_healing_aura",
    [
        <bhc:red_heart>,
        <contenttweaker:iron_apple>,
        <roots:terra_moss>,
        <roots:bark_birch>, <roots:bark_birch>
    ]
);
Rituals.getRitual("ritual_healing_aura").setFloat("amount", 6.0);
Rituals.getRitual("ritual_healing_aura").setFloat("player_amount", 2.0);


Rituals.getRitual("ritual_transmutation").setInteger("radius_x", 8);
Rituals.getRitual("ritual_transmutation").setInteger("radius_z", 8);
Rituals.getRitual("ritual_transmutation").setInteger("interval", 25);
Rituals.modifyRitual("ritual_transmutation", [
    <roots:moonglow_leaf>, <roots:chiseled_runestone>, 
    <moretcon:carbonpile>, <actuallyadditions:item_misc:9>, <appliedenergistics2:material:45>
]);

{//flower ritual
    <ore:netherMycelium>.add(<biomesoplenty:grass:8>);
    <ore:netherMycelium>.add(<betternether:nether_mycelium>);
    //addRecipeItemOnSoils(
    //    string name,      // The name of the recipe that you're adding
    //    IItemStack stack, // The itemstack describing an itemblock to be placed
    //    List allowedSoils // A list of blocks that this flower can be placed on
    //);


    
    Rituals.modifyRitual("ritual_flower_growth",
        [
            <botania:fertilizer>,
            <roots:baffle_cap_mushroom> | <contenttweaker:weak_enhancer>,
            <ore:rootsBark>,
            <immersiveengineering:material:4>,
            <immersiveengineering:material:4>
        ]
    );

    Rituals.getRitual("ritual_flower_growth").setInteger("interval", 4);



    val flower_recipes as IItemStack[string] = {
        ia_mushroom_red: <minecraft:red_mushroom>,
        ia_mushroom_brown: <minecraft:brown_mushroom>,

        ia_glowshroom1: <natura:nether_glowshroom>,
        ia_glowshroom2: <natura:nether_glowshroom:1>,
        ia_glowshroom3: <natura:nether_glowshroom:2>,

        ia_roots_mushroom: <roots:baffle_cap_mushroom>,

        ia_botania_flower0: <botania:flower>,
        ia_botania_flower1: <botania:flower:1>,
        ia_botania_flower2: <botania:flower:2>,
        ia_botania_flower3: <botania:flower:3>,
        ia_botania_flower4: <botania:flower:4>,
        ia_botania_flower5: <botania:flower:5>,
        ia_botania_flower6: <botania:flower:6>,
        ia_botania_flower7: <botania:flower:7>,
        ia_botania_flower8: <botania:flower:8>,
        ia_botania_flower9: <botania:flower:9>,
        ia_botania_flower10: <botania:flower:10>,
        ia_botania_flower11: <botania:flower:11>,
        ia_botania_flower12: <botania:flower:12>,
        ia_botania_flower13: <botania:flower:13>,
        ia_botania_flower14: <botania:flower:14>,
        ia_botania_flower15: <botania:flower:15>,

        ia_botania_mushroom0: <botania:mushroom>,
        ia_botania_mushroom1: <botania:mushroom:1>,
        ia_botania_mushroom2: <botania:mushroom:2>,
        ia_botania_mushroom3: <botania:mushroom:3>,
        ia_botania_mushroom4: <botania:mushroom:4>,
        ia_botania_mushroom5: <botania:mushroom:5>,
        ia_botania_mushroom6: <botania:mushroom:6>,
        ia_botania_mushroom7: <botania:mushroom:7>,
        ia_botania_mushroom8: <botania:mushroom:8>,
        ia_botania_mushroom9: <botania:mushroom:9>,
        ia_botania_mushroom10: <botania:mushroom:10>,
        ia_botania_mushroom11: <botania:mushroom:11>,
        ia_botania_mushroom12: <botania:mushroom:12>,
        ia_botania_mushroom13: <botania:mushroom:13>,
        ia_botania_mushroom14: <botania:mushroom:14>,
        ia_botania_mushroom15: <botania:mushroom:15>,

        quark_glowshroom: <quark:glowshroom>,

        sapling_palm: <atum:palm_sapling>,
        sapling_floweroak: <biomesoplenty:sapling_1:5>,
        sapling_balsam: <erebus:sapling_balsam>,
        sapling_mossbark: <erebus:sapling_mossbark>,
        sapling_bamboo: <erebus:sapling_bamboo>,
        //sapling_bamboo2: <biomesoplenty:sapling_0:2>,
        sapling_amaranth: <natura:overworld_sapling:2>,
        sapling_blossom: <quark:variant_sapling:1>,
        sapling_ghost: <natura:nether_sapling>,

        nettle1: <erebus:small_plant>,
        nettle2: <erebus:small_plant:1>,

        bone_mushroom: <betternether:bone_mushroom>,
        egg_plant: <betternether:egg_plant>,

        origin: <biomesoplenty:flower_1:5>,

        ame1: <caves_n_cliffs:small_amethyst_bud>,
        ame2: <caves_n_cliffs:medium_amethyst_bud>, 
        ame3: <caves_n_cliffs:large_amethyst_bud>, 
        ame4: <caves_n_cliffs:amethyst_cluster>,
        ame5: <caves_n_cliffs:amethyst_cluster_single>
    };
    val flower_soils as IIngredient[string] = {
        ia_mushroom_red: <minecraft:mycelium>,
        ia_mushroom_brown: <minecraft:mycelium>,

        ia_glowshroom1: <natura:nether_tainted_soil>,
        ia_glowshroom2: <natura:nether_tainted_soil>,
        ia_glowshroom3: <natura:nether_tainted_soil>,

        ia_roots_mushroom: <minecraft:mycelium>,

        ia_botania_mushroom0: <minecraft:mycelium>,
        ia_botania_mushroom1: <minecraft:mycelium>,
        ia_botania_mushroom2: <minecraft:mycelium>,
        ia_botania_mushroom3: <minecraft:mycelium>,
        ia_botania_mushroom4: <minecraft:mycelium>,
        ia_botania_mushroom5: <minecraft:mycelium>,
        ia_botania_mushroom6: <minecraft:mycelium>,
        ia_botania_mushroom7: <minecraft:mycelium>,
        ia_botania_mushroom8: <minecraft:mycelium>,
        ia_botania_mushroom9: <minecraft:mycelium>,
        ia_botania_mushroom10: <minecraft:mycelium>,
        ia_botania_mushroom11: <minecraft:mycelium>,
        ia_botania_mushroom12: <minecraft:mycelium>,
        ia_botania_mushroom13: <minecraft:mycelium>,
        ia_botania_mushroom14: <minecraft:mycelium>,
        ia_botania_mushroom15: <minecraft:mycelium>,

        quark_glowshroom: <quark:glowcelium>,

        sapling_palm: <twilightforest:uberous_soil>,
        sapling_floweroak: <twilightforest:uberous_soil>,
        sapling_balsam: <erebus:mud>,
        sapling_mossbark: <erebus:mud>,
        sapling_bamboo: <erebus:mud>,
        sapling_blossom: <twilightforest:uberous_soil>,
        sapling_ghost: <natura:nether_tainted_soil>,

        nettle1: <erebus:mud>,
        nettle2: <erebus:mud>,

        bone_mushroom: <betternether:bone_tile>,
        egg_plant: <betternether:netherrack_moss>,

        origin: <biomesoplenty:grass:5>,

        ame1: <caves_n_cliffs:budding_amethyst>,
        ame2: <caves_n_cliffs:budding_amethyst>,
        ame3: <caves_n_cliffs:budding_amethyst>,
        ame4: <caves_n_cliffs:budding_amethyst>,
        ame5: <caves_n_cliffs:budding_amethyst>,
    };

    //jei
    var roots_flower_JEI = <assembly:roots_flower>;
    {//jei setup    
        roots_flower_JEI.setJEIItemSlot(0, 0, "soil", SlotVisual.itemSlot());
        roots_flower_JEI.setJEIDecoration(1, 0, "indicator_arrow", SlotVisual.arrowRight());
        roots_flower_JEI.setJEIItemSlot(2, 0, "flower", SlotVisual.itemSlot());

        roots_flower_JEI.addJEICatalyst(<roots:ritual_flower_growth>);
        roots_flower_JEI.addJEICatalyst(<roots:pyre>);
    }
    var anySoil as IItemStack = <minecraft:grass>.withDisplayName("Any acceptable soil");

    for flower_name in flower_recipes{
        if (flower_soils has flower_name){
            
            FlowerGrowth.addRecipeItemOnSoils(
                flower_name,
                flower_recipes[flower_name],
                [flower_soils[flower_name]]
            );

            roots_flower_JEI.addJEIRecipe(
                AssemblyRecipe.create(function(container) {
                    container.addItemOutput("flower", flower_recipes[flower_name]);
                }).requireItem("soil", flower_soils[flower_name])
            );

        }else{

            FlowerGrowth.addRecipeItem(flower_name, flower_recipes[flower_name]);

            roots_flower_JEI.addJEIRecipe(
                AssemblyRecipe.create(function(container) {
                    container.addItemOutput("flower", flower_recipes[flower_name]);
                }).requireItem("soil", anySoil)
            );

        }
    }
}


{//carved wood
    for wood, carv in {
        <minecraft:log>: <roots:runed_oak>,
        <minecraft:log:2>: <roots:runed_birch>,
        <minecraft:log:1>: <roots:runed_spruce>,
        <minecraft:log2>: <roots:runed_acacia>,
        <minecraft:log2:1>: <roots:runed_dark_oak>,
        <minecraft:log:3>: <roots:runed_jungle>,
        <roots:wildwood_log>: <roots:runed_wildwood>
    } as IItemStack[IItemStack] {
        recipes.addShapeless("ia_roots_" ~ carv.name, carv,
            [
                wood,
                <roots:wildroot>,
                <roots:diamond_knife>.anyDamage().transformDamage()
            ]
        );
    }
}

function Chrysopoeia_addRecipe(name as string, inp as IItemStack, outp as IItemStack){
    Chrysopoeia.addRecipe(name, inp, outp);
    mods.thermalexpansion.InductionSmelter.addRecipe(
        outp, 
        inp, <contenttweaker:transmut_gel>, 
        15000, 
        outp, 50
    );

}
{//Chrysopoeia
    Chrysopoeia.removeRecipeByOutput(<minecraft:iron_nugget>);
    Chrysopoeia.removeRecipeByOutput(<minecraft:gold_nugget>);
    Chrysopoeia.removeRecipeByOutput(<minecraft:iron_ingot>);
    Chrysopoeia.removeRecipeByOutput(<minecraft:gold_ingot>);

    //tier 1
    Chrysopoeia_addRecipe("iron_tin", <minecraft:iron_ingot> * 4, <thermalfoundation:material:129> * 4);
    Chrysopoeia_addRecipe("tin_cpr", <thermalfoundation:material:129> * 4, <thermalfoundation:material:128> * 4);
    Chrysopoeia_addRecipe("cpr_iron", <thermalfoundation:material:128> * 4, <minecraft:iron_ingot> * 4);

    Chrysopoeia_addRecipe("al_znc", <thermalfoundation:material:132> * 4, <contenttweaker:zinc_ingot> * 4);
    Chrysopoeia_addRecipe("znc_nkl", <contenttweaker:zinc_ingot> * 4, <thermalfoundation:material:133> * 4);
    Chrysopoeia_addRecipe("nkl_al", <thermalfoundation:material:133> * 4, <thermalfoundation:material:132> * 4);

    //tier 2
    Chrysopoeia_addRecipe("gold_lead", <minecraft:gold_ingot> * 4, <thermalfoundation:material:131> * 4);
    Chrysopoeia_addRecipe("lead_osm", <thermalfoundation:material:131> * 4, <mekanism:ingot:1> * 4);
    Chrysopoeia_addRecipe("osm_slv", <mekanism:ingot:1> * 4, <thermalfoundation:material:130> * 4);
    Chrysopoeia_addRecipe("slv_gold", <thermalfoundation:material:130> * 4, <minecraft:gold_ingot> * 4);

    Chrysopoeia_addRecipe("cob_ard", <tconstruct:ingots> * 4, <tconstruct:ingots:1> * 4);
    Chrysopoeia_addRecipe("ard_cob", <tconstruct:ingots:1> * 4, <tconstruct:ingots> * 4);

    Chrysopoeia_addRecipe("kar_ov", <taiga:karmesine_ingot> * 4, <taiga:ovium_ingot> * 4);
    Chrysopoeia_addRecipe("ov_jax", <taiga:ovium_ingot> * 4, <taiga:jauxum_ingot> * 4);
    Chrysopoeia_addRecipe("jax_ov", <taiga:jauxum_ingot> * 4, <taiga:karmesine_ingot> * 4);

    //transmut
    Chrysopoeia.addRecipe("transmut1", <contenttweaker:singularity_dust>, <contenttweaker:transmut_gel> * 2);
    Chrysopoeia.addRecipe("transmut2", <prodigytech:primordium> * 48, <contenttweaker:transmut_gel>);
    Chrysopoeia.addRecipe("transmut3", <contenttweaker:entwood_dust> * 8, <contenttweaker:transmut_gel>);
    Chrysopoeia.addRecipe("transmut4", <thermalfoundation:material:1028> * 8, <contenttweaker:transmut_gel>);

    //bamboo
    Chrysopoeia_addRecipe("bamboo1", <erebus:sapling_bamboo>, <biomesoplenty:sapling_0:2>);
    Chrysopoeia_addRecipe("bamboo2", <biomesoplenty:sapling_0:2>, <harvestcraft:bambooshootitem>);

    //entwood_dust
    Chrysopoeia_addRecipe("entwood_dust", <erebus:materials:7> * 8, <contenttweaker:entwood_dust>);
    Chrysopoeia_addRecipe("entwood_dust2", <moretcon:dustironwood> * 6, <contenttweaker:entwood_dust>);

    //twilight
    Chrysopoeia_addRecipe("borer_essence1", <erebus:materials:18> * 6, <twilightforest:borer_essence>);
    Chrysopoeia_addRecipe("borer_essence2", <mysticalagriculture:crafting> * 32, <twilightforest:borer_essence>);

    Chrysopoeia.addRecipe("twilight_sapling", <minecraft:sapling> * 16, <twilightforest:twilight_sapling>);
    Chrysopoeia_addRecipe("twilight_root", <twilightforest:root>, <twilightforest:root:1>);

    //redstone
    Chrysopoeia_addRecipe("redstone", <biomesoplenty:gem:1> * 2, <minecraft:redstone> * 8);
    //glowstone
    Chrysopoeia_addRecipe("glowstone1", <minecraft:gold_block>, <minecraft:glowstone>);
    Chrysopoeia_addRecipe("glowstone2", <minecraft:torch> * 64, <minecraft:glowstone_dust>);

    Chrysopoeia_addRecipe("eyes", <biomesoplenty:double_plant:2> * 2, <contenttweaker:primitive_eyes>);

    Chrysopoeia_addRecipe("jar", <minecraft:glass_bottle>, <biomesoplenty:jar_empty>);

    Chrysopoeia_addRecipe("germanium", <contenttweaker:evil_desert_dust> * 16, <contenttweaker:germanium_dust>);

    //quartz
    Chrysopoeia_addRecipe("certus_to", <appliedenergistics2:material:3> * 4, <appliedenergistics2:material:2> * 4);
    Chrysopoeia_addRecipe("certus_from", <appliedenergistics2:material:2> * 4, <appliedenergistics2:material:3> * 4);

    //Chrysopoeia_addRecipe("bloodshroom", <mod_lavacow:cordy_shroom>, <mod_lavacow:bloodtooth_shroom>);
    
    //caves amethyst
    Chrysopoeia_addRecipe("ame1", <prodigytech:energion_crystal_seed> * 4, <caves_n_cliffs:amethyst_cluster_single> * 4);
    Chrysopoeia_addRecipe("ame2", <caves_n_cliffs:small_amethyst_bud>, <caves_n_cliffs:amethyst_cluster_single> * 2);
    Chrysopoeia_addRecipe("ame3", <caves_n_cliffs:medium_amethyst_bud>, <caves_n_cliffs:amethyst_cluster_single> * 3);
    Chrysopoeia_addRecipe("ame4", <caves_n_cliffs:large_amethyst_bud>, <caves_n_cliffs:amethyst_cluster_single> * 4);
    Chrysopoeia_addRecipe("ame5", <caves_n_cliffs:amethyst_cluster>, <caves_n_cliffs:amethyst_cluster_single> * 8);

    Chrysopoeia_addRecipe("netherrack1", <minecraft:netherrack>, <biomesoplenty:grass:6>);
    Chrysopoeia_addRecipe("netherrack2", <betternether:netherrack_moss>, <biomesoplenty:grass:6>);
    Chrysopoeia_addRecipe("netherrack3", <biomesoplenty:grass:6>, <betternether:netherrack_moss>);

}
{//forest runes
    mods.appliedenergistics2.Inscriber.addRecipe(<contenttweaker:runewood>, 
        <contenttweaker:fine_wooden_board>, false, 
        <contenttweaker:wildwood_pulp>, <contenttweaker:steelwood_ingot>
    );
    Chrysopoeia.addRecipe("runewood_activation", <contenttweaker:runewood>, <contenttweaker:runewood_enchanted>);
    
}