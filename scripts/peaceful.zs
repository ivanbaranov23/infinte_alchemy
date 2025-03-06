import crafttweaker.item.IItemStack;

function addWeakEnhancerRecipe(inp as IItemStack, outp as IItemStack){
    recipes.addShapeless("weak_enh" ~ inp.displayName, outp, [inp, <contenttweaker:weak_enhancer>]);
}

recipes.addShapeless("weak_enh_rotten_flesh1", <minecraft:rotten_flesh> * 3, [<minecraft:porkchop>, <contenttweaker:weak_enhancer>]);
recipes.addShapeless("weak_enh_rotten_flesh2", <minecraft:rotten_flesh> * 3, [<minecraft:beef>, <contenttweaker:weak_enhancer>]);
recipes.addShapeless("weak_enh_rotten_flesh3", <minecraft:rotten_flesh> * 3, [<minecraft:chicken>, <contenttweaker:weak_enhancer>]);