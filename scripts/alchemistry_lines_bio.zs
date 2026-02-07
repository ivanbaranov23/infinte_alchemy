import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;

import mods.alchemistry.Evaporator;
import mods.alchemistry.Combiner;
import mods.alchemistry.Dissolver;

import mods.alchemistry.Atomizer;
import mods.alchemistry.Liquifier;

import scripts.content_machines.addChemicalRecipe;


{//1
    addChemicalRecipe(
        [<contenttweaker:alanine>, <alchemistry:compound:6>, <alchemistry:compound:209>],
        [<contenttweaker:acetaldehyde>, <contenttweaker:ammonium_chloride>, <alchemistry:compound:223>, <alchemistry:compound:7> * 2],
        []
    );

    addChemicalRecipe(
        [<contenttweaker:pyruvate> * 2, <alchemistry:compound:7> * 2, <alchemistry:element:8> * 2],
        [<contenttweaker:h2o2> * 2, <contenttweaker:tartaric_acid>],
        []
    );
    addChemicalRecipe(
        [<contenttweaker:alanine>, <alchemistry:compound:7>, <alchemistry:compound:225>],
        [<contenttweaker:pyruvate>, <contenttweaker:ammonium_formate>],
        []
    );
    
}
{//9
    Dissolver.addRecipe(<contenttweaker:hemocyanin>, false, 1,
        [
            [100, <contenttweaker:histidine> * 4, <alchemistry:element:29> * 32]
        ]
    );
}