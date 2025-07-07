import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.entity.IEntityDefinition;

import scripts.mob_jei.addJEIentityHint;



function addDollHint(ent as string, doll as IItemStack, fluid as ILiquidStack){
    addJEIentityHint(
        [doll], null, "",
        [
            <exnihilocreatio:item_material:5>.withDisplayName(game.localize("ia.egg_hint.doll")),
            <exnihilocreatio:block_barrel0> | <exnihilocreatio:block_barrel1>
        ], fluid,
        [], null, ent
    );
}

addDollHint("minecraft:blaze", <exnihilocreatio:item_doll>, <liquid:lava>);
addDollHint("minecraft:enderman", <exnihilocreatio:item_doll:1>, <liquid:witchwater>);
addDollHint("minecraft:shulker", <exnihilocreatio:item_doll:2>, <liquid:witchwater>);
addDollHint("minecraft:guardian", <exnihilocreatio:item_doll:3>, <liquid:water>);
addDollHint("thermalfoundation:blizz", <exnihilocreatio:item_doll:4>, <liquid:pyrotheum>);
addDollHint("thermalfoundation:blitz", <exnihilocreatio:item_doll:5>, <liquid:pyrotheum>);
addDollHint("thermalfoundation:basalz", <exnihilocreatio:item_doll:6>, <liquid:pyrotheum>);
addDollHint("tconstruct:blueslime", <exnihilocreatio:item_doll:6>, <liquid:milk>);