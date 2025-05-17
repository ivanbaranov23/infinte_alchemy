import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;

recipes.remove(<openblocks:xp_bottler>);
recipes.addShaped("ia_xp_bottler", <openblocks:xp_bottler>, [
	[<contenttweaker:zinc_plate>, <minecraft:glass_bottle>, <contenttweaker:zinc_plate>], 
	[<immersiveengineering:metal_device1:6>, <extrautils2:machine>, <immersiveengineering:metal_device1:6>], 
	[<contenttweaker:zinc_plate>, <immersiveengineering:material:9>, <contenttweaker:zinc_plate>]
]);

scripts.jei.addJEIhint(
    [<minecraft:glass_bottle>],
    [<liquid:xpjuice>],
    [<openblocks:xp_bottler>],
    [<minecraft:experience_bottle>]
);

recipes.remove(<openblocks:xp_drain>);
recipes.addShaped("ia_xp_drain", <openblocks:xp_drain>, [
	[<minecraft:iron_bars>, <immersiveengineering:material:8>, <minecraft:iron_bars>], 
	[<minecraft:iron_bars>, <mob_grinding_utils:xp_tap>, <minecraft:iron_bars>], 
	[<minecraft:iron_bars>, <immersiveengineering:material:8>, <minecraft:iron_bars>]
]);

scripts.jei.addJEIhint(
    [<minecraft:skull:2>.withDisplayName("Player")],
    [],
    [<mob_grinding_utils:tank_sink>, <openblocks:xp_drain>],
    [],
    [<liquid:xpjuice>]
);

for input,output in {
    <deepmoblearning:pristine_matter_zombie>: <openblocks:trophy:0>.withTag({entity_id: "minecraft:zombie"}),

    <deepmoblearning:pristine_matter_wither_skeleton>: <openblocks:trophy:0>.withTag({entity_id: "minecraft:wither_skeleton"})
} as IItemStack[IItemStack] {
    recipes.addShaped("open_" ~ input.name, output, [
        [input, input, input],
        [input, <exnihilocreatio:item_material:5>, input],
        [input, input, input]
    ]);
}