import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.data.IData;

import crafttweaker.enchantments.IEnchantmentDefinition;

import mods.modularmachinery.RecipeBuilder;

import mods.requious.Assembly;
import mods.requious.AssemblyRecipe;

{
    val array as IEnchantmentDefinition[] = [
        <enchantment:minecraft:protection>,
        <enchantment:minecraft:fire_protection>,
        <enchantment:minecraft:feather_falling>,
        <enchantment:minecraft:blast_protection>,
        <enchantment:minecraft:projectile_protection>,
        <enchantment:minecraft:respiration>,
        <enchantment:minecraft:aqua_affinity>
    ];


    var map as IData = {};

    for ench in array {
        map += ench.makeEnchantment(3).makeTag();
    }

    print(map.asString());


    //recipes.addShapeless("Supo", <minecraft:golden_sword>.withTag(map), [<minecraft:iron_sword>, <minecraft:golden_sword>]);
}

static counter as int = 0;
//ench, base, max_lvl
function enchToBook(ench as IEnchantmentDefinition, lvl as int) as IItemStack{
    //<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 16}]})
    return <minecraft:enchanted_book>.withTag(
        {StoredEnchantments: ench.makeEnchantment(lvl).makeTag().ench}
    );
}
function addLargeEnchanterRecipe(
    input_book as IItemStack, output_book as IItemStack, catalyst as IItemStack,
    inp as IItemStack[], enchantium_amount as int, time_t as int, rft as int
){
    counter += 1;
    var rec = RecipeBuilder.newBuilder("recipe" ~ counter, "large_enchanter", time_t);
	rec.addEnergyPerTickInput(rft);

	rec.addItemInput(input_book);

    if (catalyst){
        rec.addItemInput(catalyst);
        rec.setChance(0.0);
    }
    for i in inp{
        rec.addItemInput(i);
    }
    rec.addFluidInput(<liquid:enchantium> * enchantium_amount);
    
    rec.addItemOutput(output_book);
	rec.build();
}


function addLargeEnchanterRecipeChain(
    input_book as IItemStack,
    ench as IEnchantmentDefinition, max_lvl as int, max_lvl_reserch as int,
    inputs as IItemStack[][],
    ea_base as int, ea_increase as int, 
    time_t_base as int, time_t_increase as int,
    rft_base as int, rft_increase as int
) as int{
    print("[enchants] adding " ~ ench.name);
    addLargeEnchanterRecipe(input_book, enchToBook(ench, 1), null, inputs[0], ea_base, time_t_base, rft_base);
    if (max_lvl_reserch == 1) return 0;

    for lvl in 1 to max_lvl{
        addLargeEnchanterRecipe(
            enchToBook(ench, lvl), enchToBook(ench, lvl + 1), 
            null, 
            inputs[lvl], 
            ea_base + ea_increase * lvl, 
            time_t_base + time_t_increase * lvl, 
            rft_base + rft_increase * lvl
        );
    }

    if (max_lvl == max_lvl_reserch) return 0;
    for lvl in max_lvl to max_lvl_reserch{
        addLargeEnchanterRecipe(
            enchToBook(ench, lvl), enchToBook(ench, lvl + 1), 
            <contenttweaker:research_enchanting>, 
            inputs[lvl], 
            ea_base + ea_increase * lvl * lvl, 
            time_t_base + time_t_increase * 2 * lvl, 
            rft_base + rft_increase * 5 * lvl
        );
    }
    
    return 0;
}

val minute_t as int = 20 * 1;

{//enchantium
    scripts.content_machines.addAdvancedMixerRecipe(
        [],
        [<liquid:enchantium> * 200],
        [
            <extrautils2:ingredients:12> * 4,
            <minecraft:dye:4> * 4,
            <thermalfoundation:material:1028> * 4,
            <betternether:cincinnasite> * 3
        ], [
            <liquid:xpjuice> * 1000,
            <liquid:experience> * 1000,
            <liquid:essence> * 1000,
            <liquid:gravitite> * 36
        ], 20, 2000
    );
    mods.thermalexpansion.Crucible.addRecipe(<liquid:enchantium> * 4000, <contenttweaker:enchantium_chunk>, 30000);

    scripts.content_machines.addBioAssemblerRecipe(
        [<contenttweaker:enchantium_chunk> * 8], null,
        [
            <extendedcrafting:singularity:2> * 2,
            <extendedcrafting:singularity_custom:7>
        ], [
            <liquid:enchantium> * 1000
        ], <contenttweaker:research_enchanting>,
        20, 100000
    );
}



