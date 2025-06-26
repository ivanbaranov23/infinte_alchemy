#priority 10
import crafttweaker.item.IItemStack;


recipes.removeByMod("mysticalagriculture");




recipes.remove(<matc:inferiumcrystal>);
mods.aether_legacy.Enchanter.registerEnchantment(<mysticalagriculture:ingot_storage:1>, <matc:inferiumcrystal>, 100);

recipes.remove(<mysticalagriculture:master_infusion_crystal>);
mods.extendedcrafting.TableCrafting.addShaped(0, <mysticalagriculture:master_infusion_crystal>, [
    [<contenttweaker:singularity_dust>, <contenttweaker:singularity_dust>, <contenttweaker:singularity_dust>, <contenttweaker:singularity_dust>, <contenttweaker:singularity_dust>], 
    [<contenttweaker:singularity_dust>, <mysticalagradditions:insanium>, <mysticalagradditions:insanium>, <mysticalagradditions:insanium>, <contenttweaker:singularity_dust>], 
    [<contenttweaker:singularity_dust>, <mysticalagradditions:insanium>, <matc:supremiumcrystal>, <mysticalagradditions:insanium>, <contenttweaker:singularity_dust>], 
    [<contenttweaker:singularity_dust>, <mysticalagradditions:insanium>, <mysticalagradditions:insanium>, <mysticalagradditions:insanium>, <contenttweaker:singularity_dust>], 
    [<contenttweaker:singularity_dust>, <contenttweaker:singularity_dust>, <contenttweaker:singularity_dust>, <contenttweaker:singularity_dust>, <contenttweaker:singularity_dust>]
]);



val toAdd3x3 as IItemStack[IItemStack] = {
    //essences
    <mysticalagriculture:crafting>: <mysticalagriculture:storage>,
    <mysticalagriculture:crafting:1>: <mysticalagriculture:storage:1>,
    <mysticalagriculture:crafting:2>: <mysticalagriculture:storage:2>,
    <mysticalagriculture:crafting:3>: <mysticalagriculture:storage:3>,
    <mysticalagriculture:crafting:4>: <mysticalagriculture:storage:4>,

    //ingot to blocks
    <mysticalagriculture:crafting:32>: <mysticalagriculture:ingot_storage>,
    <mysticalagriculture:crafting:33>: <mysticalagriculture:ingot_storage:1>,
    <mysticalagriculture:crafting:34>: <mysticalagriculture:ingot_storage:2>,
    <mysticalagriculture:crafting:35>: <mysticalagriculture:ingot_storage:3>,
    <mysticalagriculture:crafting:36>: <mysticalagriculture:ingot_storage:4>,
    <mysticalagriculture:crafting:37>: <mysticalagriculture:ingot_storage:5>,
    <mysticalagriculture:crafting:38>: <mysticalagriculture:ingot_storage:6>,
    //nugget to ingot
    <mysticalagriculture:crafting:39>: <mysticalagriculture:crafting:32>,
    <mysticalagriculture:crafting:40>: <mysticalagriculture:crafting:33>,
    <mysticalagriculture:crafting:41>: <mysticalagriculture:crafting:34>,
    <mysticalagriculture:crafting:42>: <mysticalagriculture:crafting:35>,
    <mysticalagriculture:crafting:43>: <mysticalagriculture:crafting:36>,
    <mysticalagriculture:crafting:44>: <mysticalagriculture:crafting:37>,
    <mysticalagriculture:crafting:45>: <mysticalagriculture:crafting:38>,
    
    //coal
    <mysticalagriculture:coal>: <mysticalagriculture:coal_block>,
    <mysticalagriculture:coal:1>: <mysticalagriculture:coal_block:1>,
    <mysticalagriculture:coal:2>: <mysticalagriculture:coal_block:2>,
    <mysticalagriculture:coal:3>: <mysticalagriculture:coal_block:3>,
    <mysticalagriculture:coal:4>: <mysticalagriculture:coal_block:4>,

    //prosperity
    <mysticalagriculture:crafting:5>: <mysticalagriculture:storage:5>
};
val toAddOther as IItemStack[IItemStack][string] = {
    "slab": {
        <mysticalagriculture:soulstone:3>: <mysticalagriculture:soulstone_brick_slab>,
        <mysticalagriculture:soulstone:1>: <mysticalagriculture:cobbled_soulstone_slab>,
        <mysticalagriculture:soulstone:2>: <mysticalagriculture:soulstone_slab>
    },
    "stair": {
        <mysticalagriculture:soulstone:3>: <mysticalagriculture:soulstone_brick_stairs>,
        <mysticalagriculture:soulstone:1>: <mysticalagriculture:cobbled_soulstone_stairs>
    },
    "wall": {
        <mysticalagriculture:soulstone:3>: <mysticalagriculture:soulstone_brick_wall>,
        <mysticalagriculture:soulstone:1>: <mysticalagriculture:cobbled_soulstone_wall>
    }
};

for item in toAdd3x3{
    recipes.addShaped("ia_ma_compress_" ~ item.name, toAdd3x3[item],
        [
            [item, item, item],
            [item, item, item],
            [item, item, item]
        ]
    );
    recipes.addShapeless("ia_ma_uncompress_" ~ item.name, item * 9,
        [
            toAdd3x3[item]
        ]
    );
}
for mat, slab in toAddOther.slab{
    recipes.addShaped("ia_ma_slab_" ~ mat.name, slab * 6,
        [[mat, mat, mat]]
    );
}
for mat, stair in toAddOther.stair{
    recipes.addShaped("ia_ma_stair_" ~ mat.name, stair * 4,
        [
            [mat, null, null],
            [mat, mat, null],
            [mat, mat, mat]
        ]
    );
}
for mat, wall in toAddOther.wall{
    recipes.addShaped("ia_ma_wall_" ~ mat.name, wall * 6,
        [
            [mat, mat, mat],
            [mat, mat, mat]
        ]
    );
}
recipes.addShaped("ia_ma_soul_glass_pane", <mysticalagriculture:soul_glass_pane> * 16,
    [
        [<mysticalagriculture:soul_glass>, <mysticalagriculture:soul_glass>, <mysticalagriculture:soul_glass>],
        [<mysticalagriculture:soul_glass>, <mysticalagriculture:soul_glass>, <mysticalagriculture:soul_glass>]
    ]
);



recipes.addShaped("ia_seed_reprocessor", <mysticalagriculture:seed_reprocessor>, [
    [<thermalfoundation:material:322>, <harvestcraft:sunflowerseedsitem>, <thermalfoundation:material:322>], 
    [<harvestcraft:roastedpumpkinseedsitem>, <extrautils2:machine>, <harvestcraft:roastedpumpkinseedsitem>], 
    [<thermalfoundation:material:322>, <harvestcraft:sunflowerseedsitem>, <thermalfoundation:material:322>]
]);