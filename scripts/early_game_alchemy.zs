import crafttweaker.item.IItemStack;

mods.exnihilocreatio.Hammer.addRecipe(
	<contenttweaker:burned_slimedirt>, <contenttweaker:fire_shard>,
	0, 0.6, 1.0
);
mods.exnihilocreatio.Hammer.addRecipe(
	<contenttweaker:burned_slimedirt>, <contenttweaker:slime_shard>,
	0, 0.6, 1.0
);
mods.exnihilocreatio.Hammer.addRecipe(
	<contenttweaker:burned_slimedirt>, <contenttweaker:fire_shard>,
	0, 0.3, 0.75
);
mods.exnihilocreatio.Hammer.addRecipe(
	<contenttweaker:burned_slimedirt>, <contenttweaker:slime_shard>,
	0, 0.3, 0.75
);

recipes.addShaped("ia_slime_sand1", <contenttweaker:slimy_sand> * 4, [
    [<contenttweaker:slime_shard>, <minecraft:sand>],
    [<minecraft:sand>, <contenttweaker:slime_shard>]
]);
recipes.addShaped("ia_slime_sand2", <contenttweaker:slimy_sand> * 2, [
    [<minecraft:slime_ball>, <minecraft:sand>],
    [<minecraft:sand>, <minecraft:slime_ball>]
]);

mods.exnihilocreatio.Hammer.addRecipe(
	<tconstruct:dried_clay>, <contenttweaker:dried_gravel>,
	0, 1.0, 1.0
);

mods.roots.Pyre.addRecipe("ia_redstone_slime", <minecraft:redstone> * 4, [
    <contenttweaker:fire_shard>, <contenttweaker:fire_shard>, <contenttweaker:brick_dust>,
    <ore:dyeRed>, <minecraft:gunpowder>
]);

function addWeakEnhancerRecipe(inp as IItemStack, outp as IItemStack){
    recipes.addShapeless("weak_enh" ~ inp.displayName, outp, [inp, <contenttweaker:weak_enhancer>]);
}
{//weak enhancer
    recipes.addShapeless("ia_weak_enhancer", <contenttweaker:weak_enhancer> * 4, [
        <biomesoplenty:fleshchunk>,
        <contenttweaker:slime_shard>,
        <minecraft:redstone>,
        <minecraft:flint>
    ]);
    recipes.addShapeless("ia_weak_enhancer", <contenttweaker:weak_enhancer> * 8, [
        <biomesoplenty:fleshchunk>,
        <contenttweaker:slime_shard>,
        <minecraft:redstone>,
        <minecraft:flint>,
        <mysticalcreations:bilim_essence>
    ]);

    addWeakEnhancerRecipe(<minecraft:gravel>, <minecraft:flint> * 3);


    recipes.addShaped("bilim1", <mysticalcreations:bilim_seeds>, [
        [<contenttweaker:weak_enhancer>, <contenttweaker:bamboo_dust>, <contenttweaker:weak_enhancer>],
        [<contenttweaker:weak_enhancer>, <ore:listAllseed>, <contenttweaker:weak_enhancer>],
        [<contenttweaker:weak_enhancer>, <contenttweaker:bamboo_dust>, <contenttweaker:weak_enhancer>]
    ]);
    recipes.addShaped("bilim2", <mysticalcreations:bilim_seeds>, [
        [<mysticalcreations:bilim_essence>, <contenttweaker:bamboo_dust>, <mysticalcreations:bilim_essence>],
        [<mysticalcreations:bilim_essence>, <ore:listAllseed>, <mysticalcreations:bilim_essence>],
        [<mysticalcreations:bilim_essence>, <contenttweaker:bamboo_dust>, <mysticalcreations:bilim_essence>]
    ]);

    recipes.addShapeless("ia_dried_clay", <tconstruct:dried_clay>, [
        <contenttweaker:weak_enhancer>, <contenttweaker:weak_enhancer>,
        <minecraft:clay>,
        <tconstruct:materials:2> | <contenttweaker:fire_shard>
    ]);
    recipes.addShapeless("ia_contenttweaker_fire_shard", <contenttweaker:fire_shard> * 4, [
        <contenttweaker:weak_enhancer>, <liquid:lava> * 1000
    ]);

    recipes.addShapeless("ia_certus_quartz", <appliedenergistics2:material>, [
        <contenttweaker:weak_enhancer>, 
        <appliedenergistics2:crystal_seed>, <appliedenergistics2:crystal_seed>, <appliedenergistics2:crystal_seed>
    ]);

    addWeakEnhancerRecipe(<minecraft:quartz>, <agricraft:agri_nugget:2> * 8);

    //red dye
    addWeakEnhancerRecipe(<minecraft:red_flower>, <minecraft:dye:1> * 3);
    addWeakEnhancerRecipe(<minecraft:beetroot>, <minecraft:dye:1> * 3);
    addWeakEnhancerRecipe(<minecraft:double_plant:4>, <minecraft:dye:1> * 6);
    addWeakEnhancerRecipe(<biomesoplenty:plant_1:10>, <minecraft:dye:1> * 6);
    addWeakEnhancerRecipe(<minecraft:red_mushroom>, <minecraft:dye:1> * 2);

    addWeakEnhancerRecipe(<minecraft:yellow_flower>, <minecraft:double_plant>);
    
    recipes.addShapeless("ia_gunpowder", <minecraft:gunpowder> * 2, [
        <contenttweaker:weak_enhancer>, 
        <thermalfoundation:material:769>, <thermalfoundation:material:769>, 
        <thermalfoundation:material:769>, <thermalfoundation:material:769>
    ]);

    //mob drops
    addWeakEnhancerRecipe(<xreliquary:mob_ingredient>, <minecraft:bone> * 6);
    addWeakEnhancerRecipe(<xreliquary:mob_ingredient:1>, <xreliquary:mob_ingredient> * 3);
    addWeakEnhancerRecipe(<xreliquary:mob_ingredient:6>, <minecraft:rotten_flesh> * 8);

    recipes.addShapeless("ia_intestine", <mod_lavacow:intestine>, [
        <contenttweaker:weak_enhancer>, 
        <minecraft:rotten_flesh>, <minecraft:rotten_flesh>, 
        <minecraft:rotten_flesh>, <minecraft:rotten_flesh>
    ]);

    addWeakEnhancerRecipe(<biomesoplenty:flesh>, <biomesoplenty:double_plant:2>);
    addWeakEnhancerRecipe(<minecraft:paper>, <minecraft:dye:15>);

    addWeakEnhancerRecipe(<minecraft:sandstone>, <contenttweaker:iron_sand> * 4);

    addWeakEnhancerRecipe(<roots:glass_eye>, <enderio:item_material:62> * 2);
    addWeakEnhancerRecipe(<minecraft:ender_pearl>, <enderio:item_material:62> * 5);
}

