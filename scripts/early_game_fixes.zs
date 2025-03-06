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
    mods.appliedenergistics2.Grinder.addRecipe(dust, ing, 3);
    Mortar.addRecipe("fix_" ~ ing.name,
        dust * 4,
        [ing, ing, ing, ing, ing]
    );
}
for chunk,dust in {
    <exnihilocreatio:item_ore_iron:1>: <thermalfoundation:material>,
    <exnihilocreatio:item_ore_copper:1>: <thermalfoundation:material:64>,
    <exnihilocreatio:item_ore_tin:1>: <thermalfoundation:material:65>,
    <exnihilocreatio:item_ore_nickel:1>: <thermalfoundation:material:69>,
    <exnihilocreatio:item_ore_aluminum:1>: <thermalfoundation:material:68>,
    <exnihilocreatio:item_ore_zinc:1>: <contenttweaker:zinc_dust>,
}as IItemStack[IItemStack]{
    mods.integrateddynamics.Squeezer.addRecipe(chunk, dust, 1.0, dust, 0.8);
    mods.appliedenergistics2.Grinder.addRecipe(dust, chunk, 3, dust, 0.8);
}

mods.integrateddynamics.Squeezer.addRecipe(<minecraft:rotten_flesh>, null, <liquid:blood> * 40);
mods.integrateddynamics.Squeezer.addRecipe(<biomesoplenty:fleshchunk>, null, <liquid:blood> * 20);

//<ore:listAllwater>.add(<erebus:bambucket>.withTag({Fluid: {FluidName: "water", Amount: 1000}}));

recipes.addShaped("ia_rice_balls", <actuallyadditions:item_misc:12> * 4, [
    [null, <actuallyadditions:item_misc:9>, null], 
    [<actuallyadditions:item_misc:9>, <erebus:bambucket>.withTag({'Fluid': {'FluidName': 'water', 'Amount': 1000}}), <actuallyadditions:item_misc:9>], 
    [null, <actuallyadditions:item_misc:9>, null]
]);

//blue slime
recipes.addShapeless("ia_sticky_bucket", <contenttweaker:sticky_bucket>, [
    <erebus:bambucket>.withTag({'Fluid': {'FluidName': 'water', 'Amount': 1000}}).noReturn(), <minecraft:rotten_flesh>, <minecraft:poisonous_potato>
]);
mods.tconstruct.Drying.addRecipe(<erebus:bambucket>.withTag({Fluid: {FluidName: "sticky_water", Amount: 1000}}), <contenttweaker:sticky_bucket>, 20 * 30);
mods.tconstruct.Casting.addTableRecipe(<tconstruct:edible:1>, null, <liquid:blueslime>, 160);
mods.tconstruct.Melting.addRecipe(<liquid:blueslime> * 160, <tconstruct:edible:1>);



mods.exnihilocreatio.Hammer.addRecipe(
	<minecraft:quartz_block>, <minecraft:quartz> * 3, 
	0, 1.0, 1.0
);
mods.exnihilocreatio.Hammer.addRecipe(
	<minecraft:quartz_block>, <agricraft:agri_nugget:2> * 3, 
	0, 1.0, 1.0
);


scripts.jei.addJEIhint(
    [], [<liquid:lava>, <liquid:blueslime>],
    [<minecraft:cobblestone>.withDisplayName("In world mixing")],
    [<contenttweaker:burned_slimedirt>]
);

scripts.jei.addJEIhint(
    [], [<liquid:witchwater>, <liquid:blueslime>],
    [<minecraft:cobblestone>.withDisplayName("In world mixing")],
    [<tconstruct:slime_dirt:1>]
);




Mortar.addRecipe("ferramic_al", <exnihilocreatio:item_ore_aluminum> * 10, [
    <contenttweaker:ferramic_gravel>,
    <contenttweaker:ferramic_gravel>,
    <contenttweaker:ferramic_gravel>,
    <contenttweaker:ferramic_gravel>,
    <contenttweaker:zinc_dust>
]);


//motor
recipes.remove(<tconstruct:stone_stick>);
recipes.addShaped("ia_stone_rod", <tconstruct:stone_stick>, [
    [<ore:cobblestone>],
    [<ore:cobblestone>]
]);
//stone gear
recipes.remove(<exnihilocreatio:item_material:7>);
recipes.remove(<enderio:item_material:10>);
recipes.addShaped("ia_stone_gear", <thermalfoundation:material:23>, [
    [<ore:rodStone>, <ore:cobblestone>, <ore:rodStone>], 
    [<ore:cobblestone>, <ore:gearWood>, <ore:cobblestone>], 
    [<ore:rodStone>, <ore:cobblestone>, <ore:rodStone>]
]);





//ex nihilo
recipes.remove(<exnihilocreatio:block_axle_stone>);
recipes.addShaped("block_axle_stone", <exnihilocreatio:block_axle_stone>, [
    [null, <ore:rodStone>, <ore:rodStone>], 
    [<ore:rodStone>, <thermalfoundation:material:23>, <ore:rodStone>], 
    [<ore:rodStone>, <ore:rodStone>, null]
]);
recipes.remove(<exnihilocreatio:block_auto_sifter>);
recipes.addShaped("block_auto_sifter", <exnihilocreatio:block_auto_sifter>, [
    [<thermalfoundation:material:22>, <minecraft:hopper>, <thermalfoundation:material:22>], 
    [<exnihilocreatio:block_axle_stone>, <contenttweaker:simple_motor>, <exnihilocreatio:block_axle_stone>], 
    [<thermalfoundation:material:23>, <minecraft:hopper>, <thermalfoundation:material:23>]
]);
//project red
recipes.remove(<projectred-expansion:machine2>);
recipes.addShaped("prr_block_breaker", <projectred-expansion:machine2>, [
    [<tconstruct:seared:3>, <minecraft:iron_pickaxe>, <tconstruct:seared:3>], 
    [<tconstruct:seared:3>, <contenttweaker:simple_motor>, <tconstruct:seared:3>], 
    [<tconstruct:seared:3>, <projectred-core:resource_item:103>, <tconstruct:seared:3>]
]);
recipes.remove(<projectred-expansion:machine2:2>);
recipes.addShaped("prr_block_placer", <projectred-expansion:machine2:2>, [
    [<tconstruct:seared:3>, <ironchest:iron_chest:3>, <tconstruct:seared:3>], 
    [<tconstruct:seared:3>, <contenttweaker:simple_motor>, <tconstruct:seared:3>], 
    [<tconstruct:seared:3>, <projectred-core:resource_item:103>, <tconstruct:seared:3>]
]);
recipes.remove(<projectred-expansion:machine2:11>);
recipes.addShaped("prr_crafter", <projectred-expansion:machine2:11>, [
    [<tconstruct:seared:3>, <minecraft:crafting_table>, <tconstruct:seared:3>], 
    [<contenttweaker:simple_motor>, <ironchest:iron_chest:3>, <contenttweaker:simple_motor>], 
    [<tconstruct:seared:3>, <projectred-core:resource_item:104>, <tconstruct:seared:3>]
]);