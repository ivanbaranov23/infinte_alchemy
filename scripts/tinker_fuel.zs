import crafttweaker.liquid.ILiquidStack;
//why is it separate?


<liquid:andesite_magma>.definition.temperature = 2200;
mods.tconstruct.Fuel.registerFuel(<liquid:andesite_magma> * 50, 20 * 20);
<liquid:high_heat_lava>.definition.temperature = 6300;
mods.tconstruct.Fuel.registerFuel(<liquid:high_heat_lava> * 50, 20 * 80);
<liquid:super_heat_lava>.definition.temperature = 20300;
mods.tconstruct.Fuel.registerFuel(<liquid:super_heat_lava> * 50, 20 * 100);
<liquid:fire>.definition.temperature = 300300;
mods.tconstruct.Fuel.registerFuel(<liquid:fire> * 50, 20 * 10);

<liquid:obsidian>.definition.temperature = 1500;
mods.tconstruct.Fuel.registerFuel(<liquid:obsidian> * 50, 20 * 1);


//jei fluids
function addJEIhint_fluid_smeltery_temperature(fluid as ILiquidStack, temp as int){
    scripts.jei.addJEIhint(
        [],
        [fluid],
        [<tconstruct:smeltery_controller>, <tconstruct:seared_tank>],
        [<minecraft:paper>.withDisplayName("Temperature: " ~ (fluid.definition.temperature -  300))]
    );
}
addJEIhint_fluid_smeltery_temperature(<liquid:lava>, 1000);
addJEIhint_fluid_smeltery_temperature(<liquid:pyrotheum>, 3700);
addJEIhint_fluid_smeltery_temperature(<liquid:fiery_essence>, 700);
addJEIhint_fluid_smeltery_temperature(<liquid:fire_water>, 1700);
addJEIhint_fluid_smeltery_temperature(<liquid:magma_fluid>, 1700);
addJEIhint_fluid_smeltery_temperature(<liquid:dilithium_fluid>, 1200);
addJEIhint_fluid_smeltery_temperature(<liquid:nitronite_fluid>, 2800);
addJEIhint_fluid_smeltery_temperature(<liquid:obsidian>, 2800);
addJEIhint_fluid_smeltery_temperature(<liquid:blazing_blood>, 2800);

addJEIhint_fluid_smeltery_temperature(<liquid:andesite_magma>, 1900);
addJEIhint_fluid_smeltery_temperature(<liquid:high_heat_lava>, 3000);
addJEIhint_fluid_smeltery_temperature(<liquid:super_heat_lava>, 5000);
addJEIhint_fluid_smeltery_temperature(<liquid:fire>, 6000);


mods.thermalexpansion.Crucible.removeRecipe(<minecraft:magma>);