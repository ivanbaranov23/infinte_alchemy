
import mods.modularmachinery.RecipeBuilder;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;


/*

here do be spoilers
don't look






if you don't want to have fun researching, first 3 items in the list are the answer


*/






















function addResearchRecipe(name as string, medium as IItemStack, out as IItemStack, input as IItemStack[], energy as int, time as int){
    out.addTooltip("Researched in Research Station multiblock.");
    out.addTooltip("Research medium is " ~ medium.displayName ~ ", amount: " ~ medium.amount);
    out.addTooltip("One research attempt lasts about " ~ time / 20 ~ " seconds at " ~ energy ~ " rf/tick");
    

    recipes.addShapeless(
        "ia_research_dup_" + out.name,
        out * 2,
        [out, medium * 1, medium * 1, medium * 1, medium * 1, medium * 1]
    );
    
    for inp in input{
        inp.anyAmount().addTooltip(game.localize("ia.tooltip.research") ~ " for \"" + out.displayName + "\", amount: " + (inp.amount as string));
        //out.addTooltip(inp.displayName + " x" + (inp.amount as string));
        oreDict["research" ~ name].add(inp * 1);
    }

    for i in 0 to (input.length - 2){
        for j in (i + 1) to (input.length - 1){
            for k in (j + 1) to input.length{
                var rec = RecipeBuilder.newBuilder(
                    "research_" + out.name + (i as string) + "_" + (j as string) + "_" + (k as string) , 
                    "research_station", time);

                rec.addItemInput(medium);
                rec.addItemInput(input[i]);
                rec.addItemInput(input[j]);
                rec.addItemInput(input[k]);

                rec.addEnergyPerTickInput(energy);

                if (i+j+k == 3){
                    rec.addItemOutput(out);
                }else{
                    var score as int = 0;
                    score += (i < 3)?1:0;
                    score += (j < 3)?1:0;
                    score += (k < 3)?1:0;
                    //>

                    rec.addItemOutput(<minecraft:paper>.withDisplayName("Failed Research Paper").withLore([(score as string) + " ingredients are correct"]));
                }
                rec.build();
            }
        }
    }
}
function addAdvancedResearchRecipe(name as string, medium as IItemStack, out as IItemStack, input as IItemStack[], energy as int, time as int){
    out.addTooltip("Researched in Advanced Research Station multiblock.");
    out.addTooltip("Research medium is " ~ medium.displayName ~ ", amount: " ~ medium.amount);
    out.addTooltip("One research attempt lasts about " ~ time / 20 ~ " seconds at " ~ energy ~ " rf/tick");
    

    recipes.addShapeless(
        "ia_research_dup_" + out.name,
        out * 2,
        [out, medium * 1, medium * 1, medium * 1, medium * 1, medium * 1]
    );
    
    for inp in input{
        inp.anyAmount().addTooltip(game.localize("ia.tooltip.research") ~ " for \"" + out.displayName + "\", amount: " + (inp.amount as string));
        //out.addTooltip(inp.displayName + " x" + (inp.amount as string));
        oreDict["research" ~ name].add(inp * 1);
    }

    for i1 in 0 to (input.length - 7)
    for i2 in (i1 + 1) to (input.length - 6)
    for i3 in (i2 + 1) to (input.length - 5)
    for i4 in (i3 + 1) to (input.length - 4)
    for i5 in (i4 + 1) to (input.length - 3)
    for i6 in (i5 + 1) to (input.length - 2)
    for i7 in (i6 + 1) to (input.length - 1)
    for i8 in (i7 + 1) to (input.length)            
    {
        var rec = RecipeBuilder.newBuilder(
                    "research_" ~ out.name ~ "_" ~ i1 ~ "_" ~ i2 ~ "_" ~ i3 ~ "_" ~ i4 ~ "_" ~ i5 ~ "_" ~ i6 ~ "_" ~ i7 ~ "_" ~ i8, 
                    "research2", time);

        rec.addItemInput(medium);
        rec.addItemInput(input[i1]);
        rec.addItemInput(input[i2]);
        rec.addItemInput(input[i3]);
        rec.addItemInput(input[i4]);
        rec.addItemInput(input[i5]);
        rec.addItemInput(input[i6]);
        rec.addItemInput(input[i7]);
        rec.addItemInput(input[i8]);

        rec.addEnergyPerTickInput(energy);

        if (i1+i2+i3+i4+i5+i6+i7+i8 == 0+1+2+3+4+5+6+7){
            rec.addItemOutput(out);
        }else{
            var score as int = 0;
            score += (i1 < 8)?1:0;
            score += (i2 < 8)?1:0;
            score += (i3 < 8)?1:0;
            score += (i4 < 8)?1:0;
            score += (i5 < 8)?1:0;
            score += (i6 < 8)?1:0;
            score += (i7 < 8)?1:0;
            score += (i8 < 8)?1:0;
            //>

            rec.addItemOutput(<minecraft:paper>.withDisplayName("Failed Research Paper").withLore([(score as string) + " ingredients are correct"]));
        }
        rec.build();
    }
        
    
}


