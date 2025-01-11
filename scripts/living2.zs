import crafttweaker.item.IIngredient;
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


{//life
    print("[living] doing life essence");
    val raw_life as IItemStack[][int] = {
        32: [
            <botania:tinypotato>,
            <contenttweaker:bacteria>,


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

            <contenttweaker:yeast>
            //<minecraft:egg>
        ],
        16: [
            <contenttweaker:ender_bacteria>
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
            <primitivemobs:mysteryegg3>,

            <contenttweaker:yeast_rich>,
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
}




print("[living] doind statics");


static livings as IItemStack[string] = {
    pilkon: <contenttweaker:pilkon>,
    sandworm: <contenttweaker:lv_sandworm>,
    bedrock_golem: <contenttweaker:lv_bedrock_golem>,
    draco_lizard: <contenttweaker:lv_draco_lizard>,

    hair_thing: <contenttweaker:lv_hair_thing>,
    baby_hair_thing: <contenttweaker:lv_baby_hair_thing>,

    nitrall: <contenttweaker:nitrall>,

    zanite_frog: <contenttweaker:lv_zanite_frog>,

    blood_slime: <contenttweaker:lv_blood_slime>,

    spice_rabbit: <contenttweaker:spice_rabbit>,

    chitigic_drone: <contenttweaker:chitigic_drone>,
    chitigic_hunter: <contenttweaker:chitigic_hunter>,
    chitigic_scout: <contenttweaker:chitigic_scout>,
    chitigic_refinery: <contenttweaker:chitigic_refinery>,
    chitigic_chewer: <contenttweaker:chitigic_chewer>,
    chitigic_chef: <contenttweaker:chitigic_chef>,
    chitigic_engineer: <contenttweaker:chitigic_engineer>,
    chitigic_nursery: <contenttweaker:chitigic_nursery>,

    chitigic_queen: <contenttweaker:chitigic_queen>,
    chitigic_empress: <contenttweaker:chitigic_empress>
};

static animal_type as string[string] = {
    pilkon: "f1l",
    sandworm: "f1l",
    draco_lizard: "f1l",
    bedrock_golem: "f1",

    hair_thing: "f1l",
    baby_hair_thing: "f1",

    nitrall: "f1",

    zanite_frog: "f1",

    blood_slime: "f1l",
    spice_rabbit: "f1l",

    chitigic_drone: "f1",
    chitigic_hunter: "f1l",
    chitigic_scout: "f1l",
    chitigic_refinery: "f1l",
    chitigic_chewer: "f1l",
    chitigic_chef: "f1l",
    chitigic_engineer: "f1l",
    chitigic_nursery: "f1l",

    chitigic_queen: "f1l",
    chitigic_empress: "f1"
};
static foods as int[][IItemStack][string] = {
    pilkon: {
        <thermalfoundation:material:98>: [10, 20]
    },
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
        <projectred-core:resource_item:301>: [10, 30]
    },
    baby_hair_thing: {
        <projectred-core:resource_item:301>: [10, 30]
    },

    nitrall: {
        <contenttweaker:nether_pest>: [10, 20]
    },

    zanite_frog: {
        <contenttweaker:zanite_frog_feed>: [10, 40]
    },

    blood_slime: {},

    spice_rabbit: {
        <contenttweaker:honeyspice_ingot>: [10, 20]
    },

    chitigic_drone: {},
    chitigic_hunter: {},
    chitigic_scout: {},
    chitigic_refinery: {},
    chitigic_chewer: {},
    chitigic_chef: {},
    chitigic_engineer: {},
    chitigic_nursery: {},

    chitigic_queen: {},
    chitigic_empress: {}
};
static products as int[IItemStack][string] = {
    pilkon: {
        <contenttweaker:pilkeum>: 25,
    },
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
    baby_hair_thing: {},

    nitrall: {
        <contenttweaker:nitrall>.withTag({food: 30}): 50
    },

    zanite_frog: {
        <contenttweaker:zanite_frog_leg>: 25
    },

    blood_slime: {
        <contenttweaker:blood_shard4>: 200
    },

    spice_rabbit: {
        <contenttweaker:spice_egg>: 4
    },

    chitigic_drone: {},
    chitigic_hunter: {},
    chitigic_scout: {},
    chitigic_refinery: {},
    chitigic_chewer: {},
    chitigic_chef: {},
    chitigic_engineer: {},
    chitigic_nursery: {},

    chitigic_queen: {},
    chitigic_empress: {}
};
static work as int[][IItemStack[]][string] = {
    chitigic_chewer: {
        [<prodigytech:meat_ground>, <contenttweaker:chewed_meat> * 1]: [5, 10],
        [<contenttweaker:sandworm_gut>, <contenttweaker:chewed_guts> * 1]: [5, 10],
        [<densemetals:dense_iron_ore>, <minecraft:iron_ore> * 5]: [20, 100],
        [<densemetals:dense_copper_ore>, <thermalfoundation:ore> * 5]: [20, 100],
        [<densemetals:dense_tin_ore>, <thermalfoundation:ore:1> * 5]: [20, 100],

        [<densemetals:dense_nickel_ore>, <thermalfoundation:ore:5> * 5]: [20, 100],
        [<densemetals:dense_zinc_ore>, <contenttweaker:zinc_ore> * 5]: [20, 100],
        [<densemetals:dense_aluminum_ore>, <thermalfoundation:ore:4> * 5]: [20, 100],

        [<contenttweaker:nitrall>, <contenttweaker:nitrall_feed> * 4]: [10, 200]
    },
    chitigic_chef: {
        [<contenttweaker:chitigic_food1>, <contenttweaker:chitigic_food3>]: [100, 300],
        [<contenttweaker:chitigic_food2>, <contenttweaker:chitigic_food3>]: [30, 80]
    },
    chitigic_nursery: {
        [<contenttweaker:chitigic_egg>, <contenttweaker:chitigic_drone>.withTag({food:125}) * 1]: [10, 20]
    }
};
static reproduction as int[IItemStack][string] = {
    pilkon: {
        <contenttweaker:pilkon>.withTag({
            food: 1,
            lifespan: 10
        }): 50
    },
    draco_lizard: {
        <contenttweaker:draco_lizard_egg>: 100
    },
    hair_thing: {
        <contenttweaker:lv_baby_hair_thing>.withTag({
            food: 1
        }): 100
    },
    spice_rabbit: {
        <contenttweaker:spice_egg> * 12: 30
    }
};
static corpses as IItemStack[string] = {
    pilkon: <contenttweaker:pilkon_corpse>,
    sandworm: <contenttweaker:sandworm_corpse>,
    draco_lizard: <contenttweaker:draco_lizard_corpse>,
    hair_thing: <contenttweaker:hair_thing_corpse>,

    chitigic_drone: <contenttweaker:chitigic>,
    chitigic_hunter: <contenttweaker:chitigic> * 3,
    chitigic_scout: <contenttweaker:chitigic> * 3,
    chitigic_refinery: <contenttweaker:chitigic> * 3,
    chitigic_chewer: <contenttweaker:chitigic> * 3,
    chitigic_nursery: <contenttweaker:chitigic> * 3,
    chitigic_queen: <contenttweaker:chitigic> * 8,
    chitigic_empress: <contenttweaker:chitigic> * 64
};
static life_essences as int[string] = {
    sandworm: 1,
    draco_lizard: 3,
    bedrock_golem: 6,
    hair_thing: 2
};
static extra_info as string[string] = {
    hair_thing: "Grows up at 250 food points.",
    baby_hair_thing: "Grows up at 250 food points."
};



function add_f1(name as string) as string[]{
    var info as string[] = [livings[name].displayName ~ " info:", "Unlimited Lifespan", "One Type of Food"];
    //tooltips
    print("[living]["~name~"] adding f1 tooltip");
    livings[name].addAdvancedTooltip(function(item){
        if (item.tag.memberGet("food")){
            //item good
            if (item.tag.food.asInt() > 0){
                //alive
                return "§6Food: " ~ item.tag.food.asInt();
            }else{
                //dead
                return "§4Dead";
            }
        }
        //item bad
        return "§4Bad Item";
    });

    //isAlive
    var isAlive as IItemCondition = function(item){
        if (item.tag.memberGet("food")){
            //item good
            return (item.tag.food.asInt() > 0);
        }
        //item bad
        return false;
    };

    //foods
    info += "Foods:";
    for food in foods[name]{
        print("[living]["~name~"] adding f1 foods");
        info += "   " ~ food.displayName ~ " gives from " ~ foods[name][food][0] ~ " to " ~ foods[name][food][1] ~ " food points.";
        recipes.addShapeless(name ~ "_feeding_" ~ food.name, livings[name],
            [livings[name].only(isAlive).marked("mark"), food],
            
            function(out, ins, cInfo){
                var range as int = foods[name][food][1] - foods[name][food][0] + 1;
                var value as int = ((Math.floor(Math.random() * range) + foods[name][food][0]) as IData).asInt();
                
                return ins.mark.withTag( {
                    food: ins.mark.tag.food.asInt() + value
                } );
            }, null
        );
    }

    //product
    for product in products[name]{
        print("[living]["~name~"] adding f1 product");
        info += "Will produce " ~ product.displayName ~ " at the cost of " ~ products[name][product] ~ " food points.";
        recipes.addShapeless(name ~ "_product_" ~ product.name, product,
            [livings[name].only(isAlive).transformNew(function(item){
                return item.withTag( {
                    food: item.tag.food.asInt() - products[name][product],
                    //lifespan: ((ls >= 1000) ? 1000 : (ls - 1))
                } );
            })]
        );
    }

    //work
    if work has name{
        //int[][IItemStack[]][string]
        info += "Will turn:";
        for inp,cost in work[name]{
            info += "   " ~ inp[0].displayName ~ " into " ~ inp[1].displayName ~ " costing between" ~ cost[0] ~ "and" ~ cost[1] ~ " food points.";
            recipes.addShapeless(name ~ "_work_" ~ inp[0].name, inp[1],
                [livings[name].only(isAlive).transformNew(function(item){
                    var range as int = cost[1] - cost[0] + 1;
                    var value as int = ((Math.floor(Math.random() * range) + cost[0]) as IData).asInt();
                
                    return item.withTag( {

                        food: item.tag.food.asInt() - value,
                        
                    } );
                }), inp[0]]
            );
        }
    }

    return info;
}
function add_f1l(name as string) as string[]{
    var info as string[] = [livings[name].displayName ~ " info:", "Limited Lifespan", "One Type of Food"];
    //tooltips
    print("[living]["~name~"] adding f1l tooltip");
    livings[name].addAdvancedTooltip(function(item){
        if ((item.tag.memberGet("food") as bool) && (item.tag.memberGet("lifespan") as bool)){
            //item good
            if ((item.tag.food.asInt() > 0)&&(item.tag.lifespan.asInt() > 0)){
                //alive
                return "§6Food: " ~ item.tag.food.asInt() ~ "    Lifespan " ~ item.tag.lifespan.asInt();
            }else{
                //dead
                return "§4Dead";
            }
        }
        //item bad
        return "§4Bad Item";
    });

    //isAlive
    var isAlive as IItemCondition = function(item){
        if ((item.tag.memberGet("food") as bool) && (item.tag.memberGet("lifespan") as bool)){
            //item good
            return (item.tag.food.asInt() > 0)&&(item.tag.lifespan.asInt() > 0);
        }
        //item bad
        return false;
    };

    //foods
    info += "Foods:";
    for food in foods[name]{
        info += "   " ~ food.displayName ~ " gives from " ~ foods[name][food][0] ~ " to " ~ foods[name][food][1] ~ " food points.";
        recipes.addShapeless(name ~ "_feeding_" ~ food.name, livings[name],
            [livings[name].only(isAlive).marked("mark"), food],
            
            function(out, ins, cInfo){
                var range as int = foods[name][food][1] - foods[name][food][0] + 1;
                var value as int = ((Math.floor(Math.random() * range) + foods[name][food][0]) as IData).asInt();
                
                return ins.mark.withTag( {
                    food: ins.mark.tag.food.asInt() + value,
                    lifespan: ins.mark.tag.lifespan.asInt()
                } );
            }, null
        );
    }

    //products
    for product in products[name]{
        print("[living]["~name~"] adding f1l product");
        info += "Will produce " ~ product.displayName ~ " at the cost of " ~ products[name][product] ~ " food points.";
        recipes.addShapeless(name ~ "_product_" ~ product.name, product,
            [livings[name].only(isAlive).transformNew(function(item){
                return item.withTag( {
                    food: item.tag.food.asInt() - products[name][product],
                    lifespan: item.tag.lifespan.asInt() - 1
                } );
            })]
        );
    }

    //reproduction
    if reproduction has name{
        print("[living]["~name~"] adding f1l reproduction");
        for egg in reproduction[name]{
            info += "Will reproduce at the cost of " ~ reproduction[name][egg]  ~ " food points.";
            recipes.addShapeless(name ~ "_reproduction_" ~ egg.name, egg,
                [
                    livings[name].only(isAlive).transformNew(function(item){
                        return item.withTag( {
                            food: item.tag.food.asInt() - reproduction[name][egg],
                            lifespan: item.tag.lifespan.asInt() - 1
                        } );
                    }),
                    livings[name].only(isAlive).transformNew(function(item){
                        return item.withTag( {
                            food: item.tag.food.asInt() - reproduction[name][egg],
                            lifespan: item.tag.lifespan.asInt() - 1
                        } );
                    })//,
                    //foods[name].keys[0]
                ]
            );
        
        }
    }

    
    //work
    /*if work has name{
        info += "Will turn:";
        for works in work[name]{
            info += "   " ~ works[0].displayName ~ " into " ~ works[1].displayName ~ " costing " ~ work[name][works] ~ " food points.";
            recipes.addShapeless(name ~ "_work_" ~ works[0].name, works[1],
                [livings[name].only(isAlive).transformNew(function(item){
                    return item.withTag( {
                        food: item.tag.food.asInt() - work[name][works],
                        lifespan: item.tag.lifespan.asInt() - 1
                    } );
                }), works[0]]
            );
        }
    }*/
    if work has name{
        //int[][IItemStack[]][string]
        info += "Will turn:";
        for inp,cost in work[name]{
            info += "   " ~ inp[0].displayName ~ " into " ~ inp[1].displayName ~ " costing between" ~ cost[0] ~ "and" ~ cost[1] ~ " food points.";
            recipes.addShapeless(name ~ "_work_" ~ inp[0].name, inp[1],
                [livings[name].only(isAlive).transformNew(function(item){
                    var range as int = cost[1] - cost[0] + 1;
                    var value as int = ((Math.floor(Math.random() * range) + cost[0]) as IData).asInt();
                
                    return item.withTag( {

                        food: item.tag.food.asInt() - value,
                        lifespan: item.tag.lifespan.asInt() - 1
                    } );
                }), inp[0]]
            );
        }
    }

    //vitamins
    recipes.addShapeless(name ~ "_vitamins", livings[name],
        [livings[name].only(isAlive).marked("mark"), <contenttweaker:vitamins>],
        function(out, ins, cInfo){
            return ins.mark.withTag( {
                food: ins.mark.tag.food.asInt() / 2,
                lifespan: ins.mark.tag.lifespan.asInt() + 10
            });
        }, null
    );

    return info;
}
function add_f2(name as string){}
function add_f2l(name as string){}



for name in livings{
    <ore:living>.add(livings[name]);

    var info as string[] = [];
    if (animal_type[name] == "f1"){
        info = add_f1(name);
    }
    else if (animal_type[name] == "f1l"){
        info = add_f1l(name);
    }

    if corpses has name{
        print("[living]["~name~"] adding corpse");
        recipes.addShapeless("ia_" ~ name ~ "_corpse", corpses[name], 
            [livings[name], <contenttweaker:butcher_knife>.anyDamage().transformDamage()]
        );
    }

    if life_essences has name{
        print("[living]["~name~"] adding life essence");
        info += "Will give " ~ life_essences[name] ~ " life essences.";
        recipes.addShapeless("ia_" ~ name ~ "_life_essence", <contenttweaker:life> * life_essences[name], 
            [livings[name], <contenttweaker:butcher_knife>.anyDamage().transformDamage(), <contenttweaker:isis_godshard>, <contenttweaker:singularity_dust>]
        );
    }

    if extra_info has name{
        info += extra_info[name];
    }

    print("[living]["~name~"] adding info");
    scripts.modular_machines.addItemInfoRecipe([livings[name]], info);
}

recipes.addShaped("ia_butcher_knife", <contenttweaker:butcher_knife>, [
	[<enderio:item_material:8>, <enderio:item_material:8>, <enderio:item_material:8>], 
	[<contenttweaker:bedrockium_alloy_plate>, <contenttweaker:bedrockium_alloy_plate>, null]
]);
<contenttweaker:iron_heart>.addTooltip("Dropped by Iron Golems");

<contenttweaker:vitamins>.addTooltip("For living halves food and gives +10 to lifespan.");

{//pilkon
    mods.roots.Fey.addRecipe("pilkon", <contenttweaker:pilkon>.withTag({
            food: 10,
            lifespan: 25
        }), [
        <contenttweaker:pilkeum>, <contenttweaker:pilkeum>, <contenttweaker:pilkeum>,
        <contenttweaker:singularity_dust>, <roots:wildwood_log>
    ]);

    scripts.helper.addSawRecipeWByproduct(<contenttweaker:pilkon_corpse>, <contenttweaker:pilkeum> * 4, <contenttweaker:pilkeum> * 2, 25);
}
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

    scripts.helper.addSawRecipeWByproduct(<contenttweaker:sandworm_gut>, <contenttweaker:dry_fibre> * 4, <contenttweaker:bacteria>, 5);
    
    mods.thermalexpansion.InductionSmelter.addRecipe(
        <contenttweaker:kaolin_clay> * 24, 
        <contenttweaker:sandworm_chitin>, <minecraft:clay_ball> * 16, 
        5000, 
        <minecraft:sand>, 10
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

    mods.thermalexpansion.Crucible.addRecipe(<liquid:lizard_spit> * 1000, <contenttweaker:draco_lizard_spit>, 4000);
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
        <contenttweaker:draco_lizard_egg>, null, 10000
    );

    mods.enderio.SagMill.addRecipe(
        [<contenttweaker:draco_lizard_shells>, <exnihilocreatio:item_ore_draconium> * 3, <exnihilocreatio:item_ore_draconium>], [1.0, 0.75, 0.5], 
        <contenttweaker:draco_lizard_egg>, "CHANCE_ONLY"
    );
    mods.enderio.SagMill.addRecipe(
        [<exnihilocreatio:item_ore_draconium> * 2, <draconicevolution:draconium_dust>, <contenttweaker:draco_lizard_spit>], [1.0, 0.3, 0.2], 
        <contenttweaker:draco_lizard_shells>, "MULTIPLY_OUTPUT"
    );

    Centrifuge.addRecipe(
        [
            (<minecraft:bone> * 4) % 100,
            (<exnihilocreatio:item_ore_draconium> * 5) % 100,
            (<exnihilocreatio:item_ore_draconium> * 2) % 25,
            <quark:enderdragon_scale> % 1
        ], 
        <contenttweaker:draco_lizard_corpse>, <liquid:ender_blood> * 250, 10000
    );

    recipes.addShaped("ia_dragon_egg_from_lizard_egg", <minecraft:dragon_egg> * 3, [
        [<contenttweaker:draco_lizard_egg>, <contenttweaker:draco_lizard_egg>, <contenttweaker:draco_lizard_egg>], 
        [<contenttweaker:draco_lizard_egg>, <deepmoblearning:pristine_matter_dragon>, <contenttweaker:draco_lizard_egg>], 
        [<contenttweaker:draco_lizard_egg>, <contenttweaker:draco_lizard_egg>, <contenttweaker:draco_lizard_egg>]
    ]);
}
{//bedrockium golem
    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:lv_bedrock_golem>.withTag({food: 50}), 
    [
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
        food: 20
    }), [
        [null, <contenttweaker:insulation_strand>, <contenttweaker:insulation_strand>, <contenttweaker:insulation_strand>, null], 
        [<contenttweaker:insulation_strand>, <contenttweaker:insulation_strand>, <contenttweaker:insulation_strand>, <contenttweaker:insulation_strand>, <contenttweaker:insulation_strand>], 
        [<contenttweaker:insulation_strand>, <contenttweaker:eye>, <contenttweaker:life>, <contenttweaker:eye>, <contenttweaker:insulation_strand>], 
        [<contenttweaker:insulation_strand>, <contenttweaker:insulation_strand>, <contenttweaker:insulation_strand>, <contenttweaker:insulation_strand>, <contenttweaker:insulation_strand>], 
        [<contenttweaker:insulation_strand>, <contenttweaker:insulation_strand>, <contenttweaker:insulation_strand>, <contenttweaker:insulation_strand>, <contenttweaker:insulation_strand>]
    ]);

    recipes.addShapeless("ia_hair_thing_growing", 
        <contenttweaker:lv_hair_thing>.withTag({
            food: 50,
            lifespan: 75
        }), 
        [
            <contenttweaker:lv_baby_hair_thing>.only(function(item){
                if (item.tag.memberGet("food")){
                    //item good
                    return (item.tag.food.asInt() >= 250);
                }
                //item bad
                return false;
            })
        ]
    );
}
{//blood slime
    mods.extendedcrafting.TableCrafting.addShaped(0, 
        <contenttweaker:lv_blood_slime>.withTag({
            food: 20,
            lifespan: 25
        }), 
        [
            [null, <extendedcrafting:singularity_custom:9>, <extendedcrafting:singularity_custom:9>, <extendedcrafting:singularity_custom:9>, null], 
            [<extendedcrafting:singularity_custom:9>, <contenttweaker:life>, <contenttweaker:life>, <contenttweaker:life>, <extendedcrafting:singularity_custom:9>], 
            [<extendedcrafting:singularity_custom:9>, <bloodmagic:dagger_of_sacrifice>, <contenttweaker:blood_shard4>, <bloodmagic:dagger_of_sacrifice>, <extendedcrafting:singularity_custom:9>], 
            [<extendedcrafting:singularity_custom:9>, <bloodmagic:dagger_of_sacrifice>, <contenttweaker:blood_shard4>, <bloodmagic:dagger_of_sacrifice>, <extendedcrafting:singularity_custom:9>], 
            [null, <extendedcrafting:singularity_custom:9>, <extendedcrafting:singularity_custom:9>, <extendedcrafting:singularity_custom:9>, null]
        ]
    );

    recipes.addShapeless("blood_slime_feeding", <contenttweaker:lv_blood_slime>,
        [
            <contenttweaker:lv_blood_slime>.only(
                function(item){
                    if ((item.tag.memberGet("food") as bool) && (item.tag.memberGet("lifespan") as bool)){
                        //item good
                        return (item.tag.food.asInt() > 0)&&(item.tag.lifespan.asInt() > 0);
                    }
                    //item bad
                    return false;
                }
            ).marked("mark"), 
            <ore:living>
        ],
            
        function(out, ins, cInfo){
            var range as int = 50 - 10 + 1;
            var value as int = ((Math.floor(Math.random() * range) + 10) as IData).asInt();
            
            return ins.mark.withTag( {
                food: ins.mark.tag.food.asInt() + value,
                lifespan: ins.mark.tag.lifespan.asInt()
            } );
        }, null
    );
}
{//zanite frog
    recipes.addShapeless("ia_zanite_frog_feed", <contenttweaker:zanite_frog_feed>, [
        <contenttweaker:aether_bug>, 
        <erebus:materials:9>, 
        <harvestcraft:cottoncandyitem>, 
        <actuallyadditions:item_dust:2>,
        <contenttweaker:gem_catalyst>,
        <contenttweaker:ambrosium_seed>
    ]);

    Centrifuge.addRecipe(
        [
            <aether_legacy:zanite_gemstone> % 70,
            <biomesoplenty:crystal_shard> % 30
        ], 
        <contenttweaker:zanite_frog_leg>, <liquid:crystal_fluid1> * 300, 12000
    );
}
{//spice rabbit
    mods.enderio.AlloySmelter.addRecipe(<contenttweaker:honeyspice_ingot> * 3, [
        <contenttweaker:soy_ingot>,
        <erebus:materials:20> * 8,
        <contenttweaker:enspiced_spicy_bioblend>
    ], 20000);
    mods.enderio.AlloySmelter.addRecipe(<contenttweaker:honeyspice_ingot> * 3, [
        <contenttweaker:soy_ingot>,
        <erebus:materials:20> * 8,
        <contenttweaker:spice_egg>
    ], 20000);

    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:spice_rabbit>.withTag({
            food: 20,
            lifespan: 5
        }), [
        [<contenttweaker:honeyspice_ingot>, <contenttweaker:honeyspice_ingot>, <contenttweaker:life>, <contenttweaker:honeyspice_ingot>, <contenttweaker:honeyspice_ingot>], 
        [<contenttweaker:life>, <contenttweaker:honeyspice_ingot>, <contenttweaker:honeyspice_ingot>, <contenttweaker:honeyspice_ingot>, <contenttweaker:life>], 
        [<contenttweaker:life>, <contenttweaker:eye>, <contenttweaker:honeyspice_ingot>, <contenttweaker:eye>, <contenttweaker:life>], 
        [<contenttweaker:life>, <contenttweaker:honeyspice_ingot>, <contenttweaker:honeyspice_ingot>, <contenttweaker:honeyspice_ingot>, <contenttweaker:life>], 
        [<contenttweaker:honeyspice_ingot>, <contenttweaker:honeyspice_ingot>, <contenttweaker:life>, <contenttweaker:honeyspice_ingot>, <contenttweaker:honeyspice_ingot>]
    ]);
    mods.thermalexpansion.InductionSmelter.addRecipe(
        <contenttweaker:spice_rabbit>.withTag({
            food: 20,
            lifespan: 5
        }), 
        <minecraft:potion>.withTag({Potion: "extrautils2:xu2.love"}),
        <contenttweaker:honeyspice_ingot> * 8,
        2000000
    );

    mods.thermalexpansion.InductionSmelter.addRecipe(
        <contenttweaker:spice_rabbit>.withTag({
            food: 10,
            lifespan: 5
        }), <contenttweaker:spice_egg>, <contenttweaker:spicy_enriched_bioblend> * 2,
        2000,
        <contenttweaker:spicy_bioblend>, 40
    );
    scripts.content_machines.addFluidSieveRecipeRandom(
        [
            <harvestcraft:cinnamonitem> % 50,
            <harvestcraft:peppercornitem> % 50,
            <harvestcraft:gingeritem> % 50,
            <harvestcraft:nutmegitem> % 50,
            <harvestcraft:spiceleafitem> % 50
        ], null, 
        <liquid:biocrude> * 300, <contenttweaker:spice_egg>,
        <exnihilocreatio:item_mesh:4>,
        20, 100
    );
}


