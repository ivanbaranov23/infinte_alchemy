
import crafttweaker.liquid.ILiquidStack;


static taiga_metals as string[] = [
    "karmesine", "ovium", "jauxum", "terrax", "tritonite",

    "eezo", "palladium", "osram", "valyrium", "abyssum", "uru", "yrdeen",
    "proxii",

    "tiberium",
    "triberium",
    "aurorium",
    "prometheum",
    "duranite",
    "vibranium",
    "fractum",
    "violium",
    "ignitz",
    "imperomite",
    "solarium",
    "nihilite",
    "adamant",
    "dyonite",
    "nucleum",
    "lumix",
    "seismum",
    "astrium",
    "niob",
    "dilithium",
    "meteorite",
    "obsidiorite",
    "iox"
];


for metal in taiga_metals{
    print("taiga doing " ~ metal);
    var ingot = scripts.metalworks.all_metals[metal].ingot;
    var block = scripts.metalworks.all_metals[metal].block;
    var nugget = scripts.metalworks.all_metals[metal].nugget;

    recipes.addShaped(
        "ia_" + ingot.name + "_" + block.name + "_compression",
        block,
        [[ingot, ingot, ingot],[ingot, ingot, ingot],[ingot, ingot, ingot]]
    );
    recipes.addShaped(
        "ia_" + nugget.name + "_" + ingot.name + "_compression",
        ingot,
        [[nugget, nugget, nugget],[nugget, nugget, nugget],[nugget, nugget, nugget]]
    );
}

//iox
mods.actuallyadditions.Empowerer.addRecipe(
	<taiga:iox_ingot>, <contenttweaker:empty_ingot>, 
	<taiga:abyssum_ingot>,
    <taiga:eezo_ingot>,
    <taiga:osram_ingot>,
    <taiga:obsidiorite_block>,
	40000, 10
);


mods.tconstruct.Melting.removeRecipe(<liquid:basalt_fluid>);
<ore:blockBasalt>.remove(<taiga:basalt_block>);