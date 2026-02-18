import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;

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