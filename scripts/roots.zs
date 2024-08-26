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



{//early game pyre
    Pyre.addRecipe("charcoal_pyre",
        <minecraft:coal:1> * 3,
        [<ore:logWood>, <ore:logWood>, <ore:logWood>, <ore:logWood>, <ore:logWood>]
    );
    Pyre.addRecipe("stone_pyre", 
        <minecraft:stone> * 3, 
        [<minecraft:cobblestone>, <minecraft:cobblestone>, <minecraft:cobblestone>, <ore:rootsBark>, <minecraft:coal:1>]
    );
    Pyre.addRecipe("brick_pyre", 
        <minecraft:brick> * 3, 
        [<minecraft:clay_ball>, <minecraft:clay_ball>, <minecraft:clay_ball>, <ore:rootsBark>, <minecraft:coal:1>]
    );
    Pyre.addRecipe("firebrick_pyre", 
        <contenttweaker:firebrick> * 3, 
        [<contenttweaker:fireclay>, <contenttweaker:fireclay>, <contenttweaker:fireclay>, <ore:rootsBark>, <minecraft:coal:1>]
    );
    Pyre.addRecipe("glassshard_pyre", 
        <quark:glass_shards> * 3, 
        [<ore:sand>, <ore:sand>, <ore:sand>, <ore:rootsBark>, <minecraft:coal:1>]
    );
    Pyre.addRecipe("ia_crucible",
        <exnihilocreatio:block_crucible:1>,
        [<exnihilocreatio:block_crucible>, <ore:rootsBark>, <ore:rootsBark>, <ore:rootsBark>, <minecraft:coal:1>]
    );
    Pyre.addRecipe("ia_charred_stone",
        <prodigytech:charred_stone> * 3,
        [<ore:stone>, <ore:stone>, <ore:stone>, <ore:rootsBark>, <minecraft:coal:1>]
    );
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

    Pyre.removeRecipe(<roots:baffle_cap_mushroom>);
    Pyre.addRecipe("ia_baffle_cap_mushroom",
        <roots:baffle_cap_mushroom> * 4,
        [<contenttweaker:mushroomite_ingot>, <roots:moonglow_leaf>, <roots:dewgonia>, <roots:stalicripe>, <roots:infernal_bulb>]
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
            <immersiveengineering:seed>
        ]
    );
    scripts.jei.addJEIhint(
        [<minecraft:tallgrass:1>], [], 
        [
            <minecraft:tallgrass:1>.withDisplayName("Punch to get the following items:"),
            <minecraft:tallgrass:1>.withDisplayName("this are only some")
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
Mortar.addRecipe("coral", 
    <contenttweaker:coral_dust>,
    [<biomesoplenty:coral>, <biomesoplenty:coral:1>, <biomesoplenty:coral:2>, <biomesoplenty:coral:3>, <ore:coralFeed>]
);
<contenttweaker:coral_dust>.addTooltip("You are the second worst thing to happen to the corals");

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





scripts.jei.addJEIhint(
    [<roots:wildroot>, <minecraft:farmland>], [], 
    [<roots:pyre>, <roots:ritual_wildroot_growth>], 
    [<roots:wildwood_log>]
);
function addStaffHint(inp as IIngredient, staff as IItemStack, out as IItemStack, right as bool){
    if (right)
        scripts.jei.addJEIhint(
            [inp], [],
            [staff, <minecraft:paper>.withDisplayName("Right Click")],
            [out]
        );
    else
        scripts.jei.addJEIhint(
            [inp], [],
            [staff, <minecraft:paper>.withDisplayName("Break Using Staff")],
            [out]
        );
}
function addStaffHint2(inp as IIngredient, staff as IItemStack, out as IItemStack[], luck as bool){
    scripts.jei.addJEIhint(
        [inp], [],
        [staff, <minecraft:paper>.withDisplayName("Break Using Staff").withLore(["Staff effected by Fortune: " ~ (luck ? "yes" : "no")])],
        out
    );
}

{//staffwood
    Mortar.addRecipe("glue", 
        <contenttweaker:organic_glue>, 
        [<harvestcraft:doughitem>, <erebus:materials:40>, <erebus:materials:40>, <mekanism:salt>, <harvestcraft:snailcookeditem>]
    );
    Fey.addRecipe("staffwood",
        <contenttweaker:staffwood>,
        [<contenttweaker:organic_glue>, <biomesoplenty:bamboo>, <natura:sticks:9>, <natura:sticks:2>, <immersiveengineering:material>]
    );


    addStaffHint(<contenttweaker:kaolin_clay_block>, <contenttweaker:staffwood_clay>, <contenttweaker:forest_clay_block>, true);
    addStaffHint(<minecraft:clay>, <contenttweaker:staffwood_clay>, <tconstruct:dried_clay>, true);
    addStaffHint(<excompressum:compressed_block:5>, <contenttweaker:staffwood_clay>, <atum:khnumite_raw>, true);
    addStaffHint(<atum:khnumite_block>, <contenttweaker:staffwood_clay>, <netherendingores:ore_other_1:6>, true);

    <contenttweaker:staffwood_mushroom>.addShiftTooltip("Breaking block:", "Press Shift for Info");
    <contenttweaker:staffwood_mushroom>.addShiftTooltip("->block will be replaced with an ore");
    <contenttweaker:staffwood_mushroom>.addShiftTooltip("->staff takes 1 damage");
    <contenttweaker:staffwood_mushroom>.addShiftTooltip("->only works with a real player");
    <contenttweaker:staffwood_mushroom>.addShiftTooltip("->works with veinminer");
    <contenttweaker:staffwood_mushroom>.addShiftTooltip("Right clicking block:");
    <contenttweaker:staffwood_mushroom>.addShiftTooltip("->block turns into oreshroom");
    <contenttweaker:staffwood_mushroom>.addShiftTooltip("->breaking oreshroom with any tool turns it into an ore");
    <contenttweaker:staffwood_mushroom>.addShiftTooltip("->staff takes 2 damage");
    <contenttweaker:staffwood_mushroom>.addShiftTooltip("->can be automated");

    
    addStaffHint2(<erebus:kaizers_fingers_mushroom_block>, <contenttweaker:staffwood_mushroom>, [
        <minecraft:netherrack>,
        <biomesoplenty:flesh>,
        <minecraft:redstone_ore>,
        <biomesoplenty:gem_ore:1>,
        <thermalfoundation:ore_fluid:2>,
        <taiga:valyrium_ore>
    ], true);
    addStaffHint2(<erebus:dutch_cap_mushroom_block>, <contenttweaker:staffwood_mushroom>, [
        <erebus:amber>,
        <thermalfoundation:ore>,
        <thermalfoundation:ore:5>,
        <minecraft:gold_ore>,
        <biomesoplenty:gem_ore:7>,
        <bigreactors:oreanglesite>.withLore(["Fortune lvl >= 1"])
    ], true);
    addStaffHint2(<erebus:grandmas_shoes_mushroom_block>, <contenttweaker:staffwood_mushroom>, [
        <mysticalagriculture:inferium_ore>.withLore(["Becomes rarer with Fortune"]),
        <minecraft:emerald_ore>,
        <erebus:ore_jade>,
        <biomesoplenty:gem_ore:2>,
        <immersiveengineering:ore:5>,
        <taiga:tiberium_ore>
    ], true);
    addStaffHint2(<erebus:dark_capped_mushroom_block>, <contenttweaker:staffwood_mushroom>, [
        <contenttweaker:electrotine_ore>,
        <minecraft:lapis_ore>,
        <netherendingores:ore_other_1:4>,
        <netherendingores:ore_other_1:10>,
        <biomesoplenty:gem_ore:6>,
        <thermalfoundation:ore:6>
    ], false);
    addStaffHint2(<erebus:sarcastic_czech_mushroom_block>, <contenttweaker:staffwood_mushroom>, [
        <stygian:endobsidian>,
        <immersiveengineering:ore:2>,
        <netherendingores:ore_other_1:8>,
        <draconicevolution:draconium_ore>,
        <biomesoplenty:gem_ore:4>,
        <contenttweaker:geode_ore>.withLore(["Fortune lvl >= 1"])
    ], true);
    
    scripts.jei.addJEIhint(
        [<contenttweaker:staffwood>, <biomesoplenty:leaves_3:9>], [],
        [<minecraft:paper>.withDisplayName("Break with staff")],
        [<contenttweaker:staffwood_flower>]
    );
}
{//flower staff
    <contenttweaker:staffwood_flower>.addShiftTooltip("Breaking block:", "Press Shift for Info");
    <contenttweaker:staffwood_flower>.addShiftTooltip("->block will drop an item");
    <contenttweaker:staffwood_flower>.addShiftTooltip("->staff takes 1 damage");
    <contenttweaker:staffwood_flower>.addShiftTooltip("->only works with a real player");
    <contenttweaker:staffwood_flower>.addShiftTooltip("->works with veinminer");
    <contenttweaker:staffwood_flower>.addShiftTooltip("Right clicking block:");
    <contenttweaker:staffwood_flower>.addShiftTooltip("->block turns into flowred leaves");
    <contenttweaker:staffwood_flower>.addShiftTooltip("->breaking flowered leaves with any tool drops an item");
    <contenttweaker:staffwood_flower>.addShiftTooltip("->staff takes 1 damage");
    <contenttweaker:staffwood_flower>.addShiftTooltip("->can be automated");


    addStaffHint2(<minecraft:leaves:*>, <contenttweaker:staffwood_flower>, [
        <harvestcraft:snailrawitem>,
        <roots:petals>,
        <biomesoplenty:plant_0:12>,
        <twilightforest:steeleaf_ingot>
    ], false);
    addStaffHint2(<erebus:leaves_marshwood>, <contenttweaker:staffwood_flower>, [
        <erebus:materials:40>,
        <erebus:materials:28>,
        <erebus:materials:30>,
        <erebus:materials:31>,
        <biomesoplenty:plant_0:12>,
        <twilightforest:steeleaf_ingot>
    ], false);
}
{//burn powder
    Mortar.addRecipe("burn_powder1", <contenttweaker:burn_powder> * 8, [
        <mysticalworld:charred_log>, <mysticalworld:charred_log>,
        <tconstruct:edible:34>, <thermalfoundation:material:771>, <erebus:small_plant:4>
    ]);

    
}



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
        BlockStateBelow.create(StatePredicate.create(<blockstate:contenttweaker:flower_steel_block>))
    );


    {//block -> ore
        Transmutation.addStateToStateRecipe(
            "clay_to_temple", 
            StatePredicate.create(<blockstate:tconstruct:dried_clay>),
            <blockstate:erebus:ore_temple>, 
            BlockStateBelow.create(StatePredicate.create(<blockstate:erebus:temple_tile>))
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
}


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
            <roots:baffle_cap_mushroom>,
            <ore:rootsBark>,
            <immersiveengineering:material:4>,
            <immersiveengineering:material:4>
        ]
    );



    val flower_recipes as IItemStack[string] = {
        ia_mushroom_red: <minecraft:red_mushroom>,
        ia_mushroom_brown: <minecraft:brown_mushroom>,

        ia_glowshroom1: <natura:nether_glowshroom>,
        ia_glowshroom2: <natura:nether_glowshroom:1>,
        ia_glowshroom3: <natura:nether_glowshroom:2>,

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
        sapling_bamboo: <erebus:sapling_bamboo>,
        sapling_amaranth: <natura:overworld_sapling:2>,
        sapling_blossom: <quark:variant_sapling:1>
    };
    val flower_soils as IIngredient[string] = {
        ia_mushroom_red: <minecraft:mycelium>,
        ia_mushroom_brown: <minecraft:mycelium>,

        ia_glowshroom1: <natura:nether_tainted_soil>,
        ia_glowshroom2: <natura:nether_tainted_soil>,
        ia_glowshroom3: <natura:nether_tainted_soil>,

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
        sapling_balsam: <twilightforest:uberous_soil>,
        sapling_bamboo: <twilightforest:uberous_soil>,
        sapling_amaranth: <twilightforest:uberous_soil>,
        sapling_blossom: <twilightforest:uberous_soil>
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

{//Chrysopoeia
    Chrysopoeia.removeRecipeByOutput(<minecraft:iron_nugget>);
    Chrysopoeia.removeRecipeByOutput(<minecraft:gold_nugget>);

    //tier 1
    Chrysopoeia.addRecipe("iron_tin", <minecraft:iron_ingot> * 2, <thermalfoundation:material:129>);
    Chrysopoeia.addRecipe("tin_cpr", <thermalfoundation:material:129> * 2, <thermalfoundation:material:128>);

    Chrysopoeia.addRecipe("al_znc", <thermalfoundation:material:132> * 2, <contenttweaker:zinc_ingot>);
    Chrysopoeia.addRecipe("znc_nkl", <contenttweaker:zinc_ingot> * 2, <thermalfoundation:material:133>);
    Chrysopoeia.addRecipe("nkl_al", <thermalfoundation:material:133> * 2, <thermalfoundation:material:132>);

    //tier 2
    Chrysopoeia.addRecipe("gold_lead", <minecraft:gold_ingot> * 2, <thermalfoundation:material:131>);
    Chrysopoeia.addRecipe("lead_osm", <thermalfoundation:material:131> * 2, <mekanism:ingot:1>);
    Chrysopoeia.addRecipe("osm_slv", <mekanism:ingot:1> * 2, <thermalfoundation:material:130>);

    Chrysopoeia.addRecipe("cob_ard", <tconstruct:ingots> * 2, <tconstruct:ingots:1>);
    Chrysopoeia.addRecipe("ard_cob", <tconstruct:ingots:1> * 2, <tconstruct:ingots>);

    Chrysopoeia.addRecipe("kar_ov", <taiga:karmesine_ingot> * 2, <taiga:ovium_ingot>);
    Chrysopoeia.addRecipe("ov_jax", <taiga:ovium_ingot> * 2, <taiga:jauxum_ingot>);
    Chrysopoeia.addRecipe("jax_ov", <taiga:jauxum_ingot> * 2, <taiga:karmesine_ingot>);

    //transmut
    Chrysopoeia.addRecipe("transmut1", <contenttweaker:singularity_dust>, <contenttweaker:transmut_gel>);
    Chrysopoeia.addRecipe("transmut2", <prodigytech:primordium> * 64, <contenttweaker:transmut_gel>);
    Chrysopoeia.addRecipe("transmut3", <contenttweaker:entwood_dust> * 24, <contenttweaker:transmut_gel>);

    //bamboo
    Chrysopoeia.addRecipe("bamboo1", <erebus:sapling_bamboo>, <biomesoplenty:sapling_0:2>);
    Chrysopoeia.addRecipe("bamboo2", <biomesoplenty:sapling_0:2>, <harvestcraft:bambooshootitem>);

    //borer
    Chrysopoeia.addRecipe("borer_essence1", <erebus:materials:18> * 6, <twilightforest:borer_essence>);
    Chrysopoeia.addRecipe("borer_essence2", <mysticalagriculture:crafting> * 64, <twilightforest:borer_essence>);
}
{//forest runes
    mods.appliedenergistics2.Inscriber.addRecipe(<contenttweaker:runewood>, 
        <contenttweaker:fine_wooden_board>, false, 
        <contenttweaker:wildwood_pulp>, <contenttweaker:steelwood_ingot>
    );
    Chrysopoeia.addRecipe("runewood_activation", <contenttweaker:runewood>, <contenttweaker:runewood_enchanted>);
    
}
{//druid circle
    {//transmut gel in circle
        var gel_recs as WeightedItemStack[][][int] = {
            1: [
                [
                    <contenttweaker:singularity_dust> * 4 % 23,
                    <prodigytech:primordium> * 40,
                    <contenttweaker:elastic_clay> * 4 % 47
                ],
                [
                    <contenttweaker:singularity_dust> * 4 % 23,
                    <prodigytech:primordium> * 36,
                    <erebus:materials:7> * 4 % 80,
                    <contenttweaker:ancient_dust>
                ],
                [
                    <contenttweaker:singularity_dust> * 4 % 23,
                    <prodigytech:primordium> * 36,
                    <twilightforest:borer_essence> * 4,
                    <erebus:materials:57> * 4
                ]
            ],
            2: [
                [
                    <contenttweaker:singularity_dust> * 4 % 31,
                    <prodigytech:primordium> * 40,
                    <contenttweaker:denorm_dust> * 4 % 80,
                    <darkutils:material> * 4
                ],
                [
                    <contenttweaker:singularity_dust> * 4 % 31,
                    <prodigytech:primordium> * 32,
                    <contenttweaker:denorm_dust> * 4 % 80,
                    <mekanism:substrate> * 12,
                    <primitivemobs:spider_egg>,
                    <mod_lavacow:mimic_claw>
                ],
            ],
            3: [
                [
                    <contenttweaker:singularity_dust> * 4 % 39,
                    <prodigytech:primordium> * 32,
                    <contenttweaker:denorm_dust> * 4 % 80,
                    <mowziesmobs:foliaath_seed>,
                    <betternether:eye_seed>,
                    <thermalfoundation:material:832> * 12,
                    <tconevo:material:1> * 3
                ],
                [
                    <contenttweaker:singularity_dust> * 4 % 39,
                    <prodigytech:primordium> * 28,
                    <contenttweaker:denorm_dust> * 4 % 80,
                    <extrautils2:redorchid>,
                    <quark:soul_bead> * 3,
                    <deepmoblearning:living_matter_overworldian> * 24
                ],
            ],
            4: [
                [
                    <contenttweaker:singularity_dust> * 4 % 31,
                    <prodigytech:primordium> * 28,
                    <contenttweaker:denorm_dust> * 4 % 80,
                    <deepmoblearning:living_matter_overworldian> * 24,
                    <contenttweaker:mushroomite_ingot> * 12,
                    <aether_legacy:healing_stone> * 4,
                    <atum:fertile_soil_pile> * 8,
                    <thermalfoundation:geode> * 4
                ],
                [
                    <contenttweaker:singularity_dust> * 4 % 31,
                    <prodigytech:primordium> * 28,
                    <contenttweaker:denorm_dust> * 4 % 80,
                    <deepmoblearning:living_matter_overworldian> * 24,
                    <contenttweaker:mushroomite_ingot> * 12,
                    <aether_legacy:healing_stone> * 4,
                    <atum:fertile_soil_pile> * 8,
                    <contenttweaker:luck_particle> * 4
                ],
                [
                    <contenttweaker:singularity_dust> * 4 % 31,
                    <prodigytech:primordium> * 28,
                    <contenttweaker:denorm_dust> * 4 % 80,
                    <deepmoblearning:living_matter_overworldian> * 24,
                    <contenttweaker:mushroomite_ingot> * 12,
                    <aether_legacy:healing_stone> * 4,
                    <atum:fertile_soil_pile> * 8,
                    <contenttweaker:entwood_dust>
                ],
            ]
        };

        var counter as int = 0;
        for gel_out,recs in gel_recs{
            for items in recs{
                var rec = RecipeBuilder.newBuilder("transmut_gel" ~ counter, "druid_circle", 120);
                counter += 1;

                rec.addEnergyPerTickInput(256);


                rec.addItemOutput(<contenttweaker:transmut_gel> * gel_out);

                for itm in items{
                    rec.addItemInput(itm.stack);
                    rec.setChance(itm.chance);
                    
                }

                rec.addFluidInput(<liquid:pereskia_soup> * 1000);
                
                rec.build();
            }
        }
    }

    {//fluid_conversions
        var fluid_conversions as ILiquidStack[ILiquidStack][int[]] = {
            //transmut, fluid in, fluid out
            [1, 144 * 16, 144 * 12]: {
                <liquid:copper>: <liquid:iron>,
                <liquid:iron>: <liquid:tin>,
                <liquid:tin>: <liquid:copper>,

                <liquid:aluminum>: <liquid:zinc>,
                <liquid:zinc>: <liquid:nickel>,
                <liquid:nickel>: <liquid:aluminum>,

                <liquid:ardite>: <liquid:cobalt>,
                <liquid:cobalt>: <liquid:ardite>,

                <liquid:silver>: <liquid:gold>,
                <liquid:gold>: <liquid:lead>,
                <liquid:lead>: <liquid:osmium>,
                <liquid:osmium>: <liquid:silver>,
                
                
            }
        };

        for amounts,recs in fluid_conversions{
            for f_in,f_out in recs{
                var rec = RecipeBuilder.newBuilder("fluid_conversions" ~ f_in.name ~ "_" ~ f_out.name, "druid_circle", 80);

                rec.addEnergyPerTickInput(128);


                rec.addItemInput(<contenttweaker:transmut_gel> * amounts[0]);
                rec.addItemInput(<contenttweaker:singularity_dust> * 4);
                rec.setChance(0.08 * 3.9);
                rec.addItemInput(<contenttweaker:druidic_dust>);
                rec.setChance(0.08 * 5.9);

                rec.addItemInput(<contenttweaker:soot> * 12);

                rec.addFluidInput(f_in * amounts[1]);
                rec.addFluidOutput(f_out * amounts[2]);
                
                rec.build();
            }
        }
    }



}

