#priority 5000

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;

import mods.requious.Assembly;

import mods.requious.ComponentFace;
import mods.requious.SlotVisual;
import mods.requious.GaugeDirection;
import mods.requious.AssemblyRecipe;



static Fluid_mixer as Assembly = <assembly:fluid_mixer>;
{
    Fluid_mixer.setItemSlot(3, 2, ComponentFace.all(), 64)
        .setAccess(true, false)
        .setGroup("input");
    Fluid_mixer.setFluidSlot(1, 3, ComponentFace.down(), 12000)
        .setAccess(true,false)
        .setGroup("input");
    Fluid_mixer.setFluidSlot(1, 1, ComponentFace.up(), 12000)
        .setAccess(true,false)
        .setGroup("input");
    Fluid_mixer.setEnergySlot(0, 2, ComponentFace.all(), 40000)
        .setAccess(true, false)
        .setGroup("power");

    Fluid_mixer.setDurationSlot(4, 2)
        .setVisual(SlotVisual.createGauge("requious:textures/gui/assembly_gauges.png", 0, 10, 1, 10, GaugeDirection.right(), false))
        .setGroup("duration");

    Fluid_mixer.setItemSlot(6, 2, ComponentFace.all(), 64)
        .setAccess(false, true)
        .setHandAccess(false, true)
        .setGroup("output");
    Fluid_mixer.setFluidSlot(7, 2, ComponentFace.all(), 12000)
        .setAccess(false, true)
        .setGroup("output");

    Fluid_mixer.setJEIItemSlot(0 ,0, "input");
    Fluid_mixer.setJEIFluidSlot(1, 0, "input");
    Fluid_mixer.setJEIFluidSlot(2, 0, "input");
    Fluid_mixer.setJEIDurationSlot(3, 0, "duration", SlotVisual.createGauge("requious:textures/gui/assembly_gauges.png", 0, 10, 1, 10, GaugeDirection.right(), false));
    Fluid_mixer.setJEIItemSlot(4, 0, "output");
    Fluid_mixer.setJEIFluidSlot(5, 0, "output");
    Fluid_mixer.setJEIEnergySlot(7, 0, "power");
}
//fluid mixer
recipes.addShaped("ia_fluid_mixer", <requious:fluid_mixer>, [
	[<contenttweaker:watertight_steel_plate>, <extrautils2:grocket:2>, <contenttweaker:watertight_steel_plate>], 
	[<contenttweaker:rotor_blades>, <extrautils2:machine>, <contenttweaker:rotor_blades>], 
	[<contenttweaker:watertight_steel_plate>, <extrautils2:grocket:2>, <contenttweaker:watertight_steel_plate>]
]);
function basicFluidMixerRecipe(outputItem as IItemStack, outputFluid as ILiquidStack, inputItem as IIngredient, inputFluids as ILiquidStack[], time_t as int, rft as int){
    var recipe = AssemblyRecipe.create(function(container) {
        if outputItem {
            container.addItemOutput("output", outputItem);
        }
        if outputFluid{
            container.addFluidOutput("output", outputFluid);
        }
    });
    if inputItem {
        recipe = recipe.requireItem("input", inputItem);
    }
    for fluid in inputFluids {
        recipe = recipe.requireFluid("input", fluid);
    }
    recipe.setActive(time_t);
    recipe.requireDuration("duration", time_t);
    recipe = recipe.requireEnergy("power", time_t * rft);
    //recipe.requireEnergy("power", 1000);

    Fluid_mixer.addRecipe(recipe);
    Fluid_mixer.addJEIRecipe(recipe);	
}
function addFluidMixerRecipe(outf as ILiquidStack, inpf1 as ILiquidStack, inpf2 as ILiquidStack, inpi as IIngredient, time_t as int, rft as int){
    var recipe = AssemblyRecipe.create(function(container) {
        container.addFluidOutput("output", outf);
    });
    if (inpi) recipe = recipe.requireItem("input", inpi);
    recipe = recipe.requireFluid("input", inpf1);
    recipe = recipe.requireFluid("input", inpf2);
    recipe.setActive(time_t);
    recipe = recipe.requireDuration("duration", time_t);
    recipe = recipe.requireEnergy("power", time_t * rft);

    Fluid_mixer.addRecipe(recipe);
    Fluid_mixer.addJEIRecipe(recipe);	
}

//basicFluidMixerRecipe([<contenttweaker:chlorasteel_gear> * 2], [<liquid:oil> * 150], [<contenttweaker:chlorasteel_gear> * 3], 20);

//basicFluidMixerRecipe([<minecraft:brown_mushroom>], [<liquid:refined_fuel> * 100, <liquid:refined_biofuel> * 100], [<contenttweaker:chlorasteel_gear>], 20);




