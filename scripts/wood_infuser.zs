import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;
import mods.contenttweaker.BlockState;
import crafttweaker.block.IBlockState;
import crafttweaker.world.IVector3d;

import mods.requious.Assembly;

import mods.requious.ComponentFace;
import mods.requious.SlotVisual;
import mods.requious.AssemblyRecipe;
import mods.requious.Variable;
import mods.requious.Parameter;

static Wood_infuser as Assembly = <assembly:wood_infuser>;
{
    Wood_infuser.setItemSlot(4, 1, ComponentFace.all(), 64)
        .setAccess(true, false)
        .setGroup("input");
    Wood_infuser.setItemSlot(4, 2, ComponentFace.all(), 64)
        .setAccess(true, false)
        .setGroup("input");
    Wood_infuser.setItemSlot(4, 3, ComponentFace.all(), 64)
        .setAccess(true, false)
        .setGroup("input");
    

    Wood_infuser.setDurationSlot(5, 2)
        .setVisual(mods.requious.SlotVisual.arrowRight())
        .setHidden()
        .setGroup("duration");

    Wood_infuser.setItemSlot(7, 3, ComponentFace.all(), 64)
        .setAccess(false, true)
        .setHandAccess(false, true)
        .setGroup("output");
    
    
    Wood_infuser.setJEIItemSlot(0, 0, "input_log");
    Wood_infuser.setJEIItemSlot(0, 1, "input");
    Wood_infuser.setJEIItemSlot(0, 2, "input");
    Wood_infuser.setJEIItemSlot(0, 3, "input");
    Wood_infuser.setJEIItemSlot(0, 4, "fire");
    Wood_infuser.setJEIDurationSlot(2, 2, "duration", SlotVisual.create(1,1).addPart("requious:textures/gui/assembly_gauges.png", 0, 8));
    Wood_infuser.setJEIItemSlot(4, 1, "output_log");
    Wood_infuser.setJEIItemSlot(4, 3, "output");
    
}

recipes.addShaped("ia_wood_infuser", <requious:wood_infuser>, [
    [<engineersdecor:treated_wood_pole>, <exnihilocreatio:item_mesh:2>, <engineersdecor:treated_wood_pole>],
    [<engineersdecor:treated_wood_pole>, <exnihilocreatio:item_mesh:2>, <engineersdecor:treated_wood_pole>],
    [<engineersdecor:treated_wood_pole>, <exnihilocreatio:item_mesh:2>, <engineersdecor:treated_wood_pole>]
]);


function addWoodInfuseFire(wood_out as IBlockState, wood_in as IBlockState, inputItem as IIngredient[], time_t as int){
    var recipe = AssemblyRecipe.create(function(container) {
        container.addWorldOutput(function(container){
            var state2 = container.world.getBlockState(container.pos.getOffset(crafttweaker.world.IFacing.up(),1));
            if (state2 == wood_in)
                container.world.setBlockState(wood_out, container.pos.getOffset(crafttweaker.world.IFacing.up(),1));
            return true;
        });
        if (container.random.nextDouble() > 0.75)
            container.addItemOutput("output", <biomesoplenty:ash>);
    });
    for i in inputItem {
        recipe = recipe.requireItem("input", i);
    }
    recipe.requireWorldCondition("world", function(container){
            var state = container.world.getBlockState(container.pos.getOffset(crafttweaker.world.IFacing.down(),1));
            var state2 = container.world.getBlockState(container.pos.getOffset(crafttweaker.world.IFacing.up(),1));
            return (
                (state.block.definition.id == "minecraft:fire") || (state.block.definition.id == "biomesoplenty:blue_fire")
                ) && (state2 == wood_in);
        }, 20
    );
    recipe.setActive(time_t).requireDuration("duration", time_t);
    

    Wood_infuser.addRecipe(recipe);
    
}
function addWoodInfuseFireJEI(wood_out as IItemStack, wood_in as IIngredient, inputItem as IIngredient[]){
    var recipe = AssemblyRecipe.create(function(container) {
        container.addItemOutput("output_log", wood_out);
        container.addItemOutput("output", <biomesoplenty:ash>.withDisplayName("25% chance of making"));
        
    });
    for i in inputItem {
        recipe = recipe.requireItem("input", i);
    }
    recipe.requireItem("input_log", wood_in);
    recipe.requireItem("fire", <minecraft:flint_and_steel>.withDisplayName("Normal Fire or Blue Fire"));
    //recipe.requireDuration("duration", time_t).setActive(time_t);
    

    Wood_infuser.addJEIRecipe(recipe);
}


