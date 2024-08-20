#norun
//todo multiple foods
//todo dead state

import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;

import crafttweaker.data.IData;

import crafttweaker.item.ITooltipFunction;
import crafttweaker.item.IItemCondition;
import crafttweaker.item.IItemTransformer;

import mods.ctutils.utils.Math;

import mods.thermalexpansion.Centrifuge;
//Centrifuge.addRecipe(WeightedItemStack[] outputs, IItemStack input, ILiquidStack fluid, int energy);

print("[living] doind statics");

static livings as IItemStack[string] = {
    sandworm: <contenttweaker:lv_sandworm>,
    draco_lizard: <contenttweaker:lv_draco_lizard>,
    bedrock_golem: <contenttweaker:lv_bedrock_golem>,
    hair_thing: <contenttweaker:lv_hair_thing>,
    baby_hair_thing: <contenttweaker:lv_baby_hair_thing>
};
static foods as int[][IItemStack][string] = {
    sandworm: {
        <contenttweaker:worm_feed>: [5, 15]
    },
    draco_lizard: {
        <contenttweaker:draco_lizard_feed>: [0, 10]
    },
    bedrock_golem: {
        <taiga:eezo_ingot>: [-10, 30],
        <taiga:eezo_block>: [5, 15]
    },
    hair_thing: {
        <projectred-core:resource_item:301>: [5, 10]
    },
    baby_hair_thing: {
        <projectred-core:resource_item:301>: [5, 10]
    }
};
static lifespans as int[string] = {
    sandworm: 100,
    draco_lizard: 25,
    bedrock_golem: 1000,
    hair_thing: 30,
    baby_hair_thing: 1000
} as IData;
static products as int[IItemStack][string] = {
    sandworm: {
        <contenttweaker:sandworm_molt>: 100
    },
    draco_lizard: {
        <contenttweaker:draco_lizard_spit>: 25
    },
    bedrock_golem: {
        <contenttweaker:bedrockium_small_chunk>: 30
    },
    hair_thing: {
        <contenttweaker:hair_ball>: 25
    },
    baby_hair_thing: {}
};
static reproduction as int[IItemStack][string] = {
    draco_lizard: {
        <contenttweaker:draco_lizard_egg>: 50
    }/*,
    hair_thing: {
        <contenttweaker:lv_baby_hair_thing>.withTag({
            food: 1,
            lifespan: 1000
        }): 50
    }*/
};
static corpses as IItemStack[string] = {
    sandworm: <contenttweaker:sandworm_corpse>,
    draco_lizard: <contenttweaker:draco_lizard_corpse>,
    //hair_thing: 
};
static life_essences as int[string] = {
    sandworm: 1,
    draco_lizard: 3,
    bedrock_golem: 6
};

print("[living] doind helper functions");

function get_lifespan(ls as int) as int{
    return ((ls >= 1000) ? 1000 : (ls - 1)) as int;
}

print("[living] doind tooltip and isAlive");

static tooltipFunction as ITooltipFunction = function(item){
    if (item.tag.memberGet("food") && item.tag.memberGet("lifespan")){
        var ans as string = "";
        //item good
        if (item.tag.food.asInt() > 0){
            //alive
            ans += "§6Food: " ~ item.tag.food.asInt();
        }else{
            //dead
            return "§4Dead";
        }
        
        if (item.tag.lifespan.asInt() > 0){
            if (item.tag.lifespan.asInt() < 1000) {
                //>
                ans += "    Lifespan " ~ item.tag.lifespan.asInt();
            }
        }else{
            return "§4Dead";
        }
        return ans;
    }
    //item bad
    return "§4Bad Item";
};
static isAlive as IItemCondition = function(item){
    if (item.tag.memberGet("food") && item.tag.memberGet("lifespan")){
        //item good
        return (item.tag.food.asInt() > 0)&&(item.tag.lifespan.asInt() > 0);
    }
    //item bad
    return false;
};

