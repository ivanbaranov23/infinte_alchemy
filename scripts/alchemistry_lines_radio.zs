import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;

import mods.alchemistry.Evaporator;
import mods.alchemistry.Combiner;
import mods.alchemistry.Dissolver;

{//thorium
    Dissolver.addRecipe(<contenttweaker:viking_metal>, false, 1,
        [
            [100, <alchemistry:element:90> * 64]
        ]
    );
    Dissolver.addRecipe(<bigreactors:ingotyellorium>, false, 1,
        [
            [100, <alchemistry:element:90> * 16]
        ]
    );
}