static Fluid_alloyer as Assembly = <assembly:fluid_alloyer>;
{
    Fluid_alloyer.setItemSlot(3, 1, ComponentFace.all(), 64)
        .setAccess(true, false)
        .setGroup("input");
    Fluid_alloyer.setItemSlot(3, 3, ComponentFace.all(), 64)
        .setAccess(true, false)
        .setGroup("input");
    Fluid_alloyer.setFluidSlot(1, 2, ComponentFace.all(), 12000)
        .setAccess(true,false)
        .setGroup("input");
    Fluid_alloyer.setEnergySlot(0, 2, ComponentFace.all(), 40000)
        .setAccess(true, false)
        .setGroup("power");

    Fluid_alloyer.setDurationSlot(4, 2)
        .setVisual(SlotVisual.createGauge("requious:textures/gui/assembly_gauges.png", 0, 9, 1, 9, GaugeDirection.right(), false))
        .setGroup("duration");

    Fluid_alloyer.setItemSlot(6, 2, ComponentFace.all(), 64)
        .setAccess(false, true)
        .setHandAccess(false, true)
        .setGroup("output");

    Fluid_alloyer.setJEIFluidSlot(0, 0, "input");
    Fluid_alloyer.setJEIItemSlot(1, 0, "input");
    Fluid_alloyer.setJEIItemSlot(2, 0, "input");
    Fluid_alloyer.setJEIDurationSlot(3, 0, "duration", SlotVisual.createGauge("requious:textures/gui/assembly_gauges.png", 0, 9, 1, 9, GaugeDirection.right(), false));
    Fluid_alloyer.setJEIItemSlot(4, 0, "output");
    Fluid_alloyer.setJEIEnergySlot(6, 0, "power");

}
function addFluidAlloyerRecipe(out as IItemStack, inpi1 as IIngredient, inpi2 as IIngredient, inpf as ILiquidStack, time_t as int, rft as int){
    var recipe = AssemblyRecipe.create(function(container) {
        container.addItemOutput("output", out);
    });
    if (inpi1) recipe = recipe.requireItem("input", inpi1);
    if (inpi2) recipe = recipe.requireItem("input", inpi2);
    recipe = recipe.requireFluid("input", inpf);
    recipe.setActive(time_t);
    recipe = recipe.requireDuration("duration", time_t);
    recipe = recipe.requireEnergy("power", time_t * rft);

    Fluid_alloyer.addRecipe(recipe);
    Fluid_alloyer.addJEIRecipe(recipe);	
}
//fluid alloyer
recipes.addShaped("ia_fluid_alloyer", <requious:fluid_alloyer>, [
	[<ore:plateOsgloglas>, <ore:itemCompressedObsidian>, <ore:plateOsgloglas>], 
	[<thermalexpansion:machine:8>, <mekanism:basicblock:8>, <thermalexpansion:machine:3>], 
	[<ore:plateOsgloglas>, <ore:itemCompressedObsidian>, <ore:plateOsgloglas>]
]);

	

static Assembler as Assembly = <assembly:assembler>;
{
    {
        Assembler.setItemSlot(1, 1, ComponentFace.all(), 64)
            .setAccess(true, false)
            .setGroup("input");
        Assembler.setItemSlot(2, 1, ComponentFace.all(), 64)
            .setAccess(true, false)
            .setGroup("input");
        Assembler.setItemSlot(3, 1, ComponentFace.all(), 64)
            .setAccess(true, false)
            .setGroup("input");

        Assembler.setItemSlot(1, 2, ComponentFace.all(), 64)
            .setAccess(true, false)
            .setGroup("input");
        Assembler.setItemSlot(2, 2, ComponentFace.all(), 64)
            .setAccess(true, false)
            .setGroup("input");
        Assembler.setItemSlot(3, 2, ComponentFace.all(), 64)
            .setAccess(true, false)
            .setGroup("input");
    }

    Assembler.setFluidSlot(2, 3, ComponentFace.all(), 12000)
        .setAccess(true, false)
        .setGroup("input");
    Assembler.setEnergySlot(0, 2, ComponentFace.all(), 400000)
        .setAccess(true, false)
        .setGroup("power");

    Assembler.setDurationSlot(5, 2)
        .setVisual(SlotVisual.createGauge("requious:textures/gui/assembly_gauges.png", 0, 8, 1, 8, GaugeDirection.right(), false))
        .setGroup("duration");

    Assembler.setItemSlot(7, 2, ComponentFace.all(), 64)
        .setAccess(false, true)
        .setHandAccess(false, true)
        .setGroup("output0");
    Assembler.setItemSlot(8, 2, ComponentFace.all(), 64)
        .setAccess(false, true)
        .setHandAccess(false, true)
        .setGroup("output1");

    Assembler.setJEIEnergySlot(0, 1, "power");
    Assembler.setJEIItemSlot(1, 0, "input");
    Assembler.setJEIItemSlot(2, 0, "input");
    Assembler.setJEIItemSlot(3, 0, "input");
    Assembler.setJEIItemSlot(1, 1, "input");
    Assembler.setJEIItemSlot(2, 1, "input");
    Assembler.setJEIItemSlot(3, 1, "input");
    
    Assembler.setJEIFluidSlot(2, 2, "input");
    
    Assembler.setJEIDurationSlot(4, 1, "duration", SlotVisual.createGauge("requious:textures/gui/assembly_gauges.png", 0, 8, 1, 8, GaugeDirection.right(), false));
    Assembler.setJEIItemSlot(5, 1, "output0");
    Assembler.setJEIItemSlot(6, 1, "output1");
    //Fluid_alloyer.setJEIFluidSlot(5, 0, "output");
    
}
function addAssemblerRecipe(out as IItemStack[], inp as IIngredient[], fluid as ILiquidStack, time_t as int, rft as int){
    var recipe = AssemblyRecipe.create(function(container) {
        for o in 0 to out.length{
            container.addItemOutput("output" ~ o, out[o]);
        }
        
    });

    

    for i in inp{
        recipe = recipe.requireItem("input", i);
    }
    if (fluid){
        recipe = recipe.requireFluid("input", fluid);
    }
    recipe.setActive(time_t);
    recipe = recipe.requireDuration("duration", time_t);
    /*recipe.requireWorldCondition("world", function(container){
        var state = container.world.getBlockState(container.pos);
        return (state.getWeakPower(container.world, container.pos, crafttweaker.world.IFacing.down()) == 0);
    }, 20);*/
    recipe = recipe.requireEnergy("power", time_t * rft);

    Assembler.addRecipe(recipe);
    Assembler.addJEIRecipe(recipe);	
}
recipes.addShaped("ia_assembler", <requious:assembler>, [
	[<moreplates:melodic_alloy_plate>, <mekanism:machineblock2:13>, <moreplates:melodic_alloy_plate>], 
	[<contenttweaker:robot_arm>, <enderio:item_material:54>, <contenttweaker:robot_arm>], 
	[<moreplates:melodic_alloy_plate>, <enderio:block_dark_steel_anvil>, <moreplates:melodic_alloy_plate>]
]);
addAssemblerRecipe([<requious:assembler>], [
    <enderio:item_material:54>, <mekanism:machineblock2:13>, <contenttweaker:robot_arm>, <enderio:block_dark_steel_anvil>,
    <moreplates:melodic_alloy_plate>
], null, 40, 1000);


