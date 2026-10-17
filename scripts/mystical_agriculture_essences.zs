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
            <mysticalagriculture:antimony_essence> * 16: <contenttweaker:antimony_ore>,

            <mysticalagriculture:redstone_essence> * 12: <minecraft:redstone_ore>,
            <mysticalagriculture:electrotine_essence> * 12: <contenttweaker:electrotine_ore>,
            <mysticalagriculture:glowstone_essence> * 8: <minecraft:glowstone>,

            <mysticalagriculture:certus_quartz_essence> * 8: <appliedenergistics2:quartz_ore>,

            <mysticalagriculture:ovium_essence> * 16: <taiga:ovium_ore>,
            <mysticalagriculture:jauxum_essence> * 16: <taiga:jauxum_ore>,
            <mysticalagriculture:karmesine_essence> * 16: <taiga:karmesine_ore>
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

            <mysticalagriculture:arkenium_essence> * 16: <netherendingores:ore_other_1:9>,
            <mysticalagriculture:dilithium_essence> * 16: <taiga:dilithium_ore>,
            <mysticalagriculture:eezo_essence> * 16: <taiga:eezo_ore>,
            <mysticalagriculture:osram_essence> * 16: <taiga:osram_ore>,
            <mysticalagriculture:prometheum_essence> * 16: <taiga:prometheum_ore>
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

            <mysticalagriculture:gallium_essence> * 16: <contenttweaker:gallium_ore>,

            <mysticalagriculture:graphite_essence> * 12: <quantumflux:graphiteore>,
            <mysticalagriculture:ender_biotite_essence> * 12: <quark:biotite_ore>,

            <mysticalagriculture:meteorite_essence> * 16: <taiga:meteoritecobble_block>
        },
        400: {
            <mysticalagriculture:mithril_essence> * 16: <thermalfoundation:ore:8>,
            <mysticalagriculture:chrome_essence> * 16: <contenttweaker:chrome_ore>,
            <mysticalagriculture:neodymium_essence> * 16: <contenttweaker:neodymium_ore>,
            <mysticalagriculture:palladium_essence> * 16: <taiga:palladium_ore>,
            <mysticalagriculture:uru_essence> * 16: <taiga:uru_ore>
        },
        450: {
            <mysticalagriculture:draconium_essence> * 16: <draconicevolution:draconium_ore>
        }
    },
    <liquid:cryotheum>: {
        200: {
            <mysticalagriculture:ice_essence> * 16: <aether_legacy:icestone>
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
            {
                var rec = RecipeBuilder.newBuilder("making2_" ~ ore.name, "essence_burner", 1 * 1);

                rec.addEnergyPerTickInput(256000 * 1000);

                rec.addItemInput(essence * (essence.amount * 16));
                rec.addGasInput(<gas:explosion_stone_glue> * (cost * 16));
                rec.addFluidInput(fluid * (cost * 16));
                rec.addFluidInput(<liquid:leap2> * cost);

                //rec.addFluidOutput(<liquid:essence_slurp> * 5000);
                rec.addItemOutput(ore * 256);

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
    recipes.addShapeless("ia_water_bucket_heavy", <forge:bucketfilled>.withTag({FluidName: "heavywater", Amount: 1000}), [
        <minecraft:bucket>, <mysticalagriculture:water_essence>, <mysticalagriculture:water_essence>, <mysticalagriculture:water_essence>
    ]);
    recipes.addShapeless("ia_water_bucket_sea", <forge:bucketfilled>.withTag({FluidName: "sea_water", Amount: 1000}), [
        <minecraft:bucket>, <mysticalagriculture:water_essence>, <mekanism:salt> | <alchemistry:mineral_salt>
    ]);
    recipes.addShapeless("ia_water_bucket_seaweed", <forge:bucketfilled>.withTag({FluidName: "seaweed_rich_water", Amount: 1000}), [
        <minecraft:bucket>, <mysticalagriculture:water_essence>, <harvestcraft:seaweeditem>
    ]);
    //ice
    addEssenceRec_1(<mysticalagriculture:ice_essence>, <minecraft:ice> * 4);
    recipes.addShapeless("ia_cold_bucket", <forge:bucketfilled>.withTag({FluidName: "cold_nitrogen", Amount: 1000}), [
        <minecraft:bucket>, <mysticalagriculture:ice_essence>, <mysticalagriculture:ice_essence>, <liquid:nitrogen> * 1000
    ]);
    //lava
    recipes.addShapeless("ia_lava_bucket", <minecraft:lava_bucket>, [<minecraft:bucket>, <mysticalagriculture:fire_essence>, <mysticalagriculture:fire_essence>]);
    recipes.addShapeless("ia_lava_residue_bucket", <forge:bucketfilled>.withTag({FluidName: "lava_residue", Amount: 1000}), [
        <minecraft:bucket>, <mysticalagriculture:fire_essence>, <mysticalagriculture:fire_essence>, <mysticalagriculture:stone_essence>
    ]);
    recipes.addShapeless("ia_steam_bucket", <forge:bucketfilled>.withTag({FluidName: "steam", Amount: 1000}), [
        <minecraft:bucket>, <mysticalagriculture:fire_essence>, <mysticalagriculture:water_essence>
    ]);

    {//dye
        recipes.addShaped("dye0", <industrialforegoing:artificial_dye> * 4, [
            [<mysticalagriculture:dye_essence>, <mysticalagriculture:dye_essence>, null],
            [null, null, null],
            [null, null, null]
        ]);
        recipes.addShaped("dye1", <industrialforegoing:artificial_dye:1> * 4, [
            [<mysticalagriculture:dye_essence>, null, <mysticalagriculture:dye_essence>],
            [null, null, null],
            [null, null, null]
        ]);
        recipes.addShaped("dye2", <industrialforegoing:artificial_dye:2> * 4, [
            [<mysticalagriculture:dye_essence>, null, null],
            [<mysticalagriculture:dye_essence>, null, null],
            [null, null, null]
        ]);
        recipes.addShaped("dye3", <industrialforegoing:artificial_dye:3> * 4, [
            [<mysticalagriculture:dye_essence>, null, null],
            [null, <mysticalagriculture:dye_essence>, null],
            [null, null, null]
        ]);
        recipes.addShaped("dye4", <industrialforegoing:artificial_dye:4> * 4, [
            [<mysticalagriculture:dye_essence>, null, null],
            [null, null, <mysticalagriculture:dye_essence>],
            [null, null, null]
        ]);
        recipes.addShaped("dye5", <industrialforegoing:artificial_dye:5> * 4, [
            [<mysticalagriculture:dye_essence>, null, null],
            [null, null, null],
            [<mysticalagriculture:dye_essence>, null, null]
        ]);
        recipes.addShaped("dye6", <industrialforegoing:artificial_dye:6> * 4, [
            [<mysticalagriculture:dye_essence>, null, null],
            [null, null, null],
            [null, <mysticalagriculture:dye_essence>, null]
        ]);
        recipes.addShaped("dye7", <industrialforegoing:artificial_dye:7> * 4, [
            [<mysticalagriculture:dye_essence>, null, null],
            [null, null, null],
            [null, null, <mysticalagriculture:dye_essence>]
        ]);
        recipes.addShaped("dye8", <industrialforegoing:artificial_dye:8> * 4, [
            [null, <mysticalagriculture:dye_essence>, <mysticalagriculture:dye_essence>],
            [null, null, null],
            [null, null, null]
        ]);
        recipes.addShaped("dye9", <industrialforegoing:artificial_dye:9> * 4, [
            [null, <mysticalagriculture:dye_essence>, null],
            [<mysticalagriculture:dye_essence>, null, null],
            [null, null, null]
        ]);
        recipes.addShaped("dye10", <industrialforegoing:artificial_dye:10> * 4, [
            [null, <mysticalagriculture:dye_essence>, null],
            [null, <mysticalagriculture:dye_essence>, null],
            [null, null, null]
        ]);
        recipes.addShaped("dye11", <industrialforegoing:artificial_dye:11> * 4, [
            [null, <mysticalagriculture:dye_essence>, null],
            [null, null, <mysticalagriculture:dye_essence>],
            [null, null, null]
        ]);
        recipes.addShaped("dye12", <industrialforegoing:artificial_dye:12> * 4, [
            [null, <mysticalagriculture:dye_essence>, null],
            [null, null, null],
            [<mysticalagriculture:dye_essence>, null, null]
        ]);
        recipes.addShaped("dye13", <industrialforegoing:artificial_dye:13> * 4, [
            [null, <mysticalagriculture:dye_essence>, null],
            [null, null, null],
            [null, <mysticalagriculture:dye_essence>, null]
        ]);
        recipes.addShaped("dye14", <industrialforegoing:artificial_dye:14> * 4, [
            [null, <mysticalagriculture:dye_essence>, null],
            [null, null, null],
            [null, null, <mysticalagriculture:dye_essence>]
        ]);
        recipes.addShaped("dye15", <industrialforegoing:artificial_dye:15> * 4, [
            [null, null, <mysticalagriculture:dye_essence>],
            [<mysticalagriculture:dye_essence>, null, null],
            [null, null, null]
        ]);
    }

    //menril
    mods.thermalexpansion.Crucible.addRecipe(<liquid:menrilresin> * 500, <mysticalagriculture:menril_essence>, 2000);

    //limestone
    infuser.addRecipe("FUNGI", 5, <mysticalagriculture:limestone_essence>, <quark:limestone> * 4);
    addEssenceRec_plus(<mysticalagriculture:limestone_essence>, <atum:sand> * 24, <deepmoblearning:living_matter_atum>);
    //sky stone
    infuser.addRecipe("FUNGI", 5, <mysticalagriculture:sky_stone_essence>, <appliedenergistics2:material:45> * 6);
    addEssenceRec_plus(<mysticalagriculture:sky_stone_essence>, <appliedenergistics2:sky_stone_block> * 16, <deepmoblearning:living_matter_overworldian>);

    //basalt
    infuser.addRecipe("FUNGI", 5, <mysticalagriculture:basalt_essence>, <chisel:basalt2:7> * 4);
    addEssenceRec_1(<mysticalagriculture:basalt_essence>, <contenttweaker:basalt_dust> * 2);
    
    //fertilizer
    infuser.addRecipe("FUNGI", 5, <mysticalagriculture:fertilizer_essence>, <industrialforegoing:fertilizer> * 4);
    mods.tconstruct.Melting.addRecipe(<liquid:sewage> * 250, <mysticalagriculture:fertilizer_essence>);
    mods.thermalexpansion.Crucible.addRecipe(<liquid:sewage> * 500, <mysticalagriculture:fertilizer_essence>, 2000);
}
{//2
    //niter
    infuser.addRecipe("FUNGI", 5, <mysticalagriculture:saltpeter_essence>, <thermalfoundation:material:772> * 4);
    //silicon
    infuser.addRecipe("FUNGI", 10, <mysticalagriculture:silicon_essence>, <appliedenergistics2:material:5> * 4);
    addEssenceRec_plus(<mysticalagriculture:silicon_essence>, <atum:khnumite> * 8, <deepmoblearning:living_matter_atum>);
    
}
{//3

    //osmium
    mods.mekanism.chemical.oxidizer.addRecipe(<mysticalagriculture:osmium_essence>, <gas:liquidosmium> * 50);
}
