#priority 1
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.WeightedItemStack;

import mods.modularmachinery.RecipeBuilder;


<ore:fertilizer>.add(<actuallyadditions:item_fertilizer>);
<ore:fertilizer>.add(<erebus:compost>);
<ore:fertilizer>.add(<minecraft:dye:15>);
<ore:fertilizer>.add(<botania:fertilizer>);

<ore:advancedFertilizer>.add(<mysticalagriculture:mystical_fertilizer>);
//<ore:advancedFertilizer>.add(<xreliquary:fertile_potion>);
<ore:advancedFertilizer>.add(<bloodmagic:component:5>);

{//fertilizers
    recipes.addShapeless("ia_fertilizer1", <contenttweaker:fertilizer1> * 4, [<minecraft:dye:15>, <prodigytech:ash>, <minecraft:rotten_flesh>]);
    
    recipes.addShapeless("ia_fertilizer2", <contenttweaker:fertilizer2> * 4, [<contenttweaker:fertilizer1>, <botania:fertilizer>, <actuallyadditions:item_fertilizer>, <immersiveengineering:seed>]);
    
    mods.thermalexpansion.Transposer.addFillRecipe(<contenttweaker:fertilizer2_5> * 2, <contenttweaker:fertilizer2>, <liquid:fertilizer> * 1000, 2000);
    mods.thermalexpansion.Transposer.addFillRecipe(<contenttweaker:fertilizer3> * 2, <contenttweaker:fertilizer2_5>, <liquid:honey> * 1000, 1000);
    
    recipes.addShapeless("ia_fertilizer4", <contenttweaker:fertilizer4> * 4, [
        <contenttweaker:fertilizer3>, <industrialforegoing:fertilizer>, <contenttweaker:steeleaf_mush>, <mekanism:biofuel>, <erebus:compost>
    ]);
    recipes.addShapeless("ia_fertilizer4_2", <contenttweaker:fertilizer4> * 6, [
        <contenttweaker:fertilizer3>, <industrialforegoing:fertilizer>, <contenttweaker:steeleaf_mush>, <mekanism:biofuel>, <erebus:compost>,
        <liquid:tartaric_acid> * 1000
    ]);
    
    mods.actuallyadditions.Empowerer.addRecipe(
        <contenttweaker:fertilizer4_5>, <contenttweaker:fertilizer4>, 
        <contenttweaker:enspiced_spicy_bioblend>, <atum:fertile_soil_pile>, <actuallyadditions:item_crystal:4>, <actuallyadditions:item_worm>,
        3000, 10
    );
    mods.thermalexpansion.Transposer.addFillRecipe(<contenttweaker:fertilizer5> * 4, <contenttweaker:fertilizer4_5>, <liquid:empoweredoil> * 500, 3000);
    
    mods.mekanism.reaction.addRecipe(
        <contenttweaker:fertilizer5>, <liquid:ender_distillation> * 100, <gas:ammonia> * 50, 
        <contenttweaker:fertilizer6> * 4, <gas:water> * 50, 50000, 60
    );
    mods.mekanism.reaction.addRecipe(
        <contenttweaker:fertilizer5>, <liquid:worm_blood> * 300, <gas:ammonia> * 50, 
        <contenttweaker:fertilizer6> * 4, <gas:water> * 50, 50000, 60
    );
    
    mods.bloodmagic.AlchemyTable.addRecipe(
        <contenttweaker:fertilizer7> * 4, 
        [<contenttweaker:fertilizer6>, <botania:manaresource:18>, <bloodmagic:component:5>, <bloodmagic:component:5>, <roots:elemental_soil_earth>, <roots:terra_moss>], 
        10000, 20, 4
    );
    /*mods.bloodmagic.AlchemyTable.addRecipe(
        <contenttweaker:fertilizer7>, 
        [<contenttweaker:fertilizer6>, <contenttweaker:entwood_dust>, <bloodmagic:component:5>, <bloodmagic:component:5>, <roots:elemental_soil_earth>, <roots:terra_moss>], 
        1000, 20, 4
    );*/
}

