//#norun
#loader crafttweaker reloadable
import mods.fluidintetweaker.FITweaker;
import mods.fluidintetweaker.FBTweaker;
import mods.fluidintetweaker.behavior.Condition as BCondition;
import mods.fluidintetweaker.interaction.Condition as ICondition;


FITweaker.addRecipe(<liquid:blood>, <liquid:water>, <blockstate:biomesoplenty:flesh>);

FITweaker.addRecipe(<liquid:blood>, <liquid:witchwater>, <blockstate:minecraft:soul_sand>);
FITweaker.addRecipe(<liquid:witchwater>, <liquid:blood>, <blockstate:minecraft:soul_sand>);

FITweaker.addRecipe(<liquid:blueslime>, <liquid:witchwater>, <blockstate:tconstruct:slime_dirt:type=blue>);
FITweaker.addRecipe(<liquid:ash_solution>, <liquid:witchwater>, <blockstate:quark:marble>);
FITweaker.addRecipe(<liquid:andesite>, <liquid:witchwater>, 
    FITweaker.outputBuilder()
        .addEvent(
            FITweaker.eventBuilder().createSetBlockEvent(<blockstate:minecraft:stone:variant=andesite>)
        )
        .addEvent(
            FITweaker.eventBuilder().createSetBlockEvent(<blockstate:minecraft:netherrack>)
                .addCondition(ICondition.byChance, [0.25f])
        )
);


FITweaker.addRecipe(<liquid:creosote>, <liquid:andesite>, <blockstate:quark:jasper:variant=stone_jasper>);


FITweaker.addRecipe(<liquid:andesite>, <liquid:blueslime>, <blockstate:minecraft:stone:variant=andesite>);

FITweaker.addRecipe(<liquid:blueslime>, <liquid:lava>, <blockstate:contenttweaker:burned_slimedirt>);

FITweaker.addRecipe(<liquid:ender_blood>, <liquid:andesite>, <blockstate:minecraft:end_stone>);

FITweaker.addRecipe(<liquid:ash_solution>, <liquid:andesite>, <blockstate:quark:limestone:variant=stone_limestone>);

FITweaker.addRecipe(<liquid:lava>, <liquid:ash_solution>, <blockstate:minecraft:stone:variant=diorite>);
FITweaker.addRecipe(<liquid:lava>, <liquid:andesite>, <blockstate:minecraft:stone:variant=granite>);


{//research
    FITweaker.addRecipe(<liquid:residue_cg>, <liquid:liquifiedsouls>, <blockstate:netherendingores:ore_other_1:blocks=overworld_quartz_ore>);

    FITweaker.addRecipe(<liquid:organic_cg>, <liquid:andesite>, <blockstate:minecraft:mossy_cobblestone>);
    FITweaker.addRecipe(<liquid:organic_cg>, <liquid:formic_acid>, <blockstate:erebus:petrified_bark_red:axis=y>);

    FITweaker.addRecipe(<liquid:residue_cg>, <liquid:pure_water>, <blockstate:contenttweaker:poor_iron_ore>);
    FITweaker.addRecipe(<liquid:residue_cg>, <liquid:sand>, <blockstate:atum:sand>);
    FITweaker.addRecipe(<liquid:residue_cg>, <liquid:redstone>, <blockstate:minecraft:sand:variant=red_sand>);
    
    FITweaker.addRecipe(<liquid:residue_cg>, <liquid:pyrotheum>, <blockstate:quark:biome_cobblestone:variant=fire_stone>);
    FITweaker.addRecipe(<liquid:residue_cg>, <liquid:cryotheum>, <blockstate:quark:biome_cobblestone:variant=icy_stone>);

    FITweaker.addRecipe(<liquid:sludge_cg>, <liquid:malachite_glue>, <blockstate:erebus:umberstone:type=umberstone>);
    FITweaker.addRecipe(<liquid:sludge_cg>, <liquid:stone>, <blockstate:tconstruct:soil:type=grout>);
    FITweaker.addRecipe(<liquid:sludge_cg>, <liquid:clay>, <blockstate:tconstruct:dried_clay:type=clay>);
    FITweaker.addRecipe(<liquid:sludge_cg>, <liquid:sea_water>, <blockstate:biomesoplenty:dirt:coarse=false,variant=silty>);
    FITweaker.addRecipe(<liquid:sludge_cg>, <liquid:sand>, <blockstate:biomesoplenty:dirt:coarse=false,variant=sandy>);
    //FITweaker.addRecipe(<liquid:sludge_cg>, <liquid:sand>, <blockstate:tconstruct:dried_clay:type=clay>);
}