addLargeEnchanterRecipeChain(<apotheosis:weapon_book>, <enchantment:minecraft:sharpness>, 15, 25,
    [
        [<minecraft:quartz> * 4, <thermalfoundation:tool.sword_bronze:*>],
        [<minecraft:quartz> * 8, <thermalfoundation:tool.sword_bronze:*>],
        [<minecraft:quartz> * 12, <thermalfoundation:tool.sword_bronze:*>],
        [<minecraft:quartz> * 16, <minecraft:iron_sword:*>],
        [<minecraft:quartz> * 24, <minecraft:iron_sword:*>],

        [<minecraft:quartz> * 32, <minecraft:iron_sword:*>],
        [<minecraft:quartz> * 48, <thermalfoundation:tool.sword_steel:*>],
        [<minecraft:quartz> * 64, <thermalfoundation:tool.sword_steel:*>],
        [<minecraft:quartz_block> * 20, <thermalfoundation:tool.sword_steel:*>],
        [<minecraft:quartz_block> * 24, <thermalfoundation:tool.sword_platinum:*>],

        [<minecraft:quartz_block> * 32, <thermalfoundation:tool.sword_platinum:*>],
        [<minecraft:quartz_block> * 40, <thermalfoundation:tool.sword_platinum:*>],
        [<minecraft:quartz_block> * 48, <roots:runed_sword:*>],
        [<minecraft:quartz_block> * 56, <roots:runed_sword:*>],
        [<minecraft:quartz_block> * 64, <roots:runed_sword:*>],

        [<extendedcrafting:singularity_custom:25>, <redstonearsenal:tool.sword_flux:*>],
        [<extendedcrafting:singularity_custom:25>, <redstonearsenal:tool.sword_flux:*>],
        [<extendedcrafting:singularity_custom:25>, <redstonearsenal:tool.sword_flux:*>],
        [<extendedcrafting:singularity_custom:25>, <aether_legacy:gravitite_sword:*>],
        [<extendedcrafting:singularity_custom:25>, <aether_legacy:gravitite_sword:*>],

        [<extendedcrafting:singularity_custom:25> * 2, <aether_legacy:gravitite_sword:*>],
        [<extendedcrafting:singularity_custom:25> * 2, <twilightforest:giant_sword:*>],
        [<extendedcrafting:singularity_custom:25> * 3, <twilightforest:giant_sword:*>],
        [<extendedcrafting:singularity_custom:25> * 4, <twilightforest:giant_sword:*>],
        [<extendedcrafting:singularity_custom:25> * 5, <botania:manasteelsword:*>]
    ],
    500, 250,
    minute_t / 2, minute_t * 3 / 2,
    100, 100
);
addLargeEnchanterRecipeChain(<apotheosis:weapon_book>, <enchantment:minecraft:knockback>, 4, 8,
    [
        [<minecraft:piston>],
        [<minecraft:piston> * 4],
        [<minecraft:piston> * 16],
        [<minecraft:piston> * 64],

        [<minecraft:piston> * 64, <minecraft:piston> * 32, <projectred-core:resource_item:410>],
        [<minecraft:piston> * 64, <minecraft:piston> * 64, <projectred-core:resource_item:410> * 4],
        [<minecraft:piston> * 64, <minecraft:piston> * 64, <minecraft:piston> * 64, <projectred-core:resource_item:410> * 16],
        [<minecraft:piston> * 64, <minecraft:piston> * 64, <minecraft:piston> * 64, <minecraft:piston> * 64, <projectred-core:resource_item:410> * 64]
    ],
    1000, 500,
    minute_t, minute_t / 2,
    100, 100
);
addLargeEnchanterRecipeChain(<apotheosis:bow_book>, <enchantment:minecraft:infinity>, 1, 1,
    [
        [<enderio:item_material:20> * 64]
    ],
    3000, 0,
    minute_t, 0,
    100, 100
);
addLargeEnchanterRecipeChain(<apotheosis:bow_book>, <enchantment:minecraft:flame>, 1, 1,
    [
        [<twilightforest:fiery_ingot> * 16]
    ],
    3000, 0,
    minute_t, 0,
    100, 100
);
addLargeEnchanterRecipeChain(<apotheosis:bow_book>, <enchantment:minecraft:power>, 15, 35,
    [
        [<contenttweaker:power_core_active>, <minecraft:bow:*>],
        [<contenttweaker:power_core_active> * 2, <minecraft:bow:*>],
        [<contenttweaker:power_core_active> * 4, <minecraft:bow:*>],
        [<contenttweaker:power_core_active> * 8, <minecraft:bow:*>],
        [<contenttweaker:power_core_active> * 16, <minecraft:bow:*>],

        [<contenttweaker:power_core_active> * 16, <thermalfoundation:tool.bow_platinum:*>],
        [<contenttweaker:power_core_active> * 16, <thermalfoundation:tool.bow_platinum:*>],
        [<contenttweaker:power_core_active> * 16, <thermalfoundation:tool.bow_platinum:*>],
        [<contenttweaker:power_core_active> * 16, <thermalfoundation:tool.bow_platinum:*>],
        [<contenttweaker:power_core_active> * 24, <thermalfoundation:tool.bow_platinum:*>],

        [<contenttweaker:power_core_active> * 24, <redstonearsenal:tool.bow_flux:*>],
        [<contenttweaker:power_core_active> * 24, <redstonearsenal:tool.bow_flux:*>],
        [<contenttweaker:power_core_active> * 32, <redstonearsenal:tool.bow_flux:*>],
        [<contenttweaker:power_core_active> * 32, <redstonearsenal:tool.bow_flux:*>],
        [<contenttweaker:power_core_active> * 32, <redstonearsenal:tool.bow_flux:*>],

        [<contenttweaker:power_core_active> * 40, <enderio:item_dark_steel_bow:*>],
        [<contenttweaker:power_core_active> * 40, <enderio:item_dark_steel_bow:*>],
        [<contenttweaker:power_core_active> * 40, <enderio:item_dark_steel_bow:*>],
        [<contenttweaker:power_core_active> * 48, <enderio:item_dark_steel_bow:*>],
        [<contenttweaker:power_core_active> * 48, <enderio:item_dark_steel_bow:*>],

        [<contenttweaker:power_core_active> * 48, <enderio:item_end_steel_bow:*>],
        [<contenttweaker:power_core_active> * 64, <enderio:item_end_steel_bow:*>],
        [<contenttweaker:power_core_active> * 64, <enderio:item_end_steel_bow:*>],
        [<contenttweaker:power_core_active> * 64, <contenttweaker:compact_empowerer>, <enderio:item_end_steel_bow:*>],
        [<contenttweaker:power_core_active> * 64, <contenttweaker:compact_empowerer>, <enderio:item_end_steel_bow:*>],

        [<contenttweaker:power_core_active> * 64, <contenttweaker:compact_empowerer>, <bloodmagic:sentient_bow:*>],
        [<contenttweaker:power_core_active> * 64, <contenttweaker:compact_empowerer>, <bloodmagic:sentient_bow:*>],
        [<contenttweaker:power_core_active> * 64, <contenttweaker:compact_empowerer> * 2, <bloodmagic:sentient_bow:*>],
        [<contenttweaker:power_core_active> * 64, <contenttweaker:compact_empowerer> * 4, <bloodmagic:sentient_bow:*>],
        [<contenttweaker:power_core_active> * 64, <contenttweaker:compact_empowerer> * 8, <bloodmagic:sentient_bow:*>],

        [<contenttweaker:power_core_active> * 64, <contenttweaker:power_core_active> * 64, <contenttweaker:compact_empowerer> * 16, <draconicevolution:wyvern_bow:*>],
        [<contenttweaker:power_core_active> * 64, <contenttweaker:power_core_active> * 64, <contenttweaker:compact_empowerer> * 16, <draconicevolution:wyvern_bow:*>],
        [<contenttweaker:power_core_active> * 64, <contenttweaker:power_core_active> * 64, <contenttweaker:compact_empowerer> * 16, <draconicevolution:wyvern_bow:*>],
        [<contenttweaker:power_core_active> * 64, <contenttweaker:power_core_active> * 64, <contenttweaker:compact_empowerer> * 16, <draconicevolution:wyvern_bow:*>],
        [<contenttweaker:power_core_active> * 64, <contenttweaker:power_core_active> * 64, <contenttweaker:compact_empowerer> * 32, <draconicevolution:wyvern_bow:*>]
    ],
    3000, 500,
    minute_t, minute_t,
    100, 100
);