{//andesite
    scripts.jei.addJEIhint(
        [<minecraft:stone:5>], [],
        [<exnihilocreatio:block_crucible:1>],
        [<forge:bucketfilled>.withTag({FluidName: "andesite", Amount: 1000})], [<liquid:andesite>]
    );
    scripts.jei.addJEIhint(
        [], [<liquid:witchwater>, <liquid:andesite>],
        [<minecraft:cobblestone>.withDisplayName("In world mixing")],
        [<minecraft:cobblestone>, <minecraft:stone:5>, <minecraft:netherrack>]
    );

    mods.tconstruct.Melting.addRecipe(<liquid:andesite> * 250, <minecraft:stone:5>);


    mods.tconstruct.Alloy.addRecipe( <liquid:zinc> * 8, [
        <liquid:iron> * 8,
        <liquid:andesite> * 8
    ] );
}

{//bilim uses
    recipes.addShapeless("ia_terra_spores", <roots:terra_spores> * 6, [
        <mysticalcreations:bilim_essence>,
        <roots:wildroot>,
        <roots:wildroot>,
        <roots:wildroot>
    ]);
    
}


mods.exnihilocreatio.Hammer.addRecipe(
	<contenttweaker:iron_sand>, <exnihilocreatio:item_ore_iron>,
	0, 0.6, 1.0
);
mods.exnihilocreatio.Hammer.addRecipe(
	<contenttweaker:iron_sand>, <exnihilocreatio:item_ore_iron>,
	0, 0.4, 1.0
);
mods.tconstruct.Melting.addRecipe(<liquid:iron> * 144, <contenttweaker:iron_sand>);


mods.exnihilocreatio.Hammer.addRecipe(
	<contenttweaker:gold_sand>, <exnihilocreatio:item_ore_gold>,
	0, 0.6, 1.0
);
mods.exnihilocreatio.Hammer.addRecipe(
	<contenttweaker:gold_sand>, <exnihilocreatio:item_ore_gold>,
	0, 0.4, 1.0
);
mods.tconstruct.Melting.addRecipe(<liquid:gold> * 144, <contenttweaker:gold_sand>);