//todo super fertilizer
//todo nonlinear growth
static GCsoils as IItemStack[] = [
    <minecraft:dirt>,//0
    <minecraft:grass>,
    <roots:elemental_soil>,
    <atum:fertile_soil>,//3
    <aether_legacy:enchanted_aether_grass>,
    <botania:altgrass:2>,
    <botania:altgrass:5>//6
];
static GCtime as int[] = [
    10 * 20,//0
    9 * 20,
    8 * 20,
    7 * 20,//3
    6 * 20,
    5 * 20,
    4 * 20//6
];
static GCenergy as int[] = [
    0, 
    16, 64, 256, 
    1024, 4096, 16384
];
static GCchance as float[] = [
    1.0,
    0.8,
    0.6,
    0.4,
    0.2,
    0.0,
    0.0,
    0.0
];
static GCfertilizer as IItemStack[] = [
    <contenttweaker:fertilizer1>,
    <contenttweaker:fertilizer2>,
    <contenttweaker:fertilizer3>,
    <contenttweaker:fertilizer4>,
    <contenttweaker:fertilizer5>,
    <contenttweaker:fertilizer6>,
    <contenttweaker:fertilizer7>
];

static GCnumbers as int[] = [
    1, //0
    2, 
    3, //2
    5,
    8, //4
    16,
    32, //6
    34,
    55
];

function addGCrecipe(tier as int, seeds as IItemStack[], fruits as WeightedItemStack[], catalyst as IItemStack[], mult as int){
    var rec = RecipeBuilder.newBuilder("GC_" ~ fruits[0].stack.name ~ seeds[0].name ~ tier, "garden_cloche", GCtime[tier] * mult);

    if (tier != 0) {rec.addEnergyPerTickInput(GCenergy[tier]);}

    for o in fruits{
        rec.addItemOutput(o.stack);
        rec.setChance(o.chance);
    }

    for i in seeds{
        rec.addItemInput(i);
        rec.setChance( GCchance[tier] );
    }
    
    rec.addItemInput(GCsoils[tier]);
    rec.setChance(0.0);

    for i in catalyst{
        rec.addItemInput(i);
        rec.setChance(0.0);
    }
    if (tier < 3){
        //>
        rec.addFluidInput(<liquid:water> * (200 * (tier + 1)));
    }else{
        rec.addFluidInput(<liquid:fertilizer> * (200 * (tier + 1)));
    }


    if (tier > 1){
        rec.addItemInput(<ore:fertilizer>, tier * 2);
    }
    if (tier > 2){
        rec.addItemInput(<contenttweaker:plant_sample>);
        rec.setChance( 1.0 / (tier as float) );
    }
    if (tier > 4){
        rec.addItemInput(<ore:advancedFertilizer>, tier - 4);
    }
    if (tier > 5){
        rec.addFluidInput(<liquid:plantoil> * 100);
    }

    rec.build();
}
function addGCrecipe_alltiers(min_tier as int, seeds as IItemStack[], fruits as WeightedItemStack[], catalyst as IItemStack[], mult as int){
    for i in min_tier to 7{
        addGCrecipe(i, seeds, fruits, catalyst, mult);
    }
}



recipes.addShaped("ia_vivid_grass", <botania:altgrass:2>, [
	[<contenttweaker:fertilizer6>, <enderio:item_material:14>, <contenttweaker:fertilizer6>], 
	[<contenttweaker:fertilizer6>, <atum:fertile_soil>, <contenttweaker:fertilizer6>], 
	[<contenttweaker:fertilizer6>, <enderio:item_material:14>, <contenttweaker:fertilizer6>]
]);



function addGCrecipe2(tier as int, 
    seeds as IItemStack[], fruits as WeightedItemStack[], 
    catalyst as IItemStack[], t_m as int, p_m as int)
{
    var rec = RecipeBuilder.newBuilder("GC2_" ~ fruits[0].stack.name ~ seeds[0].name ~ tier, "garden_cloche", GCtime[tier] * t_m);

    if (tier != 0) {rec.addEnergyPerTickInput(GCenergy[tier] * p_m);}

    for o in fruits{
        //for i in 0 to (tier * 2 + 1){
            rec.addItemOutput(o.stack * (o.stack.amount * GCnumbers[tier]));
            rec.setChance(o.chance);
        //}
    }

    for i in seeds{
        rec.addItemInput(i);
        rec.setChance(0.0);
    }
    
    rec.addItemInput(GCsoils[tier]);
    rec.setChance(0.0);
    rec.addItemInput(GCfertilizer[tier]);

    for i in catalyst{
        rec.addItemInput(i);
    }
    if (tier < 3){
        //>
        rec.addFluidInput(<liquid:water> * (200 * (tier + 1)));
    }else{
        rec.addFluidInput(<liquid:fertilizer> * (200 * (tier + 1)));
    }
    if (tier > 3){
        rec.addFluidInput(<liquid:plantoil> * 100);
    }

    rec.build();
}
function addGCrecipe_alltiers2(min_tier as int, 
    seeds as IItemStack[], fruits as WeightedItemStack[], 
    catalyst as IItemStack[], t_m as int, p_m as int)
{
    for i in min_tier to 7{
        addGCrecipe2(i, seeds, fruits, catalyst, t_m, p_m);
    }
}