addResearchRecipe("Glass", <minecraft:paper>, <contenttweaker:research_glass_making>,//ok
    [
        <cathedral:cathedral_glass_stained> * 16,
        <contenttweaker:glass_cutter_research_token>,
        <natura:nether_glass:1> * 4,
        <immersiveengineering:stone_decoration:8>,
        <roots:glass_eye>
    ],
    32, 20*20
);
addResearchRecipe("ExoticCircuit", <immersiveengineering:material:27>, <contenttweaker:research_circuit1>,//ok
    [
        <immersiveengineering:connector:5> * 6,
        <prodigytech:pattern_circuit_perfected>,
        <prodigytech:circuit_refined> * 8,
        <contenttweaker:fishy_capacitor> * 24,
        <contenttweaker:cactus_charcoal> * 32,
        <immersiveengineering:toolupgrade:10> * 10
    ],
    128, 30*20
);
addResearchRecipe("Structure", <immersiveengineering:metal_decoration1:1> * 12, <contenttweaker:research_structure>,//ok
    [
        <immersiveengineering:metal_decoration0:4> * 3,
        <immersiveengineering:metal_decoration2> * 24,
        <immersiveengineering:sheetmetal:6> * 24,
        <immersiveengineering:metal_decoration1:5> * 24,
        <immersiveengineering:metal_decoration0:5> * 2,
        <contenttweaker:concrete_token> * 8
    ],
    128, 30*20
);


addResearchRecipe("Plants1", <minecraft:paper> * 4, <contenttweaker:research_plants1>,//ok
    [
        <contenttweaker:steel_hoe_research_token> * 4,
        <erebus:log_baobab> * 12,
        <minecraft:poisonous_potato> * 32,
        <contenttweaker:plant_sample> * 2,
        <erebus:materials:55> * 8,
        <actuallyadditions:item_fertilizer> * 16
    ],
    128, 30*20
);
addResearchRecipe("Trees", <prodigytech:zorra_leaf>, <contenttweaker:research_plants2>,//ok
    [
        <bonsaitrees:bonsaipot:1>,
        <natura:redwood_logs:1> * 8,
        <tconstruct:slime_sapling:2> * 12,
        <prodigytech:zorrasteel_ingot> * 3,
        <tconstruct:broad_axe_head>.withTag({Material: "firewood"}),
        <minecraft:apple> * 32
    ], 512, 45 * 20
);
addResearchRecipe("Vines", <contenttweaker:plant_sample>, <contenttweaker:research_plants3>,//ok
    [
        <erebus:wall_plants_cultivated:7> * 8,
        <botania:vineball> * 12,
        <atum:ophidian_tongue_flower> * 4,
        <natura:nether_thorn_vines> * 8,
        <contenttweaker:blueslime_bucket> * 2,
        <contenttweaker:purpleslime_bucket> * 2
    ], 512, 45 * 20
);
<botania:vineball>.addTooltip("Throw me at the wall");


