import mods.alfinivia.Milking;


Milking.add(
    <contenttweaker:staffwood_bug>,
    <entity:minecraft:zombie>,
    <exnihilocreatio:item_ore_iron>, false
);
scripts.jei.addJEIhint(
    [<minecraft:egg>.withDisplayName(<entity:minecraft:zombie>.name)], [],
    [<contenttweaker:staffwood_bug>],
    [<exnihilocreatio:item_ore_iron>]
);