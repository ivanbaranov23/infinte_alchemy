import mods.modularmachinery.RecipeBuilder;

import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;

function addBarrelRecipe(out as IItemStack, cat as IItemStack, iin as WeightedItemStack[], fin as ILiquidStack, time_tick as int, energy as int){
    var rec = RecipeBuilder.newBuilder(out.name, "deepslate_barrel", time_tick);
    if (energy != 0) {rec.addEnergyPerTickInput(energy);}

    rec.addItemOutput(out);
    
    if (cat){
        rec.addItemInput(cat);
        rec.setChance(0.0);
    }

    for i in iin{
        rec.addItemInput(i.stack);
		rec.setChance(i.chance);
    }
    if (fin){
        rec.addFluidInput(fin);
    }
    rec.build();
}


addBarrelRecipe(<quark:marble> * 16, <quark:marble>, [<prodigytech:ash>], <liquid:andesite> * 250, 10, 0);
addBarrelRecipe(<quark:limestone> * 16, <quark:limestone>, [<prodigytech:ash>], <liquid:andesite> * 250, 10, 0);
addBarrelRecipe(<quark:jasper> * 16, null, [<minecraft:hardened_clay>], <liquid:clay> * 144, 10, 0);
addBarrelRecipe(<quark:slate> * 16, <quark:slate>, [<prodigytech:ash>], <liquid:andesite> * 250, 10, 0);

addBarrelRecipe(<quark:biome_cobblestone> * 16, null, [<tconstruct:seared:1>, <thermalfoundation:material:771>], <liquid:andesite> * 250, 10, 0);
addBarrelRecipe(<quark:biome_cobblestone:1> * 16, null, [<tconstruct:seared:1>, <mod_lavacow:shattered_ice>], <liquid:andesite> * 250, 10, 0);

addBarrelRecipe(<minecraft:purpur_block> * 16, null, [<minecraft:chorus_fruit_popped> * 4], <liquid:andesite> * 250, 10, 0);

addBarrelRecipe(<quark:elder_prismarine> * 16, <quark:elder_prismarine>, [<contenttweaker:prismatic_clay>], null, 10, 0);