//life
print("[living] doing life essence");
val raw_life as IItemStack[][int] = {
    32: [
        <botania:tinypotato>,

        <harvestcraft:perchrawitem>,
        <exnihilocreatio:item_material:2>,
        <harvestcraft:scalloprawitem>,
        <harvestcraft:calamarirawitem>,
        <harvestcraft:shrimprawitem>,
        <harvestcraft:snailrawitem>,
        <harvestcraft:snapperrawitem>,
        <harvestcraft:eelrawitem>,
        <harvestcraft:frograwitem>,
        <harvestcraft:grouperrawitem>,
        <harvestcraft:herringrawitem>,
        <harvestcraft:jellyfishrawitem>,
        <harvestcraft:mudfishrawitem>,
        <harvestcraft:octopusrawitem>,
        <harvestcraft:tilapiarawitem>,
        <harvestcraft:anchovyrawitem>,
        <harvestcraft:bassrawitem>,
        <harvestcraft:carprawitem>,
        <harvestcraft:catfishrawitem>,
        <harvestcraft:charrrawitem>,
        <harvestcraft:clamrawitem>,
        <harvestcraft:crabrawitem>,
        <harvestcraft:crayfishrawitem>,
        <harvestcraft:troutrawitem>,
        <harvestcraft:tunarawitem>,
        <harvestcraft:turtlerawitem>,
        <harvestcraft:walleyerawitem>,
        <harvestcraft:greenheartfishitem>,
        <harvestcraft:sardinerawitem>,
        <harvestcraft:musselrawitem>,
        <harvestcraft:oysterrawitem>,
        <minecraft:fish:1>,
        <minecraft:fish>,
        <minecraft:fish:2>,
        <minecraft:fish:3>,

        //<minecraft:egg>
    ],
    8: [
        <aether_legacy:moa_egg>.withTag({typeId: 0}),
        <aether_legacy:moa_egg>.withTag({typeId: 1}),
        <aether_legacy:moa_egg>.withTag({typeId: 2}),
        <aether_legacy:moa_egg>.withTag({typeId: 3}),

        <betternether:eye_seed>,
        <erebus:materials:60>,

        <atum:fish_forsaken>,
        <atum:fish_mummified>,
        <atum:fish_skeletal>,
        <mod_lavacow:piranha>,
        <mod_lavacow:cheirolepis>,
        <mod_lavacow:zombiepiranha_item>,

        <mod_lavacow:parasite_item>,
        <mod_lavacow:parasite_item:1>,
        <mod_lavacow:parasite_item:2>,

        <primitivemobs:mysteryegg1>,
        <primitivemobs:mysteryegg2>,
        <primitivemobs:mysteryegg3>
    ],
    4: [
        <primitivemobs:spider_egg>,
        <harvestcraft:grubitem>,
        <contenttweaker:draco_lizard_egg>,
        <primitivemobs:dodo_egg>,

        <quark:parrot_egg>,
        <quark:parrot_egg:1>,
        <quark:parrot_egg:2>,
        <quark:parrot_egg:3>,
        <quark:parrot_egg:4>,

        <mowziesmobs:foliaath_seed>,
        <mod_lavacow:cactus_fruit>,

        <atum:fish_jeweled>,
        <mod_lavacow:enigmoth_larva_item>
    ],
    1: [
        <erebus:antlion_egg>,
        <erebus:tarantula_egg>,
        <quark:slime_bucket:1>,
        <atum:idol_of_labor>
    ]
};
for n in raw_life{
    for raw in raw_life[n]{
        mods.enderio.AlloySmelter.addRecipe(<contenttweaker:life>, 
            [
                raw * n,
                <contenttweaker:isis_godshard>,
                <contenttweaker:singularity_dust>
            ]
        );
    }
}
mods.enderio.AlloySmelter.addRecipe(<contenttweaker:life> * 4, 
    [
        <minecraft:dragon_egg>,
        <contenttweaker:isis_godshard>,
        <contenttweaker:singularity_dust>
    ]
);

