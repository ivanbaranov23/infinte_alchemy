
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;

import mods.modularmachinery.RecipeBuilder;

import mods.requious.Assembly;

import mods.requious.ComponentFace;
import mods.requious.SlotVisual;
import mods.requious.GaugeDirection;
import mods.requious.AssemblyRecipe;

<ore:sprookFood>.add(<harvestcraft:beansontoastitem>);
<ore:sprookFood>.add(<harvestcraft:beanburritoitem>);
<ore:sprookFood>.add(<harvestcraft:threebeansaladitem>);
<ore:sprookFood>.add(<twilightforest:borer_essence>);

<ore:sprook>.add(<contenttweaker:sprook1>);
<ore:sprook>.add(<contenttweaker:sprook2>);
<ore:sprook>.add(<contenttweaker:sprook3>);
<ore:sprook>.add(<contenttweaker:sprook4>);

static Feeder as Assembly = <assembly:feeder>; 
{
    Feeder.setFluidSlot(2, 2, ComponentFace.all(), 12000)
        .setAccess(true, false)
        .setGroup("input");
    Feeder.setEnergySlot(0, 2, ComponentFace.all(), 400000)
        .setAccess(true, false)
        .setGroup("power");

    Feeder.setDurationSlot(5, 2)
        .setVisual(SlotVisual.createGauge("requious:textures/gui/assembly_gauges.png", 0, 8, 1, 8, GaugeDirection.right(), false))
        .setGroup("duration");

    /*Feeder.setJEIEnergySlot(0, 1, "power");
    Feeder.setJEIItemSlot(1, 0, "input");
    Feeder.setJEIItemSlot(2, 0, "input");
    Feeder.setJEIItemSlot(3, 0, "input");
    Feeder.setJEIItemSlot(1, 1, "input");
    Feeder.setJEIItemSlot(2, 1, "input");
    Feeder.setJEIItemSlot(3, 1, "input");
    
    Feeder.setJEIFluidSlot(2, 2, "input");
    
    Feeder.setJEIDurationSlot(4, 1, "duration", SlotVisual.createGauge("requious:textures/gui/assembly_gauges.png", 0, 8, 1, 8, GaugeDirection.right(), false));
    Feeder.setJEIItemSlot(5, 1, "output0");
    Feeder.setJEIItemSlot(6, 1, "output1");*/
}

{//sprook feeder
    var recipe = AssemblyRecipe.create(function(container) {});
	
    recipe = recipe.requireFluid("input", <liquid:lava> * 1000);
    recipe = recipe.requireEnergy("power", 20 * 1000);

    recipe.setActive(20);
    recipe = recipe.requireDuration("duration", 20);

    Feeder.addRecipe(recipe);
    //FluidSieve.addJEIRecipe(recipe);	
}
{
    var rec = RecipeBuilder.newBuilder("1", "sprook_pasture", 80);
	rec.addEnergyPerTickInput(1000);

	/*rec.addItemInput(<enderio:item_soul_vial:1>.withTag({entityId: entity}));
    rec.addItemOutput(<enderio:item_soul_vial>);

	/*if (poison_fluid){
        rec.addFluidInput(poison_fluid);
    }
	
    for drop in drops{
        rec.addItemOutput(drop);
    }
    for liquid in liquids{
        rec.addFluidOutput(liquid);
    }*/

	rec.build();
}



recipes.addShaped("ia_sprook_compress1", <contenttweaker:sprooks1>, [
    [<ore:sprook>, <ore:sprook>, <ore:sprook>],
    [<ore:sprook>, <ore:sprook>, <ore:sprook>],
    [<ore:sprook>, <ore:sprook>, <ore:sprook>]
]);
recipes.addShaped("ia_sprook_compress2", <contenttweaker:sprooks2>, [
    [<contenttweaker:sprooks1>, <contenttweaker:sprooks1>, <contenttweaker:sprooks1>],
    [<contenttweaker:sprooks1>, <contenttweaker:sprooks1>, <contenttweaker:sprooks1>],
    [<contenttweaker:sprooks1>, <contenttweaker:sprooks1>, <contenttweaker:sprooks1>]
]);
recipes.addShaped("ia_sprook_compress3", <contenttweaker:sprooks3>, [
    [<contenttweaker:sprooks2>, <contenttweaker:sprooks2>, <contenttweaker:sprooks2>],
    [<contenttweaker:sprooks2>, <contenttweaker:sprooks2>, <contenttweaker:sprooks2>],
    [<contenttweaker:sprooks2>, <contenttweaker:sprooks2>, <contenttweaker:sprooks2>]
]);
