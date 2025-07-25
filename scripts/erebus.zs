import moretweaker.erebus.OfferingAltar;



/*
//tooltips are from dj2
<erebus:materials:8>.addTooltip("§f- Solifuges (in the Ulterior Outback biome)");
<erebus:materials:8>.addTooltip("§f- Centipedes (in most biomes)");
<erebus:materials:13>.addTooltip("§f- Solifuges (in the Ulterior Outback biome)");
<erebus:materials:13>.addTooltip("§f- Centipedes (in most biomes)");
<erebus:materials>.addTooltip("§f- Beetles (in Underground Jungles,");
<erebus:materials>.addTooltip("§f           Subterranean Savannahs and Elysian Fields)");
<erebus:materials>.addTooltip("§f- Antlions (in Volcanic Deserts and in Antlion Overlord Pyramids)");
dj2.magma_crawler_eye.desc0=§f- Magma Crawlers (in Antlion Overlord Pyramids)");
dj2.tarantula_leg.desc0=§f- Tarantulas (in most biomes)");
dj2.fly_wing.desc0=§f- Flies (in all biomes)");
dj2.fly_wing.desc1=§f- Botflies (in most biomes)");
dj2.dragonfly_wing.desc0=§f- Dragonflies (on Dragonfly Lilypads in)");
dj2.dragonfly_wing.desc1=§flarge water bodies within Submerged Swamps");
dj2.elastic_fibre.desc0=§f- Locusts (in Elysian Fields and Subterranean Savannahs)");
dj2.elastic_fibre.desc1=§f- Punchrooms (in Fungal Forests as an uncommon drop)");
*/



//bamboo
recipes.addShapeless(
    "bamboo_uncrafting",
    <erebus:materials:3> * 4,
    [<erebus:planks:8>]
);
<erebus:bambucket>.definition.setContainerItem(<erebus:bambucket>.definition);

{//mushroom dup
  recipes.addShapeless("ia_erebus_mushroom_dup1", 
      <erebus:dark_capped_mushroom> * 3,
      [<exnihilocreatio:item_material:3>, <exnihilocreatio:item_material:3>, <erebus:kaizers_fingers_mushroom>]
  );
  recipes.addShapeless("ia_erebus_mushroom_dup2", 
      <erebus:sarcastic_czech_mushroom> * 3,
      [<exnihilocreatio:item_material:3>, <exnihilocreatio:item_material:3>, <erebus:dark_capped_mushroom>]
  );
  recipes.addShapeless("ia_erebus_mushroom_dup3", 
      <erebus:grandmas_shoes_mushroom> * 3,
      [<exnihilocreatio:item_material:3>, <exnihilocreatio:item_material:3>, <erebus:sarcastic_czech_mushroom>]
  );
  recipes.addShapeless("ia_erebus_mushroom_dup4", 
      <erebus:dutch_cap_mushroom> * 3,
      [<exnihilocreatio:item_material:3>, <exnihilocreatio:item_material:3>, <erebus:grandmas_shoes_mushroom>]
  );
  recipes.addShapeless("ia_erebus_mushroom_dup5", 
      <erebus:kaizers_fingers_mushroom> * 3,
      [<exnihilocreatio:item_material:3>, <exnihilocreatio:item_material:3>, <erebus:dutch_cap_mushroom>]
  );
}
//portal

OfferingAltar.removeRecipe(<erebus:materials:38>);
OfferingAltar.addRecipe(<erebus:materials:38>, <contenttweaker:power_core_active>, <contenttweaker:duraluminum_gear>, <ore:ingotHOPGraphite>);

recipes.remove(<erebus:altar_offering>);
recipes.addShaped("ia_altar_offering", <erebus:altar_offering>, [
	[null, <contenttweaker:power_core_active>, null], 
	[<ore:blockSteel>, <ore:compressed1xDustBedrock>, <ore:blockSteel>], 
	[<ore:blockSteel>, <contenttweaker:duraluminum_block>, <ore:blockSteel>]
]);

recipes.remove(<erebus:gaean_keystone>);
recipes.addShaped("ia_gaean_keystone", <erebus:gaean_keystone>, [
	[null, null, null], 
	[<prodigytech:circuit_refined>, <prodigytech:circuit_refined>, <prodigytech:circuit_refined>], 
	[<ore:plateSteel>, <contenttweaker:duraluminum_block>, <ore:plateSteel>]
]);

