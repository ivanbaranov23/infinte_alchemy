#loader contenttweaker
#modloaded tconstruct
#modloaded tconevo

import mods.contenttweaker.tconstruct.MaterialBuilder;
import mods.contenttweaker.tconstruct.TraitBuilder;

import crafttweaker.entity.IEntityItem;


//0 wood tool - stone
//1 stone tool - iron ore
//2 iron tool - diamond ore
//3 diamond tool - obsidiane
//4 - cobalt ore
//5 cobalt tool - 

//addHeadMaterialStats(durability, mining speed, damage, mining level)


{//ferramic
    val mat = MaterialBuilder.create("ferramic");
    mat.color = 0xffd2c8;

    mat.craftable = false;
    mat.castable = true;

    mat.liquid = <liquid:ferramic>;
    mat.representativeItem = <item:prodigytech:ferramic_ingot>;

    mat.addHeadMaterialStats(200, 5.0f, 4.0f, 2);
    mat.addHandleMaterialStats(0.7, 20);
    mat.addExtraMaterialStats(30);

    mat.addMaterialTrait("aridiculous", null);
    mat.addMaterialTrait("superheat", null);

    mat.itemLocalizer = function(thisMaterial, itemName){return "Ferramic " + itemName;};
    mat.localizedName = "Ferramic";
    mat.register();
}


{//angel
    val flying_trait_base = TraitBuilder.create("flying");
    flying_trait_base.localizedName = "Flying";
    flying_trait_base.localizedDescription = "Sends enemies flying";
    flying_trait_base.onHit = function(trait, tool, attacker, target, damage, isCritical) {
        if target{
            target.addPotionEffect(<potion:minecraft:levitation>.makePotionEffect(20, 1));
        }
    };

    var flying_trait = flying_trait_base.register();

    val mat = MaterialBuilder.create("angel");
    mat.color = 0x7dd2e0;

    mat.craftable = false;
    mat.castable = true;

    mat.liquid = <liquid:angel>;
    mat.representativeItem = <item:contenttweaker:angel_ingot>;

    mat.addHeadMaterialStats(120, 5.0f, 4.0f, 2);
    mat.addHandleMaterialStats(0.7, 20);
    mat.addExtraMaterialStats(20);
    mat.addProjectileMaterialStats();

    mat.addMaterialTrait(flying_trait, null);

    mat.itemLocalizer = function(thisMaterial, itemName){return "Angelic " + itemName;};
    mat.localizedName = "Angel Metal";
    mat.register();
}

{//duraluminum
    val mat = MaterialBuilder.create("duraluminum");
    mat.color = 0xa274ae;

    mat.craftable = false;
    mat.castable = true;

    mat.liquid = <liquid:duraluminum>;
    mat.representativeItem = <item:contenttweaker:duraluminum_ingot>;

    mat.addHeadMaterialStats(720, 7.0f, 6.0f, 4);
    mat.addHandleMaterialStats(1.1, 80);
    mat.addExtraMaterialStats(70);
    mat.addProjectileMaterialStats();

    mat.addMaterialTrait("crude1", null);
    mat.addMaterialTrait("coldblooded", "head");

    mat.itemLocalizer = function(thisMaterial, itemName){return "Duraluminum " + itemName;};
    mat.localizedName = "Duraluminum";
    mat.register();
}

{//bocuit
    val testMat = mods.contenttweaker.tconstruct.MaterialBuilder.create("bocuit");
    testMat.color = 0x6a893b;
    testMat.craftable = true;
    
    testMat.addItem(<item:contenttweaker:bocuit>);
    testMat.representativeItem = <item:contenttweaker:bocuit>;
    
    testMat.addBowStringMaterialStats(1.75f);
    
    testMat.addMaterialTrait("shocking", null);

    testMat.itemLocalizer = function(thisMaterial, itemName){return "Bocuit " + itemName;};
    testMat.localizedName = "Bocuit";
    testMat.register();
}

