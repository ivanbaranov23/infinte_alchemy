
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

mods.bloodmagic.meteor.recipeBuilder()
    .catalyst(item('extendedcrafting:singularity', 1))
    .component(ore('oreOverworldIron'), 50)
    .component(ore('oreManyIron'), 20)
    .component(ore('sandIron'), 30)
    .component(ore('oreOverworldNickel'), 30)
    .component(ore('oreManyNickel'), 10)
    .component(ore('oreOxideNickel'), 5)
    .component(ore('oreOverworldLead'), 20)
    .radius(8)
    .explosionStrength(10)
    .cost(100 * 1000)
    .register()