static AdvancedMixer as Assembly = <assembly:advanced_mixer>;
{
    {//item input
        AdvancedMixer.setItemSlot(3, 1, ComponentFace.all(), 64)
            .setAccess(true, false)
            .setGroup("input");
        AdvancedMixer.setItemSlot(3, 2, ComponentFace.all(), 64)
            .setAccess(true, false)
            .setGroup("input");
        AdvancedMixer.setItemSlot(4, 1, ComponentFace.all(), 64)
            .setAccess(true, false)
            .setGroup("input");
        AdvancedMixer.setItemSlot(4, 2, ComponentFace.all(), 64)
            .setAccess(true, false)
            .setGroup("input");
    }
    {//fluid input
        AdvancedMixer.setFluidSlot(1, 1, ComponentFace.north(), 25000)
            .setAccess(true, false)
            .setGroup("input");
        AdvancedMixer.setFluidSlot(2, 1, ComponentFace.south(), 25000)
            .setAccess(true, false)
            .setGroup("input");
        AdvancedMixer.setFluidSlot(1, 2, ComponentFace.east(), 25000)
            .setAccess(true, false)
            .setGroup("input");
        AdvancedMixer.setFluidSlot(2, 2, ComponentFace.west(), 25000)
            .setAccess(true, false)
            .setGroup("input");
    }


    
    AdvancedMixer.setEnergySlot(0, 2, ComponentFace.all(), 400000)
        .setAccess(true, false)
        .setGroup("power");

    AdvancedMixer.setDurationSlot(5, 2)
        .setVisual(SlotVisual.createGauge("requious:textures/gui/assembly_gauges.png", 0, 10, 1, 10, GaugeDirection.right(), false))
        .setGroup("duration");

    AdvancedMixer.setItemSlot(6, 1, ComponentFace.all(), 64)
        .setAccess(false, true)
        .setHandAccess(false, true)
        .setGroup("output0");
    AdvancedMixer.setItemSlot(6, 2, ComponentFace.all(), 64)
        .setAccess(false, true)
        .setHandAccess(false, true)
        .setGroup("output1");
    AdvancedMixer.setFluidSlot(7, 1, ComponentFace.all(), 25000)
        .setAccess(false, true)
        .setGroup("output0");
    AdvancedMixer.setFluidSlot(7, 2, ComponentFace.all(), 25000)
        .setAccess(false, true)
        .setGroup("output1");

    AdvancedMixer.setJEIEnergySlot(0, 1, "power");


    AdvancedMixer.setJEIFluidSlot(1, 0, "input");
    AdvancedMixer.setJEIFluidSlot(2, 0, "input");
    AdvancedMixer.setJEIFluidSlot(1, 1, "input");
    AdvancedMixer.setJEIFluidSlot(2, 1, "input");

    AdvancedMixer.setJEIItemSlot(3, 0, "input");
    AdvancedMixer.setJEIItemSlot(4, 0, "input");
    AdvancedMixer.setJEIItemSlot(3, 1, "input");
    AdvancedMixer.setJEIItemSlot(4, 1, "input");
    
    AdvancedMixer.setJEIDurationSlot(5, 1, "duration", SlotVisual.createGauge("requious:textures/gui/assembly_gauges.png", 0, 10, 1, 10, GaugeDirection.right(), false));
    AdvancedMixer.setJEIItemSlot(6, 0, "output0");
    AdvancedMixer.setJEIItemSlot(6, 1, "output1");
    AdvancedMixer.setJEIFluidSlot(7, 0, "output0");
    AdvancedMixer.setJEIFluidSlot(7, 1, "output1");
}
function addAdvancedMixerRecipe(out as IItemStack[], outfluid as ILiquidStack[], inp as IIngredient[], inpfluid as ILiquidStack[], time_t as int, rft as int){
    var recipe = AssemblyRecipe.create(function(container) {
        if (out.length != 0){
            for o in 0 to out.length{
                container.addItemOutput("output" ~ o, out[o]);
            }
        }
        if (outfluid.length != 0){
            for o in 0 to outfluid.length{
                container.addFluidOutput("output" ~ o, outfluid[o]);
            }
        }
    });

    for i in inp{
        recipe = recipe.requireItem("input", i);
    }
    for i in inpfluid{
        recipe = recipe.requireFluid("input", i);
    }
    recipe.setActive(time_t);
    recipe = recipe.requireDuration("duration", time_t);
    recipe = recipe.requireEnergy("power", time_t * rft);

    AdvancedMixer.addRecipe(recipe);
    AdvancedMixer.addJEIRecipe(recipe);	
}
addAssemblerRecipe(
    [<requious:advanced_mixer>], 
    [
        <enderio:item_material:54>, <requious:fluid_mixer> * 4, <thermalexpansion:machine:12> * 4,
        <contenttweaker:purple_gold_ingot> * 16, <contenttweaker:tank2> * 2, <contenttweaker:crucible> * 2
    ], <liquid:watertight_steel> * 576, 
    10, 1024
);




