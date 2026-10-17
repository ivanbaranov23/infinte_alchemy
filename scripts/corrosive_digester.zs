#priority 1

import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.oredict.IOreDictEntry;

import mod.mekanism.gas.IGasStack;

import mods.ctutils.utils.Math;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.mmce_complement.RedstoneInterface;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineStructureFormedEvent;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.RecipeFinishEvent;



function getCorrosionCoefficient(corr as int, waste as int) as int{
    return 3 + Math.clamp(
        (corr - waste) / 10,
        0,
        7
    );
}



RedstoneInterface.newRedstone("corrosive_digester", "corrosiveness").build();
RedstoneInterface.newRedstone("corrosive_digester", "waste").build();

MMEvents.onStructureFormed("corrosive_digester", function(event as MachineStructureFormedEvent) {
    event.controller.customData = {
        corrosiveness: 0,
        waste: 0
    };
});
MMEvents.onMachinePreTick("corrosive_digester", function(event as MachineTickEvent) {
    event.controller.setRedstone("corrosiveness", event.controller.customData.corrosiveness.asInt() / 100);
    event.controller.setRedstone("waste", event.controller.customData.waste.asInt() / 100);
});
MMEvents.onControllerGUIRender("corrosive_digester", function(event as ControllerGUIRenderEvent) {
    event.extraInfo = [
        "corrosiveness: " ~ event.controller.customData.corrosiveness, 
        "waste: " ~ event.controller.customData.waste,
        "current coefficient: " ~ getCorrosionCoefficient(event.controller.customData.corrosiveness.asInt(), event.controller.customData.waste.asInt())
    ];
});




{
    var rec = RecipeBuilder.newBuilder("raising_corr", "corrosive_digester", 2);
    rec.setMaxThreads(1);
    rec.addEnergyPerTickInput(1000 * 1000);

    rec.addItemInput(<contenttweaker:chewed_meat>);
            
            

    rec.addFinishHandler(function(event as RecipeFinishEvent) {
        event.controller.customData = {
            corrosiveness: event.controller.customData.corrosiveness.asInt() + 10,
            waste: event.controller.customData.waste.asInt()
        };
    });
            

    rec.build();
}
{
    var rec = RecipeBuilder.newBuilder("removing_waste", "corrosive_digester", 2);
    rec.setMaxThreads(1);
    rec.addEnergyPerTickInput(1000 * 1000);

    rec.addItemInput(<contenttweaker:soap>);
            
            

    rec.addFinishHandler(function(event as RecipeFinishEvent) {
        event.controller.customData = {
            corrosiveness: 0,
            waste: 0
        };
    });
            

    rec.build();
}