print("[living] doind living");
//living
for name in livings{
    print("[living] doing " ~ name);
    <ore:living>.add(livings[name]);
    //tooltip
    livings[name].addAdvancedTooltip(tooltipFunction);

    //info
    var info as string[] = ["Foods:"];

    print("[living]["~name~"] adding food");
    //feeding
    for food in foods[name]{
        info += "   " ~ food.displayName ~ " gives from " ~ foods[name][food][0] ~ " to " ~ foods[name][food][1] ~ " food points.";
        recipes.addShapeless(name ~ "_feeding_" ~ food.name, livings[name],
            [livings[name].only(isAlive).marked("mark"), food],
            
            function(out, ins, cInfo){
                var range as int = foods[name][food][1] - foods[name][food][0] + 1;
                var value as int = ((Math.floor(Math.random() * range) + foods[name][food][0]) as IData).asInt();
                var ls as int = ins.mark.tag.lifespan.asInt();
                
                return ins.mark.withTag( {
                    food: ins.mark.tag.food.asInt() + value, 
                    lifespan: ((ls >= 1000) ? 1000 : (ls - 1))
                } );
            }, null
        );
    }

    print("[living]["~name~"] adding product");
    //product
    for product in products[name]{
        info += "Will produce " ~ product.displayName ~ " at the cost of " ~ products[name][product] ~ " food points.";
        recipes.addShapeless(name ~ "_product_" ~ product.name, product,
            [livings[name].only(isAlive).transformNew(function(item){
                var ls as int = item.tag.lifespan.asInt();
                return item.withTag( {
                    food: item.tag.food.asInt() - products[name][product],
                    lifespan: ((ls >= 1000) ? 1000 : (ls - 1))
                } );
            })]
        );
    }

    
    //reproduction
    if reproduction has name{
        print("[living]["~name~"] adding reproduction");
        for egg in reproduction[name]{
            info += "Will reproduce at the cost of " ~ reproduction[name][egg]  ~ " food points.";
            recipes.addShapeless(name ~ "_reproduction_" ~ egg.name, egg,
                [
                    livings[name].only(isAlive).transformNew(function(item){
                        return item.withTag( {
                            food: item.tag.food.asInt() - reproduction[name][egg],
                            lifespan: item.tag.lifespan.asInt()//get_lifespan(item.tag.lifespan.asInt())
                        } );
                    }),
                    livings[name].only(isAlive).transformNew(function(item){
                        return item.withTag( {
                            food: item.tag.food.asInt() - reproduction[name][egg],
                            lifespan: item.tag.lifespan.asInt()//get_lifespan(item.tag.lifespan.asInt())
                        } );
                    }),
                    foods[name].keys[0]
                ]
            );
        
        }
    }

    //corpse
    if corpses has name{
        print("[living]["~name~"] adding corpse");
        recipes.addShapeless("ia_" ~ name ~ "_corpse", corpses[name], 
            [livings[name], <contenttweaker:butcher_knife>.anyDamage().transformDamage()]
        );
    }

    //life essence
    if life_essences has name{
        print("[living]["~name~"] adding life essence");
        info += "Will give " ~ life_essences[name] ~ " life essences.";
        recipes.addShapeless("ia_" ~ name ~ "_life_essence", <contenttweaker:life> * life_essences[name], 
            [livings[name], <contenttweaker:butcher_knife>.anyDamage().transformDamage(), <contenttweaker:isis_godshard>, <contenttweaker:singularity_dust>]
        );
    }

    print("[living]["~name~"] adding info");
    scripts.modular_machines.addItemInfoRecipe([livings[name]], info);
}


/*<contenttweaker:aaa>.addAdvancedTooltip(function(item) {
    if (item.tag.memberGet("food"))
        if (item.tag.food.asInt() > 0)
            return ("§6Food: " ~ item.tag.food);
    return ("§4Dead");
});*/

recipes.addShaped("ia_butcher_knife", <contenttweaker:butcher_knife>, [
	[<enderio:item_material:8>, <enderio:item_material:8>, <enderio:item_material:8>], 
	[null, <contenttweaker:bedrockium_alloy_plate>, <contenttweaker:bedrockium_alloy_plate>]
]);
<contenttweaker:iron_heart>.addTooltip("Dropped by Iron Golems");

