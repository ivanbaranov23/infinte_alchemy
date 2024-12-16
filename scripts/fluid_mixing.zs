//#norun
#loader crafttweaker reloadable
import mods.fluidintetweaker.FITweaker;
import mods.fluidintetweaker.FBTweaker;
import mods.fluidintetweaker.behavior.Condition;

FITweaker.addRecipe(<liquid:creosote>, false, <liquid:andesite>, <blockstate:quark:jasper:variant=stone_jasper>);


FITweaker.addRecipe(<liquid:andesite>, false, <liquid:blueslime>, <blockstate:minecraft:stone:variant=andesite>);

FITweaker.addRecipe(<liquid:blueslime>, false, <liquid:lava>, <blockstate:contenttweaker:burned_slimedirt>);

FITweaker.addRecipe(<liquid:ender_blood>, false, <liquid:andesite>, <blockstate:minecraft:end_stone>);

FITweaker.addRecipe(<liquid:ash_solution>, false, <liquid:andesite>, <blockstate:quark:limestone:variant=stone_limestone>);

FITweaker.addRecipe(<liquid:ash_solution>, false, <liquid:lava>, <blockstate:minecraft:stone:variant=diorite>);
FITweaker.addRecipe(<liquid:lava>, false, <liquid:andesite>, <blockstate:minecraft:stone:variant=granite>);


{//research
    FITweaker.addRecipe(<liquid:organic_cg>, false, <liquid:andesite>, <blockstate:minecraft:mossy_cobblestone>);
    FITweaker.addRecipe(<liquid:organic_cg>, false, <liquid:formic_acid>, <blockstate:erebus:petrified_bark_red:axis=y>);

    FITweaker.addRecipe(<liquid:residue_cg>, false, <liquid:pure_water>, <blockstate:contenttweaker:poor_iron_ore>);
    FITweaker.addRecipe(<liquid:residue_cg>, false, <liquid:sand>, <blockstate:atum:sand>);
    FITweaker.addRecipe(<liquid:residue_cg>, false, <liquid:redstone>, <blockstate:minecraft:sand:variant=red_sand>);
    FITweaker.addRecipe(<liquid:residue_cg>, false, <liquid:liquifiedsouls>, <blockstate:netherendingores:ore_other_1:blocks=overworld_quartz_ore>);
    FITweaker.addRecipe(<liquid:residue_cg>, false, <liquid:pyrotheum>, <blockstate:quark:biome_cobblestone:variant=fire_stone>);
    FITweaker.addRecipe(<liquid:residue_cg>, false, <liquid:cryotheum>, <blockstate:quark:biome_cobblestone:variant=icy_stone>);

    FITweaker.addRecipe(<liquid:sludge_cg>, false, <liquid:malachite_glue>, <blockstate:erebus:umberstone:type=umberstone>);
    FITweaker.addRecipe(<liquid:sludge_cg>, false, <liquid:stone>, <blockstate:tconstruct:soil:type=grout>);
    FITweaker.addRecipe(<liquid:sludge_cg>, false, <liquid:clay>, <blockstate:tconstruct:dried_clay:type=clay>);
    FITweaker.addRecipe(<liquid:sludge_cg>, false, <liquid:sea_water>, <blockstate:biomesoplenty:dirt:coarse=false,variant=silty>);
    FITweaker.addRecipe(<liquid:sludge_cg>, false, <liquid:sand>, <blockstate:biomesoplenty:dirt:coarse=false,variant=sandy>);
    //FITweaker.addRecipe(<liquid:sludge_cg>, false, <liquid:clay>, <blockstate:tconstruct:dried_clay:type=clay>);
}

{//jei
    FITweaker.addJEIRecipeWrapper(<liquid:blood>, 1, <liquid:water>, 1,
        FITweaker.outputBuilder().addEvent(FITweaker.eventBuilder().createSetBlockEvent(<blockstate:biomesoplenty:flesh>))
    );
    FITweaker.addJEIRecipeWrapper(<liquid:blood>, 1, <liquid:witchwater>, 1,
        FITweaker.outputBuilder().addEvent(FITweaker.eventBuilder().createSetBlockEvent(<blockstate:minecraft:soul_sand>))
    );
    FITweaker.addJEIRecipeWrapper(<liquid:blueslime>, 1, <liquid:witchwater>, 1,
        FITweaker.outputBuilder().addEvent(FITweaker.eventBuilder().createSetBlockEvent(<blockstate:tconstruct:slime_dirt:type=blue>))
    );
    FITweaker.addJEIRecipeWrapper(<liquid:sand>, 1, <liquid:water>, 1,
        FITweaker.outputBuilder().addEvent(FITweaker.eventBuilder().createSetBlockEvent(<blockstate:biomesoplenty:mud:variant=mud>))
    );

}


//<entity:primitivemobs:treasure_slime>

FBTweaker.addRecipe(<liquid:water>, FBTweaker.outputBuilder()
    .addEvent(FBTweaker.eventBuilder().createEntityConversionEvent(
        <entity:minecraft:blaze>, <entity:thermalfoundation:basalz>
    ))
);

//effects
FBTweaker.addRecipe(<liquid:cold_liquid>, FBTweaker.outputBuilder()
    .addEvent(FBTweaker.eventBuilder().createPotionEffectEvent(
        "mowziesmobs:frozen", 20, 0
    ).addCondition(Condition.byChance, [0.1f]))
    .addEvent(FBTweaker.eventBuilder().createPotionEffectEvent(
        "minecraft:instant_damage", 1, 0
    ).addCondition(Condition.byChance, [0.1f]))
    .addEvent(FBTweaker.eventBuilder().createSetSnowEvent())
    
);
FBTweaker.addRecipe(<liquid:malachite_glue>, FBTweaker.outputBuilder()
    .addEvent(FBTweaker.eventBuilder().createPotionEffectEvent(
        "minecraft:slowness", 20, 0
    ))
    .addEvent(FBTweaker.eventBuilder().createSetSnowEvent())
    
);

FBTweaker.addRecipe(<liquid:sand>, FBTweaker.outputBuilder()
    
    .addEvent(FBTweaker.eventBuilder().createEntityConversionEvent(
        <entity:minecraft:zombie>, <entity:atum:mummy>
    ).addCondition(Condition.byChance, [0.1f]))
    .addEvent(FBTweaker.eventBuilder().createEntityConversionEvent(
        <entity:minecraft:zombie>, <entity:atum:wraith>
    ).addCondition(Condition.byChance, [0.1f]))
    .addEvent(FBTweaker.eventBuilder().createEntityConversionEvent(
        <entity:minecraft:zombie>, <entity:atum:forsaken>
    ).addCondition(Condition.byChance, [0.1f]))
    .addEvent(FBTweaker.eventBuilder().createEntityConversionEvent(
        <entity:minecraft:zombie>, <entity:minecraft:husk>
    ).addCondition(Condition.byChance, [0.1f]))
    
);
//FBTweaker.eventBuilder().createEntityConversionEvent();