{//garden cloche
    //no cat
    {//vanila    
        addGCrecipe_alltiers2(0, 
            [<exnihilocreatio:item_seed_potato>], 
            [(<minecraft:potato> * 8) % 95, <minecraft:poisonous_potato> % 5 ],
            [], 1, 1
        );
        addGCrecipe_alltiers2(0, 
            [<exnihilocreatio:item_seed_carrot>], 
            [(<minecraft:carrot> * 8) % 95],
            [], 1, 1
        );
        addGCrecipe_alltiers2(0, 
            [<minecraft:beetroot_seeds>], 
            [(<minecraft:beetroot> * 8) % 95],
            [], 1, 1
        );

        addGCrecipe_alltiers2(0, 
            [<minecraft:wheat_seeds>], 
            [(<minecraft:wheat> * 8) % 95],
            [], 1, 1
        );
        addGCrecipe_alltiers2(0, 
            [<natura:overworld_seeds>], 
            [(<natura:materials> * 8) % 95],
            [], 1, 1
        );
        addGCrecipe_alltiers2(0, 
            [<actuallyadditions:item_rice_seed>], 
            [(<actuallyadditions:item_food:16> * 8) % 95],
            [], 1, 1
        );

        
        addGCrecipe_alltiers2(0, 
            [<minecraft:pumpkin_seeds>], 
            [(<harvestcraft:harvestpumpkinitem> * 8) % 95],
            [], 6, 1
        );
        addGCrecipe_alltiers2(0, 
            [<minecraft:melon_seeds>], 
            [(<minecraft:melon> * 8) % 95],
            [], 2, 1
        );
        
    }

    //cat
    {//pam
        addGCrecipe_alltiers2(0, 
            [<harvestcraft:beanseeditem>], 
            [(<harvestcraft:beanitem> * 4) % 95],
            [], 1, 1
        );
        
        addGCrecipe_alltiers2(0, 
            [<harvestcraft:taroseeditem>], 
            [(<harvestcraft:taroitem> * 4) % 95],
            [], 1, 1
        );
    }
    {//other    
        addGCrecipe_alltiers2(2, 
            [<minecraft:nether_wart>, <contenttweaker:research_plants1>, <minecraft:soul_sand>], 
            [(<minecraft:nether_wart> * 4) % 75],
            [], 4, 1
        );

        addGCrecipe_alltiers2(2, 
            [<extrautils2:redorchid>, <contenttweaker:research_plants1>, <minecraft:redstone_ore>], 
            [(<minecraft:redstone> * 4) % 50, <extrautils2:redorchid> % 1, <erebus:materials:11> % 10 ],
            [], 1, 4
        );
        addGCrecipe_alltiers2(2, 
            [<actuallyadditions:item_food:16>, <contenttweaker:research_plants1>], 
            [(<actuallyadditions:item_misc:13> * 8) % 95 ],
            [], 1, 4
        );
        
        addGCrecipe_alltiers2(3, 
            [<twilightforest:steeleaf_ingot>, <contenttweaker:research_plants1>], 
            [(<twilightforest:steeleaf_ingot>) % 75 ],
            [], 4, 4
        );
        addGCrecipe_alltiers2(0, 
            [<contenttweaker:flolit_plant>, <contenttweaker:research_plants1>], 
            [<contenttweaker:flolit_plant> % 75],
            [<harvestcraft:huckleberryitem>], 2, 2
        );
        addGCrecipe_alltiers2(0, 
            [<contenttweaker:excited_crop>, <contenttweaker:research_plants1>], 
            [<contenttweaker:excited_crop> * 2 % 75],
            [<harvestcraft:chilipepperitem>], 2, 2
        );
        
        addGCrecipe_alltiers2(3, 
            [<stygian:endglow>, <contenttweaker:research_plants1>], 
            [(<stygian:endglow> * 4) % 75, <contenttweaker:ender_bacteria> % 10],
            [<contenttweaker:excited_crop> * 4], 4, 4
        );
        addGCrecipe_alltiers2(3, 
            [<contenttweaker:spicy_cactus>, <contenttweaker:research_plants1>], 
            [<contenttweaker:spicy_cactus> % 75],
            [<contenttweaker:honeyspice_ingot>], 4, 4
        );

        addGCrecipe_alltiers2(3, 
            [<contenttweaker:celestial_seed>, <contenttweaker:research_plants1>, <contenttweaker:uv_lamp>], 
            [<contenttweaker:celestial_corn> % 75, <contenttweaker:celestial_corn> % 50, <contenttweaker:celestial_corn> % 25],
            [<contenttweaker:ender_bacteria>, <contenttweaker:excited_crop> * 4], 4, 4
        );

        
    }

    {//vines
        addGCrecipe_alltiers2(0, 
            [<minecraft:vine>, <contenttweaker:research_plants3>], 
            [(<minecraft:vine> * 8) % 95 ],
            [], 2, 2
        );
        addGCrecipe_alltiers2(3, 
            [<atum:ophidian_tongue>, <contenttweaker:research_plants3>], 
            [(<atum:ophidian_tongue_flower> * 8) % 95 ],
            [], 2, 2
        );

        //mould
        addGCrecipe_alltiers2(2, 
            [<erebus:wall_plants:7>, <contenttweaker:research_plants3>, <erebus:log_rotten>], 
            [(<erebus:wall_plants:7> * 4) % 75 ],
            [], 2, 2
        );
        addGCrecipe_alltiers2(4, 
            [<erebus:wall_plants_cultivated:7>, <contenttweaker:research_plants3>, <erebus:log_rotten>], 
            [(<erebus:wall_plants_cultivated:7> * 8) % 85 ],
            [], 2, 2
        );
    }
    {//mushrooms

    }
}

