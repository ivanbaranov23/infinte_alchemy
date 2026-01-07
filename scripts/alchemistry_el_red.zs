import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;

import mods.thermalexpansion.InductionSmelter;
//InductionSmelter.addRecipe(IItemStack primaryOutput, IItemStack primaryInput, IItemStack secondaryInput, int energy, @Optional IItemStack secondaryOutput, @Optional int secondaryChance);

import mods.alchemistry.Dissolver;

{
    recipes.addShapeless("elemental_reduction", <contenttweaker:elemental_reduction> * 3, [
        <contenttweaker:creosolon>, 
        <contenttweaker:transmut_gel>, 
        <contenttweaker:osmiridium_dust>, 
        <contenttweaker:bacteria>
    ]);
    recipes.addShapeless("elemental_reduction2", <contenttweaker:elemental_reduction> * 5, [
        <contenttweaker:soapart>, 
        <contenttweaker:transmut_gel>, 
        <contenttweaker:osmiridium_dust>, 
        <contenttweaker:bacteria>
    ]);
    recipes.addShapeless("elemental_reduction3", <contenttweaker:elemental_reduction> * 7, [
        <contenttweaker:soapart>, 
        <contenttweaker:transmut_gel>, 
        <contenttweaker:osmiridium_dust>, 
        <contenttweaker:bacteria>,
        <alchemistry:element:68>
    ]);
}



function addTableElementShapeless(el as IItemStack, inp as IItemStack, num as int){
    var inps as IItemStack[] = [<contenttweaker:elemental_reduction>];
    for i in 0 .. num{
        inps += inp;
    }
    recipes.addShapeless("ia_el_red" ~ el.displayName ~ "_" ~ inp.displayName, el, inps);
}
var elements as int[IItemStack][IItemStack] = {

    <alchemistry:element:68>: {
        <erebus:dark_capped_mushroom_block> * 8: 1,
        <erebus:sarcastic_czech_mushroom_block> * 8: 1,
        <erebus:grandmas_shoes_mushroom_block> * 8: 1,
        <erebus:dutch_cap_mushroom_block> * 8: 1,
        <erebus:kaizers_fingers_mushroom_block> * 8: 1,

        <erebus:materials:15> * 4: 1,
        <erebus:planks:12> * 8: 1,
        <erebus:materials:64>: 4
    },

    <alchemistry:element:94>: {
        <bigreactors:ingotcyanite> * 2: 1,
        <bigreactors:dustcyanite> * 2: 1
    }
};
var elements_no_alch as int[IItemStack][IItemStack] = {
    <alchemistry:element:3>: {
        <mekanism:otherdust:4>: 4
    },
    <alchemistry:element:20>: {
        <contenttweaker:calcium>: 4
    },
    <alchemistry:element:41>: {
        <taiga:niob_ingot>: 2
    },
    <alchemistry:element:56>: {
        <contenttweaker:witherite>: 2,
        <contenttweaker:awaken_witherite>: 4
    },
    <alchemistry:element:84>: {    
        <contenttweaker:polonium_dust>: 4
    }
};
for el in elements{
    for inp in elements[el]{
        addTableElementShapeless(el * elements[el][inp], inp * 1, inp.amount);
        Dissolver.addRecipe(
            inp, true, 1, [
                [1, el * elements[el][inp]]
            ]
        );
    }
}
for el in elements_no_alch{
    for inp in elements_no_alch[el]{
        addTableElementShapeless(el * elements_no_alch[el][inp], inp * 1, inp.amount);
    }
}


Dissolver.addRecipe(
    <taiga:niob_ingot>, true, 1, [
        [1, <alchemistry:element:41> * 4]
    ]
);