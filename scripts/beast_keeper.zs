import mods.alfinivia.Milking;


Milking.add(
    <minecraft:bucket>,
    <entity:minecraft:zombie>,
    <forge:bucketfilled>.withTag({FluidName: "rot", Amount: 1000}), false
);
scripts.jei.addJEIhint(
    [<minecraft:egg>.withDisplayName(<entity:minecraft:zombie>.name), <minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:zombie"}})], [],
    [<minecraft:bucket>],
    [<forge:bucketfilled>.withTag({FluidName: "rot", Amount: 1000})], [<liquid:rot>]
);

Milking.add(
    <roots:living_arrow>,
    <entity:minecraft:zombie>,
    <exnihilocreatio:item_ore_iron>, false
);
scripts.jei.addJEIhint(
    [<minecraft:egg>.withDisplayName(<entity:minecraft:zombie>.name), <minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:zombie"}})], [],
    [<roots:living_arrow>],
    [<exnihilocreatio:item_ore_iron>]
);