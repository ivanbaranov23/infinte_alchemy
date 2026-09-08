import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.data.IData;

import mods.ctutils.utils.Math;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.mmce_complement.RedstoneInterface;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineStructureFormedEvent;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.RecipeFinishEvent;

RedstoneInterface.newRedstone("lava_fabricator", "temperature").build();

MMEvents.onStructureFormed("lava_fabricator", function(event as MachineStructureFormedEvent) {
    event.controller.customData = {temperature: 0};
});
MMEvents.onMachinePreTick("lava_fabricator", function(event as MachineTickEvent) {
    event.controller.customData = {
            temperature: Math.max(0, event.controller.customData.temperature.asInt() - 1)
    };
    event.controller.setRedstone("temperature", event.controller.customData.temperature.asInt() / 10000);
});
MMEvents.onControllerGUIRender("lava_fabricator", function(event as ControllerGUIRenderEvent) {
    event.extraInfo = ["temperature " ~ event.controller.customData.temperature / 10];
});

function addHeatingRec(fluid as ILiquidStack, amount_t as int, max_t as int){
    var rec = RecipeBuilder.newBuilder("heating_" ~ fluid.name, "lava_fabricator", 10);

    rec.addFluidInput(fluid);
    rec.addInput(<minecraft:redstone>);
    rec.addFinishHandler(function(event as RecipeFinishEvent) {
        event.controller.customData = {
            temperature: Math.min(max_t, event.controller.customData.temperature.asInt() + amount_t)
        };
        //event.controller.setRedstone("temperature", event.controller.customData.temperature.asInt() / 10000 + 1);

    });

    rec.addRecipeTooltip("+" ~ amount_t / 10 ~ " units of temperature,", "up to " ~ max_t / 10);

    rec.build();
}

addHeatingRec(<liquid:lava> * 100, 1000, 30000);
addHeatingRec(<liquid:high_heat_lava> * 100, 3000, 50000);
addHeatingRec(<liquid:super_heat_lava> * 100, 5000, 70000);
addHeatingRec(<liquid:insane_heat_lava> * 100, 10000, 100000);
addHeatingRec(<liquid:bonkers_heat_lava> * 100, 20000, 150000);



{//high heat lava
    var rec = RecipeBuilder.newBuilder("making_lava", "lava_fabricator", 20);
    rec.addEnergyPerTickInput(25000);

    rec.addItemInput(<contenttweaker:hot_ingot>).setChance(0.5);
    rec.addItemInput(<prodigytech:heat_capacitor_1>);
    rec.addItemOutput(<prodigytech:heat_capacitor_1:1200>);
        
    rec.addFluidInputs(
		<liquid:pyrotheum> * 1000, 
        <liquid:napalm> * 1000,
		<liquid:empoweredoil> * 1000//,

		//<liquid:andesite_magma> * 1000,
		//<liquid:nitronite_fluid> * 250,
		//<liquid:fierymetal> * 288
    );

    /*rec.addFinishHandler(function(event as RecipeFinishEvent) {
        if (event.controller.customData.temperature >= 1000){
            event.controller.customData = {
                temperature: event.controller.customData.temperature.asInt() / 2
            } as IData;

        }
        event.controller.setRedstone("temperature", event.controller.customData.temperature.asInt() / 1000 + 1);
    });*/

    rec.addFluidOutput(<liquid:high_heat_lava> * 1000).addFluidModifier(function(controller, liquid) {
        if controller.customData.temperature >= 10000{
            
            
            return <liquid:high_heat_lava> * 1000;
        }
        return null;
    });
    rec.addRecipeTooltip("Needs at least 1000", "units of temperature.");
    rec.addFluidOutput(<liquid:lava_residue> * 1000);
    
    rec.build();
}

{//super heat lava
    var rec = RecipeBuilder.newBuilder("making_lava2", "lava_fabricator", 20);
    rec.addEnergyPerTickInput(250000);

    rec.addItemInput(<bloodmagic:component:1>).setChance(0.5);
    rec.addItemInput(<prodigytech:heat_capacitor_2>);
    rec.addItemOutput(<prodigytech:heat_capacitor_2:1200>);
        
    rec.addFluidInputs(
		<liquid:liquidfusionlava> * 2000, 
		<liquid:nitronite_fluid> * 250,
		<liquid:fierymetal> * 288
    );

    rec.addFinishHandler(function(event as RecipeFinishEvent) {
        if (event.controller.customData.temperature >= 1000){
            event.controller.customData = {
                temperature: event.controller.customData.temperature.asInt() - 10000
            } as IData;

        }
    });

    rec.addFluidOutput(<liquid:super_heat_lava> * 1000).addFluidModifier(function(controller, liquid) {
        if controller.customData.temperature >= 35000{
            
            
            return <liquid:super_heat_lava> * 1000;
        }
        return null;
    });
    rec.addRecipeTooltip("Needs at least", "3500 units of temperature.", "1000 units are consumed");
    rec.addFluidOutput(<liquid:lava_residue> * 1000);
    
    rec.build();
}