recipes.addShaped("ia_greenhouse_lamps", <contenttweaker:greenhouse_lamps>, [
	[<ore:plankTreatedWood>, <ore:electronTube>, <ore:plankTreatedWood>], 
	[<ore:electronTube>, <immersiveengineering:metal_decoration0>, <ore:electronTube>], 
	[<ore:plankTreatedWood>, <ore:electronTube>, <ore:plankTreatedWood>]
]);
recipes.remove(<quantumflux:darkstone:1>);
recipes.addShaped("ia_darkstone_lamps", <quantumflux:darkstone:1>, [
	[<quantumflux:darkstone>, <actuallyadditions:block_crystal_empowered:2>, <quantumflux:darkstone>], 
	[<contenttweaker:uv_lamp>, <contenttweaker:greenhouse_lamps>, <contenttweaker:uv_lamp>], 
	[<quantumflux:darkstone>, <contenttweaker:uv_lamp>, <quantumflux:darkstone>]
]);



{//creation
    mods.roots.Fey.addRecipe("ia_netherwart",
        <minecraft:nether_wart>,
        [
            <minecraft:beetroot_seeds>,
            <atum:fertile_soil_pile>,
            <enderio:item_material:74>,
            <minecraft:red_mushroom>,
            <minecraft:brown_mushroom>
        ]
    );

    mods.roots.Pyre.addRecipe("ia_erebus_sapling_bamboo",
        <erebus:sapling_bamboo>,
        [
            <erebus:materials:3>,
            <minecraft:reeds>,
            <ore:treeSapling>,
            <minecraft:dye:15>,
            <minecraft:dye:15>
        ]
    );
}

