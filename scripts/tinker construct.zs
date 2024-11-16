import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;

import mods.tconstruct.Casting;

//<ticontrait:direct>.addItem(<immersiveengineering:toolupgrade:12>);

//purge gear and rod casts
Casting.removeTableRecipe(<tconstruct:cast_custom:3>);
Casting.removeTableRecipe(<tconstruct:cast_custom:4>);

recipes.remove(<tconstruct:smeltery_controller>);
recipes.addShaped(
    "furnace_to_smeltery_controller",
    <tconstruct:smeltery_controller>,
    [[<tconstruct:seared:3>, <ore:plateTin>, <tconstruct:seared:3>],
    [<ore:plateCopper>, <ore:gearIron>, <ore:plateCopper>],
    [<tconstruct:seared:3>, <minecraft:furnace>, <tconstruct:seared:3>]]
);

recipes.remove(<tconstruct:seared_furnace_controller>);
recipes.addShaped("ia_seared_furnace", <tconstruct:seared_furnace_controller>, [
    [<tconstruct:seared:3>, <tconstruct:materials>, <tconstruct:seared:3>],
    [<tconstruct:materials>, <morefurnaces:furnaceblock:5>, <tconstruct:materials>],
    [<tconstruct:seared:3>, <tconstruct:materials>, <tconstruct:seared:3>]
]);

//bauxite
Casting.addBasinRecipe(
    <immersiveengineering:ore:1>, 
    <minecraft:quartz_block>, 
    <liquid:glass>, 1000, 
    true);
//eezo
scripts.helper.addFluidAlloyerRecipe(
    <taiga:eezo_ore>, 
    <enderio:item_material:20> * 32, <contenttweaker:black_bronze_ingot> * 4, 
    <liquid:petrotheum> * 2000, 
    256, 30
);


//basic modularium
Casting.addTableRecipe(
    <contenttweaker:basic_modularium>, 
    <contenttweaker:modularium_paste>, 
    <liquid:bronze>, 144, 
    true
);


//dirt brick
Casting.removeTableRecipe(<tconstruct:materials:1>);

recipes.addShaped("ia_silky_jewel_alt", <tconstruct:materials:16>, [
	[null, <tconstruct:materials:15>, null], 
	[<tconstruct:materials:15>, <contenttweaker:power_core_active>, <tconstruct:materials:15>], 
	[null, <tconstruct:materials:15>, null]
]);


{//slime
    recipes.remove(<minecraft:slime>);
    recipes.addShaped("ia_slime_block_no_ore", <minecraft:slime>,
        [
            [<minecraft:slime_ball>, <minecraft:slime_ball>, <minecraft:slime_ball>], 
            [<minecraft:slime_ball>, <minecraft:slime_ball>, <minecraft:slime_ball>], 
            [<minecraft:slime_ball>, <minecraft:slime_ball>, <minecraft:slime_ball>]
        ]
    );

    //drop
    recipes.addShapeless("ia_green_drop_alt", <tconstruct:edible:30>, [<minecraft:slime_ball>, <ore:itemSalt>]);
    recipes.addShapeless("ia_blue_drop_alt", <tconstruct:edible:31>, [<tconstruct:edible:1>, <ore:itemSalt>]);
    recipes.addShapeless("ia_purple_drop_alt", <tconstruct:edible:32>, [<tconstruct:edible:2>, <ore:itemSalt>]);
    recipes.addShapeless("ia_orange_drop_alt", <tconstruct:edible:34>, [<tconstruct:edible:4>, <ore:itemSalt>]);
    
    recipes.addShapeless("ia_blood_drop_alt", <tconstruct:edible:33>, [<tconstruct:edible:3>, <ore:itemSalt>]);

    //ore slime
    <ore:slimeball>.remove(<industrialforegoing:pink_slime>);
}

recipes.remove(<tconstruct:firewood:1>);
recipes.addShaped("ia_firewood", <tconstruct:firewood:1>, [
    [<minecraft:blaze_powder>, <tconstruct:firewood>, <minecraft:blaze_powder>],
    [<taiga:osram_nugget>, <biomesoplenty:flower_0:15>, <taiga:osram_nugget>],
    [<minecraft:blaze_powder>, <tconstruct:firewood>, <minecraft:blaze_powder>]
]);

//materials
recipes.addShaped("ia_bocuit", <contenttweaker:bocuit>, [
    [null, <immersiveengineering:material:22>, null], 
    [<contenttweaker:gold_wire>, <prodigytech:circuit_crude>, <immersiveengineering:material:20>], 
    [null, <contenttweaker:zinc_wire>, null]
]);

{
    recipes.remove(<tconstruct:materials:14>);
    recipes.addShaped("ia_reinforced_mod", <tconstruct:materials:14>, [
        [<roots:runed_obsidian>, <thermalfoundation:material:359>, <roots:runed_obsidian>], 
        [<contenttweaker:anput_godshard>, <tconstruct:cast>, <contenttweaker:anput_godshard>], 
        [<roots:runed_obsidian>, <thermalfoundation:material:359>, <roots:runed_obsidian>]
    ]);
}