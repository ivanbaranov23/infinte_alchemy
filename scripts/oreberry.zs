import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import mod.mekanism.gas.IGasStack;


for bush,berry in {
    <oreberries:karmesine_oreberry_bush>: <oreberries:karmesine_oreberry>,
    <oreberries:ovium_oreberry_bush>: <oreberries:ovium_oreberry>,
    <oreberries:jauxum_oreberry_bush>: <oreberries:jauxum_oreberry>,

    <oreberries:akai_oreberry_bush>: <oreberries:akai_oreberry>,
    <oreberries:kii_oreberry_bush>: <oreberries:kii_oreberry>,
    <oreberries:midori_oreberry_bush>: <oreberries:midori_oreberry>,
    <oreberries:aoi_oreberry_bush>: <oreberries:aoi_oreberry>,
    <oreberries:kuroi_oreberry_bush>: <oreberries:kuroi_oreberry>,
    <oreberries:shiroi_oreberry_bush>: <oreberries:shiroi_oreberry>,
    
    <oreberries:mercury_oreberry_bush>: <oreberries:mercury_oreberry>
} as IItemStack[IItemStack] {
    scripts.jei.addJEIhint(
        [bush], [],
        [],
        [berry]
    );
}


recipes.addShapeless("ia_karmesine_bush", <oreberries:karmesine_oreberry_bush>, [
    <ore:berryBush>, <taiga:karmesine_block>, <contenttweaker:research_oreberry>.reuse()
]);
mods.thermalexpansion.InductionSmelter.addRecipe(<taiga:karmesine_nugget> * 3, <oreberries:karmesine_oreberry>, <minecraft:sand>, 500);
mods.thermalexpansion.Crucible.addRecipe(<liquid:karmesine_fluid> * 48, <oreberries:karmesine_oreberry>, 400);
furnace.addRecipe(<taiga:karmesine_ingot> * 2, <oreberries:karmesine_oreberry_bush>);


recipes.addShapeless("ia_ovium_bush", <oreberries:ovium_oreberry_bush>, [
    <ore:berryBush>, <taiga:ovium_block>, <contenttweaker:research_oreberry>.reuse()
]);
mods.thermalexpansion.InductionSmelter.addRecipe(<taiga:ovium_nugget> * 3, <oreberries:ovium_oreberry>, <minecraft:sand>, 500);
mods.thermalexpansion.Crucible.addRecipe(<liquid:ovium_fluid> * 48, <oreberries:ovium_oreberry>, 400);
furnace.addRecipe(<taiga:ovium_ingot> * 2, <oreberries:ovium_oreberry_bush>);


recipes.addShapeless("ia_jauxum_bush", <oreberries:jauxum_oreberry_bush>, [
    <ore:berryBush>, <taiga:jauxum_block>, <contenttweaker:research_oreberry>.reuse()
]);
mods.thermalexpansion.InductionSmelter.addRecipe(<taiga:jauxum_nugget> * 3, <oreberries:jauxum_oreberry>, <minecraft:sand>, 500);
mods.thermalexpansion.Crucible.addRecipe(<liquid:jauxum_fluid> * 48, <oreberries:jauxum_oreberry>, 400);
furnace.addRecipe(<taiga:jauxum_ingot> * 2, <oreberries:jauxum_oreberry_bush>);