static isDroneAlive as IItemCondition = function(item){
            if (item.tag.memberGet("food")){
                //item good
                return (item.tag.food.asInt() > 0);
            }
            //item bad
            return false;
};
static isNonDroneAlive as IItemCondition = function(item){
            if ((item.tag.memberGet("food") as bool) && (item.tag.memberGet("lifespan") as bool)){
                //item good
                return (item.tag.food.asInt() > 0)&&(item.tag.lifespan.asInt() > 0);
            }
            //item bad
            return false;
}; 
function add8refinery(outp as IItemStack, inp as IIngredient, cost as int){
    recipes.addShaped("chitigic_refining_" ~ outp.name, outp, [
        [inp, inp, inp],
        [inp, <contenttweaker:chitigic_refinery>.only(isNonDroneAlive).transformNew(function(item){
            return item.withTag( {
                food: item.tag.food.asInt() - cost,
                lifespan: item.tag.lifespan.asInt() - 1
            });
        }), inp],
        [inp, inp, inp]
    ]);
}
function addDroneToWorker(worker as IItemStack, cats as IIngredient[], cost as int){
    recipes.addShapeless("chitigic_dronetoworker", worker, 
        cats + <contenttweaker:chitigic_drone>.only(
            function(item){
                if (item.tag.memberGet("food")){
                    //item good
                    return (item.tag.food.asInt() >= cost);
                }
                //item bad
                return false;
            }
        )
    );
}
{//chitigic
    //food
    scripts.content_machines.addBioAssemblerRecipe(
        [<contenttweaker:chitigic_food1>], null, 
        [
            <contenttweaker:flesh_piece> * 4,
            <harvestcraft:southernstylebreakfastitem>|<harvestcraft:meatfeastpizzaitem>|<harvestcraft:thankfuldinneritem>|<harvestcraft:koreandinneritem>|<harvestcraft:gourmetvenisonburgeritem>|<harvestcraft:cornedbeefbreakfastitem>,
            <minecraft:golden_apple:1> * 4
        ], [<liquid:bugs> * 1000], <extrautils2:machine>.withTag({Type: "extrautils2:generator_culinary"}),
        400, 100000
    );
    mods.mekanism.infuser.addRecipe("MANA", 160, <contenttweaker:chitigic_food1>, <contenttweaker:chitigic_food2>);


    //egg
    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:chitigic_egg> * 4, [
        [null, null, <extendedcrafting:singularity_custom:19>, <extendedcrafting:singularity_custom:19>, <extendedcrafting:singularity_custom:19>, null, null], 
        [null, <extendedcrafting:singularity_custom:19>, <contenttweaker:chitin_ball>, <contenttweaker:life>, <contenttweaker:chitin_ball>, <extendedcrafting:singularity_custom:19>, null], 
        [<extendedcrafting:singularity_custom:19>, <contenttweaker:chitin_ball>, <extendedcrafting:singularity_custom:41>, <contenttweaker:blood_shard4>, <extendedcrafting:singularity_custom:41>, <contenttweaker:chitin_ball>, <extendedcrafting:singularity_custom:19>], 
        [<extendedcrafting:singularity_custom:19>, <contenttweaker:life>, <contenttweaker:blood_shard4>, <extendedcrafting:singularity_custom:53>, <contenttweaker:blood_shard4>, <contenttweaker:life>, <extendedcrafting:singularity_custom:19>], 
        [<extendedcrafting:singularity_custom:19>, <contenttweaker:chitin_ball>, <extendedcrafting:singularity_custom:41>, <contenttweaker:blood_shard4>, <extendedcrafting:singularity_custom:41>, <contenttweaker:chitin_ball>, <extendedcrafting:singularity_custom:19>], 
        [null, <extendedcrafting:singularity_custom:19>, <contenttweaker:chitin_ball>, <contenttweaker:life>, <contenttweaker:chitin_ball>, <extendedcrafting:singularity_custom:19>, null], 
        [null, null, <extendedcrafting:singularity_custom:19>, <extendedcrafting:singularity_custom:19>, <extendedcrafting:singularity_custom:19>, null, null]
    ]);
    mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:chitigic_egg> * 2, [
        [null, <contenttweaker:chitigic>, <contenttweaker:chitigic>, <contenttweaker:chitigic>, null], 
        [<contenttweaker:chitigic>, <contenttweaker:life>, <contenttweaker:chitin>, <contenttweaker:life>, <contenttweaker:chitigic>], 
        [<contenttweaker:chitigic>, <contenttweaker:chitin>, <contenttweaker:chitin_ball>, <contenttweaker:chitin>, <contenttweaker:chitigic>], 
        [<contenttweaker:chitigic>, <contenttweaker:life>, <contenttweaker:chitin>, <contenttweaker:life>, <contenttweaker:chitigic>], 
        [null, <contenttweaker:chitigic>, <contenttweaker:chitigic>, <contenttweaker:chitigic>, null]
    ]);

    //drone
    recipes.addShapeless("chitigic_egg", <contenttweaker:chitigic_drone>.withTag({food:5}), [<contenttweaker:chitigic_egg>]);

    //workers
    addDroneToWorker(<contenttweaker:chitigic_hunter>.withTag({food:25, life: 10}), [<enderio:item_end_steel_sword>, <enderio:item_end_steel_sword>], 200);
    //addDroneToWorker(<contenttweaker:chitigic_hunter>.withTag({food:25, life: 10}), [<enderio:item_end_steel_sword>, <enderio:item_end_steel_sword>], 200);
    //addDroneToWorker(<contenttweaker:chitigic_hunter>.withTag({food:25, life: 10}), [<enderio:item_end_steel_sword>, <enderio:item_end_steel_sword>], 200);
    //addDroneToWorker(<contenttweaker:chitigic_hunter>.withTag({food:25, life: 10}), [<enderio:item_end_steel_sword>, <enderio:item_end_steel_sword>], 200);
    


    recipes.addShapeless("ia_chit_party", <contenttweaker:chitigic_party>, [
        <contenttweaker:chitigic_scout>.only(isNonDroneAlive),
        <contenttweaker:chitigic_hunter>.only(isNonDroneAlive),
        <contenttweaker:chitigic_hunter>.only(isNonDroneAlive),
        <contenttweaker:chitigic_hunter>.only(isNonDroneAlive),
        <contenttweaker:chitigic_hunter>.only(isNonDroneAlive)
    ]);

    add8refinery(<contenttweaker:life>, <contenttweaker:isis_godshard>, 200);
    add8refinery(<contenttweaker:chitigic>, <contenttweaker:chitin>, 100);


    recipes.addShapeless("ia_chit_queen", <contenttweaker:chitigic_queen>, [
        <contenttweaker:chitigic_nursery>
    ]);
}