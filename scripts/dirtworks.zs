import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;

import mods.tconstruct.Casting;

import mods.thermalexpansion.Crucible;
import mods.thermalexpansion.Transposer;


Crucible.addRecipe(<liquid:dirt> * 144, <biomesoplenty:dirt:1>, 4000);
Crucible.addRecipe(<liquid:dirt> * 144, <biomesoplenty:dirt:2>, 4000);
Crucible.addRecipe(<liquid:dirt> * 144, <natura:nether_tainted_soil>, 4000);
Crucible.addRecipe(<liquid:dirt> * 144, <biomesoplenty:dirt>, 4000);
Crucible.addRecipe(<liquid:dirt> * 144, <biomesoplenty:dirt:8>, 4000);
Crucible.addRecipe(<liquid:dirt> * 144, <biomesoplenty:dirt:9>, 4000);
Crucible.addRecipe(<liquid:dirt> * 144, <biomesoplenty:dirt:10>, 4000);

//silty
//silty dirt to niter in ex nihilo
Casting.addBasinRecipe(
    <biomesoplenty:dirt:2>, 
    <thermalfoundation:material:772>, 
    <liquid:dirt>, 288, 
    true
);
Transposer.addFillRecipe(
    <biomesoplenty:dirt:2>,
    <thermalfoundation:material:772>, <liquid:dirt> * 144, 
    400
);

//sandy
Casting.addBasinRecipe(
    <biomesoplenty:dirt:1>, 
    <minecraft:sand>, 
    <liquid:dirt>, 288, 
    true
);
Transposer.addFillRecipe(
    <biomesoplenty:dirt:1>,
    <minecraft:sand>, <liquid:dirt> * 144, 
    400
);