mods.botania.mana_infusion.recipeBuilder()
    .input(item('contenttweaker:orichalcum_block'))
    .output(item('contenttweaker:death_metal_pieces'))
    .mana(500000)
    .catalyst(blockstate('contenttweaker:death_metal_block'))
    .register()


mods.botania.mana_infusion.recipeBuilder()
    .input(item('contenttweaker:terra_base_dust'))
    .output(item('contenttweaker:terra_base'))
    .mana(500000)
    .catalyst(blockstate('contenttweaker:terracrux'))
    .register()