recipes.remove(<erebus:portal_activator>);
recipes.addShaped("ia_portal_activator", <erebus:portal_activator>, [
	[null, <roots:spirit_herb>, <erebus:materials:38>], 
	[<enderio:item_material:48>, <contenttweaker:duraluminum_rod>, <roots:spirit_herb>], 
	[<ore:gearEnchantedMetal>, <enderio:item_material:48>, null]
]);



{//peaceful

}

{//bee keeping
  recipes.addShaped("ia_beehive", <harvestcraft:beehive>, [
    [<erebus:materials>, <erebus:materials:19>, <erebus:materials>], 
    [<erebus:materials>, <ironchest:iron_chest:1>, <erebus:materials>], 
    [<erebus:materials>, <erebus:materials:19>, <erebus:materials>]
  ]);
  mods.tconstruct.Casting.addBasinRecipe(
      <erebus:honey_comb>, 
      <harvestcraft:beehive>,
      <liquid:sap>, 4000,
      true
  );
  recipes.remove(<erebus:honey_comb>);
  /*recipes.addShaped("ia_honey_comb", <erebus:honey_comb>, [
    [<ore:foodCaramel>, <erebus:nectar_collector>.noReturn(), <ore:foodCaramel>], 
    [<ore:foodCaramel>, <ironchest:iron_chest:1>, <ore:foodCaramel>], 
    [<ore:foodCaramel>, <erebus:nectar_collector>.noReturn(), <ore:foodCaramel>]
  ]);*/

  recipes.remove(<erebus:nectar_collector>);
  recipes.addShaped("ia_nectar_collector", <erebus:nectar_collector>, [
    [null, null, <minecraft:bowl>], 
    [null, <ore:stickTreatedWood>, null], 
    [<ore:stickTreatedWood>, null, null]
  ]);

  /*scripts.jei.addJEIhint(
    [<minecraft:spawn_egg>.withTag({EntityTag: {id: "erebus:erebus.beetle"}})], [], 
    [<minecraft:bucket>, <industrialforegoing:animal_resource_harvester>], 
    [<forge:bucketfilled>.withTag({FluidName: "beetle_juice", Amount: 1000})], [<liquid:beetle_juice>]
  );*/
  mods.thermalexpansion.Crucible.addRecipe(<liquid:honey> * 75, <erebus:materials:20>, 500);

  scripts.jei.addJEIhint(
    [<erebus:materials:20>], [], 
    [<erebus:liquifier>, <minecraft:redstone_block>], 
    [<erebus:materials:20>.withDisplayName("50 mb of honey")], [<liquid:honey>]
  );
}
//beetles


//jade
recipes.addShaped("ia_jade_bush1", <erebus:jade_berry_bush> * 2, [
	[<ore:gemJade>, <ore:gemJade>, <ore:gemJade>], 
	[<ore:gemJade>, <extendedcrafting:singularity_custom:100>, <ore:gemJade>], 
	[<ore:gemJade>, <thermalfoundation:fertilizer:1>, <ore:gemJade>]
]);
recipes.addShaped("ia_jade_bush2", <erebus:jade_berry_bush> * 4, [
	[<ore:gemJade>, <ore:gemJade>, <ore:gemJade>], 
	[<ore:gemJade>, <extendedcrafting:singularity_custom:100>, <ore:gemJade>], 
	[<ore:gemJade>, <thermalfoundation:fertilizer:2>, <ore:gemJade>]
]);
recipes.addShaped("ia_jade_bush3", <erebus:jade_berry_bush> * 5, [
	[<erebus:materials:55>, <ore:gemJade>, <erebus:materials:55>], 
	[<ore:gemJade>, <extendedcrafting:singularity_custom:100>, <ore:gemJade>], 
	[<erebus:materials:55>, <thermalfoundation:fertilizer:2>, <erebus:materials:55>]
]);

//amber
mods.tconstruct.Casting.addBasinRecipe(
	<erebus:amber>, 
	<erebus:materials:40>, <liquid:resin>, 2000, 
  true, 400
);
mods.thermalexpansion.Transposer.addFillRecipe(<erebus:amber>, <erebus:materials:40>, <liquid:resin> * 2000, 6000);

mods.tconstruct.Casting.addBasinRecipe(
	<erebus:amber>, 
	<thermalfoundation:material:832>, <liquid:resin>, 1000, 
  true, 200
);
mods.thermalexpansion.Transposer.addFillRecipe(<erebus:amber>, <thermalfoundation:material:832>, <liquid:resin> * 500, 3000);