for liq, ansddifn in {
    <liquid:stone> * 576: {
        <oreberries:iron_oreberry> * 2:     <exnihilocreatio:item_ore_iron>,
        <oreberries:copper_oreberry> * 2:   <exnihilocreatio:item_ore_copper>,
        <oreberries:tin_oreberry> * 2:      <exnihilocreatio:item_ore_tin>,
        <oreberries:aluminum_oreberry> * 2: <exnihilocreatio:item_ore_aluminum>,
        <oreberries:nickel_oreberry> * 2:   <exnihilocreatio:item_ore_nickel>,
        <oreberries:zinc_oreberry> * 2:     <exnihilocreatio:item_ore_zinc>,

        <oreberries:cobalt_oreberry> * 2:   <exnihilocreatio:item_ore_cobalt>,
        <oreberries:ardite_oreberry> * 2:   <exnihilocreatio:item_ore_ardite>,
        <oreberries:antimony_oreberry> * 2: <contenttweaker:antimony_pieces>
    },
    <liquid:concrete> * 500: {
        <oreberries:gold_oreberry> * 2:     <exnihilocreatio:item_ore_gold>,
        <oreberries:silver_oreberry> * 2:   <exnihilocreatio:item_ore_silver>,
        <oreberries:osmium_oreberry> * 2:   <exnihilocreatio:item_ore_osmium>,
        <oreberries:lead_oreberry> * 2:     <exnihilocreatio:item_ore_lead>,
    }
} as IItemStack[IItemStack][ILiquidStack] {
    for berry,piece in ansddifn{
        mods.thermalexpansion.Transposer.addFillRecipe(
            piece,
            berry, liq,
            2000
        );
    }
}


mods.thermalexpansion.Crucible.addRecipe(<liquid:mercury> * 16, <oreberries:mercury_oreberry>, 1000);


mods.mekanism.reaction.addRecipe(
    <thermalfoundation:material:1025>, <liquid:tartaric_acid> * 1000, <gas:carmin> * 1000, 
    null, <gas:carmin_tartrate> * 1000, 900, 60
);
for berry,cfvgbh in {
    <oreberries:akai_oreberry>: {
        <liquid:ardite> * 144:          <gas:cleanArdite> * 1000,
        <liquid:chrome> * 144:          <gas:cleanChrome> * 1000,
        <liquid:valyrium_fluid> * 144:  <gas:cleanValyrium> * 1000,
        <liquid:aurorium_fluid> * 144:  <gas:cleanAurorium> * 1000,
        <liquid:karmesine_fluid> * 144: <gas:cleanKarmesine> * 1000,
        <liquid:neodymium> * 144:       <gas:cleanNeodymium> * 1000,
        <liquid:iron> * 144:            <gas:cleanIron> * 1000,
    },
    <oreberries:kii_oreberry>: {
        <liquid:gold> * 144:            <gas:cleanGold> * 1000,
        <liquid:palladium_fluid> * 144: <gas:cleanPalladium> * 1000,
        <liquid:copper> * 144:          <gas:cleanCopper> * 1000,
        <liquid:nickel> * 144:          <gas:cleanNickel> * 1000,
        <liquid:osram_fluid> * 144:     <gas:cleanOsram> * 1000,
        
        <liquid:yellorium> * 144:       <gas:cleanYellorium> * 1000,
    },
    <oreberries:midori_oreberry>: {
        <liquid:uranium> * 144:         <gas:cleanUranium> * 1000,
        <liquid:titanium> * 144:        <gas:cleanTitanium> * 1000,
        <liquid:tiberium_fluid> * 144:  <gas:cleanTiberium> * 1000,
        <liquid:jauxum_fluid> * 144:    <gas:cleanJauxum> * 1000,
    },
    <oreberries:aoi_oreberry>: {
        <liquid:zinc> * 144:            <gas:cleanZinc> * 1000,
        <liquid:tin> * 144:             <gas:cleanTin> * 1000,
        <liquid:lead> * 144:            <gas:cleanLead> * 1000,
        <liquid:platinum> * 144:        <gas:cleanPlatinum> * 1000,
        <liquid:cobalt> * 144:          <gas:cleanCobalt> * 1000,
        <liquid:duranite_fluid> * 144:  <gas:cleanDuranite> * 1000,
        <liquid:mithril> * 144:         <gas:cleanMithril> * 1000,
        <liquid:ovium_fluid> * 144:     <gas:cleanOvium> * 1000,
        <liquid:abyssum_fluid> * 144:   <gas:cleanAbyssum> * 1000,
    },
    <oreberries:kuroi_oreberry>: {
        <liquid:arkenium> * 144:        <gas:cleanArkenium> * 1000,
        <liquid:starmetal> * 144:       <gas:cleanastral_starmetal> * 1000,
        <liquid:draconium> * 144:       <gas:cleanDraconium> * 1000,
        <liquid:tungsten> * 144:        <gas:cleanTungsten> * 1000,
        <liquid:eezo_fluid> * 144:      <gas:cleanEezo> * 1000,
        <liquid:prometheum_fluid> * 144:<gas:cleanPrometheum> * 1000,
    },
    <oreberries:shiroi_oreberry>: {
        <liquid:gallium> * 144:         <gas:cleanGallium> * 1000,
        <liquid:osmium> * 144:          <gas:cleanOsmium> * 1000,
        <liquid:silver> * 144:          <gas:cleanSilver> * 1000,
        <liquid:iridium> * 144:         <gas:cleanIridium> * 1000,
        <liquid:aluminum> * 144:        <gas:cleanAluminum> * 1000,
        <liquid:uru_fluid> * 144:       <gas:cleanUru> * 1000,
        <liquid:vibranium_fluid> * 144: <gas:cleanVibranium> * 1000,
        <liquid:vanadium> * 144:        <gas:cleanVanadium> * 1000,
    }
} as IGasStack[ILiquidStack][IItemStack]{
    for fluid,gas in cfvgbh{
        mods.mekanism.reaction.addRecipe(
            berry, fluid, <gas:carmin_tartrate> * 100, 
            null, gas, 900, 60
        );
    }
}