{//pam gardens
    recipes.addShapeless("ia_aridgarden", <harvestcraft:aridgarden>, [<erebus:materials:19>, <contenttweaker:plant_sample>, <ore:sand>]);
    recipes.addShapeless("ia_frostgarden", <harvestcraft:frostgarden>, [<erebus:materials:19>, <contenttweaker:plant_sample>, <minecraft:snow>]);
    recipes.addShapeless("ia_shadedgarden", <harvestcraft:shadedgarden>, [<erebus:materials:19>, <contenttweaker:plant_sample>, <ore:listAllmushroom>]);
    recipes.addShapeless("ia_soggygarden", <harvestcraft:soggygarden>, [<erebus:materials:19>, <contenttweaker:plant_sample>, <minecraft:waterlily>]);
    recipes.addShapeless("ia_tropicalgarden", <harvestcraft:tropicalgarden>, [<erebus:materials:19>, <contenttweaker:plant_sample>, <ore:vine>]);
    recipes.addShapeless("ia_windygarden", <harvestcraft:windygarden>, [<erebus:materials:19>, <contenttweaker:plant_sample>, <ore:tallgrass>]);

    scripts.helper.addPlantStationRecipe(
        <contenttweaker:plant_sample>,
        [
            <harvestcraft:cactusfruititem>,
            <harvestcraft:agaveitem>,
            <harvestcraft:sisalitem>,
            <harvestcraft:cassavaitem>,
            <harvestcraft:chickpeaitem>,
            <harvestcraft:lentilitem>,
            <minecraft:cactus>
        ],
        [<harvestcraft:aridgarden> * 16],
        <liquid:water> * 1000,
        15
    );
    scripts.helper.addPlantStationRecipe(
        <contenttweaker:plant_sample>,
        [
            <harvestcraft:raspberryitem>,
            <harvestcraft:oatsitem>,
            <harvestcraft:ryeitem>,
            <harvestcraft:celeryitem>,
            <harvestcraft:peasitem>,
            <harvestcraft:beetitem>,
            <harvestcraft:rutabagaitem>,
            <harvestcraft:broccoliitem>,
            <harvestcraft:caulifloweritem>,
            <harvestcraft:cabbageitem>,
            <harvestcraft:spinachitem>,
            <harvestcraft:cottonitem>,
            <harvestcraft:huckleberryitem>,
            <harvestcraft:kohlrabiitem>,
            <harvestcraft:quinoaitem>,
            <harvestcraft:juniperberryitem>
        ],
        [<harvestcraft:frostgarden> * 16],
        <liquid:water> * 1000,
        15
    );
    scripts.helper.addPlantStationRecipe(
        <contenttweaker:plant_sample>,
        [
            <harvestcraft:whitemushroomitem>,
            <harvestcraft:blackberryitem>,
            <harvestcraft:zucchiniitem>,
            <harvestcraft:radishitem>,
            <harvestcraft:rhubarbitem>,
            <harvestcraft:tealeafitem>,
            <harvestcraft:garlicitem>,
            <harvestcraft:sweetpotatoitem>,
            <harvestcraft:turnipitem>,
            <harvestcraft:spiceleafitem>,
            <harvestcraft:beanitem>,
            <harvestcraft:leekitem>,
            <harvestcraft:scallionitem>,
            <harvestcraft:tomatoitem>,
            <harvestcraft:juteitem>
        ],
        [<harvestcraft:shadedgarden> * 16],
        <liquid:water> * 1000,
        15
    );
    scripts.helper.addPlantStationRecipe(
        <contenttweaker:plant_sample>,
        [
            <harvestcraft:brusselsproutitem>,
            <harvestcraft:spiceleafitem>,
            <harvestcraft:blueberryitem>,
            <harvestcraft:asparagusitem>,
            <harvestcraft:cranberryitem>,
            <harvestcraft:riceitem>,
            <harvestcraft:seaweeditem>,
            <harvestcraft:waterchestnutitem>,
            <harvestcraft:okraitem>,
            <harvestcraft:cottonitem>,
            <harvestcraft:kaleitem>,
            <harvestcraft:milletitem>,
            <harvestcraft:jicamaitem>,
            <harvestcraft:greengrapeitem>,
            <harvestcraft:mulberryitem>,
            <harvestcraft:tomatilloitem>
        ],
        [<harvestcraft:soggygarden> * 16],
        <liquid:water> * 1000,
        15
    );
    scripts.helper.addPlantStationRecipe(
        <contenttweaker:plant_sample>,
        [
            <harvestcraft:grapeitem>,
            <harvestcraft:pineappleitem>,
            <harvestcraft:kiwiitem>,
            <harvestcraft:sesameseedsitem>,
            <harvestcraft:curryleafitem>,
            <harvestcraft:bambooshootitem>,
            <harvestcraft:cantaloupeitem>,
            <harvestcraft:gingeritem>,
            <harvestcraft:coffeebeanitem>,
            <harvestcraft:soybeanitem>,
            <harvestcraft:eggplantitem>,
            <harvestcraft:kenafitem>,
            <harvestcraft:arrowrootitem>,
            <harvestcraft:taroitem>
        ],
        [<harvestcraft:tropicalgarden> * 16],
        <liquid:water> * 1000,
        15
    );
    scripts.helper.addPlantStationRecipe(
        <contenttweaker:plant_sample>,
        [
            <harvestcraft:strawberryitem>,
            <harvestcraft:barleyitem>,
            <harvestcraft:cornitem>,
            <harvestcraft:cucumberitem>,
            <harvestcraft:wintersquashitem>,
            <harvestcraft:mustardseedsitem>,
            <harvestcraft:onionitem>,
            <harvestcraft:parsnipitem>,
            <harvestcraft:peanutitem>,
            <minecraft:potato>,
            <minecraft:carrot>,
            <harvestcraft:lettuceitem>,
            <harvestcraft:artichokeitem>,
            <harvestcraft:bellpepperitem>,
            <harvestcraft:chilipepperitem>,
            <minecraft:wheat>,
            <harvestcraft:flaxitem>,
            <harvestcraft:amaranthitem>,
            <harvestcraft:elderberryitem>
        ],
        [<harvestcraft:windygarden> * 16],
        <liquid:water> * 1000,
        15
    );
}

