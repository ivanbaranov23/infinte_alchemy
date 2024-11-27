import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;

import mods.alchemistry.Evaporator;
import mods.alchemistry.Combiner;

recipes.removeByMod("alchemistry");

recipes.addShaped("ia_evaporator", <alchemistry:evaporator>, [
	[<contenttweaker:watertight_steel_plate>, null, <contenttweaker:watertight_steel_plate>], 
	[<projectred-core:resource_item>, <contenttweaker:watertight_steel_plate>, <projectred-core:resource_item>]
]);
recipes.addShapeless("ia_evaporator_reset", <alchemistry:evaporator>, [<alchemistry:evaporator>]);

Evaporator.addRecipe(<harvestcraft:seaweeditem>, <liquid:seaweed_rich_water> * 1500);


//better recipes
Combiner.addRecipe(<contenttweaker:insulation_strand>, [<contenttweaker:insulation_base>]);





//
Combiner.addRecipe(<contenttweaker:inert_glass>, [
	<extendedcrafting:singularity_custom:3> * 4, <alchemistry:element:500>, 
	//<alchemistry:fusion_casing> * 16, <alchemistry:fission_casing> * 16,
	<contenttweaker:starry_glass> * 4, <bloodmagic:decorative_brick:2> * 4,
	<contenttweaker:star_polymer> * 16
]);


//