//research
recipes.addShapeless("ia_mercury_bush", <oreberries:mercury_oreberry_bush>, [
    <ore:berryBush>, <liquid:mercury> * 1000, <contenttweaker:research_oreberry>.reuse()
]);

scripts.helper.addPlantStationRecipe(
    <contenttweaker:research_oreberry>,
    [<oreberries:akai_oreberry_bush>],
    [
        <contenttweaker:soapart> * 4,
        <thermalfoundation:material:1024> * 64,
        <contenttweaker:plant_sample> * 16,
        <oreberries:antimony_oreberry_bush>
    ],
    <liquid:karmesine_fluid> * (144 * 16),
    15
);
scripts.helper.addPlantStationRecipe(
    <contenttweaker:research_oreberry>,
    [<oreberries:kii_oreberry_bush>],
    [
        <contenttweaker:soapart> * 4,
        <thermalfoundation:material:1026> * 64,
        <contenttweaker:plant_sample> * 16,
        <oreberries:gold_oreberry_bush>
    ],
    <liquid:yellorium> * (144 * 16),
    15
);
scripts.helper.addPlantStationRecipe(
    <contenttweaker:research_oreberry>,
    [<oreberries:midori_oreberry_bush>],
    [
        <contenttweaker:soapart> * 4,
        <thermalfoundation:material:1027> * 64,
        <contenttweaker:plant_sample> * 16,
        <oreberries:jauxum_oreberry_bush>
    ],
    <liquid:titanium> * (144 * 16),
    15
);
scripts.helper.addPlantStationRecipe(
    <contenttweaker:research_oreberry>,
    [<oreberries:aoi_oreberry_bush>],
    [
        <contenttweaker:soapart> * 4,
        <thermalfoundation:material:1025> * 64,
        <contenttweaker:plant_sample> * 16,
        <oreberries:cobalt_oreberry_bush>
    ],
    <liquid:platinum> * (144 * 16),
    15
);


scripts.helper.addPlantStationRecipe(
    <contenttweaker:research_oreberry>,
    [<oreberries:kuroi_oreberry_bush>],
    [
        <contenttweaker:soapart> * 4,
        <thermalfoundation:material:1028> * 16,
        <contenttweaker:plant_sample> * 16,
        <oreberries:lead_oreberry_bush>
    ],
    <liquid:arkenium> * (144 * 16),
    15
);
scripts.helper.addPlantStationRecipe(
    <contenttweaker:research_oreberry>,
    [<oreberries:shiroi_oreberry_bush>],
    [
        <contenttweaker:soapart> * 4,
        <thermalfoundation:material:1028> * 16,
        <contenttweaker:plant_sample> * 16,
        <oreberries:osmium_oreberry_bush>
    ],
    <liquid:gallium> * (144 * 16),
    15
);