static Recycler as Assembly = <assembly:recycler>;
{
    
    Recycler.setItemSlot(1, 2, ComponentFace.all(), 64)
        .setAccess(true, false)
        .setGroup("input");
    
    Recycler.setEnergySlot(0, 2, ComponentFace.all(), 40000)
        .setAccess(true, false)
        .setGroup("power");

    Recycler.setDurationSlot(3, 2)
        .setVisual(SlotVisual.createGauge("requious:textures/gui/assembly_gauges.png", 2, 9, 3, 9, GaugeDirection.right(), false))
        .setGroup("duration");

    {
        Recycler.setItemSlot(5, 1, ComponentFace.all(), 64)
            .setAccess(false, true)
            .setHandAccess(false, true)
            .setGroup("output0");
        Recycler.setItemSlot(6, 1, ComponentFace.all(), 64)
            .setAccess(false, true)
            .setHandAccess(false, true)
            .setGroup("output1");
        Recycler.setItemSlot(7, 1, ComponentFace.all(), 64)
            .setAccess(false, true)
            .setHandAccess(false, true)
            .setGroup("output2");

        Recycler.setItemSlot(5, 2, ComponentFace.all(), 64)
            .setAccess(false, true)
            .setHandAccess(false, true)
            .setGroup("output3");
        Recycler.setItemSlot(6, 2, ComponentFace.all(), 64)
            .setAccess(false, true)
            .setHandAccess(false, true)
            .setGroup("output4");
        Recycler.setItemSlot(7, 2, ComponentFace.all(), 64)
            .setAccess(false, true)
            .setHandAccess(false, true)
            .setGroup("output5");
        
        Recycler.setItemSlot(5, 3, ComponentFace.all(), 64)
            .setAccess(false, true)
            .setHandAccess(false, true)
            .setGroup("output6");
        Recycler.setItemSlot(6, 3, ComponentFace.all(), 64)
            .setAccess(false, true)
            .setHandAccess(false, true)
            .setGroup("output7");
        Recycler.setItemSlot(7, 3, ComponentFace.all(), 64)
            .setAccess(false, true)
            .setHandAccess(false, true)
            .setGroup("output8");
    }
    
    Recycler.setItemSlot(1, 1, ComponentFace.all(), 1)
        .setAccess(true, false)
        .setGroup("luck");
    Recycler.setItemSlot(1, 0, ComponentFace.all(), 1)
        .setAccess(false, false)
        .setHandAccess(false, false)
        .setHidden()
        .setGroup("luck2");
    Recycler.setSelectionSlot(2, 1, "selection", 0)
        .setGroup("selection")
        .setMaxSelection(1);


    //Recycler.setJEIEnergySlot(0, 1, "power");
    Recycler.setJEIItemSlot(0, 1, "input");

    Recycler.setJEIItemSlot(2, 0, "output");
    Recycler.setJEIItemSlot(3, 0, "output");
    Recycler.setJEIItemSlot(4, 0, "output");

    Recycler.setJEIItemSlot(2, 1, "output");
    Recycler.setJEIItemSlot(3, 1, "output");
    Recycler.setJEIItemSlot(4, 1, "output");

    Recycler.setJEIItemSlot(2, 2, "output");
    Recycler.setJEIItemSlot(3, 2, "output");
    Recycler.setJEIItemSlot(4, 2, "output");
    
    Recycler.setJEIDurationSlot(1, 0, "duration", SlotVisual.createGauge("requious:textures/gui/assembly_gauges.png", 2, 9, 3, 9, GaugeDirection.right(), false));
}