for ore,sing in {
    <minecraft:gold_ore>: <extendedcrafting:singularity:5>,
    <minecraft:iron_ore>: <extendedcrafting:singularity:1>,
    <minecraft:coal_ore>: <extendedcrafting:singularity>,
    <minecraft:lapis_ore>: <extendedcrafting:singularity:2>,
    <minecraft:diamond_ore>: <extendedcrafting:singularity:6>,
    <minecraft:redstone_ore>: <extendedcrafting:singularity:3>,
    <minecraft:emerald_ore>: <extendedcrafting:singularity:7>,
    <mysticalworld:quartz_ore>: <extendedcrafting:singularity_custom:25>,
    <appliedenergistics2:quartz_ore>: <extendedcrafting:singularity_custom:26>,
    <actuallyadditions:block_misc:3>: <extendedcrafting:singularity_custom:27>,
    <astralsorcery:blockcustomsandore>: <extendedcrafting:singularity_custom:55>,
    <betternether:cincinnasite_ore>: <extendedcrafting:singularity_custom:7>,
    <contenttweaker:zinc_ore>: <extendedcrafting:singularity:20>,
    <contenttweaker:electrotine_ore>: <extendedcrafting:singularity_custom:28>,
    <contenttweaker:titanium_ore>: <extendedcrafting:singularity:31>,
    <contenttweaker:tungsten_ore>: <extendedcrafting:singularity:30>,
    <draconicevolution:draconium_ore>: <extendedcrafting:singularity_custom:31>,
    <netherendingores:ore_other_1:4>: <extendedcrafting:singularity:65>,
    <netherendingores:ore_other_1:2>: <extendedcrafting:singularity:64>,
    <mysticalworld:amethyst_ore>: <extendedcrafting:singularity_custom:37>,
    <contenttweaker:bismuth_ore>: <extendedcrafting:singularity_custom:106>,
    <contenttweaker:rhodium_ore>: <extendedcrafting:singularity_custom:103>,
    <moretcon:oreerythynite>: <extendedcrafting:singularity_custom:81>,
    <moretcon:oreetherstone>: <extendedcrafting:singularity_custom:82>,
    <moretcon:oreelectarite>: <extendedcrafting:singularity_custom:83>,
    <bigreactors:oreyellorite>: <extendedcrafting:singularity_custom:17>,
    <immersiveengineering:ore:5>: <extendedcrafting:singularity:32>,
    <mekanism:oreblock>: <extendedcrafting:singularity_custom:5>,
    <moretcon:orevoidspar>: <extendedcrafting:singularity_custom:77>,
    <moretcon:oreenderal>: <extendedcrafting:singularity_custom:78>,
    <moretcon:oregarstone>: <extendedcrafting:singularity_custom:76>,
    <moretcon:oregravitonium>: <extendedcrafting:singularity_custom:99>,
    <moretcon:orebloodstone>: <extendedcrafting:singularity_custom:79>,
    <moretcon:oreechostone>: <extendedcrafting:singularity_custom:80>,
    <contenttweaker:gallium_ore>: <extendedcrafting:singularity_custom:63>,
    <contenttweaker:chrome_ore>: <extendedcrafting:singularity:33>,
    <contenttweaker:neodymium_ore>: <contenttweaker:neodymium_singularity>,
    <contenttweaker:caelumite_ore>: <extendedcrafting:singularity_custom:98>,
    <quark:biotite_ore>: <extendedcrafting:singularity_custom:29>,
    <thermalfoundation:ore>: <extendedcrafting:singularity:17>,
    <thermalfoundation:ore:1>: <extendedcrafting:singularity:18>,
    <thermalfoundation:ore:2>: <extendedcrafting:singularity:22>,
    <thermalfoundation:ore:3>: <extendedcrafting:singularity:23>,
    <thermalfoundation:ore:4>: <extendedcrafting:singularity:16>,
    <thermalfoundation:ore:5>: <extendedcrafting:singularity:25>,
    <thermalfoundation:ore:6>: <extendedcrafting:singularity:34>,
    <thermalfoundation:ore:7>: <extendedcrafting:singularity:35>,
    <thermalfoundation:ore:8>: <extendedcrafting:singularity:29>,
    <taiga:karmesine_ore>: <extendedcrafting:singularity_custom:84>,
    <taiga:ovium_ore>: <extendedcrafting:singularity_custom:85>,
    <taiga:jauxum_ore>: <extendedcrafting:singularity_custom:86>,
    <taiga:palladium_ore>: <extendedcrafting:singularity_custom:30>,
    <taiga:eezo_ore>: <extendedcrafting:singularity_custom:34>,
    <atum:relic_ore>: <extendedcrafting:singularity_custom:32>,
    <netherendingores:ore_other_1:6>: <extendedcrafting:singularity_custom:36>,

    <contenttweaker:germanium_ore>: <extendedcrafting:singularity_custom:102>,
    <contenttweaker:arsenic_ore>: <extendedcrafting:singularity_custom:111>,
    <contenttweaker:molybdenum_ore>: <extendedcrafting:singularity_custom:74>,
    <contenttweaker:tantalite_ore>: <extendedcrafting:singularity_custom:75>
} as IItemStack[IItemStack] {
    var rec = RecipeBuilder.newBuilder(sing.name ~ "_" ~ ore.name, "deepslate_barrel", 20 * 5);
    rec.addEnergyPerTickInput(10 * 1000);

    rec.addItemOutput(ore * 64);
    rec.addItemOutput(<contenttweaker:singularity_dust>);
    rec.setChance(0.5);
    
    rec.addItemInput(sing);
	rec.addInput(<contenttweaker:burn_powder> * 4);
	rec.addInput(<contenttweaker:research_ores>);
	rec.setChance(0.0);
	rec.addInput(<gas:explosion_stone_glue> * 1000);
    
    rec.build();
}