
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;

import crafttweaker.data.IData;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.IngredientArrayBuilder;

import mods.requious.Assembly;

import mods.requious.ComponentFace;
import mods.requious.SlotVisual;
import mods.requious.GaugeDirection;
import mods.requious.AssemblyRecipe;

import mods.ctutils.utils.Math;

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
    /*Feeder.setEnergySlot(0, 2, ComponentFace.all(), 400000)
        .setAccess(true, false)
        .setGroup("power");*/
    Feeder.setItemSlot(2, 1, ComponentFace.all(), 1)
        .setAccess(true, false)
        .setGroup("input");
    Feeder.setItemSlot(2, 2, ComponentFace.all(), 1)
        .setAccess(true, false)
        .setGroup("input");
    Feeder.setItemSlot(2, 3, ComponentFace.all(), 1)
        .setAccess(true,false)
        .setGroup("input");


    Feeder.setItemSlot(6, 1, ComponentFace.all(), 1)
        .setAccess(false, true)
        .setHandAccess(false, true)
        .setGroup("output1");
    Feeder.setItemSlot(6, 2, ComponentFace.all(), 1)
        .setAccess(false, true)
        .setHandAccess(false, true)
        .setGroup("output2");
    Feeder.setItemSlot(6, 3, ComponentFace.all(), 1)
        .setAccess(false, true)
        .setHandAccess(false, true)
        .setGroup("output3");

    Feeder.setDurationSlot(4, 2)
        .setVisual(SlotVisual.createGauge("requious:textures/gui/assembly_gauges.png", 0, 8, 1, 8, GaugeDirection.right(), false))
        .setGroup("duration");

    
    Feeder.setJEIItemSlot(1, 0, "input");
    Feeder.setJEIItemSlot(2, 0, "input");
    Feeder.setJEIItemSlot(3, 0, "input");
    /*Feeder.setJEIItemSlot(1, 1, "input");
    Feeder.setJEIItemSlot(2, 1, "input");
    Feeder.setJEIItemSlot(3, 1, "input");
    
    Feeder.setJEIFluidSlot(2, 2, "input");*/
    
    Feeder.setJEIDurationSlot(4, 0, "duration", SlotVisual.createGauge("requious:textures/gui/assembly_gauges.png", 0, 8, 1, 8, GaugeDirection.right(), false));
    Feeder.setJEIItemSlot(5, 0, "output1");
    Feeder.setJEIItemSlot(6, 0, "output2");
    Feeder.setJEIItemSlot(7, 0, "output3");
}

static sprookBreading as string[][] = [
    ["iron", "nickel"],
    
    ["copper", "tin"],
    ["copper", "aluminum"],
    ["copper", "nickel"],
    
    ["tin", "copper"],
    
    ["nickel", "iron"],
    ["nickel", "copper"],
    ["nickel", "aluminum"],
    
    ["aluminum", "copper"],
    ["aluminum", "nickel"],

    ["zinc", "cobalt"],

    ["cobalt", "ardite"],
    ["cobalt", "zinc"],

    ["ardite", "cobalt"]
];
static sprookSexes as string[] = [
    "iron", "copper", "tin", "nickel", "aluminum", "zinc", "cobalt", "ardite"
];
static sprookTypes as IItemStack[] = [
    <contenttweaker:sprook1>,
    <contenttweaker:sprook2>,
    <contenttweaker:sprook3>,
    <contenttweaker:sprook4>
];
function makeSprook() as IItemStack{
    var sprookType as int = ((Math.floor(Math.random() * 4)) as IData).asInt();
    var sprookSex as int = ((Math.floor(Math.random() * 8)) as IData).asInt();

    return sprookTypes[sprookType].withTag({"sex": sprookSexes[sprookSex]});
}

