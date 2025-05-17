import crafttweaker.item.IItemStack;

function add2x2Recipe(brick as IItemStack, block as IItemStack){
    recipes.addShaped(
        "ia_" + brick.name + "_" + block.name + "_compression",
        block,
        [[brick, brick],[brick, brick]]
    );
    recipes.addShapeless(
        "ia_" + brick.name + "_" + block.name + "_uncompression",
        brick * 4,
        [block]
    );
}


//fireclay
recipes.addShapeless("ia_fireclay1", <contenttweaker:fireclay> * 2, [
    <minecraft:clay_ball>, <contenttweaker:brick_dust>, <minecraft:blaze_powder>, <minecraft:flint>
]);
recipes.addShapeless("ia_fireclay2", <contenttweaker:fireclay> * 6, [
    <contenttweaker:rich_clay>, <contenttweaker:brick_dust>, <minecraft:blaze_powder>, <minecraft:flint>
]);
//firebrick
furnace.addRecipe(<contenttweaker:firebrick>, <contenttweaker:fireclay>);
    
add2x2Recipe(<contenttweaker:firebrick>, <contenttweaker:firebrick_block>);

//porcelin
recipes.addShapeless("ia_porcelain_clay1", <exnihilocreatio:item_material:1> * 8, [
    <ore:clayBall>, <ore:clayBall>, <ore:clayBall>, 
    <ore:dustNetherQuartz>, <ore:dyeWhite>, <ore:dustAsh>
]);
recipes.addShapeless("ia_porcelain_clay2", <exnihilocreatio:item_material:1> * 16, [
    <contenttweaker:rich_clay>, <contenttweaker:rich_clay>, <contenttweaker:rich_clay>, 
    <ore:dustNetherQuartz>, <ore:dyeWhite>, <ore:dustAsh>
]);


//kaolin
add2x2Recipe(<contenttweaker:kaolin_clay>, <contenttweaker:kaolin_clay_block>);
mods.thermalexpansion.InductionSmelter.addRecipe(
    <contenttweaker:kaolin_clay> * 40, 
    <contenttweaker:sandworm_chitin>, <minecraft:clay_ball> * 8, 
    5000, 
    <atum:khnumite> * 4, 50
);
mods.thermalexpansion.Crucible.addRecipe(
    <liquid:claymud> * 250,
    <contenttweaker:kaolin_clay>, 2000
);
mods.thermalexpansion.Transposer.addFillRecipe(<contenttweaker:kaolin_clay>, <contenttweaker:industrial_clay>, <liquid:claymud> * 500, 2000);
mods.thermalexpansion.Transposer.addFillRecipe(<contenttweaker:kaolin_clay>, <contenttweaker:fireclay>, <liquid:claymud> * 1000, 2000);
mods.thermalexpansion.Transposer.addFillRecipe(<contenttweaker:kaolin_clay>, <contenttweaker:rich_clay>, <liquid:claymud> * 750, 2000);

//industrial clay
recipes.addShapeless("ai_industrail_clay", 
    <contenttweaker:industrial_clay>, 
    [<contenttweaker:fireclay>, <contenttweaker:fireclay>, <prodigytech:inferno_crystal>, <ore:dustConstantan>, <exnihilocreatio:item_material:1>]
);
recipes.addShapeless("ai_industrail_clay2", 
    <contenttweaker:industrial_clay> * 2, 
    [
        <contenttweaker:fireclay>, <contenttweaker:fireclay>, 
        <prodigytech:inferno_crystal>, 
        <ore:dustConstantan>, <exnihilocreatio:item_material:1>,
        <contenttweaker:dried_gravel> | <mysticalagriculture:crafting:28> | <contenttweaker:kaolin_clay> | <immersivepetroleum:material>
    ]
);
recipes.addShapeless("ai_industrail_clay3", 
    <contenttweaker:industrial_clay> * 6, 
    [
        <contenttweaker:fireclay>, <contenttweaker:fireclay>, 
        <prodigytech:inferno_crystal>, 
        <ore:dustConstantan>, <exnihilocreatio:item_material:1>,
        <contenttweaker:dried_gravel> | <mysticalagriculture:crafting:28> | <contenttweaker:kaolin_clay> | <immersivepetroleum:material>,
        <liquid:claymud> * 1000
    ]
);