addResearchRecipe("Sieving", <exnihilocreatio:item_mesh:3>, <contenttweaker:research_sieving>, //ok
    [
        <excompressum:chicken_stick>.withTag({IsAngry: 1 as byte}),
        <harvestcraft:doughitem> * 16,
        <erebus:materials:2> * 12,
        <contenttweaker:grass_bucket> * 2,
        <moreplates:pig_iron_gear> * 8,
        <thermalexpansion:augment:497>
    ], 128, 30 * 20
);
addResearchRecipe("Flight", <minecraft:paper>, <contenttweaker:research_flight1>,
    [<extrautils2:angelblock> * 12,
    <tconstruct:slimesling>,
    <contenttweaker:angel_gear> * 4,
    <contenttweaker:glow_bucket> * 2,
    <roots:mystic_feather> * 8,
    <quark:gravisand> * 24],
    256, 30*20
);
addResearchRecipe("Fluids", <minecraft:paper>, <contenttweaker:research_fluids>,//ok
    [
        <erebus:fluid_jar>,
        <contenttweaker:demon_bucket>,
        <immersiveengineering:metal_device1:6> * 32,
        <extrautils2:passivegenerator:3> * 8,
        <thermalexpansion:tank>,
        <fluiddrawers:tank> * 8,
        <enderio:block_reservoir> * 8
    ],
    128, 20*20
);


addAdvancedResearchRecipe("Singularity", <contenttweaker:singularity_dust> * 16, <contenttweaker:research_singularity>, [
    <extendedcrafting:singularity_custom:100> * 64,
    <contenttweaker:neuro_singularity> * 2,
    <contenttweaker:fiery_singularity> * 8,
    <extendedcrafting:singularity_custom:19> * 3,
    <extendedcrafting:singularity_custom:28> * 12,
    <extendedcrafting:singularity_custom:50>,
    <extendedcrafting:singularity_custom:65> * 2,
    <extendedcrafting:singularity:48> * 8,
    <extendedcrafting:singularity_custom:51>,
    <extendedcrafting:singularity:49> * 8,
    <extendedcrafting:singularity_custom:21> * 3
], 10000, 20 * 30);

addResearchRecipe("Waste", <forge:bucketfilled>.withTag({FluidName: "crystal_waste", Amount: 1000}), <contenttweaker:research_chemistry1>,
    [
        <forge:bucketfilled>.withTag({FluidName: "anti_venom", Amount: 1000}),
        <aether_legacy:aechor_petal> * 16,
        <contenttweaker:bedrockium_alloy_mix> *2,
        <forge:bucketfilled>.withTag({FluidName: "plantoil", Amount: 1000}),
        <contenttweaker:fertilizer4> * 8,
        <contenttweaker:energized_compound> * 4
    ],
    512, 30*20
);
addResearchRecipe("Polymer", <contenttweaker:bouncy_matter_small>, <contenttweaker:research_chemistry2>,
    [
        <bloodmagic:component:8>,
        <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 10}]}),
        <avaritia:resource:7> * 4,
        <forge:bucketfilled>.withTag({FluidName: "polyethylene", Amount: 1000}),
        <contenttweaker:ldpe> * 48,
        <mekanism:polyethene> * 24,
        <enderio:item_material:4> * 32
    ],
    2048, 120*20
);
addResearchRecipe("AlienMat", <moreplates:end_steel_plate>, <contenttweaker:research_chemistry3>,
    [
        <extendedcrafting:singularity:64> * 2,
        <contenttweaker:bedrockium_alloy_ingot> * 20,
        <thermalfoundation:material:892> * 64,
        <extendedcrafting:singularity_custom:29>,
        <actuallyadditions:item_dust:2> * 32,
        <contenttweaker:gambrosium_dust> * 32,
        <deepmoblearning:polymer_clay> * 64
    ],
    4096, 5*60*20
);