static Vial_processor as Assembly = <assembly:vial_processor>;
{
    
    Vial_processor.setItemSlot(1, 2, ComponentFace.all(), 64)
        .setAccess(true, false)
        .setGroup("input");
    Vial_processor.setFluidSlot(1, 3, ComponentFace.all(), 12000)
        .setAccess(true, false)
        .setGroup("input");
    
    Vial_processor.setEnergySlot(0, 2, ComponentFace.all(), 400000)
        .setAccess(true, false)
        .setGroup("power");

    Vial_processor.setDurationSlot(3, 2)
        .setVisual(SlotVisual.createGauge("requious:textures/gui/assembly_gauges.png", 2, 10, 3, 10, GaugeDirection.right(), false))
        .setGroup("duration");

    {
        Vial_processor.setItemSlot(5, 1, ComponentFace.all(), 64)
            .setAccess(false, true)
            .setHandAccess(false, true)
            .setGroup("output0");
        Vial_processor.setItemSlot(6, 1, ComponentFace.all(), 64)
            .setAccess(false, true)
            .setHandAccess(false, true)
            .setGroup("output1");
        Vial_processor.setItemSlot(7, 1, ComponentFace.all(), 64)
            .setAccess(false, true)
            .setHandAccess(false, true)
            .setGroup("output2");

        Vial_processor.setItemSlot(5, 2, ComponentFace.all(), 64)
            .setAccess(false, true)
            .setHandAccess(false, true)
            .setGroup("output3");
        Vial_processor.setItemSlot(6, 2, ComponentFace.all(), 64)
            .setAccess(false, true)
            .setHandAccess(false, true)
            .setGroup("output4");
        Vial_processor.setItemSlot(7, 2, ComponentFace.all(), 64)
            .setAccess(false, true)
            .setHandAccess(false, true)
            .setGroup("output5");
        
        Vial_processor.setItemSlot(5, 3, ComponentFace.all(), 64)
            .setAccess(false, true)
            .setHandAccess(false, true)
            .setGroup("output6");
        Vial_processor.setItemSlot(6, 3, ComponentFace.all(), 64)
            .setAccess(false, true)
            .setHandAccess(false, true)
            .setGroup("output7");
        Vial_processor.setItemSlot(7, 3, ComponentFace.all(), 64)
            .setAccess(false, true)
            .setHandAccess(false, true)
            .setGroup("output8");
    }
    Vial_processor.setItemSlot(4, 2, ComponentFace.all(), 64)
        .setAccess(false, true)
        .setHandAccess(false, true)
        .setGroup("vial");
    Vial_processor.setFluidSlot(8, 2, ComponentFace.all(), 20000)
        .setAccess(false, true)
        .setGroup("output");
    
    Vial_processor.setItemSlot(1, 1, ComponentFace.all(), 1)
        .setAccess(false, false)
        .setHandAccess(true, true)
        .setGroup("luck");
    Vial_processor.setItemSlot(1, 0, ComponentFace.all(), 1)
        .setAccess(false, false)
        .setHandAccess(false, false)
        .setHidden()
        .setGroup("luck2");
    Vial_processor.setSelectionSlot(2, 1, "selection", 0)
        .setGroup("selection")
        .setMaxSelection(1);


    //Vial_processor.setJEIEnergySlot(0, 1, "power");
    Vial_processor.setJEIItemSlot(0, 0, "input");
    Vial_processor.setJEIItemSlot(0, 1, "egg");
    Vial_processor.setJEIFluidSlot(0, 2, "input");

    Vial_processor.setJEIItemSlot(2, 0, "output");
    Vial_processor.setJEIItemSlot(3, 0, "output");
    Vial_processor.setJEIItemSlot(4, 0, "output");

    Vial_processor.setJEIItemSlot(2, 1, "output");
    Vial_processor.setJEIItemSlot(3, 1, "output");
    Vial_processor.setJEIItemSlot(4, 1, "output");

    Vial_processor.setJEIItemSlot(2, 2, "output");
    Vial_processor.setJEIItemSlot(3, 2, "output");
    Vial_processor.setJEIItemSlot(4, 2, "output");
    
    Vial_processor.setJEIFluidSlot(5, 1, "output");
    
    Vial_processor.setJEIDurationSlot(1, 0, "duration", SlotVisual.createGauge("requious:textures/gui/assembly_gauges.png", 2, 10, 3, 10, GaugeDirection.right(), false));
    //Vial_processor.setJEIItemSlot(5, 1, "output0");
    //Vial_processor.setJEIItemSlot(6, 1, "output1");
    //Fluid_alloyer.setJEIFluidSlot(5, 0, "output");
    
}


