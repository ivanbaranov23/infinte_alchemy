#loader crafttweaker reloadable
import mods.fluidintetweaker.FITweaker;
import mods.fluidintetweaker.FBTweaker;
import mods.fluidintetweaker.behavior.Condition as BCondition;
import mods.fluidintetweaker.interaction.Condition as ICondition;

import crafttweaker.liquid.ILiquidStack;
import crafttweaker.entity.IEntityDefinition;

function addOneToOne(inp as IEntityDefinition, fluid as ILiquidStack, out as IEntityDefinition){
    FBTweaker.addRecipe(fluid, FBTweaker.outputBuilder().addEvent(FBTweaker.eventBuilder().createEntityConversionEvent(inp, out)));
}
function addOneToMany(fluid as ILiquidStack, ent as IEntityDefinition[][IEntityDefinition]){
    var o = FBTweaker.outputBuilder();

    for inp,out in ent{
        for outp in out
            o.addEvent(FBTweaker.eventBuilder().createEntityConversionEvent(inp, outp).addCondition(BCondition.byChance, [0.1f]));
    }

    FBTweaker.addRecipe(fluid, o);
}


addOneToMany(<liquid:sea_water>, {<entity:minecraft:skeleton>: [<entity:quark:pirate>]});


{//atum
    /*FBTweaker.addRecipe(<liquid:sand>, FBTweaker.outputBuilder()
        
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
        
    );*/
    addOneToMany(<liquid:sand>, {
        <entity:minecraft:skeleton>: [
            <entity:atum:mummy>,
            <entity:atum:wraith>,
            <entity:atum:forsaken>,
            <entity:minecraft:husk>
        ],

        <entity:minecraft:zombie>: [
            <entity:atum:mummy>,
            <entity:atum:wraith>,
            <entity:atum:forsaken>,
            <entity:minecraft:husk>
        ]
    });

    /*addOneToOne(<entity:minecraft:villager_golem>, <liquid:khnumite>, <entity:atum:stonewarden>);
    addOneToOne(<entity:minecraft:skeleton>, <liquid:khnumite>, <entity:atum:stoneguard>);
    addOneToOne(<entity:minecraft:zombie>, <liquid:khnumite>, <entity:atum:stoneguard>);*/

    addOneToMany(<liquid:khnumite>, {
        <entity:minecraft:villager_golem>: [<entity:atum:stonewarden>],
        <entity:minecraft:skeleton>: [<entity:atum:stoneguard>],
        <entity:minecraft:zombie>: [<entity:atum:stoneguard>]
    });
}
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