scripts.helper.addPlantStationRecipe(
	<contenttweaker:research_plants2>, 
    [<integrateddynamics:menril_sapling>], 
    [
        <prodigytech:zorra_sapling> * 4,
        <natura:nether_sapling2> * 4,
        <moreplates:platinum_stick>,

    ], <liquid:tree_oil> * 2000, 12
);
scripts.helper.addPlantStationRecipe(
	<contenttweaker:research_plants2>, 
    [<extrautils2:ironwood_sapling>], 
    [
        <natura:redwood_sapling> * 4,
        <contenttweaker:plant_sample> * 16,
        <immersiveengineering:material:1> * 8,

    ], <liquid:tree_oil> * 2000, 12
);
scripts.helper.addPlantStationRecipe(
	<contenttweaker:research_plants2>, 
    [<aether_legacy:skyroot_sapling>], 
    [
        <natura:nether_sapling> * 4,
        <contenttweaker:plant_sample> * 8,
        <contenttweaker:angel_rod> * 8,
        <actuallyadditions:item_crystal_empowered:2> * 8
    ], <liquid:tree_oil> * 2000, 12
);
scripts.helper.addPlantStationRecipe(
	<contenttweaker:research_plants2>, 
    [<biomesoplenty:sapling_1:7>], 
    [
        <aether_legacy:golden_oak_sapling> * 4,
        <contenttweaker:plant_sample> * 32,
        <contenttweaker:egoold> * 32
    ], <liquid:holy_water> * 4000, 12
);

//plant sample
mods.thermalexpansion.InductionSmelter.addRecipe(<tconstruct:materials:1> * 3, <roots:elemental_soil>, <thermalfoundation:material:865> * 2, 1500, <thermalfoundation:material:864>, 45);

mods.thermalexpansion.Transposer.addFillRecipe(<contenttweaker:plant_sample>, <tconstruct:materials:1>, <liquid:refined_biofuel> * 2500, 3000);
{
    scripts.helper.addPlantStationRecipe(
        <roots:elemental_soil_earth>,
        [
            <contenttweaker:plant_sample> * 4
        ],
        [
            <tconstruct:materials:1>,
            <contenttweaker:excited_crop>,
            <appliedenergistics2:material:4>,
            <harvestcraft:ceasarsaladitem>
        ],
        <liquid:refined_biofuel> * 3000,
        20
    );
    scripts.helper.addPlantStationRecipe(
        <roots:elemental_soil_earth>,
        [
            <contenttweaker:plant_sample> * 4
        ],
        [
            <tconstruct:materials:1>,
            <contenttweaker:excited_crop>,
            <mekanism:biofuel>,
            <harvestcraft:ceasarsaladitem>
        ],
        <liquid:refined_biofuel> * 3000,
        20
    );
}

//processing

//carrot
scripts.helper.addSawRecipe(<minecraft:carrot>, <contenttweaker:carrot_pulp> * 2);

//beetroot
scripts.helper.addSawRecipe(<minecraft:beetroot>, <minecraft:dye:1> * 2);

{//pam
    {//barley
        scripts.helper.addSimpleCrushingRecipeWByproduct(
            <natura:materials>, <natura:materials:1> * 2, <natura:materials:1>, 50
        );
        mods.mekanism.crusher.addRecipe(<natura:materials>, <natura:materials:1> * 2);
        mods.prodigytech.rotarygrinder.addRecipe(<natura:materials>, <natura:materials:1> * 2);


        recipes.addShapeless("ia_barley_natura", <natura:overworld_seeds>, [
            <harvestcraft:barleyseeditem>
        ]);
        recipes.addShapeless("ia_barley_pam", <harvestcraft:barleyseeditem>, [
            <natura:overworld_seeds>
        ]);
    }

    {//amaranth
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:amaranth_juice> * 500, <harvestcraft:amaranthitem>, <liquid:water> * 200, 2000);
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:amaranth_juice> * 750, <harvestcraft:amaranthitem>, <liquid:formic_acid> * 25, 1000);

        mods.thermalexpansion.Imbuer.addRecipe(<liquid:amaranth_juice> * 500, <harvestcraft:amaranthseeditem>, <liquid:water> * 200, 2000);
        mods.thermalexpansion.Imbuer.addRecipe(<liquid:amaranth_juice> * 750, <harvestcraft:amaranthseeditem>, <liquid:formic_acid> * 25, 1000);

        mods.thermalexpansion.Refinery.addRecipe(<liquid:lubricant> * 50, null, <liquid:amaranth_juice> * 200, 2000);
        mods.immersiveengineering.Refinery.addRecipe(<liquid:purpleslime> * 16, <liquid:amaranth_juice> * 8, <liquid:blueslime> * 8, 300);
    }

}