//forest
add2x2Recipe(<contenttweaker:forest_clay>, <contenttweaker:forest_clay_block>);


//elastic clay
recipes.addShapeless("ia_elastic_clay1", 
    <contenttweaker:elastic_clay>, 
    [<contenttweaker:industrial_clay>, <contenttweaker:solar_silicon>, <contenttweaker:steeleaf_mush>, <erebus:materials:9>]
);
recipes.addShapeless("ia_elastic_clay2", 
    <contenttweaker:elastic_clay> * 3, 
    [<contenttweaker:industrial_clay>, <contenttweaker:solar_silicon>, <contenttweaker:steeleaf_mush>, <erebus:materials:9>, <contenttweaker:forest_clay>]
);

//clay glowstone
mods.enderio.AlloySmelter.removeRecipe(<enderio:item_material:76>);
recipes.addShapeless("ia_clay_glowstone", <enderio:item_material:76>, [
	<deepmoblearning:polymer_clay>, <deepmoblearning:polymer_clay>, <contenttweaker:insulation_strand>, 
	<ore:crystalTiberium>, <enderio:block_holy_fog>, 
	<liquid:claymud> * 2000
]);
recipes.addShapeless("ia_clay_glowstone2", <enderio:item_material:76>, [
	<deepmoblearning:polymer_clay>, <deepmoblearning:polymer_clay>, <contenttweaker:insulation_strand>, 
	<ore:crystalTiberium>, <enderio:block_holy_fog>, 
	<liquid:claymud> * 1000, 
	<liquid:claymud> * 1000
]);
mods.enderio.SagMill.removeRecipe(<enderio:item_material:76>);

scripts.content_machines.addAdvancedMixerRecipe(
    [<enderio:item_material:76> * 3], [], [
        <deepmoblearning:polymer_clay> * 2, <contenttweaker:insulation_strand>, 
	    <ore:crystalTiberium>, <enderio:block_holy_fog>
    ], [<liquid:claymud> * 1000], 20, 1000
);


{//tablet
    mods.bloodmagic.TartaricForge.addRecipe(<contenttweaker:alchemical_clay>, [
		<enderio:item_material:76>, <extrautils2:ingredients:5>, <atum:khnumite_block>, <aether_legacy:zanite_block>
	], 32, 16);

	mods.bloodmagic.TartaricForge.addRecipe(<contenttweaker:tablet_empty> * 3, [
		<contenttweaker:soul_codex8>, <contenttweaker:alchemical_clay>, <contenttweaker:advanced_petrotheum>, <tconstruct:dried_clay>
	], 300, 120);

	scripts.content_machines.addBioAssemblerRecipe(
		[<contenttweaker:tablet_engraved>], null,
		[
			<contenttweaker:tablet_empty>,
			<contenttweaker:blood_runic_dust> * 5,
			<contenttweaker:poisotheum>
		], [
			<liquid:ultrapure_water> * 1000
		], <contenttweaker:pressure_cutter>,
		20, 10000
	);
	
	mods.bloodmagic.AlchemyArray.addRecipe(
		<contenttweaker:tablet_evil>, 
		<contenttweaker:tablet_engraved>, <extrautils2:simpledecorative:2>, "contenttweaker:textures/hey.png"
	);
	mods.bloodmagic.AlchemyArray.addRecipe(
		<contenttweaker:tablet_good>, 
		<contenttweaker:tablet_evil>, <extendedcrafting:singularity_custom:42>, "contenttweaker:textures/hey.png"
	);
}


add2x2Recipe(<contenttweaker:manaclay>, <contenttweaker:manaclay_block>);
add2x2Recipe(<contenttweaker:manabrick>, <contenttweaker:manabrick_block>);

