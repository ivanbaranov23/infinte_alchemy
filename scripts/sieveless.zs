import crafttweaker.item.IItemStack;

import mods.alfinivia.Milking;
import crafttweaker.entity.IEntityDefinition;


Milking.add(
    <minecraft:wheat_seeds>,
    <entity:minecraft:witch>,
    <exnihilocreatio:item_material:3>, false
);
scripts.jei.addJEIhint(
    [<minecraft:wheat_seeds>], [],
    [<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:witch"}})],
    [<exnihilocreatio:item_material:3>]
);

