#priority 500

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;

import mods.requious.Assembly;

import mods.requious.ComponentFace;
import mods.requious.SlotVisual;
import mods.requious.AssemblyRecipe;


static Hint as Assembly = <assembly:hint>;
{
    Hint.setJEIItemSlot(0, 0, "input");
    Hint.setJEIItemSlot(1, 0, "input");
    Hint.setJEIItemSlot(2, 0, "input");
    Hint.setJEIItemSlot(0, 1, "input");
    Hint.setJEIItemSlot(1, 1, "input");
    Hint.setJEIItemSlot(2, 1, "input");

    Hint.setJEIFluidSlot(0, 2, "input");
    Hint.setJEIFluidSlot(1, 2, "input");
    Hint.setJEIFluidSlot(2, 2, "input");

    Hint.setJEIDecoration(3, 1, "duration", SlotVisual.create(1,1).addPart("requious:textures/gui/assembly_gauges.png", 0, 8));

    Hint.setJEIItemSlot(4, 0, "catalyst");
    Hint.setJEIItemSlot(4, 1, "catalyst");
    Hint.setJEIItemSlot(4, 2, "catalyst");

    Hint.setJEIDecoration(5, 1, "duration", SlotVisual.create(1,1).addPart("requious:textures/gui/assembly_gauges.png", 0, 8));

    Hint.setJEIItemSlot(6, 0, "output");
    Hint.setJEIItemSlot(7, 0, "output");
    Hint.setJEIItemSlot(8, 0, "output");
    Hint.setJEIItemSlot(6, 1, "output");
    Hint.setJEIItemSlot(7, 1, "output");
    Hint.setJEIItemSlot(8, 1, "output");

    Hint.setJEIFluidSlot(6, 2, "output");
    Hint.setJEIFluidSlot(7, 2, "output");
    Hint.setJEIFluidSlot(8, 2, "output");
}

function addJEIhint(
    inputs as IIngredient[], input_fluids as ILiquidStack[], 
    catalysts as IIngredient[], 
    outputs as IItemStack[], output_fluids as ILiquidStack[] = [] as ILiquidStack[]
    )
{
    var recipe = AssemblyRecipe.create(function(container) {
        for out in outputs{
            container.addItemOutput("output", out);
        }
        for outf in output_fluids{
            container.addFluidOutput("output", outf * 1);
        }
    });

    for inp in inputs{
        recipe = recipe.requireItem("input", inp);
    }
    for inpf in input_fluids{
        recipe = recipe.requireFluid("input", inpf * 1);
    }

    for catalyst in catalysts{
        recipe = recipe.requireItem("catalyst", catalyst);
    }

    Hint.addJEIRecipe(recipe);	
}


addJEIhint([
        <minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:zombie"}}).withDisplayName("Any Creature")
    ], [], [
        <tconstruct:sword_blade>.withTag({Material: "pigiron"}).withDisplayName("TiC weapon with Baconlicious trait"),
        <tconstruct:ingots:4>
    ], [
        <tconstruct:edible>
    ]
);
addJEIhint([
        <minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:zombie"}}).withDisplayName("Any Creature")
    ], [], [
        <tconstruct:sword_blade>.withTag({Material: "bound_metal"}),
        <bloodmagic:bound_sword>
    ], [
        <bloodmagic:blood_shard>
    ]
);
addJEIhint([
        <minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:zombie"}}).withDisplayName("Any Creature")
    ], [], [
        <bloodmagic:soul_snare>,
        <bloodmagic:sentient_sword>.withTag({}),
        <tconstruct:sword_blade>.withTag({Material: "sentient_metal"}),
    ], [
        <bloodmagic:monster_soul>.withTag({souls: 1.0})
    ]
);

addJEIhint(
    [
        <minecraft:deadbush>,
        <forge:bucketfilled>.withTag({FluidName: "potion", Amount: 1000, Tag: {Potion: "extrautils2:xu2.second.chance"}}) * 4
    ], [
        <liquid:potion>.withTag({Potion: "extrautils2:xu2.second.chance"})
    ], [
        <thermalexpansion:machine:8>
    ], [
        <contenttweaker:revived_bush>
    ]

);




function removeAndHide(i as IItemStack){
    mods.jei.JEI.removeAndHide(i);
}

removeAndHide(<excompressum:compressed_block:1>);
removeAndHide(<excompressum:compressed_block:2>);
removeAndHide(<excompressum:compressed_block:3>);
removeAndHide(<excompressum:compressed_block:9>);

removeAndHide(<thermalexpansion:device:1>);
removeAndHide(<thermalexpansion:device:8>);
removeAndHide(<thermalexpansion:device:12>);