{//jei
    /**FITweaker.addJEIRecipeWrapper(<liquid:blood>, 1, <liquid:water>, 1,
        FITweaker.outputBuilder().addEvent(FITweaker.eventBuilder().createSetBlockEvent(<blockstate:biomesoplenty:flesh>))
    );
    FITweaker.addJEIRecipeWrapper(<liquid:blood>, 1, <liquid:witchwater>, 1,
        FITweaker.outputBuilder().addEvent(FITweaker.eventBuilder().createSetBlockEvent(<blockstate:minecraft:soul_sand>))
    )
    FITweaker.addJEIRecipeWrapper(<liquid:blueslime>, 1, <liquid:witchwater>, 1,
        FITweaker.outputBuilder().addEvent(FITweaker.eventBuilder().createSetBlockEvent(<blockstate:tconstruct:slime_dirt:type=blue>))
    );*/
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
    ).addCondition(BCondition.byChance, [0.1f]))
    .addEvent(FBTweaker.eventBuilder().createPotionEffectEvent(
        "minecraft:instant_damage", 1, 0
    ).addCondition(BCondition.byChance, [0.1f]))
    .addEvent(FBTweaker.eventBuilder().createSetSnowEvent())
    
);
FBTweaker.addRecipe(<liquid:malachite_glue>, FBTweaker.outputBuilder()
    .addEvent(FBTweaker.eventBuilder().createPotionEffectEvent(
        "minecraft:slowness", 20, 0
    ))
    
);

FBTweaker.addRecipe(<liquid:sand>, FBTweaker.outputBuilder()
    
    .addEvent(FBTweaker.eventBuilder().createEntityConversionEvent(
        <entity:minecraft:zombie>, <entity:atum:mummy>
    ).addCondition(BCondition.byChance, [0.1f]))
    .addEvent(FBTweaker.eventBuilder().createEntityConversionEvent(
        <entity:minecraft:zombie>, <entity:atum:wraith>
    ).addCondition(BCondition.byChance, [0.1f]))
    .addEvent(FBTweaker.eventBuilder().createEntityConversionEvent(
        <entity:minecraft:zombie>, <entity:atum:forsaken>
    ).addCondition(BCondition.byChance, [0.1f]))
    .addEvent(FBTweaker.eventBuilder().createEntityConversionEvent(
        <entity:minecraft:zombie>, <entity:minecraft:husk>
    ).addCondition(BCondition.byChance, [0.1f]))
    
);

FBTweaker.addRecipe(<liquid:fiery_essence>, FBTweaker.outputBuilder()
    
    .addEvent(FBTweaker.eventBuilder().createEntityConversionEvent(
        <entity:minecraft:spider>, <entity:twilightforest:tower_termite>
    ).addCondition(BCondition.byChance, [0.1f]))
    .addEvent(FBTweaker.eventBuilder().createEntityConversionEvent(
        <entity:minecraft:cave_spider>, <entity:twilightforest:tower_termite>
    ).addCondition(BCondition.byChance, [0.1f]))
    .addEvent(FBTweaker.eventBuilder().createEntityConversionEvent(
        <entity:primitivemobs:baby_spider>, <entity:twilightforest:tower_termite>
    ).addCondition(BCondition.byChance, [0.1f]))
    .addEvent(FBTweaker.eventBuilder().createEntityConversionEvent(
        <entity:primitivemobs:mother_spider>, <entity:twilightforest:tower_termite>
    ).addCondition(BCondition.byChance, [0.1f]))

    .addEvent(FBTweaker.eventBuilder().createEntityConversionEvent(
        <entity:minecraft:spider>, <entity:twilightforest:king_spider>
    ).addCondition(BCondition.byChance, [0.05f]))
    .addEvent(FBTweaker.eventBuilder().createEntityConversionEvent(
        <entity:primitivemobs:mother_spider>, <entity:twilightforest:king_spider>
    ).addCondition(BCondition.byChance, [0.05f]))
    
);
//FBTweaker.eventBuilder().createEntityConversionEvent();