static FluidSieve as Assembly = <assembly:fluid_sieve>;
{
    
    FluidSieve.setItemSlot(2, 2, ComponentFace.all(), 64)
            .setAccess(false, false)
            .setHandAccess(true, true)
            .setGroup("mesh");
    FluidSieve.setItemSlot(3, 2, ComponentFace.all(), 64)
            .setAccess(true, false)
            .setGroup("input");
    

    FluidSieve.setFluidSlot(1, 2, ComponentFace.all(), 25000)
        .setAccess(true, false)
        .setGroup("input");
    
    

    FluidSieve.setEnergySlot(0, 2, ComponentFace.all(), 4000000)
        .setAccess(true, false)
        .setGroup("power");

    FluidSieve.setDurationSlot(4, 2)
        .setVisual(SlotVisual.createGauge("requious:textures/gui/assembly_gauges.png", 0, 7, 1, 7, GaugeDirection.right(), false))
        .setGroup("duration");

    {    
        FluidSieve.setItemSlot(5, 1, ComponentFace.all(), 64)
            .setAccess(false, true)
            .setHandAccess(false, true)
            .setGroup("output0");
        FluidSieve.setItemSlot(6, 1, ComponentFace.all(), 64)
            .setAccess(false, true)
            .setHandAccess(false, true)
            .setGroup("output1");
        FluidSieve.setItemSlot(7, 1, ComponentFace.all(), 64)
            .setAccess(false, true)
            .setHandAccess(false, true)
            .setGroup("output2");
        FluidSieve.setItemSlot(5, 2, ComponentFace.all(), 64)
            .setAccess(false, true)
            .setHandAccess(false, true)
            .setGroup("output3");
        FluidSieve.setItemSlot(6, 2, ComponentFace.all(), 64)
            .setAccess(false, true)
            .setHandAccess(false, true)
            .setGroup("output4");
        FluidSieve.setItemSlot(7, 2, ComponentFace.all(), 64)
            .setAccess(false, true)
            .setHandAccess(false, true)
            .setGroup("output5");

        FluidSieve.setFluidSlot(6, 3, ComponentFace.all(), 25000)
            .setAccess(false, true)
            .setGroup("output");
    }

    FluidSieve.setJEIEnergySlot(0, 1, "power");
    FluidSieve.setJEIFluidSlot(1, 1, "input");
    FluidSieve.setJEIItemSlot(2, 1, "mesh");
    FluidSieve.setJEIItemSlot(3, 1, "input");
    
    FluidSieve.setJEIDurationSlot(4, 1, "duration", SlotVisual.createGauge("requious:textures/gui/assembly_gauges.png", 0, 7, 1, 7, GaugeDirection.right(), false));

    FluidSieve.setJEIFluidSlot(6, 2, "output");

    FluidSieve.setJEIItemSlot(5, 0, "output0");
    FluidSieve.setJEIItemSlot(6, 0, "output1");
    FluidSieve.setJEIItemSlot(7, 0, "output2");
    FluidSieve.setJEIItemSlot(5, 1, "output3");
    FluidSieve.setJEIItemSlot(6, 1, "output4");
    FluidSieve.setJEIItemSlot(7, 1, "output5");
    
    
}
function addFluidSieveRecipeRandom(
        out as WeightedItemStack[], fluid_out as ILiquidStack, 
        fluid_in as ILiquidStack, inp as IIngredient,
        mesh as IIngredient,
        time_t as int, rft as int
    )
{
	var recipe = AssemblyRecipe.create(function(container) {
		for o in 0 to out.length {
			if(container.jei)
				container.addItemOutput("output" ~ o, out[o].stack.withLore(["§d§l" ~ out[o].percent ~ "%"]));
			else if(container.random.nextDouble() < out[o].chance) //>
				container.addItemOutput("output" ~ o, out[o].stack);
		}
        if fluid_out{
            container.addFluidOutput("output", fluid_out);
        }
	});
	if (inp) {
        recipe = recipe.requireItem("input", inp);
    }
    if (fluid_in) {
        recipe = recipe.requireFluid("input", fluid_in);
    }

    if mesh{
        recipe = recipe.requireItem("mesh", mesh, 0, 0);
    }
    recipe.setActive(time_t);
    recipe = recipe.requireDuration("duration", time_t);
    recipe = recipe.requireEnergy("power", time_t * rft);

    FluidSieve.addRecipe(recipe);
    FluidSieve.addJEIRecipe(recipe);	
}
recipes.addShaped("ia_fluid_sieve", <requious:fluid_sieve>, [
	[<contenttweaker:ecoppra>, <contenttweaker:filter_empty>, <contenttweaker:ecoppra>], 
	[<quantumflux:craftingpiece>, <actuallyadditions:block_misc:9>, <quantumflux:craftingpiece>], 
	[<contenttweaker:ecoppra>, <contenttweaker:filter_empty>, <contenttweaker:ecoppra>]
]);




