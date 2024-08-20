
mods.bloodmagic.meteor.remove(item('minecraft:diamond_block'))
mods.bloodmagic.meteor.remove(item('minecraft:iron_block'))
mods.bloodmagic.meteor.remove(item('minecraft:gold_block'))


mods.bloodmagic.meteor.recipeBuilder()
    .catalyst(item('extendedcrafting:singularity_custom', 35))
    .component(ore('blockMeteoritecobble'), 70)
    .radius(7)
    .explosionStrength(10)
    .cost(1000)
    .register()