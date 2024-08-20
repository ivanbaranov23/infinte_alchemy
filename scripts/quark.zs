
furnace.addRecipe(<quark:glass_shards>, <minecraft:sand>);

{//quark cave crystals
	recipes.removeByRecipeName("actuallyadditions:recipes188");
	recipes.removeByRecipeName("actuallyadditions:recipes212");
	recipes.removeByRecipeName("actuallyadditions:recipes194");
	recipes.removeByRecipeName("actuallyadditions:recipes200");
	recipes.removeByRecipeName("actuallyadditions:recipes206");
	recipes.removeByRecipeName("actuallyadditions:recipes218");

    //red
    recipes.addShaped("ia_red_quark_crystal", <quark:crystal:1>, [
		[<actuallyadditions:item_crystal_empowered>, <actuallyadditions:item_crystal_empowered>, <actuallyadditions:item_crystal_empowered>], 
		[<actuallyadditions:item_crystal_empowered>, <quark:crystal:4>, <actuallyadditions:item_crystal_empowered>], 
		[<actuallyadditions:item_crystal_empowered>, <actuallyadditions:item_crystal_empowered>, <actuallyadditions:item_crystal_empowered>]
	]);
    //orange
    recipes.addShaped("ia_orange_quark_crystal", <quark:crystal:2>, [
		[<contenttweaker:ecoppra>, <contenttweaker:ecoppra>, <contenttweaker:ecoppra>], 
		[<contenttweaker:ecoppra>, <quark:crystal:4>, <contenttweaker:ecoppra>], 
		[<contenttweaker:ecoppra>, <contenttweaker:ecoppra>, <contenttweaker:ecoppra>]
	]);
    //yellow
    recipes.addShaped("ia_yellow_quark_crystal", <quark:crystal:3>, [
		[<contenttweaker:egoold>, <contenttweaker:egoold>, <contenttweaker:egoold>], 
		[<contenttweaker:egoold>, <quark:crystal:4>, <contenttweaker:egoold>], 
		[<contenttweaker:egoold>, <contenttweaker:egoold>, <contenttweaker:egoold>]
	]);
	//green
	recipes.addShaped("ia_green_quark_crystal", <quark:crystal:4>, [
		[<actuallyadditions:item_crystal_empowered:4>, <actuallyadditions:item_crystal:4>, <actuallyadditions:item_crystal_empowered:4>], 
		[<actuallyadditions:item_crystal:4>, <ore:gemMoon>, <actuallyadditions:item_crystal:4>], 
		[<actuallyadditions:item_crystal_empowered:4>, <actuallyadditions:item_crystal:4>, <actuallyadditions:item_crystal_empowered:4>]
	]);
    //blue
    recipes.addShaped("ia_blue_quark_crystal", <quark:crystal:5>, [
		[<contenttweaker:enittin>, <contenttweaker:enittin>, <contenttweaker:enittin>], 
		[<contenttweaker:enittin>, <quark:crystal:4>, <contenttweaker:enittin>], 
		[<contenttweaker:enittin>, <contenttweaker:enittin>, <contenttweaker:enittin>]
	]);
    //indigo
    recipes.addShaped("ia_indigo_quark_crystal", <quark:crystal:6>, [
		[<actuallyadditions:item_crystal_empowered:1>, <actuallyadditions:item_crystal_empowered:1>, <actuallyadditions:item_crystal_empowered:1>], 
		[<actuallyadditions:item_crystal_empowered:1>, <quark:crystal:4>, <actuallyadditions:item_crystal_empowered:1>], 
		[<actuallyadditions:item_crystal_empowered:1>, <actuallyadditions:item_crystal_empowered:1>, <actuallyadditions:item_crystal_empowered:1>]
	]);
    //white
    recipes.addShaped("ia_white_quark_crystal", <quark:crystal>, [
		[<actuallyadditions:item_crystal_empowered:5>, <actuallyadditions:item_crystal_empowered:5>, <actuallyadditions:item_crystal_empowered:5>], 
		[<actuallyadditions:item_crystal_empowered:5>, <quark:crystal:4>, <actuallyadditions:item_crystal_empowered:5>], 
		[<actuallyadditions:item_crystal_empowered:5>, <actuallyadditions:item_crystal_empowered:5>, <actuallyadditions:item_crystal_empowered:5>]
	]);
    //black
    recipes.addShaped("ia_black_quark_crystal", <quark:crystal:8>, [
		[<actuallyadditions:item_crystal_empowered:3>, <actuallyadditions:item_crystal_empowered:3>, <actuallyadditions:item_crystal_empowered:3>], 
		[<actuallyadditions:item_crystal_empowered:3>, <quark:crystal:4>, <actuallyadditions:item_crystal_empowered:3>], 
		[<actuallyadditions:item_crystal_empowered:3>, <actuallyadditions:item_crystal_empowered:3>, <actuallyadditions:item_crystal_empowered:3>]
	]);


}


//elder prismarine