{//kelp
    scripts.helper.addPlantStationRecipe(
        <roots:elemental_soil_earth>,
        [
            <biomesoplenty:seaweed>
        ],
        [
            <contenttweaker:algae_string> * 32,
            <contenttweaker:coral_dust> * 12,
            <immersiveengineering:material:7> * 32
        ],
        <liquid:refined_biofuel> * 3000,
        20
    );
    scripts.helper.addPlantStationRecipe(
        <roots:elemental_soil_earth>,
        [
            <biomesoplenty:seaweed>
        ],
        [
            <contenttweaker:algae_string> * 32,
            <contenttweaker:coral_dust> * 12,
            <thermalfoundation:material:864> * 32
        ],
        <liquid:refined_biofuel> * 3000,
        20
    );
    furnace.addRecipe(<contenttweaker:varec>, <biomesoplenty:seaweed>);
    mods.mekanism.compressor.addRecipe(<contenttweaker:varec>, <gas:chlorine>, <contenttweaker:iodine>);

    mods.alchemistry.Dissolver.addRecipe(<biomesoplenty:seaweed>, false, 1,
        [
            [100, <alchemistry:compound:507> * 8]
        ]
    );
}

//jade
addGCrecipe_alltiers2(2, 
    [<erebus:jade_berry_bush>], 
    [(<erebus:materials:55> * 5) % 50],
    [], 1, 1
);
mods.thermalexpansion.InductionSmelter.addRecipe(<erebus:materials:1>, 
    <erebus:materials:55>*4, <roots:cloud_berry>, 2000
);

{//bamboo
    mods.roots.Mortar.addRecipe("bamboo_dust", <contenttweaker:bamboo_dust>, [<erebus:materials:3>]);
    scripts.helper.addSawRecipe(<erebus:materials:3>, <contenttweaker:bamboo_dust> * 2);

    recipes.addShapeless("bamboo_to_sawdust", <prodigytech:sawdust> * 6, [<contenttweaker:bamboo_dust>, <ore:dustWood>]);
    recipes.addShapeless("bamboo_to_dough", <contenttweaker:bamboo_dough> * 3, [
        <contenttweaker:bamboo_dust>, 
        <harvestcraft:soymilkitem>, <harvestcraft:saltedcaramelitem>, <ore:dustWheat>
    ]);
    furnace.addRecipe(<contenttweaker:bamboo_cookie>, <contenttweaker:bamboo_dough>);
}

{//enbiotic
    scripts.helper.addSawRecipeWByproduct(<stygian:endglow>, <mekanism:biofuel>, <contenttweaker:enbiotic>, 25);
    mods.roots.Mortar.addRecipe("enbiotic1", <contenttweaker:enbiotic> * 4, [
        <stygian:endglow>, <stygian:endglow>, <stygian:endglow>, 
        <harvestcraft:rhubarbitem> | <harvestcraft:elderberryitem> | <harvestcraft:figitem>,
        <mekanism:biofuel>
    ]);
    mods.roots.Mortar.addRecipe("enbiotic2", <contenttweaker:enbiotic> * 5, [
        <stygian:endglow>, <stygian:endglow>, 
        <harvestcraft:grapejuiceitem>, 
        <harvestcraft:rhubarbitem>,
        <mekanism:biofuel>
    ]);

    mods.thermalexpansion.Centrifuge.addRecipe(
        [<contenttweaker:ender_amethyst_dirty_dust> % 30, <contenttweaker:ender_bacteria> % 5], 
        <contenttweaker:enbiotic>, <liquid:biotite> * 300, 5000
    );
}
{//super spice
    scripts.helper.addPlantStationRecipe(
        <roots:elemental_soil_earth>,
        [
            <contenttweaker:spicy_cactus>
        ],
        [
            <contenttweaker:honeyspice_ingot> * 32,
            <contenttweaker:plant_sample> * 32,
            <contenttweaker:cactus_charcoal> * 32
        ],
        <liquid:refined_biofuel> * 3000,
        20
    );

    mods.thermalexpansion.Crucible.addRecipe(<liquid:spicy_latex> * 250, <contenttweaker:spicy_cactus>, 4000);
    mods.thermalexpansion.Transposer.addFillRecipe(
        <contenttweaker:spicy_cactus_dust>,
        <contenttweaker:enspiced_spicy_bioblend>, <liquid:spicy_latex> * 1250,
        16000
    );

    <contenttweaker:spicy_cactus_dust>.addTooltip(game.localize("ia.tooltip.spicy_cactus_dust"));
}