{//watertight_steel
    val testMat = mods.contenttweaker.tconstruct.MaterialBuilder.create("watertight_steel");
    testMat.color = 0x2a5693;
    testMat.craftable = false;
    testMat.liquid = <liquid:watertight_steel>;
    testMat.castable = true;
    testMat.addItem(<item:contenttweaker:watertight_steel_ingot>);
    testMat.representativeItem = <item:contenttweaker:watertight_steel_ingot>;
    testMat.addHeadMaterialStats(300, 2.5f, 4.5f, 3);//int durability, float miningSpeed, float attackDamage, int harvestLevel
    testMat.addHandleMaterialStats(0.85, 100);
    testMat.addExtraMaterialStats(70);
    //testMat.addBowStringMaterialStats(0.5f);
    /*testMat.addMaterialTrait(<ticontrait:kindlich_test>, "bowstring");
    testMat.addMaterialTrait(<ticontrait:kindlich_test>, "head");
    testMat.addMaterialTrait("blasting", "bowstring");
    testMat.addMaterialTrait("blasting", "head");*/

    //null (or not specifying that parameter at all) means that this is a default trait.
    //Default traits are only queried when no other traits are added to that material type.
    //In this case, the dense trait will only be on toolrods, because bowstrings and heads already have other traits.
    testMat.addMaterialTrait("aquadynamic", null);

    testMat.itemLocalizer = function(thisMaterial, itemName){return "Watertight Steel " + itemName;};
    testMat.localizedName = "Watertight Steel";
    testMat.register();
}
{//thermal
    val testMat = mods.contenttweaker.tconstruct.MaterialBuilder.create("thermal_steel");
    testMat.color = 0xcc4e4c;
    testMat.craftable = false;
    testMat.liquid = <liquid:thermal>;
    testMat.castable = true;
    testMat.addItem(<item:contenttweaker:thermal_ingot>);
    testMat.representativeItem = <item:contenttweaker:thermal_ingot>;
    testMat.addHeadMaterialStats(300, 2.5f, 4.5f, 3);//int durability, float miningSpeed, float attackDamage, int harvestLevel
    testMat.addHandleMaterialStats(0.9, 100);
    testMat.addExtraMaterialStats(70);
    //testMat.addBowStringMaterialStats(0.5f);
    /*testMat.addMaterialTrait(<ticontrait:kindlich_test>, "bowstring");
    testMat.addMaterialTrait(<ticontrait:kindlich_test>, "head");
    testMat.addMaterialTrait("blasting", "bowstring");
    testMat.addMaterialTrait("blasting", "head");*/

    //null (or not specifying that parameter at all) means that this is a default trait.
    //Default traits are only queried when no other traits are added to that material type.
    //In this case, the dense trait will only be on toolrods, because bowstrings and heads already have other traits.
    testMat.addMaterialTrait("aridiculous", null);

    testMat.itemLocalizer = function(thisMaterial, itemName){return "High Heat Resistant " + itemName;};
    testMat.localizedName = "High Heat Resistant Steel";
    testMat.register();
}
{//erosion_resistant_alloy
    val testMat = mods.contenttweaker.tconstruct.MaterialBuilder.create("erosion_resistant_alloy");
    testMat.color = 0xdfbf98;
    testMat.craftable = false;
    testMat.liquid = <liquid:wear_resistant_alloy>;
    testMat.castable = true;
    testMat.addItem(<item:contenttweaker:wear_resistant_alloy_ingot>);
    testMat.representativeItem = <item:contenttweaker:wear_resistant_alloy_ingot>;
    testMat.addHeadMaterialStats(400, 2.5f, 4.5f, 3);//int durability, float miningSpeed, float attackDamage, int harvestLevel
    testMat.addHandleMaterialStats(1.2, 100);
    testMat.addExtraMaterialStats(70);
    //testMat.addBowStringMaterialStats(0.5f);
    /*testMat.addMaterialTrait(<ticontrait:kindlich_test>, "bowstring");
    testMat.addMaterialTrait(<ticontrait:kindlich_test>, "head");
    testMat.addMaterialTrait("blasting", "bowstring");
    testMat.addMaterialTrait("blasting", "head");*/

    //null (or not specifying that parameter at all) means that this is a default trait.
    //Default traits are only queried when no other traits are added to that material type.
    //In this case, the dense trait will only be on toolrods, because bowstrings and heads already have other traits.
    testMat.addMaterialTrait("dense", null);

    testMat.itemLocalizer = function(thisMaterial, itemName){return "Erosion Resistant " + itemName;};
    testMat.localizedName = "Erosion Resistant Alloy";
    testMat.register();
}
{//mushroomite
    val mat = MaterialBuilder.create("mushroomite");
    mat.color = 0x5e4e8d;

    mat.craftable = true;
    mat.castable = false;

    mat.addItem(<item:contenttweaker:mushroomite_ingot>);
    mat.representativeItem = <item:contenttweaker:mushroomite_ingot>;

    mat.addHeadMaterialStats(300, 2.5f, 3.5f, 1);//stone tool level
    mat.addHandleMaterialStats(1.0, 100);
    mat.addExtraMaterialStats(60);
    mat.addProjectileMaterialStats();

    mat.addMaterialTrait("tasty", null);
    mat.addMaterialTrait("poisonous", null);

    mat.itemLocalizer = function(thisMaterial, itemName){return "Mushroomite " + itemName;};
    mat.localizedName = "Mushroomite";
    mat.register();
}
{//electric_manyullyn
    val mat = MaterialBuilder.create("electric_manyullyn");
    mat.color = 0x5e4e8d;

    mat.craftable = false;
    mat.castable = true;
    mat.liquid = <liquid:electric_manyullyn>;

    mat.addItem(<item:contenttweaker:electric_manyullyn_ingot>);
    mat.representativeItem = <item:contenttweaker:electric_manyullyn_ingot>;

    mat.addHeadMaterialStats(750, 7.0f, 8.0f, 4);//stone tool level
    mat.addHandleMaterialStats(0.6, 100);
    mat.addExtraMaterialStats(60);
    mat.addProjectileMaterialStats();

    mat.addMaterialTrait("shocking", null);
    mat.addMaterialTrait("insatiable", null);

    mat.itemLocalizer = function(thisMaterial, itemName){return "Electric Manyullyn " + itemName;};
    mat.localizedName = "Electric Manyullyn";
    mat.register();
}



