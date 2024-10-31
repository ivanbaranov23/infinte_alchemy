import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;

import mods.requious.Assembly;

import mods.requious.ComponentFace;
import mods.requious.SlotVisual;
import mods.requious.AssemblyRecipe;


static Sorter_food as Assembly = <assembly:sorter_food>;
{
    Sorter_food.setItemSlot(2, 2, ComponentFace.all(), 1)
        .setAccess(false, false)
        .setGroup("input1");
    Sorter_food.setItemSlot(4, 2, ComponentFace.all(), 1)
        .setAccess(true, false)
        .setGroup("input2");

    Sorter_food.setItemSlot(2, 1, ComponentFace.all(), 1)
        .setAccess(false, false)
        .setHidden()
        .setGroup("hidden");

    Sorter_food.setDurationSlot(5, 2)
        .setVisual(mods.requious.SlotVisual.arrowRight())
        .setGroup("duration");

    Sorter_food.setItemSlot(6, 0, ComponentFace.up(), 1)
        .setAccess(false, true)
        .setHandAccess(false, true)
        .setGroup("up");
    Sorter_food.setItemSlot(6, 4, ComponentFace.down(), 1)
        .setAccess(false, true)
        .setHandAccess(false, true)
        .setGroup("down");

    
}
static Sorter_livespan as Assembly = <assembly:sorter_livespan>;
{
    Sorter_livespan.setItemSlot(2, 2, ComponentFace.all(), 1)
        .setAccess(false, false)
        .setGroup("input1");
    Sorter_livespan.setItemSlot(4, 2, ComponentFace.all(), 1)
        .setAccess(true, false)
        .setGroup("input2");

    Sorter_livespan.setItemSlot(2, 1, ComponentFace.all(), 1)
        .setAccess(false, false)
        .setHidden()
        .setGroup("hidden");

    Sorter_livespan.setDurationSlot(5, 2)
        .setVisual(mods.requious.SlotVisual.arrowRight())
        .setGroup("duration");

    Sorter_livespan.setItemSlot(6, 0, ComponentFace.up(), 1)
        .setAccess(false, true)
        .setHandAccess(false, true)
        .setGroup("up");
    Sorter_livespan.setItemSlot(6, 4, ComponentFace.down(), 1)
        .setAccess(false, true)
        .setHandAccess(false, true)
        .setGroup("down");

    
}

var recipe_food = AssemblyRecipe.create(function(container) {
    var ref as IItemStack = container.getItem("input1");
    var liv as IItemStack = container.getItem("input2");

    var ref_f as int = 0;
    var liv_f as int = 0;
    if (ref){
        if (ref.tag.memberGet("food")) {
            ref_f += ref.tag.food.asInt();
        }
    }
    if (liv){
        if (liv.tag.memberGet("food")) {
            liv_f += liv.tag.food.asInt();
        }
    }

    if (liv_f >= ref_f) {
        container.addItemOutput("up", liv);
    }
    else {
        container.addItemOutput("down", liv);
    }
    container.addItemOutput("hidden", ref);
});
recipe_food.requireItem("input1", <ore:living>.marked("input1"));
recipe_food.requireItem("input2", <ore:living>.marked("input2"));
recipe_food.requireDuration("duration", 20 * 10);
    

Sorter_food.addRecipe(recipe_food);

var recipe_life = AssemblyRecipe.create(function(container) {
    var ref as IItemStack = container.getItem("input1");
    var liv as IItemStack = container.getItem("input2");

    var ref_f as int = 0;
    var liv_f as int = 0;
    if (ref){
        if (ref.tag.memberGet("lifespan")) {
            ref_f += ref.tag.lifespan.asInt();
        }
    }
    if (liv){
        if (liv.tag.memberGet("lifespan")) {
            liv_f += liv.tag.lifespan.asInt();
        }
    }

    if (liv_f >= ref_f) {container.addItemOutput("up", liv);}
    else {container.addItemOutput("down", liv);}
    container.addItemOutput("hidden", ref);
});
recipe_life.requireItem("input1", <ore:living>.marked("input1"));
recipe_life.requireItem("input2", <ore:living>.marked("input2"));
recipe_life.requireDuration("duration", 20 * 10);
    

Sorter_livespan.addRecipe(recipe_life);


var recipe_return = AssemblyRecipe.create(function(container) {
    var ref as IItemStack = container.getItem("input1");
    
    container.addItemOutput("input1", ref);
});
recipe_return.requireItem("hidden", <ore:living>.marked("input1"));

Sorter_food.addRecipe(recipe_return);
Sorter_livespan.addRecipe(recipe_return);