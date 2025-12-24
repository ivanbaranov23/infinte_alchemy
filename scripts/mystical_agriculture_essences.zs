import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;

import mods.mekanism.infuser;

{//gas:explosion_stone_glue
    mods.mekanism.reaction.addRecipe(
        <contenttweaker:superglue>, <liquid:stone> * 200, <gas:ammonium_nitrate> * 200, 
        null, <gas:explosion_stone_glue> * 200, 1000, 60
    );

    mods.mekanism.reaction.addRecipe(
        <contenttweaker:superglue>, <liquid:concrete> * 200, <gas:ammonium_nitrate> * 200, 
        null, <gas:explosion_stone_glue> * 225, 1000, 60
    );

    mods.mekanism.reaction.addRecipe(
        <contenttweaker:superglue>, <liquid:sky_stone> * 200, <gas:ammonium_nitrate> * 200, 
        null, <gas:explosion_stone_glue> * 300, 1000, 60
    );
}

val essenceToItem_esg as IItemStack[IItemStack][int][ILiquidStack] = {
    <liquid:ore_make>: {
        100: {
            <mysticalagriculture:iron_essence> * 16: <minecraft:iron_ore>,
            <mysticalagriculture:copper_essence> * 16: <thermalfoundation:ore>,
            <mysticalagriculture:tin_essence> * 16: <thermalfoundation:ore:1>,

            <mysticalagriculture:aluminum_essence> * 16: <thermalfoundation:ore:4>,
            <mysticalagriculture:nickel_essence> * 16: <thermalfoundation:ore:5>,
            <mysticalagriculture:zinc_essence> * 16: <contenttweaker:zinc_ore>,

            <mysticalagriculture:coal_essence> * 8: <minecraft:coal_ore>
        },
        125: {
            <mysticalagriculture:nether_quartz_essence> * 12: <mysticalworld:quartz_ore>
        },
        150: {
            <mysticalagriculture:cobalt_essence> * 16: <netherendingores:ore_other_1:4>,
            <mysticalagriculture:ardite_essence> * 16: <netherendingores:ore_other_1:2>,
            <mysticalcreations:antimony_essence> * 16: <contenttweaker:antimony_ore>,

            <mysticalagriculture:redstone_essence> * 12: <minecraft:redstone_ore>,
            <mysticalagriculture:electrotine_essence> * 12: <contenttweaker:electrotine_ore>,
            <mysticalagriculture:glowstone_essence> * 8: <minecraft:glowstone>,

            <mysticalagriculture:certus_quartz_essence> * 8: <appliedenergistics2:quartz_ore>,

            <mysticalcreations:ovium_essence> * 16: <taiga:ovium_ore>,
            <mysticalcreations:jauxum_essence> * 16: <taiga:jauxum_ore>,
            <mysticalcreations:karmesine_essence> * 16: <taiga:karmesine_ore>
        },
        200: {
            <mysticalagriculture:gold_essence> * 16: <minecraft:gold_ore>,
            <mysticalagriculture:silver_essence> * 16: <thermalfoundation:ore:2>,
            <mysticalagriculture:osmium_essence> * 16: <mekanism:oreblock>,
            <mysticalagriculture:lead_essence> * 16: <thermalfoundation:ore:3>,

            <mysticalagriculture:lapis_lazuli_essence> * 12: <minecraft:lapis_ore>,
            <mysticalagriculture:jade_essence> * 8: <erebus:ore_jade>,
            <mysticalagriculture:black_quartz_essence> * 8: <actuallyadditions:block_misc:3>
        },
        250: {
            <mysticalagriculture:ruby_essence> * 16: <biomesoplenty:gem_ore:1>,
            <mysticalagriculture:topaz_essence> * 16: <biomesoplenty:gem_ore:3>,
            <mysticalagriculture:amber_essence> * 16: <biomesoplenty:gem_ore:7>,
            <mysticalagriculture:peridot_essence> * 16: <biomesoplenty:gem_ore:2>,
            <mysticalagriculture:malachite_essence> * 16: <biomesoplenty:gem_ore:5>,
            <mysticalagriculture:sapphire_essence> * 16: <biomesoplenty:gem_ore:6>,
            <mysticalagriculture:tanzanite_essence> * 16: <biomesoplenty:gem_ore:4>,

            <mysticalagriculture:diamond_essence> * 8: <minecraft:diamond_ore>,
            <mysticalagriculture:emerald_essence> * 8: <minecraft:emerald_ore>,

            <mysticalcreations:arkenium_essence> * 16: <netherendingores:ore_other_1:9>,
            <mysticalagriculture:dilithium_essence> * 16: <taiga:dilithium_ore>,
            <mysticalcreations:eezo_essence> * 16: <taiga:eezo_ore>,
            <mysticalcreations:osram_essence> * 16: <taiga:osram_ore>,
            <mysticalcreations:prometheum_essence> * 16: <taiga:prometheum_ore>
        },
        300: {
            
            <mysticalagriculture:aquamarine_essence> * 8: <astralsorcery:blockcustomsandore>,
            <mysticalagriculture:ender_amethyst_essence> * 8: <biomesoplenty:gem_ore>,

            <mysticalagriculture:platinum_essence> * 16: <thermalfoundation:ore:6>,
            <mysticalagriculture:iridium_essence> * 16: <thermalfoundation:ore:7>,
            <mysticalagriculture:uranium_essence> * 16: <immersiveengineering:ore:5>,
            <mysticalagriculture:yellorium_essence> * 16: <bigreactors:oreyellorite>,
            <mysticalagriculture:tungsten_essence> * 16: <contenttweaker:tungsten_ore>,
            <mysticalagriculture:titanium_essence> * 16: <contenttweaker:titanium_ore>,

            <mysticalcreations:gallium_essence> * 16: <contenttweaker:gallium_ore>,

            <mysticalagriculture:graphite_essence> * 12: <quantumflux:graphiteore>,
            <mysticalagriculture:ender_biotite_essence> * 12: <quark:biotite_ore>
        },
        400: {
            <mysticalagriculture:mithril_essence> * 16: <thermalfoundation:ore:8>,
            <mysticalagriculture:chrome_essence> * 16: <contenttweaker:chrome_ore>,
            <mysticalcreations:neodymium_essence> * 16: <contenttweaker:neodymium_ore>,
            <mysticalcreations:palladium_essence> * 16: <taiga:palladium_ore>,
            <mysticalcreations:uru_essence> * 16: <taiga:uru_ore>
        },
        450: {
            <mysticalagriculture:draconium_essence> * 16: <draconicevolution:draconium_ore>
        }
    },
    <liquid:rune_acid>: {
        50: {
            <mysticalagriculture:terrasteel_essence> * 16: <contenttweaker:terrasteel_ore>
        }
    }
};
for fluid in essenceToItem_esg{
    for cost, items in essenceToItem_esg[fluid]{
        for essence, ore in items{
            mods.mekanism.reaction.addRecipe(
                essence, fluid * cost, <gas:explosion_stone_glue> * cost, 
                ore, <gas:waste_gas> * (cost / 5), 1000, 60
            );
            {
                var rec = RecipeBuilder.newBuilder("making_" ~ ore.name, "essence_burner", 20 * 1);

                rec.addEnergyPerTickInput(256000);

                rec.addItemInput(essence * (essence.amount * 16));
                rec.addGasInput(<gas:explosion_stone_glue> * (cost * 4));
                rec.addFluidInput(fluid * (cost * 4));
                rec.addFluidInput(<liquid:leap> * cost);

                //rec.addFluidOutput(<liquid:essence_slurp> * 5000);
                rec.addItemOutput(ore * 64);

                rec.build();
            }
        }
    }
}