{//khnumite
    val trait = TraitBuilder.create("stonesupremacy");
    trait.localizedName = "Stone Supremacy";
    trait.localizedDescription = "Does twice the damage to non-stone enemies and zero damage to stone ones. How one would know which are stone? By asking their name of course";
    trait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
	    if (!isNull(target)){
            if (target.definition.name.toLowerCase() has "stone"){
                return 0.0 as float;
            }
            else
                return (newDamage + newDamage);
        }
        return (newDamage + newDamage);
    };
    var t = trait.register();

    val mat = MaterialBuilder.create("khnumite");
    mat.color = 0x897c4f;

    mat.craftable = true;
    mat.castable = false;

    mat.addItem(<item:atum:khnumite>);
    mat.representativeItem = <item:atum:khnumite>;
    
    mat.addHeadMaterialStats(300, 4.5f, 5.5f, 3);
    mat.addHandleMaterialStats(1.25, 50);
    mat.addExtraMaterialStats(140);
    mat.addProjectileMaterialStats();

    mat.addMaterialTrait(t, null);

    mat.itemLocalizer = function(thisMaterial, itemName){return "Khnumite " + itemName;};
    mat.localizedName = "Khnumite";
    mat.register();
}
{//relic
    val trait = TraitBuilder.create("relichunter");
    trait.localizedName = "Relic Hunter";
    trait.localizedDescription = "Breaking blocks sometimes drops dirty coins";
    trait.onBlockHarvestDrops = function(trait, tool, event) {
	    event.addItem(<item:atum:coin_dirty> % 5);
    };
    var t = trait.register();

    val mat = MaterialBuilder.create("relic");
    mat.color = 0x533222;

    mat.craftable = true;
    mat.castable = false;

    mat.addItem(<item:contenttweaker:relic_ingot>);
    mat.representativeItem = <item:contenttweaker:relic_ingot>;
    
    mat.addHeadMaterialStats(200, 4.5f, 5.5f, 3);
    mat.addHandleMaterialStats(1.25, 50);
    mat.addExtraMaterialStats(140);
    mat.addProjectileMaterialStats();

    mat.addMaterialTrait(t, null);

    mat.itemLocalizer = function(thisMaterial, itemName){return "Relic " + itemName;};
    mat.localizedName = "Relic";
    mat.register();
}



{//uranium
    val mat = MaterialBuilder.create("uranium");
    mat.color = 0x677d5a;

    mat.craftable = false;
    mat.castable = true;

    mat.liquid = <liquid:uranium>;
    mat.representativeItem = <item:immersiveengineering:metal:5>;

    mat.addHeadMaterialStats(500, 4.5f, 6.5f, 4);
    mat.addHandleMaterialStats(1.0, 100);
    mat.addExtraMaterialStats(70);
    mat.addProjectileMaterialStats();

    mat.addMaterialTrait("poisonous", null);
    //mat.addMaterialTrait("radioactiveI", null);
    mat.addMaterialTrait("radioactive1", null);

    mat.itemLocalizer = function(thisMaterial, itemName){return "Uranium " + itemName;};
    mat.localizedName = "Uranium";
    mat.register();
}