static bioAssembler as Assembly = <assembly:bioassembler>;
{
    {
        bioAssembler.setItemSlot(1, 1, ComponentFace.all(), 64)
            .setAccess(true, false)
            .setGroup("input");
        bioAssembler.setItemSlot(2, 1, ComponentFace.all(), 64)
            .setAccess(true, false)
            .setGroup("input");
        bioAssembler.setItemSlot(3, 1, ComponentFace.all(), 64)
            .setAccess(true, false)
            .setGroup("input");

        bioAssembler.setItemSlot(1, 2, ComponentFace.all(), 64)
            .setAccess(true, false)
            .setGroup("input");
        bioAssembler.setItemSlot(2, 2, ComponentFace.all(), 64)
            .setAccess(true, false)
            .setGroup("input");
        bioAssembler.setItemSlot(3, 2, ComponentFace.all(), 64)
            .setAccess(true, false)
            .setGroup("input");
    }

    bioAssembler.setFluidSlot(2, 3, ComponentFace.up(), 25000)
        .setAccess(true, false)
        .setGroup("input");
    bioAssembler.setFluidSlot(3, 3, ComponentFace.down(), 25000)
        .setAccess(true, false)
        .setGroup("input");
    
    bioAssembler.setItemSlot(5, 1, ComponentFace.all(), 64)
            .setAccess(false, false)
            .setHandAccess(true, true)
            .setGroup("catalyst");

    bioAssembler.setEnergySlot(0, 2, ComponentFace.all(), 100000000)
        .setAccess(true, false)
        .setGroup("power");

    bioAssembler.setDurationSlot(5, 2)
        .setVisual(mods.requious.SlotVisual.arrowRight())
        .setGroup("duration");

    {    
        bioAssembler.setItemSlot(7, 1, ComponentFace.all(), 64)
            .setAccess(false, true)
            .setHandAccess(false, true)
            .setGroup("output0");
        bioAssembler.setItemSlot(8, 1, ComponentFace.all(), 64)
            .setAccess(false, true)
            .setHandAccess(false, true)
            .setGroup("output1");
        bioAssembler.setItemSlot(7, 2, ComponentFace.all(), 64)
            .setAccess(false, true)
            .setHandAccess(false, true)
            .setGroup("output2");
        bioAssembler.setItemSlot(8, 2, ComponentFace.all(), 64)
            .setAccess(false, true)
            .setHandAccess(false, true)
            .setGroup("output3");

        bioAssembler.setFluidSlot(7, 3, ComponentFace.all(), 25000)
            .setAccess(false, true)
            .setGroup("output");
    }

    bioAssembler.setJEIEnergySlot(0, 1, "power");
    bioAssembler.setJEIItemSlot(1, 0, "input");
    bioAssembler.setJEIItemSlot(2, 0, "input");
    bioAssembler.setJEIItemSlot(3, 0, "input");
    bioAssembler.setJEIItemSlot(1, 1, "input");
    bioAssembler.setJEIItemSlot(2, 1, "input");
    bioAssembler.setJEIItemSlot(3, 1, "input");
    
    bioAssembler.setJEIFluidSlot(2, 2, "input");
    bioAssembler.setJEIFluidSlot(3, 2, "input");
    
    bioAssembler.setJEIDurationSlot(5, 1, "duration", SlotVisual.create(1,1).addPart("requious:textures/gui/assembly_gauges.png", 0, 8));

    bioAssembler.setJEIItemSlot(5, 0, "catalyst");

    bioAssembler.setJEIItemSlot(7, 0, "output2");
    bioAssembler.setJEIItemSlot(8, 0, "output3");
    bioAssembler.setJEIItemSlot(7, 1, "output0");
    bioAssembler.setJEIItemSlot(8, 1, "output1");
    bioAssembler.setJEIFluidSlot(7, 2, "output");
    
}
function addBioAssemblerRecipe(
        out as IItemStack[], fluid_out as ILiquidStack, 
        inp as IIngredient[], fluid_in as ILiquidStack[], catalyst as IIngredient,
        time_t as int, rft as int
    )
{
    var recipe = AssemblyRecipe.create(function(container) {
        if (out.length != 0)
            for o in 0 to out.length{
                container.addItemOutput("output" ~ o, out[o]);
            }
        if fluid_out{
            container.addFluidOutput("output", fluid_out);
        }
    });

    for i in inp{
        recipe = recipe.requireItem("input", i);
    }
    for fluid in fluid_in{
        recipe = recipe.requireFluid("input", fluid);
    }

    if catalyst{
        recipe = recipe.requireItem("catalyst", catalyst, 0, 0);
    }
    recipe.setActive(time_t);
    recipe = recipe.requireDuration("duration", time_t);
    recipe = recipe.requireEnergy("power", time_t * rft);

    bioAssembler.addRecipe(recipe);
    bioAssembler.addJEIRecipe(recipe);	
}
function addBioAssemblerRecipeRandom(
        out as WeightedItemStack[], fluid_out as ILiquidStack, 
        inp as IIngredient[], fluid_in as ILiquidStack[], catalyst as IIngredient,
        time_t as int, rft as int
    )
{
	var recipe = AssemblyRecipe.create(function(container) {
		for o in 0 to out.length {
			if(container.jei)
				container.addItemOutput("output" ~ o, out[o].stack.withLore(["§d§l" ~ out[o].percent ~ "%"]));
			else if(container.random.nextDouble() < out[o].chance) //>
				container.addItemOutput("output" ~ o, out[o].stack);
		}
        if fluid_out{
            container.addFluidOutput("output", fluid_out);
        }
	});
	for i in inp{
        recipe = recipe.requireItem("input", i);
    }
    for fluid in fluid_in{
        recipe = recipe.requireFluid("input", fluid);
    }

    if catalyst{
        recipe = recipe.requireItem("catalyst", catalyst, 0, 0);
    }
    recipe.setActive(time_t);
    recipe = recipe.requireDuration("duration", time_t);
    recipe = recipe.requireEnergy("power", time_t * rft);

    bioAssembler.addRecipe(recipe);
    bioAssembler.addJEIRecipe(recipe);	
}

mods.extendedcrafting.TableCrafting.addShaped(0, <requious:bioassembler>, [
	[<contenttweaker:living_steel_plate>, <bloodmagic:component:8>, <contenttweaker:living_processor>, <bloodmagic:component:8>, <contenttweaker:living_steel_plate>], 
	[<bloodmagic:component:8>, <contenttweaker:mechanical_eye>, <requious:assembler>, <contenttweaker:mechanical_eye>, <bloodmagic:component:8>], 
	[<contenttweaker:living_processor>, <contenttweaker:bio_injector>, <contenttweaker:blood_frame>, <contenttweaker:bio_injector>, <contenttweaker:living_processor>], 
	[<bloodmagic:component:8>, <contenttweaker:bio_injector>, <requious:assembler>, <contenttweaker:bio_injector>, <bloodmagic:component:8>], 
	[<contenttweaker:living_steel_plate>, <bloodmagic:component:8>, <contenttweaker:living_processor>, <bloodmagic:component:8>, <contenttweaker:living_steel_plate>]
]);

