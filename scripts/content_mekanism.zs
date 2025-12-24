#loader mekatweaker
import mods.mekatweaker.Gas;
import mods.mekatweaker.GasFactory;
import crafttweaker.liquid.ILiquidStack;
import mods.contenttweaker.Color;


mods.mekatweaker.InfuserType.addType("GOLD");
mods.mekatweaker.InfuserType.addType("MANA");
mods.mekatweaker.InfuserType.addType("CHEESE");
//todo neutronium, meat, sarahanium

function addGas(name as string, color as string, needFluid as bool){
    var gas = GasFactory.createGas(name);
    gas.setColorize(true);
    gas.setColor(Color.fromHex(color).getIntColor());
    gas.setNeedFluid(needFluid);
    gas.setIcon("blocks/liquid");
    gas.setIconFlowing("blocks/liquid_flow");
    gas.register();
}

addGas("naoh", "eae553", true);

{
    var xpjuice = GasFactory.createGas("xpjuice");
    xpjuice.setColorize(false);
    //gas.setColor(Color.fromHex(color).getIntColor());
    xpjuice.setNeedFluid(true);
    xpjuice.setIcon("blocks/xpjuice");
    xpjuice.setIconFlowing("blocks/xpjuice");
    xpjuice.register();
}

addGas("phosphoric_acid", "b53a4c", true);

addGas("nitrogen", "476678", true);
addGas("ammonia", "2f3e58", true);
addGas("nitric_oxide", "2f3e58", false);
addGas("nitric_dioxide", "2f3e58", false);
addGas("nitric_acid", "55747d", true);
addGas("ammonium_nitrate", "2e3e53", true);

addGas("rfna", "e0190a", false);

addGas("carmin", "cb1109", false);
addGas("black_slurp", "000000", true);

addGas("copper_reject", "36291e", false);

addGas("selenium_dioxide", "683882", false);
addGas("selenious_acid", "572771", false);

addGas("polyethylene", "723265", true);

addGas("butene", "cbc090", true);
addGas("hexane", "e4dec5", true);
addGas("ethylbenzene", "496315", true);

addGas("retinol", "ffc546", false);

addGas("fluorine", "bba52c", true);
addGas("hf", "75af2e", true);

addGas("tar_gas", "0c0a0f", false);

addGas("chlorosulfonic", "70d06f", true);

addGas("osgloridium", "747c41", true);

addGas("light1", "dddb57", false);
addGas("light2", "f0efa9", true);

addGas("nether_star_inert", "272d68", true);
addGas("nether_star_solution", "fcfbee", true);

addGas("evil", "000000", false);
addGas("evil_nitrate", "770e06", false);

addGas("neutron_inert", "c0c0c0", false);
addGas("neutron_active", "808080", false);


addGas("methane", "6d9c61", true);
addGas("acetic_acid", "532d0d", true);
addGas("formaldehyde", "bb8840", true);

addGas("ethyl_cyanoacrylate", "96bad5", true);
addGas("cyanoacrylate", "afdfe9", true);

addGas("ethylene_oxide", "afdfe9", false);
addGas("ethanolamine", "afdfe9", false);
addGas("taurine", "afdfe9", true);

addGas("rare_earth_slurry", "694217", false);
addGas("rarer_earth_slurry", "afd91d", false);
addGas("bastnasite_slurry", "d28200", false);

addGas("amethesting", "8e3885", true);

addGas("smart", "22ffff", false);

{
    var explosion_stone_glue = GasFactory.createGas("explosion_stone_glue");
    explosion_stone_glue.setColorize(false);
    //gas.setColor(Color.fromHex(color).getIntColor());
    explosion_stone_glue.setNeedFluid(false);
    explosion_stone_glue.setIcon("blocks/explosion_stone_glue");
    explosion_stone_glue.setIconFlowing("blocks/explosion_stone_glue");
    explosion_stone_glue.register();
}
addGas("waste_gas", "1f1f20", false);


function addMetalGas(name as string, color as string){
    addGas(name, color, false);
    addGas("clean" ~ name, color, false);
}
addMetalGas("chrome", "c2abb0");
addMetalGas("neodymium", "d34aa0");
addMetalGas("arkenium", "333139");
addMetalGas("gallium", "b5ceea");
addMetalGas("death_metal", "330d39");
addMetalGas("kikeridan", "84cc6e");


/*
lg Methane(+silver/iron III oxide)
g  Formaldehyde

    Methane+Ammonia+NaOH)
    Sodium cyanide NaCN

lg Ethanol (+O2, +Palladium cat)
l  Acetic acid (+Cl)


Acetic acid + Cl + NaCN + Ethanol=
Ethyl cyanoacrylate(+Formaldehyde)
Cyanoacrylate
l Super glue
*/

/*
var nitrogen = GasFactory.createGas("nitrogen");
nitrogen.setColor(Color.fromHex().getIntColor());
nitrogen.setNeedFluid(true);
nitrogen.setIcon("blocks/liquid");
nitrogen.setIconFlowing("blocks/liquid_flow");
nitrogen.register();

var polyethylene = GasFactory.createGas();
polyethylene.setColor(Color.fromHex().getIntColor());
polyethylene.setNeedFluid(true);
polyethylene.register();*/