

mods.thermalexpansion.tapper_tree.add(blockstate('botania:livingwood', 'variant=default'), blockstate('contenttweaker:revived_log'))
mods.thermalexpansion.tapper.addBlock(item('botania:livingwood'), fluid('lava') * 150)

mods.thermalexpansion.tapper.removeBlockByInput(item('natura:overworld_logs', 2))
mods.thermalexpansion.tapper.addBlock(item('natura:overworld_logs', 2), fluid('amaranth_juice') * 50)

mods.thermalexpansion.tapper_tree.add(blockstate('tconstruct:slime_congealed', 'type=green'), blockstate('tconstruct:slime_leaves', 'check_decay=false', 'decayable=true', 'foliage=blue'))
mods.thermalexpansion.tapper.addBlock(item('tconstruct:slime_congealed'), fluid('blueslime') * 50)

mods.thermalexpansion.tapper_fertilizer.add(item('minecraft:dye', 15), 2)
mods.thermalexpansion.tapper_fertilizer.add(item('actuallyadditions:item_fertilizer'), 4)
mods.thermalexpansion.tapper_fertilizer.add(item('atum:fertile_soil_pile'), 3)
mods.thermalexpansion.tapper_fertilizer.add(item('botania:fertilizer'), 5)
mods.thermalexpansion.tapper_fertilizer.add(item('alchemistry:fertilizer'), 12)
mods.thermalexpansion.tapper_fertilizer.add(item('industrialforegoing:fertilizer'), 3)
mods.thermalexpansion.tapper_fertilizer.add(item('mysticalagriculture:fertilized_essence'), 50)
mods.thermalexpansion.tapper_fertilizer.add(item('botania:overgrowthseed'), 100)

mods.thermalexpansion.tapper_fertilizer.add(item('thermalfoundation:material', 800), 1)
mods.thermalexpansion.tapper_fertilizer.add(item('prodigytech:sawdust'), 1)
mods.thermalexpansion.tapper_fertilizer.add(item('mekanism:sawdust'), 1)

mods.thermalexpansion.tapper_fertilizer.add(item('contenttweaker:fertilizer1'), 2)
mods.thermalexpansion.tapper_fertilizer.add(item('contenttweaker:fertilizer2'), 4)
mods.thermalexpansion.tapper_fertilizer.add(item('contenttweaker:fertilizer3'), 6)
mods.thermalexpansion.tapper_fertilizer.add(item('contenttweaker:fertilizer4'), 10)
mods.thermalexpansion.tapper_fertilizer.add(item('contenttweaker:fertilizer5'), 25)
mods.thermalexpansion.tapper_fertilizer.add(item('contenttweaker:fertilizer6'), 50)
mods.thermalexpansion.tapper_fertilizer.add(item('contenttweaker:fertilizer7'), 100)