{//zorra leaf
    val mat = MaterialBuilder.create("zorra_leaf");
    mat.color = 0xffffff;

    mat.craftable = true;
    mat.castable = false;

    mat.addItem(<item:prodigytech:zorra_leaf>, 1, 36);
    mat.addItem(<item:prodigytech:zorra_leaves>);
    mat.representativeItem = <item:prodigytech:zorra_leaf>;

    mat.addFletchingMaterialStats(1.0, 1.75);

    mat.addMaterialTrait("sharp", null);

    mat.itemLocalizer = function(thisMaterial, itemName){return "Zorra " + itemName;};
    mat.localizedName = "Zorra leaf";
    mat.register();
}

{//honey drop
    val trait = TraitBuilder.create("honey");
    trait.localizedName = "Sweet Nectar";
    trait.localizedDescription = "Breaking blocks sometimes drop nectar";
    trait.onBlockHarvestDrops = function(trait, tool, event) {
	    event.addItem(<item:erebus:materials:19> % 10);
    };
    var t = trait.register();

    val mat = MaterialBuilder.create("honey_drop");
    mat.color = 0xe4b60e;

    mat.craftable = true;
    mat.castable = false;

    mat.addItem(<item:erebus:materials:20>, 1, 36);
    mat.representativeItem = <item:erebus:materials:20>;

    mat.addHeadMaterialStats(100, 2.5f, 3.5f, 1);//stone tool level
    mat.addHandleMaterialStats(0.8, 100);
    mat.addExtraMaterialStats(70);

    mat.addMaterialTrait("tasty", null);
    mat.addMaterialTrait(t, "head");

    mat.itemLocalizer = function(thisMaterial, itemName){return "Honey " + itemName;};
    mat.localizedName = "Honey Drop";
    mat.register();
}
{//elastic_fiber
    val mat = MaterialBuilder.create("elastic_fiber");
    mat.color = 0x00753a;

    mat.craftable = true;
    mat.castable = false;

    mat.addItem(<item:erebus:materials:9>);
    mat.representativeItem = <item:erebus:materials:9>;

    mat.addHeadMaterialStats(100, 2.5f, 3.5f, 1);//stone tool level
    mat.addHandleMaterialStats(1.4, 100);
    mat.addExtraMaterialStats(60);

    mat.addMaterialTrait("ecological", null);
    mat.addMaterialTrait("unnatural", null);

    mat.itemLocalizer = function(thisMaterial, itemName){return "Elastic Fiber " + itemName;};
    mat.localizedName = "Elastic Fiber";
    mat.register();
}

{//soap
    val mat = MaterialBuilder.create("soap");
    mat.color = 0xc3b2b2;

    mat.craftable = true;
    mat.castable = false;

    mat.addItem(<item:contenttweaker:soap>);
    mat.representativeItem = <item:contenttweaker:soap>;

    mat.addHeadMaterialStats(1500, 5.5f, 0.0f, 2);
    mat.addHandleMaterialStats(1.25, 100);
    mat.addExtraMaterialStats(100);

    mat.addMaterialTrait("squeaky", null);

    mat.itemLocalizer = function(thisMaterial, itemName){return "Soapy " + itemName;};
    mat.localizedName = "Soap";
    mat.register();
}



val fake_crystalline_base = TraitBuilder.create("fake_crystalline");
fake_crystalline_base.localizedName = "Crystalline";
fake_crystalline_base.localizedDescription = "Crystalline";
fake_crystalline_base.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
	var bonusDamage as float = 0.2 as float;
    var toolDamage as float = tool.metadata as float;
    var toolDurab as float = tool.tag.Stats.Durability.asFloat();

    bonusDamage = (bonusDamage * (toolDurab - toolDamage) / toolDurab) as float;

	return newDamage + originalDamage * bonusDamage;
};
var fake_crystalline = fake_crystalline_base.register();


