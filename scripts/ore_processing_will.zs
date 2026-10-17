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



static counter as int = 1;

for chunk,gasS in {
    <exnihilocreatio:item_ore_iron:1>: <gas:iron>,
    <exnihilocreatio:item_ore_copper:1>: <gas:copper>,
    <exnihilocreatio:item_ore_tin:1>: <gas:tin>,
    <exnihilocreatio:item_ore_nickel:1>: <gas:nickel>,
    <exnihilocreatio:item_ore_aluminum:1>: <gas:aluminum>,
    <exnihilocreatio:item_ore_zinc:1>: <gas:zinc>,
    
    <exnihilocreatio:item_ore_cobalt:1>: <gas:cobalt>,
    <exnihilocreatio:item_ore_ardite:1>: <gas:ardite>,

    <exnihilocreatio:item_ore_gold:1>: <gas:gold>,
    <exnihilocreatio:item_ore_silver:1>: <gas:silver>,
    <exnihilocreatio:item_ore_lead:1>: <gas:lead>,
    <exnihilocreatio:item_ore_osmium:1>: <gas:osmium>,
    
    <exnihilocreatio:item_ore_platinum:1>: <gas:platinum>,
    <exnihilocreatio:item_ore_iridium:1>: <gas:iridium>,
    <exnihilocreatio:item_ore_tungsten:1>: <gas:tungsten>,
    <exnihilocreatio:item_ore_titanium:1>: <gas:titanium>,
    <exnihilocreatio:item_ore_yellorium:1>: <gas:yellorium>,
    <contenttweaker:uranium_chunk>: <gas:uranium>,
    
    <exnihilocreatio:item_ore_mithril:1>: <gas:mithril>,
    <exnihilocreatio:item_ore_draconium:1>: <gas:draconium>,


    <contenttweaker:gallium_chunk>: <gas:gallium>,
    
    <contenttweaker:chrome_chunk>: <gas:chrome>,
    <contenttweaker:neodymium_chunk>: <gas:neodymium>,
    <contenttweaker:arkenium_chunk>: <gas:arkenium>,


    <contenttweaker:karmesine_chunk>: <gas:karmesine>,
    <contenttweaker:ovium_chunk>: <gas:ovium>,
    <contenttweaker:jauxum_chunk>: <gas:jauxum>,

    <contenttweaker:osram_chunk>: <gas:osram>,
    <contenttweaker:prometheum_chunk>: <gas:prometheum>,
    <contenttweaker:vibranium_chunk>: <gas:vibranium>,
    <contenttweaker:valyrium_chunk>: <gas:valyrium>,
    <contenttweaker:eezo_chunk>: <gas:eezo>,
    <contenttweaker:palladium_chunk>: <gas:palladium>,
    <contenttweaker:abyssum_chunk>: <gas:abyssum>,
    <contenttweaker:uru_chunk>: <gas:uru>,
    
    <contenttweaker:orichalcum_chunk>: <gas:orichalcum>,
    <contenttweaker:zirconium_chunk>: <gas:zirconium>,
    <contenttweaker:kikeridan_chunk>: <gas:kikeridan>,
    
    <contenttweaker:tantalum_chunk>: <gas:tantalum>,
    <contenttweaker:niobium_chunk>: <gas:niobium>,
    <contenttweaker:arsenic_chunk>: <gas:arsenic>,
    <contenttweaker:germanium_chunk>: <gas:germanium>,
    <contenttweaker:rhodium_chunk>: <gas:rhodium>,
    <contenttweaker:molybdenum_chunk>: <gas:molybdenum>,
    <contenttweaker:death_metal_chunk>: <gas:death_metal>,


} as IGasStack[IItemStack] {
    {
        var rec = RecipeBuilder.newBuilder("dissolving_" ~ counter, "corrosive_digester", 2);
        counter += 1;
        rec.setMaxThreads(1);
        rec.addEnergyPerTickInput(1000 * 1000);

        rec.addItemInput(chunk);
        rec.addWillInput(
            "CORROSIVE", 2
        );
            
        rec.addGasOutput(gasS * 600).addGasModifier(function(controller, gas) {
            var amount as int = scripts.corrosive_digester.getCorrosionCoefficient(
                controller.customData.corrosiveness.asInt(),
                controller.customData.waste.asInt()
            );
            return gas * (amount * 200);
        });

        rec.addFinishHandler(function(event as RecipeFinishEvent) {
            event.controller.customData = {
                corrosiveness: event.controller.customData.corrosiveness.asInt(),
                waste: event.controller.customData.waste.asInt() + 2 + (event.controller.customData.corrosiveness.asInt() / 50)
            };
        });
            

        rec.build();
    }
}




