

recipes.remove(<torchmaster:feral_flare_lantern>);
recipes.addShaped("ia_feral_flare_lantern", <torchmaster:feral_flare_lantern>, [
    [<contenttweaker:gold_wire>, <immersiveengineering:material:2>, <contenttweaker:gold_wire>],
    [<minecraft:glass>, <minecraft:redstone_lamp>, <minecraft:glass>],
    [<contenttweaker:gold_wire>, <immersiveengineering:material:2>, <contenttweaker:gold_wire>]
]);

recipes.remove(<torchmaster:dread_lamp>);
recipes.addShapeless("ia_dread_lamp", <torchmaster:dread_lamp>, [
    <torchmaster:feral_flare_lantern>, <extrautils2:ingredients:10>
]);