addLargeEnchanterRecipeChain(<minecraft:book>, <enchantment:apotheosis:hell_infusion>, 12, 20, //10, 25,
    [
        [<extrautils2:ingredients:11>],
        [<extrautils2:ingredients:11> * 2, <minecraft:netherrack>],
        [<extrautils2:ingredients:11> * 4, <minecraft:netherrack> * 2],
        [<extrautils2:simpledecorative:1>, <minecraft:netherrack> * 4],
        [<extrautils2:simpledecorative:1> * 2, <extrautils2:compressednetherrack>, <twilightforest:fiery_ingot>],

        [<extrautils2:simpledecorative:1> * 4, <extrautils2:compressednetherrack> * 2, <twilightforest:fiery_ingot> * 3],
        [<extrautils2:simpledecorative:1> * 8, <extrautils2:compressednetherrack> * 3, <twilightforest:block_storage:1>],
        [<extrautils2:simpledecorative:1> * 16, <extrautils2:compressednetherrack> * 4, <twilightforest:block_storage:1>],
        [<extendedcrafting:singularity_custom:41>, <extrautils2:compressednetherrack:1>, <twilightforest:block_storage:1> * 2],
        [<extendedcrafting:singularity_custom:41>, <extrautils2:compressednetherrack:1> * 2, <twilightforest:block_storage:1> * 4],

        [<extendedcrafting:singularity_custom:41>, <extrautils2:compressednetherrack:1> * 4, <twilightforest:block_storage:1> * 8],
        [<extendedcrafting:singularity_custom:41> * 2, <extrautils2:compressednetherrack:2>, <twilightforest:block_storage:1> * 12],
        [<extendedcrafting:singularity_custom:41> * 2, <extrautils2:compressednetherrack:2>, <twilightforest:block_storage:1> * 16],
        [<extendedcrafting:singularity_custom:41> * 4, <extrautils2:compressednetherrack:2>, <twilightforest:block_storage:1> * 20],
        [<extendedcrafting:singularity_custom:41> * 4, <extrautils2:compressednetherrack:2>, <contenttweaker:fiery_singularity>],

        [<extendedcrafting:singularity_custom:41> * 4, <extrautils2:compressednetherrack:3>, <contenttweaker:fiery_singularity>],
        [<extendedcrafting:singularity_custom:41> * 8, <extrautils2:compressednetherrack:3>, <contenttweaker:fiery_singularity>],
        [<extendedcrafting:singularity_custom:41> * 8, <extrautils2:compressednetherrack:3>, <contenttweaker:fiery_singularity>],
        [<extendedcrafting:singularity_custom:41> * 16, <extrautils2:compressednetherrack:4>, <contenttweaker:fiery_singularity> * 2],
        [<extendedcrafting:singularity_custom:41> * 32, <extrautils2:compressednetherrack:5>, <contenttweaker:fiery_singularity> * 3]
    ],
    1000, 500,
    minute_t / 2, minute_t * 3 / 2,
    100, 100
);