function addWoodInfuseBlueFire(wood_out as IBlockState, wood_in as IBlockState, inputItem as IIngredient[], time_t as int){
    var recipe = AssemblyRecipe.create(function(container) {
        container.addWorldOutput(function(container){
            var state2 = container.world.getBlockState(container.pos.getOffset(crafttweaker.world.IFacing.up(),1));
            if (state2 == wood_in)
                container.world.setBlockState(wood_out, container.pos.getOffset(crafttweaker.world.IFacing.up(),1));
            return true;
        });
        if (container.random.nextDouble() > 0.75)
            container.addItemOutput("output", <biomesoplenty:ash>);
    });
    for i in inputItem {
        recipe = recipe.requireItem("input", i);
    }
    recipe.requireWorldCondition("world", function(container){
            var state = container.world.getBlockState(container.pos.getOffset(crafttweaker.world.IFacing.down(),1));
            var state2 = container.world.getBlockState(container.pos.getOffset(crafttweaker.world.IFacing.up(),1));
            return (state.block.definition.id == "biomesoplenty:blue_fire") && (state2 == wood_in);
        }, 20
    );
    recipe.setActive(time_t).requireDuration("duration", time_t);
    

    Wood_infuser.addRecipe(recipe);
    
}
function addWoodInfuseBlueFireJEI(wood_out as IItemStack, wood_in as IIngredient, inputItem as IIngredient[]){
    var recipe = AssemblyRecipe.create(function(container) {
        container.addItemOutput("output_log", wood_out);
        container.addItemOutput("output", <biomesoplenty:ash>.withDisplayName("25% chance of making"));
        
    });
    for i in inputItem {
        recipe = recipe.requireItem("input", i);
    }
    recipe.requireItem("input_log", wood_in);
    recipe.requireItem("fire", <biomesoplenty:jar_filled:1>.withDisplayName("Blue Fire"));
    //recipe.requireDuration("duration", time_t).setActive(time_t);
    

    Wood_infuser.addJEIRecipe(recipe);
}




recipes.remove(<mysticalworld:charred_log>);
addWoodInfuseFire(<blockstate:mysticalworld:charred_log:axis=y>, <blockstate:minecraft:log:variant=oak>, [<ore:string>, <actuallyadditions:item_misc:11> * 2], 20);
addWoodInfuseFireJEI(<mysticalworld:charred_log>, <minecraft:log>, [<ore:string>, <actuallyadditions:item_misc:11> * 2]);

addWoodInfuseFire(
    <blockstate:aether_legacy:aether_log:aether_legacy_double_drops=false,axis=y,aether_logs=golden_oak_log>, <blockstate:aether_legacy:aether_log:aether_legacy_double_drops=false,axis=y,aether_logs=skyroot_log>, [
        <thermalfoundation:material:1> * 2
    ], 20
);
addWoodInfuseFire(
    <blockstate:aether_legacy:aether_log:aether_legacy_double_drops=false,axis=y,aether_logs=golden_oak_log>, <blockstate:aether_legacy:aether_log:aether_legacy_double_drops=false,axis=y,aether_logs=skyroot_log>, [
        <contenttweaker:goold>
    ], 20
);
addWoodInfuseFireJEI(<aether_legacy:aether_log:1>, <aether_legacy:aether_log>, [<thermalfoundation:material:1> * 2]);
addWoodInfuseFireJEI(<aether_legacy:aether_log:1>, <aether_legacy:aether_log>, [<contenttweaker:goold>]);

