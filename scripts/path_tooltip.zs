
import crafttweaker.item.IItemStack;


for speed,paths in {
    1.5: [
        <minecraft:white_glazed_terracotta>,
        <minecraft:orange_glazed_terracotta>,
        <minecraft:magenta_glazed_terracotta>,
        <minecraft:light_blue_glazed_terracotta>,
        <minecraft:yellow_glazed_terracotta>,
        <minecraft:lime_glazed_terracotta>,
        <minecraft:pink_glazed_terracotta>,
        <minecraft:gray_glazed_terracotta>,
        <minecraft:silver_glazed_terracotta>,
        <minecraft:cyan_glazed_terracotta>,
        <minecraft:purple_glazed_terracotta>,
        <minecraft:blue_glazed_terracotta>,
        <minecraft:brown_glazed_terracotta>,
        <minecraft:green_glazed_terracotta>,
        <minecraft:red_glazed_terracotta>,
        <minecraft:black_glazed_terracotta>,
        <minecraft:hardened_clay>,
        <minecraft:stained_hardened_clay:*>,
    ],
    2.3: [
        <minecraft:obsidian>,
        <minecraft:jukebox>,
        <minecraft:gold_block>,

        <immersiveengineering:stone_decoration:4>, 
        <immersiveengineering:stone_decoration:5>, 
        <immersiveengineering:stone_decoration:7>,
        <immersivepetroleum:stone_decoration>
    ],
    2.5: [
        <minecraft:diamond_block>,

        <immersiveengineering:stone_decoration:6>
    ]
} as IItemStack[][float]{
    for path in paths{
        path.addTooltip("Speed bonus " ~ ( (speed - 1) * 100 ) as int ~ "%");
    }
}