addResearchRecipe("Heat", <prodigytech:heat_capacitor_0>, <contenttweaker:research_heat>,
    [
        <prodigytech:aeternus_crystal> * 64,
        <extendedcrafting:singularity:16>,
        <prodigytech:heat_capacitor_3>,
        <prodigytech:zorrasteel_ingot> * 48,
        <forge:bucketfilled>.withTag({FluidName: "fire_water", Amount: 1000}),
        <modulardiversity:blockhotairinputhatch> * 4,
        <prodigytech:energion_crystal_seed> * 64
    ],
    1024, 180*20
);

addResearchRecipe("Bacteria", <contenttweaker:bacteria> * 4, <contenttweaker:research_bacteria1>,
    [
        <forge:bucketfilled>.withTag({FluidName: "bacteria_waste", Amount: 1000}),
        <minecraft:fermented_spider_eye> * 64,
        <harvestcraft:vinegaritem> * 48,
        <forge:bucketfilled>.withTag({FluidName: "fermented_bacteria_broth", Amount: 1000}),
        <actuallyadditions:block_fermenting_barrel> * 4,
        <xreliquary:mob_ingredient:6> * 48,
        <contenttweaker:soap> * 64
    ],
    2048, 300*20
);

addResearchRecipe("Blood", <bloodmagic:slate:4>, <contenttweaker:research_magic2>,
    [
        <forge:bucketfilled>.withTag({FluidName: "evil_blood", Amount: 1000}),
        <extendedcrafting:singularity_custom:9> * 2,
        <contenttweaker:advanced_plating4_1> * 3,
        <bloodmagic:component:8> * 4,
        <forge:bucketfilled>.withTag({FluidName: "bound_metal", Amount: 1000}),
        <bloodmagic:points_upgrade>,
        <bhc:red_heart> * 48,
        <bloodmagic:blood_shard> * 64
    ],
    10000, 400 * 20
);




//research
recipes.addShapeless(
    "ia_glass_cutter_research_token",
    <contenttweaker:glass_cutter_research_token>,
    [<extrautils2:glasscutter>.noReturn()]
);
recipes.addShapeless(
    "ia_steel_hoe_research_token",
    <contenttweaker:steel_hoe_research_token>,
    [<immersiveengineering:hoe_steel>.noReturn()]
);

recipes.addShapeless(
    "ia_blueslime_bucket",
    <contenttweaker:blueslime_bucket>,
    [<forge:bucketfilled>.withTag({FluidName: "blueslime", Amount: 1000}).noReturn()]
);
recipes.addShapeless(
    "ia_purpleslime_bucket",
    <contenttweaker:purpleslime_bucket>,
    [<forge:bucketfilled>.withTag({FluidName: "purpleslime", Amount: 1000}).noReturn()]
);
recipes.addShapeless(
    "ia_grass_bucket",
    <contenttweaker:grass_bucket>,
    [<forge:bucketfilled>.withTag({FluidName: "refined_biofuel", Amount: 1000}).noReturn()]
);
recipes.addShapeless(
    "ia_glow_bucket",
    <contenttweaker:glow_bucket>,
    [<forge:bucketfilled>.withTag({FluidName: "glowstone", Amount: 1000}).noReturn()]
);
recipes.addShapeless(
    "ia_demon_bucket",
    <contenttweaker:demon_bucket>,
    [<forge:bucketfilled>.withTag({FluidName: "xu_demonic_metal", Amount: 1000}).noReturn()]
);

recipes.addShapeless(
    "ia_concrete_token",
    <contenttweaker:concrete_token>,
    [<forge:bucketfilled>.withTag({FluidName: "concrete", Amount: 1000}).noReturn()]
);
recipes.addShapeless(
    "ia_concrete_token2",
    <contenttweaker:concrete_token>,
    [<liquid:concrete> * 1000, <minecraft:bucket>]
);