addWoodInfuseFire(
    <blockstate:twilightforest:root:variant=liveroot>, <blockstate:twilightforest:root:variant=root>, [
        <twilightforest:ironwood_ingot>,
        <harvestcraft:ediblerootitem> * 4,
        <contenttweaker:ashen_biocoal> * 2
], 20);
addWoodInfuseFireJEI(<twilightforest:root:1>, <twilightforest:root>, [
        <twilightforest:ironwood_ingot>,
        <harvestcraft:ediblerootitem> * 4,
        <contenttweaker:ashen_biocoal> * 2
]);
addWoodInfuseBlueFire(
    <blockstate:twilightforest:root:variant=liveroot>, <blockstate:twilightforest:root:variant=root>, [
        <twilightforest:ironwood_ingot>,
        <harvestcraft:ediblerootitem> * 2,
        <contenttweaker:biocoal>
], 20);
addWoodInfuseBlueFireJEI(<twilightforest:root:1>, <twilightforest:root>, [
        <twilightforest:ironwood_ingot>,
        <harvestcraft:ediblerootitem> * 2,
        <contenttweaker:biocoal>
]);



addWoodInfuseBlueFire(
    <blockstate:contenttweaker:entwood_block>, <blockstate:contenttweaker:revived_log>, [
        <contenttweaker:entwood> * 2,
        <contenttweaker:activated_biopower> * 5,
        <bloodmagic:component:5> * 4
], 20);
addWoodInfuseBlueFireJEI(<contenttweaker:entwood_block>, <contenttweaker:revived_log>, [
        <contenttweaker:entwood> * 2,
        <contenttweaker:activated_biopower> * 5,
        <bloodmagic:component:5> * 4
]);


addWoodInfuseFire(
    <blockstate:mekanism:saltblock>, <blockstate:alchemistry:wet_sand>, [
        <ore:dyeWhite>
], 20);
addWoodInfuseFireJEI(<mekanism:saltblock>, <alchemistry:wet_sand>, [
        <ore:dyeWhite>
]);



addWoodInfuseBlueFire(
    <blockstate:contenttweaker:divine_mud>, <blockstate:contenttweaker:glowshroomite_mud>, [
        <contenttweaker:reagent_bug>,
        <tconevo:earth_material_block> * 16,
        <contenttweaker:empowered_shard> * 4
], 20);
addWoodInfuseBlueFireJEI(<contenttweaker:divine_mud>, <contenttweaker:glowshroomite_mud>, [
        <contenttweaker:reagent_bug>,
        <tconevo:earth_material_block> * 16,
        <contenttweaker:empowered_shard> * 3
]);




//ores
for stone,ore_list in {
    <minecraft:stone>: {
        <thermalfoundation:material>: <minecraft:iron_ore>,
        <thermalfoundation:material:1>: <minecraft:gold_ore>,
        <thermalfoundation:material:768>: <minecraft:coal_ore>,
        <enderio:item_material:32>: <minecraft:lapis_ore>,
        <minecraft:redstone>: <minecraft:redstone_ore>,
        <appliedenergistics2:material:3>: <netherendingores:ore_other_1>,

        <appliedenergistics2:material:2>: <appliedenergistics2:quartz_ore>, 

        <thermalfoundation:material:64>: <thermalfoundation:ore>,
        <thermalfoundation:material:65>: <thermalfoundation:ore:1>,
        <thermalfoundation:material:66>: <thermalfoundation:ore:2>,
        <thermalfoundation:material:67>: <thermalfoundation:ore:3>,
        <thermalfoundation:material:68>: <thermalfoundation:ore:4>,
        <thermalfoundation:material:69>: <thermalfoundation:ore:5>,

        <exnihilocreatio:item_ore_cobalt:2>: <netherendingores:ore_other_1:4>,
        <exnihilocreatio:item_ore_ardite:2>: <netherendingores:ore_other_1:2>,

        <contenttweaker:zinc_dust>: <contenttweaker:zinc_ore>,

        <mekanism:dust:2>: <mekanism:oreblock>,
    },
    <minecraft:stone:5>: {<taiga:karmesine_dust>: <taiga:karmesine_ore>},
    <minecraft:stone:3>: {<taiga:ovium_dust>: <taiga:ovium_ore>},
    <minecraft:stone:1>: {<taiga:jauxum_dust>: <taiga:jauxum_ore>}
} as IItemStack[IItemStack][IItemStack] {
    for dust,ore in ore_list{
        mods.roots.Pyre.addRecipe(
            "ore_craft_" ~ ore.name ~ dust.name, ore,
            [
                <contenttweaker:burn_powder>,
                <thermalfoundation:material:770>,
                <extrautils2:ingredients> | <contenttweaker:mushroomite_nugget>,

                stone,
                dust
            ]
        );
    }
}