function addEssenceRec_1(essence as IItemStack, outp as IItemStack, add_matter as IItemStack = null){
    recipes.addShapeless("addEssenceRec_1" ~ essence.name ~ outp.name, outp, [essence]);
    if (add_matter){
        recipes.addShapeless("addEssenceRec_1_matter" ~ essence.name, outp * (outp.amount * 2), [essence, add_matter]);
    }
}
function addEssenceRec_o(essence as IItemStack, outp as IItemStack, add_matter as IItemStack = null){
    recipes.addShaped("addEssenceRec_o" ~ essence.name ~ outp.name ~ outp.amount, outp, [
        [essence, essence, essence],
        [essence, add_matter, essence],
        [essence, essence, essence]
    ]);
}
function addEssenceRec_plus(essence as IItemStack, outp as IItemStack, add_matter as IItemStack = null){
    recipes.addShaped("addEssenceRec_plus" ~ essence.name ~ outp.name ~ outp.amount, outp, [
        [null, essence, null],
        [essence, add_matter, essence],
        [null, essence, null]
    ]);
}

//addEssenceRec_1(<mysticalagriculture:stone_essence>, <minecraft:stone> * 4);

{//1
    //stone
    infuser.addRecipe("FUNGI", 5, <mysticalagriculture:stone_essence>, <minecraft:stone> * 4);
    
    mods.thermalexpansion.Crucible.addRecipe(<liquid:concrete> * 150, <mysticalagriculture:stone_essence>, 2000);
    //dirt
    infuser.addRecipe("FUNGI", 5, <mysticalagriculture:dirt_essence>, <minecraft:dirt> * 4);
    addEssenceRec_plus(<mysticalagriculture:dirt_essence>, <minecraft:grass> * 6, <deepmoblearning:living_matter_overworldian>);
    addEssenceRec_plus(<mysticalagriculture:dirt_essence>, <atum:coin_dirty> * 4, <thermalfoundation:material:1>);
    addEssenceRec_plus(<mysticalagriculture:dirt_essence>, <twilightforest:uberous_soil> * 4, <deepmoblearning:living_matter_twilight>);
    addEssenceRec_1(<mysticalagriculture:dirt_essence>, <atum:fertile_soil_pile> * 3, <deepmoblearning:living_matter_atum>);

    addEssenceRec_plus(<mysticalagriculture:dirt_essence>, <biomesoplenty:dirt> * 12, <biomesoplenty:dirt>);
    addEssenceRec_plus(<mysticalagriculture:dirt_essence>, <biomesoplenty:dirt:1> * 12, <biomesoplenty:dirt:1>);
    addEssenceRec_plus(<mysticalagriculture:dirt_essence>, <biomesoplenty:dirt:2> * 12, <biomesoplenty:dirt:2>);
    addEssenceRec_plus(<mysticalagriculture:dirt_essence>, <minecraft:dirt:1> * 12, <minecraft:dirt:1>);
    addEssenceRec_plus(<mysticalagriculture:dirt_essence>, <tconstruct:slime_dirt> * 6, <minecraft:slime_ball>);
    addEssenceRec_plus(<mysticalagriculture:dirt_essence>, <tconstruct:slime_dirt:1> * 6, <tconstruct:edible:1>);
    addEssenceRec_plus(<mysticalagriculture:dirt_essence>, <tconstruct:slime_dirt:2> * 6, <tconstruct:edible:2>);
    addEssenceRec_plus(<mysticalagriculture:dirt_essence>, <tconstruct:slime_dirt:3> * 6, <tconstruct:edible:4>);

    mods.thermalexpansion.Crucible.addRecipe(<liquid:dirt> * 500, <mysticalagriculture:dirt_essence>, 2000);
    //

    //water
    addEssenceRec_1(<mysticalagriculture:water_essence>, <harvestcraft:freshwateritem> * 4);
    recipes.addShapeless("ia_water_bucket", <minecraft:water_bucket>, [<minecraft:bucket>, <mysticalagriculture:water_essence>]);
    recipes.addShapeless("ia_water_bucket_pure", <forge:bucketfilled>.withTag({FluidName: "pure_water", Amount: 1000}), [
        <minecraft:bucket>, <mysticalagriculture:water_essence>, <mysticalagriculture:water_essence>
    ]);
    recipes.addShapeless("ia_water_bucket_sea", <forge:bucketfilled>.withTag({FluidName: "sea_water", Amount: 1000}), [
        <minecraft:bucket>, <mysticalagriculture:water_essence>, <mekanism:salt> | <alchemistry:mineral_salt>
    ]);
    recipes.addShapeless("ia_water_bucket_seaweed", <forge:bucketfilled>.withTag({FluidName: "seaweed_rich_water", Amount: 1000}), [
        <minecraft:bucket>, <mysticalagriculture:water_essence>, <harvestcraft:seaweeditem>
    ]);

    //menril
    mods.thermalexpansion.Crucible.addRecipe(<liquid:menrilresin> * 500, <mysticalagriculture:menril_essence>, 2000);
}
{//2
    infuser.addRecipe("FUNGI", 10, <mysticalagriculture:silicon_essence>, <appliedenergistics2:material:5> * 2);
    addEssenceRec_plus(<mysticalagriculture:silicon_essence>, <atum:khnumite> * 4, <deepmoblearning:living_matter_atum>);
    
}