{//coppra
    val mat = MaterialBuilder.create("coppra");
    mat.color = 0xffb51a;

    mat.craftable = true;
    mat.castable = false;

    mat.addItem(<item:contenttweaker:coppra>);
    mat.representativeItem = <item:contenttweaker:coppra>;

    mat.addHeadMaterialStats(300, 4.5f, 5.5f, 3);
    mat.addHandleMaterialStats(1.0, 50);
    mat.addExtraMaterialStats(40);
    mat.addProjectileMaterialStats();

    mat.addMaterialTrait(fake_crystalline, null);

    mat.itemLocalizer = function(thisMaterial, itemName){return "Coppra Crystal " + itemName;};
    mat.localizedName = "Coppra Crystal";
    mat.register();
}
{//nittin
    val mat = MaterialBuilder.create("nittin");
    mat.color = 0xb3c4d2;

    mat.craftable = true;
    mat.castable = false;

    mat.addItem(<item:contenttweaker:nittin>);
    mat.representativeItem = <item:contenttweaker:nittin>;

   mat.addHeadMaterialStats(300, 4.5f, 5.5f, 3);
    mat.addHandleMaterialStats(1.0, 50);
    mat.addExtraMaterialStats(40);
    mat.addProjectileMaterialStats();

    mat.addMaterialTrait(fake_crystalline, null);

    mat.itemLocalizer = function(thisMaterial, itemName){return "Nittin Crystal " + itemName;};
    mat.localizedName = "Nittin Crystal";
    mat.register();
}
{//goold
    val mat = MaterialBuilder.create("goold");
    mat.color = 0xffff0b;

    mat.craftable = true;
    mat.castable = false;

    mat.addItem(<item:contenttweaker:goold>);
    mat.representativeItem = <item:contenttweaker:goold>;

    mat.addHeadMaterialStats(300, 4.5f, 5.5f, 3);
    mat.addHandleMaterialStats(1.1, 50);
    mat.addExtraMaterialStats(40);
    mat.addProjectileMaterialStats();

    mat.addMaterialTrait(fake_crystalline, null);

    mat.itemLocalizer = function(thisMaterial, itemName){return "Goold Crystal " + itemName;};
    mat.localizedName = "Goold Crystal";
    mat.register();
}





{//osgloridium
    val mat = MaterialBuilder.create("osgloridium");
    mat.color = 0x747c41;

    mat.craftable = false;
    mat.castable = true;

    mat.liquid = <liquid:osgloridium>;
    mat.representativeItem = <item:contenttweaker:osgloridium_ingot>;

    mat.addHeadMaterialStats(2400, 7.0f, 12.0f, 5);
    mat.addHandleMaterialStats(1.2, 80);
    mat.addExtraMaterialStats(80);
    mat.addProjectileMaterialStats();

    mat.addMaterialTrait("devilsstrength", null);
    mat.addMaterialTrait("sassy", null);

    mat.itemLocalizer = function(thisMaterial, itemName){return "Osgloridium " + itemName;};
    mat.localizedName = "Osgloridium";
    mat.register();
}
{//arkenium
    val mat = MaterialBuilder.create("arkenium");
    mat.color = 0x2f2d35;

    mat.craftable = false;
    mat.castable = true;

    mat.liquid = <liquid:arkenium>;
    mat.representativeItem = <item:contenttweaker:arkenium_ingot>;

    mat.addHeadMaterialStats(700, 6.5f, 6.5f, 3);//stone tool level
    mat.addHandleMaterialStats(1.25, 100);
    mat.addExtraMaterialStats(60);
    mat.addProjectileMaterialStats();

    mat.addMaterialTrait("enderference", null);
    mat.addMaterialTrait("stalwart", null);

    mat.itemLocalizer = function(thisMaterial, itemName){return "Arkenium " + itemName;};
    mat.localizedName = "Arkenium";
    mat.register();
}
{//black_bronze
    val mat = MaterialBuilder.create("black_bronze");
    mat.color = 0x423468;

    mat.craftable = false;
    mat.castable = true;

    mat.liquid = <liquid:black_bronze>;
    mat.representativeItem = <item:contenttweaker:black_bronze_ingot>;

    mat.addHeadMaterialStats(700, 4.5f, 7.8f, 3);
    mat.addHandleMaterialStats(1.15, 200);
    mat.addExtraMaterialStats(70);
    mat.addProjectileMaterialStats();

    mat.addMaterialTrait("twilit", null);
    mat.addMaterialTrait("dense", null);
    mat.addMaterialTrait("sharp", null);

    mat.itemLocalizer = function(thisMaterial, itemName){return "Black Bronze " + itemName;};
    mat.localizedName = "Black Bronze";
    mat.register();
}


{//wormweave
    val testMat = mods.contenttweaker.tconstruct.MaterialBuilder.create("wormweave");
    testMat.color = 0xe6b25f;
    testMat.craftable = true;
    
    testMat.addItem(<item:contenttweaker:wormweave>);
    testMat.representativeItem = <item:contenttweaker:wormweave>;
    
    testMat.addBowStringMaterialStats(2.5f);
    
    testMat.addMaterialTrait("ecological", null);
    testMat.addMaterialTrait("unnatural", null);

    testMat.itemLocalizer = function(thisMaterial, itemName){return "Wormweave " + itemName;};
    testMat.localizedName = "Wormweave";
    testMat.register();
}
