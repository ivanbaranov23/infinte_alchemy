#loader crafttweaker reloadable
import mods.fluidintetweaker.FITweaker;
import mods.fluidintetweaker.FBTweaker;

FITweaker.addRecipe(<liquid:creosote>, false, <liquid:andesite>, <blockstate:quark:jasper:variant=stone_jasper>);


FITweaker.addRecipe(<liquid:andesite>, false, <liquid:blueslime>, <blockstate:minecraft:stone:variant=andesite>);

FITweaker.addRecipe(<liquid:lava>, false, <liquid:blueslime>, <blockstate:contenttweaker:burned_slimedirt>);

FITweaker.addRecipe(<liquid:organic_green>, false, <liquid:andesite>, <blockstate:minecraft:mossy_cobblestone>);

FITweaker.addRecipe(<liquid:ender_blood>, false, <liquid:andesite>, <blockstate:minecraft:end_stone>);

FITweaker.addRecipe(<liquid:ash_solution>, false, <liquid:andesite>, <blockstate:quark:limestone:variant=stone_limestone>);

FITweaker.addRecipe(<liquid:ash_solution>, false, <liquid:lava>, <blockstate:minecraft:stone:variant=diorite>);
FITweaker.addRecipe(<liquid:lava>, false, <liquid:andesite>, <blockstate:minecraft:stone:variant=granite>);


FBTweaker.addRecipe(<liquid:water>, FBTweaker.outputBuilder()
    .addEvent(FBTweaker.eventBuilder().createEntityConversionEvent(
        "minecraft:blaze", "thermalfoundation:basalz"
    ).done())
    .done()
);
FBTweaker.addRecipe(<liquid:cold_liquid>, FBTweaker.outputBuilder()
    .addEvent(FBTweaker.eventBuilder().createPotionEffectEvent(
        "mowziesmobs:frozen", 20, 0
    ).addCondition("ByChance", [0.1f]).done())
    .addEvent(FBTweaker.eventBuilder().createPotionEffectEvent(
        "minecraft:instant_damage", 1, 0
    ).addCondition("ByChance", [0.1f]).done())
    .addEvent(FBTweaker.eventBuilder().createSetSnowEvent().done())
    .done()
);

FBTweaker.addRecipe(<liquid:sand>, FBTweaker.outputBuilder()
    .addEvent(FBTweaker.eventBuilder().createEntityConversionEvent(
        "minecraft:zombie", "atum:mummy"
    ).addCondition("ByChance", [0.1f]).done())
    .addEvent(FBTweaker.eventBuilder().createEntityConversionEvent(
        "minecraft:zombie", "atum:wraith"
    ).addCondition("ByChance", [0.1f]).done())
    .addEvent(FBTweaker.eventBuilder().createEntityConversionEvent(
        "minecraft:zombie", "atum:forsaken"
    ).addCondition("ByChance", [0.1f]).done())
    .addEvent(FBTweaker.eventBuilder().createEntityConversionEvent(
        "minecraft:zombie", "minecraft:husk"
    ).addCondition("ByChance", [0.1f]).done())
    .done()
);