{//celestial
    scripts.helper.addSawRecipeWByproduct(<contenttweaker:celestial_corn>, <contenttweaker:celestial_seed>, <contenttweaker:celestial_seed>, 25);

    mods.actuallyadditions.AtomicReconstructor.addRecipe(<biomesoplenty:crystal_shard>, <contenttweaker:celestial_corn>, 10000);

    scripts.content_machines.addAdvancedMixerRecipe(
        [], [<liquid:celestial_oil> * 1000], 
        [
            <contenttweaker:celestial_seed> * 4,
            <contenttweaker:flower_nether_eye> | <deepmoblearning:pristine_matter_mushroom>,
            <harvestcraft:kohlrabiitem> * 24
        ], [
            <liquid:canolaoil> * 1000,
            <liquid:seed_oil> * 1000
        ], 20, 1000
    );
    scripts.content_machines.addAdvancedMixerRecipe(
        [], [<liquid:celestial_oil> * 1000], 
        [
            <contenttweaker:celestial_seed> * 4,
            <contenttweaker:flower_nether_eye> | <deepmoblearning:pristine_matter_mushroom>,
            <harvestcraft:kohlrabiitem> * 16
        ], [
            <liquid:amaranth_juice> * 1000,
            <liquid:seed_oil> * 1000
        ], 20, 1000
    );

    scripts.content_machines.addBioAssemblerRecipe(
        [], <liquid:hot_celestial_oil> * 1000,
        [
            <thermalfoundation:material:1024>,
            <immersiveengineering:material:17>
        ], [<liquid:celestial_oil> * 500], <mekanism:basicblock2:5>,
        10, 1000
    );

    
    mods.thermalexpansion.Transposer.addFillRecipe(<contenttweaker:celestial_cluster>, 
        <biomesoplenty:crystal_shard>, <liquid:celestial_oil> * 100, 10000
    );
    mods.thermalexpansion.Transposer.addFillRecipe(<contenttweaker:celestial_cluster>, 
        <biomesoplenty:crystal_shard>, <liquid:hot_celestial_oil> * 75, 10000
    );

    scripts.helper.addSawRecipeWByproduct(<contenttweaker:celestial_cluster>, <biomesoplenty:crystal_shard> * 2, <biomesoplenty:crystal_shard>, 50);
}

//nether eye
<betternether:eye_seed>.displayName = "Nether Eye Seed";
mods.thermalexpansion.Transposer.addFillRecipe(<contenttweaker:flowering_nether_eye>, 
    <betternether:eye_seed>, <liquid:nether_air> * 1000, 4000
);
mods.mekanism.sawmill.addRecipe(
    <contenttweaker:flowering_nether_eye>, 
    <contenttweaker:flower_nether_eye>, 
    <biomesoplenty:fleshchunk>, 0.4
);


{//potash apples
    recipes.addShaped("ia_chalky_apple", <natura:edibles:10>, [
        [null, <natura:nether_leaves2>, null], 
        [<natura:nether_leaves2>, <minecraft:apple>, <natura:nether_leaves2>], 
        [null, <natura:nether_leaves2>, null]
    ]);

    recipes.addShapeless("ia_niter", <thermalfoundation:material:772>, [
        <natura:edibles:10>
    ]);
    scripts.helper.addSawRecipeWByproduct(<natura:edibles:10>, <thermalfoundation:material:772> * 2, <thermalfoundation:material:772>, 50);
    mods.prodigytech.atomicreshaper.addRecipe(<natura:edibles:10>, <contenttweaker:dolomite>, 12);
    mods.actuallyadditions.Empowerer.addRecipe(
        <minecraft:quartz_block> * 2, <minecraft:sand>, 
        <natura:edibles:10>,
        <natura:edibles:10>,
        <natura:edibles:10>,
        <natura:edibles:10>,
        4000, 10
    );
}

{//grape
    mods.immersiveengineering.Refinery.addRecipe(<liquid:purpleslime> * 10, <liquid:grape_juice> * 8, <liquid:blueslime> * 8, 300);
}