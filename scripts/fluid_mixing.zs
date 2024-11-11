#loader crafttweaker reloadable
import mods.fluidintetweaker.FITweaker;

FITweaker.addRecipe(<liquid:blueslime>, false, <liquid:creosote>, <quark:jasper>.asBlock());
FITweaker.addRecipe(<liquid:creosote>, false, <liquid:blueslime>, <quark:jasper>.asBlock());


FITweaker.addRecipe(<liquid:blueslime>, false, <liquid:andesite>, <minecraft:stone:5>.asBlock());
FITweaker.addRecipe(<liquid:andesite>, false, <liquid:blueslime>, <minecraft:stone:5>.asBlock());

FITweaker.addRecipe(<liquid:blueslime>, false, <liquid:lava>, <contenttweaker:burned_slimedirt>.asBlock());
FITweaker.addRecipe(<liquid:lava>, false, <liquid:blueslime>, <contenttweaker:burned_slimedirt>.asBlock());

FITweaker.addRecipe(<liquid:organic_green>, false, <liquid:andesite>, <minecraft:mossy_cobblestone>.asBlock());
FITweaker.addRecipe(<liquid:andesite>, false, <liquid:organic_green>, <minecraft:mossy_cobblestone>.asBlock());

FITweaker.addRecipe(<liquid:ash_solution>, false, <liquid:andesite>, <quark:limestone>.asBlock());
FITweaker.addRecipe(<liquid:andesite>, false, <liquid:ash_solution>, <quark:limestone>.asBlock());