{//sandworm
    //worm
    recipes.addShapeless("ia_lv_sandworm", 
        <contenttweaker:lv_sandworm>.withTag({
            food: 20,
            lifespan: 100
        }), 
        [<exnihilocreatio:item_material:2>, <minecraft:potion>.withTag({Potion: "cofhcore:healing4"}), <atum:sand>, <contenttweaker:worm_feed>]
    );
    <ore:sandworm>.add(<contenttweaker:lv_sandworm>);

    //food
    recipes.addShapeless("ia_worm_feed", 
        <contenttweaker:worm_feed> * 4, 
        [<contenttweaker:desert_pollen>, <quark:tallow>, <harvestcraft:bakedcactusitem>, <contenttweaker:relic_nugget>]
    );

    //processing
    Centrifuge.addRecipe(
        [<contenttweaker:sandworm_molt> % 100,
        (<contenttweaker:sandworm_gut> * 2) % 100, 
        <contenttweaker:dry_fibre> % 25, <contenttweaker:sandworm_chitin> % 50], 
        <contenttweaker:sandworm_corpse>, <liquid:worm_blood> * 500, 2000
    );
    Centrifuge.addRecipe(
        [<contenttweaker:dry_fibre> % 100, <contenttweaker:dry_fibre> % 75, <contenttweaker:sandworm_chitin> % 100, <contenttweaker:sandworm_chitin> % 75], 
        <contenttweaker:sandworm_molt>, null, 2000
    );

    mods.thermalexpansion.Transposer.addFillRecipe(<erebus:materials:9>, <contenttweaker:dry_fibre>, <liquid:hot_spring_water> * 100, 1000);
    Centrifuge.addRecipe(
        [(<appliedenergistics2:material:5> * 4) % 100, <industrialforegoing:tinydryrubber> % 25, <appliedenergistics2:material:5> % 50, <contenttweaker:solar_silicon> % 3], 
        <contenttweaker:dry_fibre>, null, 2000
    );
}
{//draco lizard
    mods.roots.Pyre.addRecipe(
        "draco_lizard_egg",
        <contenttweaker:draco_lizard_egg>,
        [<contenttweaker:life>, <moreplates:draconium_gear>, <minecraft:dragon_breath>, <minecraft:dragon_breath>, <mysticalagradditions:stuff:3>]
    );

    recipes.addShapeless("ia_draco_lizard_feed1", <contenttweaker:draco_lizard_feed> * 3, 
        [<harvestcraft:cookedgrubitem>, <harvestcraft:dragonfruititem>, <natura:edibles:1> | <erebus:erebus_food:5>, <extrautils2:magicapple>, <liquid:nutrient_distillation> * 1000]
    );
    recipes.addShapeless("ia_draco_lizard_feed2", <contenttweaker:draco_lizard_feed> * 6, 
        [<harvestcraft:cookedgrubitem>, <harvestcraft:dragonfruititem>, <natura:edibles:1> | <erebus:erebus_food:5>, <extrautils2:magicapple>, <liquid:liquidchorus> * 1000]
    );

    mods.thermalexpansion.Crucible.addRecipe(<liquid:lizard_spit> * 250, <contenttweaker:draco_lizard_spit>, 4000);
    mods.thermalexpansion.Refinery.addRecipe(<liquid:dragon_spit> * 250, <contenttweaker:draco_lizard_spit> % 10, <liquid:lizard_spit> * 500, 8000);
    mods.thermalexpansion.Transposer.addFillRecipe(<minecraft:dragon_breath>, <minecraft:glass_bottle>, <liquid:dragon_spit> * 250, 4000);

    Centrifuge.addRecipe(
        [
            livings.draco_lizard.withTag({
                food: 20,
                lifespan: 25
            }) % 75,
            <contenttweaker:draco_lizard_shells> % 95
        ], 
        <contenttweaker:draco_lizard_egg>, null, 20000
    );

    mods.enderio.SagMill.addRecipe(
        [<contenttweaker:draco_lizard_shells>, <draconicevolution:draconium_dust> * 2, <draconicevolution:draconium_dust>], [1.0, 0.75, 0.5], 
        <contenttweaker:draco_lizard_egg>, "CHANCE_ONLY"
    );
    mods.enderio.SagMill.addRecipe(
        [<minecraft:dye:15> * 4, <draconicevolution:draconium_dust>, <contenttweaker:draco_lizard_spit>], [1.0, 0.3, 0.2], 
        <contenttweaker:draco_lizard_shells>, "MULTIPLY_OUTPUT"
    );

    Centrifuge.addRecipe(
        [
            (<minecraft:bone> * 4) % 100,
            (<draconicevolution:draconium_dust> * 5) % 100,
            (<draconicevolution:draconium_dust> * 2) % 25,
            <quark:enderdragon_scale> % 1
        ], 
        <contenttweaker:draco_lizard_corpse>, <liquid:blood> * 250, 10000
    );

    recipes.addShaped("ia_dragon_egg_from_lizard_egg", <minecraft:dragon_egg> * 2, [
        [<contenttweaker:draco_lizard_egg>, <contenttweaker:draco_lizard_egg>, <contenttweaker:draco_lizard_egg>], 
        [<contenttweaker:draco_lizard_egg>, <deepmoblearning:pristine_matter_dragon>, <contenttweaker:draco_lizard_egg>], 
        [<contenttweaker:draco_lizard_egg>, <contenttweaker:draco_lizard_egg>, <contenttweaker:draco_lizard_egg>]
    ]);
}
{//bedrockium golem
    
    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:lv_bedrock_golem>.withTag({
        food: 50,
        lifespan: 1000    
    }), [
        [null, null, <minecraft:pumpkin>, null, null], 
        [<contenttweaker:bedrockium_alloy_ingot>, <contenttweaker:bedrockium_alloy_block>, <contenttweaker:iron_heart>, <contenttweaker:bedrockium_alloy_block>, <contenttweaker:bedrockium_alloy_ingot>], 
        [<contenttweaker:bedrockium_alloy_ingot>, <contenttweaker:bedrockium_alloy_plate>, <contenttweaker:life>, <contenttweaker:bedrockium_alloy_plate>, <contenttweaker:bedrockium_alloy_ingot>], 
        [<contenttweaker:bedrockium_alloy_ingot>, <taiga:eezo_ingot>, <taiga:eezo_block>, <taiga:eezo_ingot>, <contenttweaker:bedrockium_alloy_ingot>], 
        [<contenttweaker:bedrockium_alloy_ingot>, <taiga:eezo_ingot>, null, <taiga:eezo_ingot>, <contenttweaker:bedrockium_alloy_ingot>]
    ]);
}
{//hair thing
    Centrifuge.addRecipe(
        [
            <contenttweaker:insulation_strand> % 100,
            <contenttweaker:insulation_strand> % 50,
            <immersiveengineering:material:22> % 100
        ], 
        <contenttweaker:hair_ball>, null, 2000
    );

    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:lv_baby_hair_thing>.withTag({
        food: 20,
        lifespan: 1000
    }), [
        [null, <contenttweaker:insulation_strand>, <contenttweaker:insulation_strand>, <contenttweaker:insulation_strand>, null], 
        [<contenttweaker:insulation_strand>, <contenttweaker:insulation_strand>, <contenttweaker:insulation_strand>, <contenttweaker:insulation_strand>, <contenttweaker:insulation_strand>], 
        [<contenttweaker:insulation_strand>, <contenttweaker:eye>, <contenttweaker:life>, <contenttweaker:eye>, <contenttweaker:insulation_strand>], 
        [<contenttweaker:insulation_strand>, <contenttweaker:insulation_strand>, <contenttweaker:insulation_strand>, <contenttweaker:insulation_strand>, <contenttweaker:insulation_strand>], 
        [<contenttweaker:insulation_strand>, <contenttweaker:insulation_strand>, <contenttweaker:insulation_strand>, <contenttweaker:insulation_strand>, <contenttweaker:insulation_strand>]
    ]);
}

{//life uses
    recipes.addShaped("ia_dodo_egg", <primitivemobs:dodo_egg> * 2, [
        [<minecraft:dye:3>, <contenttweaker:life>, <minecraft:dye:3>], 
        [<minecraft:dye:3>, <minecraft:egg>, <minecraft:dye:3>], 
        [<minecraft:dye:3>, <contenttweaker:life>, <minecraft:dye:3>]
    ]);
}