function addFeederRecipe(it1 as IItemStack, it2 as IItemStack){//sprook feeder
    var recipe = AssemblyRecipe.create(function(container) {
        var p1 as IItemStack = container.getItem("parent1");
        var p2 as IItemStack = container.getItem("parent2");
        var p1s as string = "";
        var p2s as string = "";

        if (p1.tag.memberGet("sex")){
            p1s = p1.tag.sex;
        }
        if (p2.tag.memberGet("sex")){
            p2s = p2.tag.sex;
        }


        var addChild as bool = false;
        for att in sprookBreading{
            if ((att[0] == p1s) && (att[1] == p2s))
                addChild = true;
        }

        if (Math.random() >= 0.2)
            container.addItemOutput("output1", p1);
        if (Math.random() >= 0.2)
            container.addItemOutput("output2", p2);
        if (addChild)
            container.addItemOutput("output3", makeSprook());
        
        

    });
	
    recipe = recipe.requireItem("input", it1.marked("parent1"));
    recipe = recipe.requireItem("input", it2.marked("parent2"));
    recipe = recipe.requireItem("input", <ore:sprookFood>);

    recipe.setActive(300);
    recipe = recipe.requireDuration("duration", 200);

    Feeder.addRecipe(recipe);

    {
        var recipeJEI = AssemblyRecipe.create(function(container) {
            container.addItemOutput("output1", it1.withLore(["80% chance"]));
            container.addItemOutput("output2", it2.withLore(["80% chance"]));
            container.addItemOutput("output3", it1.withLore(["if sexes are compatible"]));
        });
        recipeJEI.requireItem("input", it1);
        recipeJEI.requireItem("input", it2);
        recipeJEI.requireItem("input", <ore:sprookFood>);
        Feeder.addJEIRecipe(recipeJEI);	
    }
    //
}
addFeederRecipe(<contenttweaker:sprook1>, <contenttweaker:sprook2>);
addFeederRecipe(<contenttweaker:sprook1>, <contenttweaker:sprook3>);
addFeederRecipe(<contenttweaker:sprook1>, <contenttweaker:sprook4>);
addFeederRecipe(<contenttweaker:sprook2>, <contenttweaker:sprook3>);
addFeederRecipe(<contenttweaker:sprook2>, <contenttweaker:sprook4>);
addFeederRecipe(<contenttweaker:sprook3>, <contenttweaker:sprook4>);

recipes.addShaped("ia_sprook_slime", <contenttweaker:sprook_slime>, [
    [<contenttweaker:life>, <industrialforegoing:pink_slime>, <contenttweaker:life>], 
    [<industrialforegoing:pink_slime>, <harvestcraft:beanitem>, <industrialforegoing:pink_slime>], 
    [<contenttweaker:life>, <industrialforegoing:pink_slime>, <contenttweaker:life>]
]);
recipes.addShapeless("sprook", <contenttweaker:sprook1>, [<contenttweaker:sprook_slime>],
    function(out, ins, cInfo){
        return makeSprook();
    }, null
);
for sprookType in sprookTypes{
    sprookType.addAdvancedTooltip(function(item){
        if (item.tag.memberGet("sex")){
            //item good
            return "§6Sex: " ~ item.tag.sex;
        }
        //item bad
        return "§6Sex: unknown";
    });
}



recipes.addShaped("ia_sprook_compress1", <contenttweaker:sprooks1>, [
    [<ore:sprook>, <ore:sprook>],
    [<ore:sprook>, <ore:sprook>]
]);
mods.thermalexpansion.Crucible.addRecipe(<liquid:sprook_mush> * 100, <contenttweaker:sprooks1>, 10000);

recipes.addShaped("ia_sprook_compress2", <contenttweaker:sprooks2>, [
    [<contenttweaker:sprooks1>, <contenttweaker:sprooks1>],
    [<contenttweaker:sprooks1>, <contenttweaker:sprooks1>]
]);
mods.thermalexpansion.Crucible.addRecipe(<liquid:sprook_mush> * 500, <contenttweaker:sprooks2>, 20000);

recipes.addShaped("ia_sprook_compress3", <contenttweaker:sprooks3>, [
    [<contenttweaker:sprooks2>, <contenttweaker:sprooks2>],
    [<contenttweaker:sprooks2>, <contenttweaker:sprooks2>]
]);
mods.thermalexpansion.Crucible.addRecipe(<liquid:sprook_mush> * 2500, <contenttweaker:sprooks3>, 40000);


recipes.addShaped("ia_req_feeder", <requious:feeder>, [
    [<simplyjetpacks:metaitemmods:12>, <contenttweaker:sprook_slime>, <simplyjetpacks:metaitemmods:12>], 
    [<simplyjetpacks:metaitemmods:12>, <cookingforblockheads:cooking_table>, <simplyjetpacks:metaitemmods:12>], 
    [<simplyjetpacks:metaitemmods:12>, <enderio:item_material:53>, <simplyjetpacks:metaitemmods:12>]
]);

{
    var rec = RecipeBuilder.newBuilder("test", "sprook_pasture", 100);
    rec.addEnergyPerTickOutput(15 * 1000 * 1000);
    rec.addFluidOutput(<liquid:society> * 1000);
    rec.build();
}