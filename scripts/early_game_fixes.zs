import crafttweaker.item.IItemStack;

import mods.roots.Pyre;
import mods.roots.Fey;
import mods.roots.Mortar;


{//early game
    Pyre.addRecipe("charcoal_pyre",
        <minecraft:coal:1> * 3,
        [<ore:logWood>, <ore:logWood>, <ore:logWood>, <ore:logWood>, <ore:logWood>]
    );
    Pyre.addRecipe("stone_pyre", 
        <minecraft:stone> * 3, 
        [<minecraft:cobblestone>, <minecraft:cobblestone>, <minecraft:cobblestone>, <ore:rootsBark>, <minecraft:coal:1>]
    );
    Pyre.addRecipe("brick_pyre", 
        <minecraft:brick> * 3, 
        [<minecraft:clay_ball>, <minecraft:clay_ball>, <minecraft:clay_ball>, <ore:rootsBark>, <minecraft:coal:1>]
    );
    Pyre.addRecipe("firebrick_pyre", 
        <contenttweaker:firebrick> * 3, 
        [<contenttweaker:fireclay>, <contenttweaker:fireclay>, <contenttweaker:fireclay>, <ore:rootsBark>, <minecraft:coal:1>]
    );
    Pyre.addRecipe("glassshard_pyre", 
        <quark:glass_shards> * 3, 
        [<ore:sand>, <ore:sand>, <ore:sand>, <ore:rootsBark>, <minecraft:coal:1>]
    );
    Pyre.addRecipe("ia_crucible",
        <exnihilocreatio:block_crucible:1>,
        [<exnihilocreatio:block_crucible>, <ore:rootsBark>, <ore:rootsBark>, <ore:rootsBark>, <minecraft:coal:1>]
    );
    Pyre.addRecipe("ia_charred_stone",
        <prodigytech:charred_stone> * 3,
        [<ore:stone>, <ore:stone>, <ore:stone>, <ore:rootsBark>, <minecraft:coal:1>]
    );

    Mortar.addRecipe("ia_skystone", <appliedenergistics2:material:45> * 2,[
        <minecraft:flint>, <minecraft:fire_charge>, <contenttweaker:fireclay>,
        <minecraft:tallgrass:1>, <ore:dustWood>
    ]);

    recipes.addShaped("flint", <minecraft:flint>, [
        [null, <botania:manaresource:21>, null],
        [<botania:manaresource:21>, <exnihilocreatio:item_pebble>, <botania:manaresource:21>],
        [null, <botania:manaresource:21>, null]
    ]);
}

for ing,dust in {
    <minecraft:iron_ingot>: <thermalfoundation:material>,
    <thermalfoundation:material:128>: <thermalfoundation:material:64>,
    <thermalfoundation:material:129>: <thermalfoundation:material:65>,
    <thermalfoundation:material:133>: <thermalfoundation:material:69>,
    <thermalfoundation:material:132>: <thermalfoundation:material:68>,
    <contenttweaker:zinc_ingot>: <contenttweaker:zinc_dust>,
}as IItemStack[IItemStack]{
    mods.integrateddynamics.Squeezer.addRecipe(ing, dust);
    mods.appliedenergistics2.Grinder.addRecipe(ing, dust, 3);
    Mortar.addRecipe("fix_" ~ ing.name,
        dust * 4,
        [ing, ing, ing, ing, ing]
    );
}

mods.integrateddynamics.Squeezer.addRecipe(<minecraft:rotten_flesh>, null, <liquid:blood> * 35);

//<ore:listAllwater>.add(<erebus:bambucket>.withTag({Fluid: {FluidName: "water", Amount: 1000}}));

recipes.addShaped("ia_rice_balls", <actuallyadditions:item_misc:12> * 4, [
    [null, <actuallyadditions:item_misc:9>, null], 
    [<actuallyadditions:item_misc:9>, <erebus:bambucket>.withTag({'Fluid': {'FluidName': 'water', 'Amount': 1000}}), <actuallyadditions:item_misc:9>], 
    [null, <actuallyadditions:item_misc:9>, null]
]);


recipes.addShapeless("ia_sticky_bucket", <contenttweaker:sticky_bucket>, [
    <erebus:bambucket>.withTag({'Fluid': {'FluidName': 'water', 'Amount': 1000}}).noReturn(), <minecraft:rotten_flesh>, <minecraft:poisonous_potato>
]);
mods.tconstruct.Drying.addRecipe(<erebus:bambucket>.withTag({Fluid: {FluidName: "sticky_water", Amount: 1000}}), <contenttweaker:sticky_bucket>, 20 * 30);
mods.tconstruct.Casting.addTableRecipe(<tconstruct:edible:1>, null, <liquid:blueslime>, 160);

mods.exnihilocreatio.Hammer.addRecipe(
	<minecraft:quartz_block>, <minecraft:quartz> * 3, 
	0, 1.0, 1.0
);
mods.exnihilocreatio.Hammer.addRecipe(
	<minecraft:quartz_block>, <agricraft:agri_nugget:2> * 3, 
	0, 1.0, 1.0
);

mods.alfinivia.LiquidInteraction.add(
    <liquid:blueslime>,
    <liquid:lava>,
    <contenttweaker:burned_slimedirt>
);
mods.alfinivia.LiquidInteraction.add(
    <liquid:lava>,
    <liquid:blueslime>,
    <contenttweaker:burned_slimedirt>
);
scripts.jei.addJEIhint(
    [], [<liquid:lava>, <liquid:blueslime>],
    [<minecraft:cobblestone>.withDisplayName("In world mixing")],
    [<contenttweaker:burned_slimedirt>]
);



Pyre.addRecipe("ia_redstone_slime", <minecraft:redstone> * 3, [
    <contenttweaker:burned_slimedirt>, <contenttweaker:burned_slimedirt>, <contenttweaker:burned_slimedirt>,
    <minecraft:dye:15>, <minecraft:gunpowder>
]);