static chemical_reactor as Assembly = <assembly:chemical_reactor>;
{
    for x in 0 to 3
    for y in 0 to 3
    {
        chemical_reactor.setItemSlot(1 + x, 1 + y, ComponentFace.all(), 64)
            .setAccess(true, false)
            .setGroup("input");
        chemical_reactor.setJEIItemSlot(x, y, "input");
    }

    for x in 0 to 2
    for y in 0 to 3
    {
        chemical_reactor.setItemSlot(7 + x, 1 + y, ComponentFace.all(), 64)
            .setAccess(false, true)
            .setHandAccess(false, true)
            .setGroup("output" ~ (x + y*2));
        chemical_reactor.setJEIItemSlot(6 + x, y, "output" ~ (x + y*2));
    }

    for y in 0 to 3
    {
        chemical_reactor.setItemSlot(5, 1 + y, ComponentFace.all(), 64)
            .setAccess(true, false)
            .setGroup("cat");
        chemical_reactor.setJEIItemSlot(4, y, "cat");
    }
    
    chemical_reactor.setEnergySlot(0, 2, ComponentFace.all(), 100 * 1000 * 1000 * 1000)
        .setAccess(true, false)
        .setGroup("power");

    chemical_reactor.setDurationSlot(4, 2)
        .setVisual(SlotVisual.createGauge("requious:textures/gui/assembly_gauges.png", 0, 9, 1, 9, GaugeDirection.right(), false))
        .setGroup("duration1");
    chemical_reactor.setDurationSlot(6, 2)
        .setVisual(SlotVisual.createGauge("requious:textures/gui/assembly_gauges.png", 0, 9, 1, 9, GaugeDirection.right(), false))
        .setGroup("duration2");

    

    //chemical_reactor.setJEIItemSlot(1, 0, "input");
    //chemical_reactor.setJEIItemSlot(2, 0, "input");
    chemical_reactor.setJEIDurationSlot(3, 1, "duration", SlotVisual.createGauge("requious:textures/gui/assembly_gauges.png", 0, 9, 1, 9, GaugeDirection.right(), false));
    chemical_reactor.setJEIDurationSlot(5, 1, "duration", SlotVisual.createGauge("requious:textures/gui/assembly_gauges.png", 0, 9, 1, 9, GaugeDirection.right(), false));
    //chemical_reactor.setJEIItemSlot(4, 0, "output");
    //chemical_reactor.setJEIEnergySlot(6, 0, "power");

}
function addChemicalRecipe(
    out as WeightedItemStack[], inp as IIngredient[], cat as IIngredient[]
){
    var recipe = AssemblyRecipe.create(function(container) {
        for o in 0 to out.length {
			if(container.jei)
				container.addItemOutput("output" ~ o, out[o].stack.withLore(["§d§l" ~ out[o].percent ~ "%"]));
			else if(container.random.nextDouble() < out[o].chance) //>
				container.addItemOutput("output" ~ o, out[o].stack);
		}
    });
    for i in inp recipe.requireItem("input", i);
    for i in cat recipe.requireItem("cat", i, 0, 0);

    recipe = recipe.requireDuration("duration1", 5);
    recipe = recipe.requireDuration("duration2", 5);
    recipe = recipe.requireEnergy("power", 1000 * 1000 * 1000);

    chemical_reactor.addRecipe(recipe);
    chemical_reactor.addJEIRecipe(recipe);	
}
addChemicalRecipe(
    [<alchemistry:compound:202>],
    [<alchemistry:element:118>, <alchemistry:element:117> * 4],
    []
);



addBioAssemblerRecipeRandom(
    [<contenttweaker:flesh_bits> % 10, <contenttweaker:imperomite_catalyst_dust> % 100 ],
    <liquid:bacteria_waste> * 1000, 
    [<mod_lavacow:canerottenmeat> * 4, <contenttweaker:enriched_bioslag> * 4, <extrautils2:ingredients:17> * 4, <contenttweaker:imperomite_catalyst>],
    [<liquid:fermented_bacteria_broth> * 1000, <liquid:if.protein> * 1000],
    <contenttweaker:uranium_mesh>,
    80, 4096
);





static satelliteController as Assembly = <assembly:satellite_controller>;
{
    satelliteController.setEnergySlot(0, 2, ComponentFace.all(), 10000000)
        .setAccess(true, false)
        .setGroup("power");
    
    satelliteController.setItemSlot(4, 2, ComponentFace.all(), 1)
            .setAccess(false, false)
            .setHandAccess(false, false)
            .setGroup("computer");
    satelliteController.setItemSlot(4, 3, ComponentFace.all(), 1)
            .setAccess(false, false)
            .setHandAccess(false, false)
            .setHidden()
            .setGroup("computer2");

    satelliteController.setDurationSlot(3, 2)
        .setVisual(mods.requious.SlotVisual.arrowRight())
        .setGroup("duration");
    
    for x in 0 .. 2{
        for y in 0 .. 3{
            satelliteController.setItemSlot(1+x, 1+y, ComponentFace.all(), 64)
                .setAccess(true, false)
                .setGroup("input");
        }
    }

    for y in 0 .. 3{
        satelliteController.setItemSlot(6, 1+y, ComponentFace.all(), 1)
            .setAccess(false, true)
            .setHandAccess(false, true)
            .setGroup("output" ~ y);
    }

    for x in 0 .. 1{
        for y in 0 .. 5{
            satelliteController.setSelectionSlot(8+x, y, "selection", x * 5 + y)
                .setGroup("selection")
                .setMaxSelection(2);
        }
    }
    

    satelliteController.setJEIItemSlot(0, 0, "input_chip");
    satelliteController.setJEIItemSlot(1, 0, "input_antenna");
    satelliteController.setJEIDurationSlot(2, 0, "duration", SlotVisual.create(1,1).addPart("requious:textures/gui/assembly_gauges.png", 0, 8));
    satelliteController.setJEIItemSlot(3, 0, "output_chip");
    satelliteController.setJEIItemSlot(4, 0, "output_info");
    satelliteController.setJEIItemSlot(5, 0, "output_sat");
    satelliteController.setJEIItemSlot(6, 0, "output_item");
}
