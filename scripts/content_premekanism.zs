#loader contenttweaker

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Color;

VanillaFactory.createItem("naoh").register(); //1 dust = 250
VanillaFactory.createFluid("naoh", Color.fromHex("eae553")).register();

VanillaFactory.createFluid("nitrogen", Color.fromHex("476678")).register();
VanillaFactory.createFluid("ammonia", Color.fromHex("2f3e58")).register();
VanillaFactory.createFluid("nitric_acid", Color.fromHex("55747d")).register();
VanillaFactory.createFluid("ammonium_nitrate", Color.fromHex("2e3e53")).register();

{//cold nitrogen
    VanillaFactory.createFluid("cold_nitrogen", Color.fromHex("37d1d9")).register();
}

VanillaFactory.createFluid("polyethylene", Color.fromHex("723265")).register();

VanillaFactory.createFluid("butene", Color.fromHex("cbc090")).register();
VanillaFactory.createFluid("hexane", Color.fromHex("e4dec5")).register();


VanillaFactory.createFluid("fluorine", Color.fromHex("bba52c")).register();
VanillaFactory.createFluid("hf", Color.fromHex("75af2e")).register();


VanillaFactory.createFluid("methane", Color.fromHex("6d9c61")).register();
VanillaFactory.createFluid("acetic_acid", Color.fromHex("532d0d")).register();
VanillaFactory.createFluid("formaldehyde", Color.fromHex("bb8840")).register();

VanillaFactory.createFluid("ethyl_cyanoacrylate", Color.fromHex("96bad5")).register();
VanillaFactory.createFluid("cyanoacrylate", Color.fromHex("afdfe9")).register();
VanillaFactory.createFluid("taurine", Color.fromHex("afdfe9")).register();

/*
VanillaFactory.createFluid("", Color.fromHex("")).register();

VanillaFactory.createFluid("nitrogen", Color.fromHex("476678")).register();
VanillaFactory.createFluid("nitrogen", Color.fromHex("476678")).register();
VanillaFactory.createFluid("nitrogen", Color.fromHex("476678")).register();
VanillaFactory.createFluid("nitrogen", Color.fromHex("476678")).register();
VanillaFactory.createFluid("nitrogen", Color.fromHex("476678")).register();
*/