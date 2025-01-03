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
add2x2Recipe(<contenttweaker:kaolin_clay>, <contenttweaker:kaolin_clay_block>);


//industrial clay
recipes.addShapeless("ai_industrail_clay", 
    <contenttweaker:industrial_clay>, 
    [<contenttweaker:fireclay>, <contenttweaker:fireclay>, <prodigytech:inferno_crystal>, <ore:dustConstantan>, <exnihilocreatio:item_material:1>]
);

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


add2x2Recipe(<contenttweaker:manaclay>, <contenttweaker:manaclay_block>);
add2x2Recipe(<contenttweaker:manabrick>, <contenttweaker:manabrick_block>);

mods.thermalexpansion.Crucible.addRecipe(
    <liquid:claymud> * 250,
    <contenttweaker:kaolin_clay>, 2000
);