{//ench dup
    var recipe = AssemblyRecipe.create(function(container) {
        if(container.jei){
            container.addItemOutput("output0", <minecraft:enchanted_book>.withLore(["doubles input book", "only vanilla books"]));
        }else{
            container.addItemOutput("output0", container.getItem("mark"));
            container.addItemOutput("output1", container.getItem("mark"));
        }
    });

    
    recipe = recipe.requireItem("input", <minecraft:enchanted_book>.marked("mark"));
    recipe = recipe.requireItem("input", <contenttweaker:enchantium_chunk> * 64);
    //recipe = recipe.requireItem("input", <contenttweaker:enchantium_chunk> * 64);
    recipe = recipe.requireItem("input", <extendedcrafting:singularity:2> * 16);
    

    recipe = recipe.requireItem("catalyst", <contenttweaker:research_enchanting>, 0, 0);
    
    recipe = recipe.requireDuration("duration", 20 * 30);
    recipe = recipe.requireEnergy("power", 1000);

    <assembly:bioassembler>.addRecipe(recipe);
    <assembly:bioassembler>.addJEIRecipe(recipe);	
}



{//enchants
    /*
    -<enchantment:projectred-expansion:electric_efficiency> - Electric Efficiency I (at level 1, max level 4, treasure: no, enchant id 27)
    -<enchantment:apotheosis:shield_bash> - Shield Bash I (at level 1, max level 5, treasure: no, enchant id 64)
    -<enchantment:minecraft:luck_of_the_sea> - Luck of the Sea I (at level 1, max level 3, treasure: no, enchant id 61)
    -<enchantment:enderio:repellent> - Repellent I (at level 1, max level 4, treasure: no, enchant id 37)
    -<enchantment:minecraft:sweeping> - Sweeping Edge I (at level 1, max level 3, treasure: no, enchant id 22)
    -<enchantment:minecraft:thorns> - Thorns I (at level 1, max level 3, treasure: no, enchant id 7)
    - - Flame (at level 1, max level 1, treasure: no, enchant id 50)
    -<enchantment:minecraft:feather_falling> - Feather Falling I (at level 1, max level 4, treasure: no, enchant id 2)
    -<enchantment:cofhcore:leech> - Leech I (at level 1, max level 4, treasure: no, enchant id 44)
    -<enchantment:cofhcore:insight> - Insight I (at level 1, max level 3, treasure: no, enchant id 43)
    -<enchantment:minecraft:binding_curse> - Curse of Binding (at level 1, max level 1, treasure: yes, enchant id 10)
    -<enchantment:apotheosis:reflective> - Reflective Defenses I (at level 1, max level 5, treasure: no, enchant id 65)
    -<enchantment:enderio:witherarrow> - Withering (at level 1, max level 1, treasure: no, enchant id 30)
    -<enchantment:mod_lavacow:corrosive> - Corrosive I (at level 1, max level 5, treasure: no, enchant id 79)
    -<enchantment:astralsorcery:enchantment.as.nightvision> - Night Vision (at level 1, max level 1, treasure: no, enchant id 76)
    -<enchantment:apotheosis:tempting> - Temptation (at level 1, max level 1, treasure: no, enchant id 63)
    -<enchantment:minecraft:projectile_protection> - Projectile Protection I (at level 1, max level 4, treasure: no, enchant id 4)
    -<enchantment:apotheosis:scavenger> - Scavenger I (at level 1, max level 3, treasure: no, enchant id 58)
    -<enchantment:minecraft:smite> - Smite I (at level 1, max level 5, treasure: no, enchant id 17)
    -<enchantment:minecraft:frost_walker> - Frost Walker I (at level 1, max level 2, treasure: yes, enchant id 9)
    -<enchantment:minecraft:punch> - Punch I (at level 1, max level 2, treasure: no, enchant id 49)
    -<enchantment:apotheosis:natures_blessing> - Nature's Blessing I (at level 1, max level 3, treasure: no, enchant id 69)
    -<enchantment:cofhcore:soulbound> - Soulbound I (at level 1, max level 3, treasure: no, enchant id 52)
    - - Sharpness I (at level 1, max level 5, treasure: no, enchant id 16)
    -<enchantment:minecraft:efficiency> - Efficiency I (at level 1, max level 5, treasure: no, enchant id 32)
    -<enchantment:enderio:witherweapon> - Decay (at level 1, max level 1, treasure: no, enchant id 36)
    -<enchantment:cofhcore:smashing> - Smashing (at level 1, max level 1, treasure: no, enchant id 46)
    -<enchantment:apotheosis:depth_miner> - Miner's Fervor I (at level 1, max level 7, treasure: no, enchant id 56)
    -<enchantment:extrautils2:xu.burnerang> - Burnerang (at level 1, max level 1, treasure: no, enchant id 14)
    -<enchantment:minecraft:lure> - Lure I (at level 1, max level 3, treasure: no, enchant id 62)
    -<enchantment:apotheosis:life_mending> - Life-Mending I (at level 1, max level 3, treasure: no, enchant id 59)
    -<enchantment:apotheosis:true_infinity> - Endless Quiver (at level 1, max level 1, treasure: no, enchant id 75)
    -<enchantment:exnihilocreatio:sieve_luck_of_the_sea> - Sieve Luck of the Sea I (at level 1, max level 3, treasure: no, enchant id 41)
    -<enchantment:apotheosis:knowledge> - Knowledge of the Ages I (at level 1, max level 3, treasure: no, enchant id 67)
    -<enchantment:minecraft:fire_aspect> - Fire Aspect I (at level 1, max level 2, treasure: no, enchant id 20)
    -<enchantment:draconicevolution:enchant_reaper> - Reaper I (at level 1, max level 5, treasure: no, enchant id 11)
    -<enchantment:apotheosis:icy_thorns> - Icy Thorns I (at level 1, max level 3, treasure: no, enchant id 60)
    -<enchantment:enderio:soulbound> - Soulbound (at level 1, max level 1, treasure: no, enchant id 38)
    -<enchantment:minecraft:unbreaking> - Unbreaking I (at level 1, max level 3, treasure: no, enchant id 34)
    -<enchantment:astralsorcery:enchantment.as.smelting> - Scorching Heat (at level 1, max level 1, treasure: no, enchant id 77)
    -<enchantment:cofhcore:multishot> - Multishot I (at level 1, max level 4, treasure: no, enchant id 45)
    -<enchantment:openblocks:last_stand> - Last Stand I (at level 1, max level 2, treasure: no, enchant id 25)
    -<enchantment:cofhcore:vorpal> - Vorpal I (at level 1, max level 3, treasure: no, enchant id 53)
    - - Hell Infusion I (at level 1, max level 10, treasure: no, enchant id 54)
    -<enchantment:extrautils2:xu.boomereaperang> - Boomereaperang (at level 1, max level 1, treasure: no, enchant id 23)
    -<enchantment:minecraft:fortune> - Fortune I (at level 1, max level 3, treasure: no, enchant id 35)
    -<enchantment:openblocks:explosive> - Unstable I (at level 1, max level 3, treasure: no, enchant id 24)
    -<enchantment:openblocks:flim_flam> - Flim Flam I (at level 1, max level 4, treasure: no, enchant id 26)
    -<enchantment:apotheosis:magic_protection> - Occult Aversion I (at level 1, max level 4, treasure: no, enchant id 73)
    -<enchantment:extrautils2:xu.bladerang> - Bladerang I (at level 1, max level 5, treasure: no, enchant id 15)
    -<enchantment:minecraft:mending> - Mending (at level 1, max level 1, treasure: yes, enchant id 70)
    - - Knockback I (at level 1, max level 2, treasure: no, enchant id 19)
    -<enchantment:minecraft:fire_protection> - Fire Protection I (at level 1, max level 4, treasure: no, enchant id 1)
    - - Power I (at level 1, max level 5, treasure: no, enchant id 48)
    -<enchantment:extrautils2:xu.kaboomerang> - Kaboomerang I (at level 1, max level 3, treasure: no, enchant id 12)
    -<enchantment:exnihilocreatio:sieve_efficiency> - Sieve Efficiency I (at level 1, max level 5, treasure: no, enchant id 39)
    -<enchantment:exnihilocreatio:sieve_fortune> - Sieve Fortune I (at level 1, max level 3, treasure: no, enchant id 40)
    -<enchantment:minecraft:aqua_affinity> - Aqua Affinity (at level 1, max level 1, treasure: no, enchant id 6)
    -<enchantment:apotheosis:mounted_strike> - Mounted Strike I (at level 1, max level 6, treasure: no, enchant id 55)
    -<enchantment:mod_lavacow:lifesteal> - Lifesteal I (at level 1, max level 3, treasure: no, enchant id 81)
    -<enchantment:apotheosis:berserk> - Berserker's Fury I (at level 1, max level 4, treasure: no, enchant id 66)
    -<enchantment:cofhcore:smelting> - Smelting (at level 1, max level 1, treasure: no, enchant id 47)
    -<enchantment:apotheosis:rebounding> - Rebounding I (at level 1, max level 3, treasure: no, enchant id 72)
    -<enchantment:cofhcore:holding> - Holding I (at level 1, max level 4, treasure: no, enchant id 42)
    -<enchantment:minecraft:vanishing_curse> - Curse of Vanishing (at level 1, max level 1, treasure: yes, enchant id 71)
    
    -<enchantment:endercore:autosmelt> - Auto-Smelt (at level 1, max level 1, treasure: no, enchant id 28)
    -<enchantment:minecraft:blast_protection> - Blast Protection I (at level 1, max level 4, treasure: no, enchant id 3)
    -<enchantment:minecraft:bane_of_arthropods> - Bane of Arthropods I (at level 1, max level 5, treasure: no, enchant id 18)
    -<enchantment:endercore:xpboost> - XP Boost I (at level 1, max level 3, treasure: no, enchant id 29)
    -<enchantment:minecraft:silk_touch> - Silk Touch (at level 1, max level 1, treasure: no, enchant id 33)
    -<enchantment:minecraft:looting> - Looting I (at level 1, max level 3, treasure: no, enchant id 21)
    -<enchantment:extrautils2:xu.zoomerang> - Zoomerang I (at level 1, max level 3, treasure: no, enchant id 13)
    -<enchantment:minecraft:depth_strider> - Depth Strider I (at level 1, max level 3, treasure: no, enchant id 8)
    -<enchantment:minecraft:respiration> - Respiration I (at level 1, max level 3, treasure: no, enchant id 5)
    -<enchantment:apotheosis:capturing> - Capturing I (at level 1, max level 5, treasure: no, enchant id 74)
    -<enchantment:apotheosis:stable_footing> - Stable Footing (at level 1, max level 1, treasure: no, enchant id 57)
    -<enchantment:simplyjetpacks:fuel_efficiency> - Fuel Efficiency I (at level 1, max level 4, treasure: no, enchant id 78)
    -<enchantment:mod_lavacow:poisonous> - Poisonous I (at level 1, max level 3, treasure: no, enchant id 80)
    -<enchantment:apotheosis:splitting> - Splitting I (at level 1, max level 5, treasure: no, enchant id 68)
    - - Infinity (at level 1, max level 1, treasure: no, enchant id 51)
    -<enchantment:minecraft:protection> - Protection I (at level 1, max level 4, treasure: no, enchant id 0)
    */
}


recipes.addShapeless("book_ench", <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 57 as short}]}),
    [<minecraft:enchanted_book>.withTag({StoredEnchantments: [{id: 58 as short}]}).marked("mark")],
    function(out, ins, cInfo){
        var book as IItemStack = ins.mark;
        //var enchs as IData = book.tag.StoredEnchantments;
        for ench in book.tag.StoredEnchantments.asList(){
            if (ench.id == 58){
                return <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: ench.lvl as short, id: 57 as short}]});
            }
        }
        return null;
    }, null
);