#priority 99
//heavily based on 
// https://github.com/Divine-Journey-2/Divine-Journey-2
//from Divine Journey 2

import mods.immersiveengineering.Excavator;
import mods.immersivepetroleum.Reservoir;

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.requious.Assembly;
import mods.requious.AssemblyRecipe;
import mods.requious.SlotVisual;



// Remove existing minerals
Excavator.removeMineral("Cassiterite");
Excavator.removeMineral("Coal");
Excavator.removeMineral("Copper");
Excavator.removeMineral("Cinnabar");
Excavator.removeMineral("Silt");
Excavator.removeMineral("Galena");
Excavator.removeMineral("Gold");
Excavator.removeMineral("Iron");
Excavator.removeMineral("Lapis");
Excavator.removeMineral("Lead");
Excavator.removeMineral("Magnetite");
Excavator.removeMineral("Nickel");
Excavator.removeMineral("Pyrite");
Excavator.removeMineral("Quartzite");
Excavator.removeMineral("Silver");
Excavator.removeMineral("Platinum");
Excavator.removeMineral("Iridium");
Excavator.removeMineral("Uranium");
Excavator.removeMineral("Bauxite");


// List of all relevant dimensions for the excavator, in `id: name` format
static dimensionIdentifier as string[int] = {
    -11325: "deep_dark",
    
    -1:     "nether",
    0:      "overworld",
    1:      "end",
    4:      "aether",
    7:      "twilight_forest",
    17:     "atum",
    
    66:     "erebus"
    
} as string[int];
//jei item
static dim_item_hints as IItemStack[int] = {
    -11325: <extrautils2:compressedcobblestone:7>,
    
    -1:     <minecraft:netherrack>,
    0:      <minecraft:stone>,
    1:      <minecraft:end_stone>,
    4:      <aether_legacy:holystone>,
    7:      <twilightforest:aurora_block>,
    17:     <atum:limestone>,
    
    66:     <erebus:umberstone>
};

// List of names and color codes for the rarities used, in `rarity: [name, color]` format
static rarityTable as string[][int] = {
     1: ["6", "rarest"],
     5: ["6", "extremely_rare"],
    10: ["6", "rare"],
    15: ["2", "uncommon"],
    20: ["2", "uncommon"],
    25: ["f", "common"],
    30: ["f", "common"],
    35: ["f", "very_common"],
    50: ["f", "extremely_common"],
} as string[][int];


// Add item inputs and outputs easily
function addSlots(a as Assembly, way as string, slots as int[][]) {
    for i, pair in slots {
        a.setJEIItemSlot(pair[0], pair[1], way ~ i);
    }
}

var excavator = <assembly:ie_excavator>;
excavator.addJEICatalyst(<immersiveengineering:metal_multiblock:11>);
excavator.addJEICatalyst(<immersiveengineering:metal_multiblock:12>);
excavator.addJEICatalyst(<immersiveengineering:metal_device1:7>);
excavator.setJEIItemSlot(0, 0, "core_sample", SlotVisual.itemSlot());
excavator.setJEIItemSlot(0, 1, "dim_item", SlotVisual.itemSlot());
excavator.setJEIDecoration(1, 0, "indicator_arrow", SlotVisual.arrowRight());
addSlots(excavator, "item_output", [
           [3,0], [4,0], [5,0], [6,0], [7,0], [8,0], [9,0],
    [2,1], [3,1], [4,1], [5,1], [6,1], [7,1], [8,1], [9,1]
]); // Adds 15 output slots
excavator.setJEIFluidSlot(2, 0, "fluid");

// Creates an excavator vein and adds it to JEI via a custom JEI category.
// While ores in a vein are limitless, due to restrictions, JEI can only display a maximum of 8.
function addExcavator(name as string, rarity as int, ores as string[], chances as double[], dims as int[]) as void {
    Excavator.addMineral(name, rarity, 0.005, ores, chances, dims);

    val recipe = AssemblyRecipe.create(function(container) {
        for i, entry in ores {
            val ore = oreDict.get(entry);
            if (!isNull(ore)) {
                // Multiplying the ore allows us to display the item chance
                container.addItemOutput("item_output" ~ i, ore.firstItem * (chances[i] * 100));
            }
        }
    });


    var locations = "Generates in the ";
    var dimNames as string[] = [] as string[];
    var dim_items as IIngredient = dim_item_hints[dims[0]];

    for i, dim in dims {
        dimNames += dimensionIdentifier[dim];
        dim_items = dim_items | dim_item_hints[dim];
    }

    // A basic enumeration function, includes oxford comma
    if (dimNames.length == 1) locations = locations ~ dimNames[0];
    else if (dimNames.length == 2) locations = locations ~ dimNames[0] ~ " and " ~ dimNames[1];
    else {
        for i, dim in dimNames {
            locations = locations ~ dim;
            if (i != dimNames.length - 1) {
                locations = locations ~ ", ";
                if (i == dimNames.length - 2) locations = locations ~ "and ";
            }
        }
    }

    locations = locations ~ " Dimension";
    if (dimNames.length > 1) locations = locations ~ "s";

    recipe.requireItem("core_sample", <immersiveengineering:coresample>.withTag({
        display:{
            // The § symbol indicates special minecraft formatting
            Name: "§r§c" ~ name,
            Lore: [
                "§r§b" ~ locations,
                "§r§" ~ rarityTable[rarity][0] ~ rarityTable[rarity][1]
            ]
        },
        mineral: name,
    }));
    recipe.requireItem("dim_item", dim_items);

    <assembly:ie_excavator>.addJEIRecipe(recipe);
}

function addFluidReservoir(
        name as string, rarity as int, fluid as ILiquidStack, 
        minSize as int, maxSize as int, replenishRate as int, 
        dims as int[]
    )
{
    print("[ORE_EXCAVATOR] adding reservoir " ~ name);
    Reservoir.registerReservoir(
        name, 
        fluid, 
        minSize, maxSize, replenishRate, 
        rarity, 
        [],// dimBlacklist, 
        dims, 
        [], //string biomeBlacklist, 
        []//string biomeWhitelist
    );

    val recipe = AssemblyRecipe.create(function(container) {
        container.addFluidOutput("fluid", fluid);
        
        container.addItemOutput("item_output0", <minecraft:brown_mushroom>.withTag({
            display:{
                Name: "§r§cMinimum",
                Lore: [
                    "§r§b" ~ scripts.helper.turnNumberToString(minSize) ~ " mb"
                ]
            }
        })); 

        container.addItemOutput("item_output1", <erebus:double_plant:6>.withTag({
            display:{
                Name: "§r§cMaximum",
                Lore: [
                    "§r§b" ~ scripts.helper.turnNumberToString(maxSize) ~ " mb"
                ]
            }
        }));

        container.addItemOutput("item_output2", <biomesoplenty:mushroom:4>.withTag({
            display:{
                Name: "§r§cReplenish Rate",
                Lore: [
                    "§r§b" ~ scripts.helper.turnNumberToString(replenishRate) ~ " mb/tick"
                ]
            }
        }));
    });


    var locations = "Generates in the ";
    var dimNames as string[] = [] as string[];

    for i, dim in dims {
        dimNames += dimensionIdentifier[dim];
    }

    // A basic enumeration function, includes oxford comma
    if (dimNames.length == 1) locations = locations ~ dimNames[0];
    else if (dimNames.length == 2) locations = locations ~ dimNames[0] ~ " and " ~ dimNames[1];
    else {
        for i, dim in dimNames {
            locations = locations ~ dim;
            if (i != dimNames.length - 1) {
                locations = locations ~ ", ";
                if (i == dimNames.length - 2) locations = locations ~ "and ";
            }
        }
    }

    locations = locations ~ " Dimension";
    if (dimNames.length > 1) locations = locations ~ "s";

    recipe.requireItem("core_sample", <immersiveengineering:coresample>.withTag({
        display:{
            // The § symbol indicates special minecraft formatting
            Name: "§r§c" ~ name,
            Lore: [
                "§r§b" ~ locations,
                "§r§" ~ rarityTable[rarity][0] ~ rarityTable[rarity][1]
            ]
        },
        resType: name,
    }));

    <assembly:ie_excavator>.addJEIRecipe(recipe);
}

// Because the excavator only takes oredict entries, we have to add a unique oredict for every item we want to add


{//overworld & deep dark
    <ore:oreOverworldIron>.add(<minecraft:iron_ore>);
    <ore:oreOverworldCopper>.add(<thermalfoundation:ore>);
    <ore:oreOverworldTin>.add(<thermalfoundation:ore:1>);
    <ore:oreOverworldAluminum>.add(<thermalfoundation:ore:4>);
    <ore:oreOverworldNickel>.add(<thermalfoundation:ore:5>);
    <ore:oreOverworldZinc>.add(<contenttweaker:zinc_ore>);

    <ore:oreOverworldBauxite>.add(<immersiveengineering:ore:1>);

    <ore:oreOverworldCobalt>.add(<netherendingores:ore_other_1:4>);
    <ore:oreOverworldArdite>.add(<netherendingores:ore_other_1:2>);

    <ore:oreOverworldGold>.add(<minecraft:gold_ore>);
    <ore:oreOverworldSilver>.add(<thermalfoundation:ore:2>);
    <ore:oreOverworldLead>.add(<thermalfoundation:ore:3>);
    <ore:oreOverworldOsmium>.add(<mekanism:oreblock>);

    <ore:oreOverworldPlatinum>.add(<thermalfoundation:ore:6>);
    <ore:oreOverworldIridium>.add(<thermalfoundation:ore:7>);
    <ore:oreOverworldTitanium>.add(<contenttweaker:titanium_ore>);
    <ore:oreOverworldTungsten>.add(<contenttweaker:tungsten_ore>);
    <ore:oreOverworldUranium>.add(<immersiveengineering:ore:5>);
    <ore:oreOverworldYellorium>.add(<bigreactors:oreyellorite>);

    <ore:oreOverworldChrome>.add(<contenttweaker:chrome_ore>);
    <ore:oreOverworldNeodymium>.add(<contenttweaker:neodymium_ore>);
    <ore:oreOverworldGallium>.add(<contenttweaker:gallium_ore>);
    <ore:oreOverworldOrichalcum>.add(<contenttweaker:orichalcum_ore>);

    <ore:oreOverworldCoal>.add(<minecraft:coal_ore>);
    <ore:oreOverworldRedstone>.add(<minecraft:redstone_ore>);
    <ore:oreOverworldElectrotine>.add(<contenttweaker:electrotine_ore>);

    <ore:oreOverworldDiamond>.add(<minecraft:diamond_ore>);
    <ore:oreOverworldLapis>.add(<minecraft:lapis_ore>);
    <ore:oreOverworldQuartz>.add(<mysticalworld:quartz_ore>);
    <ore:oreOverworldCertusQuartz>.add(<appliedenergistics2:quartz_ore>);
    <ore:oreOverworldChargedCertusQuartz>.add(<appliedenergistics2:charged_quartz_ore>);
    <ore:oreOverworldBlackQuartz>.add(<actuallyadditions:block_misc:3>);
    <ore:oreOverworldGravitite>.add(<netherendingores:ore_other_1:7>);

    //taiga
    <ore:oreOverworldKarmesine>.add(<taiga:karmesine_ore>);
    <ore:oreOverworldVibranium>.add(<taiga:vibranium_ore>);

    //bop
    <ore:oreOverworldRuby>.add(<biomesoplenty:gem_ore:1>);
    <ore:oreOverworldAmber>.add(<biomesoplenty:gem_ore:7>);
    <ore:oreOverworldSapphire>.add(<biomesoplenty:gem_ore:6>);


    //other
    <ore:oreMagicalCopper>.add(<mysticalworld:copper_ore>);
    <ore:oreMagicalTin>.add(<mekanism:oreblock:2>);
    //<ore:oreMagicalCopper>.add(<minecraft:diamond_ore>);

    <ore:orePoorIron>.add(<contenttweaker:poor_iron_ore>);
}
{//erebus
    <ore:oreErebusCoal>.add(<erebus:ore_coal>);
    <ore:oreErebusIron>.add(<erebus:ore_iron>);
    <ore:oreErebusGold>.add(<erebus:ore_gold>);
    <ore:oreErebusLead>.add(<erebus:ore_lead>);
    <ore:oreErebusTin>.add(<erebus:ore_tin>);
    <ore:oreErebusSilver>.add(<erebus:ore_silver>);
    <ore:oreErebusAluminum>.add(<erebus:ore_aluminium>);

    <ore:oreErebusJade>.add(<erebus:ore_jade>);
    <ore:oreErebusMalachite>.add(<erebus:ore_copper>);
    <ore:oreErebusLapis>.add(<erebus:ore_lapis>);
    <ore:oreErebusEmerald>.add(<erebus:ore_emerald>);
    <ore:oreErebusQuartz>.add(<erebus:ore_quartz>);
    <ore:oreErebusPetrifiedQuartz>.add(<erebus:ore_petrified_quartz>);
    <ore:oreErebusDiamond>.add(<erebus:ore_diamond>);
    <ore:oreErebusEncrustedDiamond>.add(<erebus:ore_encrusted_diamond>);

    <ore:oreErebusTemple>.add(<erebus:ore_temple>);
    <ore:oreErebusGneiss>.add(<erebus:ore_gneiss>);
    <ore:oreErebusFossil>.add(<erebus:ore_fossil>);
    <ore:oreErebusWood>.add(<erebus:ore_petrified_wood>);

    <ore:blockErebusAmber>.add(<erebus:amber>);
    <ore:blockErebusGneiss>.add(<erebus:gneiss>);

    <ore:erebusDutchCapMushroom>.add(<erebus:dutch_cap_mushroom>);
    <ore:erebusGrandmasShoesMushroom>.add(<erebus:grandmas_shoes_mushroom>);
    <ore:erebusDarkCappedMushroom>.add(<erebus:dark_capped_mushroom>);
    <ore:erebusKaizersFingersMushroom>.add(<erebus:kaizers_fingers_mushroom>);
    <ore:erebusSarcasticCzechMushroom>.add(<erebus:sarcastic_czech_mushroom>);

    <ore:oreErebusFlolit>.add(<contenttweaker:flolit_ore>);
}
{//atum
    <ore:oreAtumCoal>.add(<atum:coal_ore>);
    <ore:oreAtumIron>.add(<atum:iron_ore>);
    <ore:oreAtumGold>.add(<atum:gold_ore>);
    <ore:oreAtumRedstone>.add(<atum:redstone_ore>);
    <ore:oreAtumLapis>.add(<atum:lapis_ore>);
    <ore:oreAtumDiamond>.add(<atum:diamond_ore>);
    <ore:oreAtumEmerald>.add(<atum:emerald_ore>);
    <ore:oreAtumRelic>.add(<atum:relic_ore>);

    <ore:oreAtumLead>.add(<contenttweaker:atum_lead_ore>);
    <ore:oreAtumZinc>.add(<contenttweaker:atum_sphalerite_ore>);

    <ore:strangeSand>.add(<atum:sand>);
    <ore:oreAtumBone>.add(<atum:bone_ore>);

    <ore:oreGodshard>.add(<contenttweaker:atum_godshardium_ore>);
}
{//nether
    <ore:oreHellIron>.add(<netherendingores:ore_nether_vanilla:4>);
    <ore:oreHellCopper>.add(<netherendingores:ore_nether_modded_1:1>);
    <ore:oreHellTin>.add(<netherendingores:ore_nether_modded_1:8>);

    <ore:oreHellNickel>.add(<netherendingores:ore_nether_modded_1:5>);
    <ore:oreHellZinc>.add(<netherendingores:ore_nether_modded_2>);
    <ore:oreHellAluminum>.add(<netherendingores:ore_nether_modded_1>);

    <ore:oreHellCobalt>.add(<tconstruct:ore>);
    <ore:oreHellArdite>.add(<tconstruct:ore:1>);

    <ore:oreHellGold>.add(<netherendingores:ore_nether_vanilla:3>);
    <ore:oreHellSilver>.add(<netherendingores:ore_nether_modded_1:7>);
    <ore:oreHellOsmium>.add(<netherendingores:ore_nether_modded_1:11>);
    <ore:oreHellLead>.add(<netherendingores:ore_nether_modded_1:3>);
    //<ore:oreHell>.add();

    <ore:oreHellOsmium>.add(<netherendingores:ore_nether_modded_1:11>);
}
{//aether
    <ore:oreAetherAmbrosium>.add(<aether_legacy:ambrosium_ore>);
    <ore:oreAetherZanite>.add(<aether_legacy:zanite_ore>);
    <ore:oreAetherGravitite>.add(<aether_legacy:gravitite_ore>);

    <ore:oreOverworldArkenium>.add(<netherendingores:ore_other_1:9>);
}
<ore:glowshroom>.add(<quark:glowshroom>);
{//end
    <ore:oreEndBiotite>.add(<quark:biotite_ore>);

    <ore:oreTheendIron>.add(<netherendingores:ore_end_vanilla:4>);
    <ore:oreTheendCopper>.add(<netherendingores:ore_end_modded_1:1>);
    <ore:oreTheendTin>.add(<netherendingores:ore_end_modded_1:8>);

    <ore:oreTheendNickel>.add(<netherendingores:ore_end_modded_1:5>);
    <ore:oreTheendZinc>.add(<netherendingores:ore_end_modded_2>);
    <ore:oreTheendAluminum>.add(<netherendingores:ore_end_modded_1>);

    <ore:oreTheendCobalt>.add(<netherendingores:ore_other_1:5>);
    <ore:oreTheendArdite>.add(<netherendingores:ore_other_1:3>);

    <ore:oreTheendGold>.add(<netherendingores:ore_end_vanilla:3>);
    <ore:oreTheendSilver>.add(<netherendingores:ore_end_modded_1:7>);
    <ore:oreTheendOsmium>.add(<netherendingores:ore_end_modded_1:11>);
    <ore:oreTheendLead>.add(<netherendingores:ore_end_modded_1:3>);

    <ore:oreTheendOsmium>.add(<netherendingores:ore_end_modded_1:11>);
}
var mil as int = 1000000;

{//overworld
    addExcavator("Iron", 30, ["oreOverworldIron", "oreOverworldNickel"], [0.8, 0.2], [0, -11325]);
    addExcavator("Copper", 30, ["oreOverworldCopper", "oreOverworldGold"], [0.8, 0.2], [0, -11325]);
    addExcavator("Tin", 30, ["oreOverworldTin", "oreOverworldSilver"], [0.8, 0.2], [0, -11325]);
    addExcavator("Electrum", 30, ["oreOverworldGold", "oreOverworldSilver", "oreOverworldElectrotine"], [0.45, 0.45, 0.1], [0, -11325]);
    addExcavator("Nickel", 30, ["oreOverworldNickel", "oreOverworldIron", "oreOverworldPlatinum"], [0.75, 0.2, 0.05], [0, -11325]);
    addExcavator("BauxiteVein", 20, ["oreOverworldBauxite", "oreOverworldAluminum", "oreOverworldGallium"], [0.78, 0.2, 0.02], [0, -11325]);

    addExcavator("Karmesine", 20, ["oreOverworldKarmesine", "oreOverworldCopper", "oreOverworldRedstone"], [0.65, 0.2, 0.15], [0, -11325]);


    addExcavator("Coal1", 30, ["oreOverworldCoal"], [1], [0, -11325]);
    addExcavator("Coal2", 20, ["oreOverworldCoal", "oreOverworldDiamond"], [0.99, 0.01], [0, -11325]);
    addExcavator("Redstone", 20, ["oreOverworldRedstone", "oreOverworldRuby"], [0.97, 0.03], [0, -11325]);

    addExcavator("Lapis1", 20, ["oreOverworldLapis", "oreOverworldElectrotine", "dustSulfur"], [0.85, 0.1, 0.05], [0, -11325]);
    addExcavator("Lapis2", 20, ["oreOverworldLapis", "oreOverworldCertusQuartz"], [0.85, 0.15], [0, -11325]);
    addExcavator("Quartz", 10, ["oreOverworldQuartz", "oreOverworldCertusQuartz", "oreOverworldBlackQuartz"], [0.65, 0.3, 0.05], [0, -11325]);
    addExcavator("Certus Quartz", 10, ["oreOverworldCertusQuartz", "oreOverworldChargedCertusQuartz", "oreOverworldBlackQuartz"], [0.65, 0.25, 0.1], [0, -11325]);
    
    addExcavator("Amber and Amber", 10, ["oreOverworldAmber", "blockErebusAmber"], [0.75, 0.25], [0, -11325]);

    addExcavator("Titanium and Garbage", 5, ["oreOverworldTitanium", "oreOverworldSapphire", "oreOverworldNeodymium", "oreOverworldVibranium"], [0.90, 0.07, 0.02, 0.01], [0, -11325]);

    addExcavator("Chrome", 10, ["oreOverworldChrome", "oreOverworldRuby", "oreOverworldRedstone"], [0.8, 0.1, 0.1], [0, -11325]);

    addFluidReservoir("Oil", 35, <liquid:oil>, 5*mil, 10*mil, 6, [0, -11325, 7]);
    addFluidReservoir("Rich Oil", 5, <liquid:oil>, 50*mil, 100*mil, 30, [0, -11325, 7]);
    addFluidReservoir("OW Lava", 25, <liquid:lava>, 5*mil, 10*mil, 6, [0]);

    addFluidReservoir("OW Sea Water", 25, <liquid:sea_water>, 5*mil, 10*mil, 6, [0]);
    addFluidReservoir("OW Mana", 5, <liquid:mana>, mil, 3*mil, 0, [0]);
}
{//erebus
    addExcavator("Erebus Raw Steel Vein", 30, ["oreErebusIron", "oreErebusNickel", "oreErebusCoal"], [0.7, 0.1, 0.2], [66, -11325]);
    addExcavator("Erebus Malachite", 30, ["oreErebusMalachite", "oreErebusJade", "oreErebusTin"], [0.7, 0.2, 0.1], [66, -11325]);
    addExcavator("Erebus Jade", 20, ["oreErebusJade", "oreErebusFlolit"], [0.8, 0.2], [66, -11325]);
    addExcavator("Erebus Flolit", 10, ["oreErebusFlolit", "oreErebusIron", "oreErebusSilver"], [0.7, 0.2, 0.1], [66, -11325]);
    addExcavator("Erebus Coal", 30, ["oreErebusCoal", "oreErebusDiamond", "oreErebusEncrustedDiamond"], [0.9, 0.07, 0.03], [66, -11325]);
    addExcavator("Erebus Diamond", 10, ["oreErebusCoal", "oreErebusDiamond", "oreErebusEncrustedDiamond"], [0.3, 0.6, 0.1], [66, -11325]);
    addExcavator("Erebus Lead", 20, ["oreErebusLead", "oreErebusSilver", "oreErebusQuartz"], [0.45, 0.45, 0.1], [66, -11325]);
    addExcavator("Erebus Fossil", 10, ["oreErebusFossil", "oreErebusFlolit", "oreErebusWood"], [0.85, 0.1, 0.05], [66, -11325]);
    addExcavator("Erebus Temple", 5, ["oreErebusTemple", "oreErebusLead", "oreErebusQuartz"], [0.75, 0.15, 0.1], [66, -11325]);
    
    addExcavator("Erebus Petrified", 5, ["oreErebusWood", "oreErebusPetrifiedQuartz"], [0.75, 0.25], [66, -11325]);
    addExcavator("Erebus Quartz", 15, ["oreErebusPetrifiedQuartz", "oreErebusQuartz"], [0.35, 0.65], [66, -11325]);

    addExcavator("Erebus SLAm", 10, ["oreErebusSilver", "oreErebusLapis", "oreOverworldAmber", "blockErebusAmber"], [0.5, 0.15, 0.25, 0.1], [0, -11325]);

    addFluidReservoir("Erebus Bugs", 10, <liquid:bugs>, 10000, 100000, 1, [66, -11325]);
    addFluidReservoir("Erebus Rich Mud", 20, <liquid:claymud>, 3 * mil, 7 * mil, 6, [66, -11325]);
    addFluidReservoir("Erebus Tar", 30, <liquid:tar>, mil, 5 * mil, 4, [66, -11325]);
    addFluidReservoir("Erebus Formic Acid", 20, <liquid:formic_acid>, mil, 3 * mil, 0, [66, -11325]);
    addFluidReservoir("Erebus Flolit Oil", 15, <liquid:flolit_oil>, 2 * mil, 5 * mil, 0, [66, -11325]);
}
//atum
addExcavator("Atum Coal", 25, ["oreAtumCoal", "oreAtumDiamond", "oreAtumEmerald"], [0.8, 0.15, 0.05], [17]);
addExcavator("Atum Diamond", 5, ["oreAtumDiamond", "oreAtumCoal", "oreAtumEmerald"], [0.7, 0.2, 0.1], [17]);
addExcavator("Atum Magnetite", 25, ["oreAtumIron", "oreAtumGold"], [0.85, 0.15], [17]);
addExcavator("Atum Lapis", 10, ["oreAtumLapis", "oreAtumIron"], [0.7, 0.3], [17]);
addExcavator("Atum Redstone", 15, ["oreAtumRedstone", "oreAtumBone", "strangeSand"], [0.75, 0.20, 0.05], [17]);
addExcavator("Atum Gold", 15, ["oreAtumGold", "oreAtumRelic", "strangeSand"], [0.65, 0.25, 0.1], [17]);
addExcavator("Atum Relic", 15, ["oreAtumRelic", "oreAtumGold", "strangeSand"], [0.75, 0.15, 0.1], [17]);
//addExcavator("Atum Oil", 15, ["oreClathrateOilSand", "sand"], [0.9, 0.1], [17]);
addExcavator("Atum Sphalerite", 10, ["oreAtumZinc", "oreAtumLead"], [0.8, 0.2], [17]);
addExcavator("Atum Porphyry", 5, ["stonePorphyry", "oreGodshard"], [0.9, 0.1], [17]);

addFluidReservoir("Atum Water", 35, <liquid:water>, mil, 2*mil, 0, [17]);
addFluidReservoir("Atum Oil", 25, <liquid:crude_oil>, mil, 2*mil, 4, [17]);
addFluidReservoir("Atum Rich Oil", 5, <liquid:crude_oil>, 10 * mil, 25*mil, 12, [17]);
addFluidReservoir("Atum Quicksand", 5, <liquid:sand>, mil, 2*mil, 4, [17]);
addFluidReservoir("Atum Deep Water", 5, <liquid:desert_water>, 10000, 200000, 0, [17]);

//nether

addFluidReservoir("Nether Lava", 35, <liquid:lava>, 10*mil, 15*mil, 10, [-1]);

//aether
addExcavator("Aether Ambrosium", 25, ["oreAetherAmbrosium", "aercloudGold", "holystone"], [0.7, 0.2, 0.1], [4]);
addExcavator("Aether Zanite", 25, ["oreAetherZanite", "oreAetherAmbrosium"], [0.75, 0.25], [4]);
addExcavator("Aether Gravitie", 25, ["oreAetherGravitite", "holystone"], [0.9, 0.1], [4]);
addExcavator("Aether Icestone", 20, ["icestone", "aercloudCold", "aercloudBlue"], [0.7, 0.2, 0.1], [4]);

addExcavator("Aether Poor Arkenium", 10, ["oreAetherZanite", "oreAetherAmbrosium", "oreOverworldArkenium"], [0.6, 0.2, 0.2], [4]);
addExcavator("Aether Rich Arkenium", 1, ["oreOverworldArkenium"], [1.0], [4]);

addFluidReservoir("Aether Pure Water", 35, <liquid:pure_water>, 10*mil, 15*mil, 30, [4]);
addFluidReservoir("Aether Skyroot Oil", 20, <liquid:skyroot>, 5*mil, 10*mil, 10, [4]);
addFluidReservoir("Aether Rich Skyroot Oil", 5, <liquid:skyroot>, 25*mil, 50*mil, 100, [4]);
addFluidReservoir("Aether Holy Water", 20, <liquid:holy_water>, mil, 10*mil, 10, [4]);

addFluidReservoir("Aether Mana", 10, <liquid:mana>, 2*mil, 5*mil, 3, [-11325]);

//end

//deepdark
addFluidReservoir("Deepdark Mana", 15, <liquid:mana>, 5 * mil, 10*mil, 12, [-11325]);
addFluidReservoir("Deepdark Dark Catalyst", 1, <liquid:dark_catalyst>, 50 * 1000, 300 * 1000, 4, [-11325]);

/*
addExcavator("Erebus Mushrooms", 25, ["erebusDutchCapMushroom", "erebusGrandmasShoesMushroom", "erebusDarkCappedMushroom", "erebusKaizersFingersMushroom", "erebusSarcasticCzechMushroom", "glowshroom", "cropMushroomRed", "cropMushroomBrown"], [0.15, 0.15, 0.15, 0.15, 0.15, 0.05, 0.1, 0.1], [66]);
addExcavator("Erebus Iron", 25, ["oreErebusIron", "oreErebusTin"], [0.65, 0.35], [66]);
addExcavator("Erebus Magnetite", 25, ["oreErebusIron", "oreErebusGold"], [0.85, 0.15], [66]);
addExcavator("Erebus Copper", 30, ["oreErebusCopper", "oreErebusGold", "blockErebusAmber"], [0.65, 0.25, 0.1], [66]);
addExcavator("Erebus Fossil", 30, ["oreFossil", "blockErebusAmber", "oreErebusCoal", "oreErebusQuartz"], [0.65, 0.25, 0.05, 0.05], [66]);
addExcavator("Erebus Cassiterite", 15, ["oreErebusTin"], [1.0], [66]);
addExcavator("Erebus Gold", 20, ["oreErebusGold", "oreErebusCopper"], [0.65, 0.35], [66]);
addExcavator("Erebus Jade", 20, ["oreJade", "oreErebusEmerald"], [0.65, 0.35], [66]);
addExcavator("Erebus Lapis", 20, ["oreErebusLapis", "oreErebusIron", "oreGneiss"], [0.65, 0.3, 0.05], [66]);
addExcavator("Erebus Gneiss", 20, ["blockErebusGneiss", "oreErebusEncrustedDiamond"], [0.65, 0.35], [66]);
addExcavator("Erebus Aluminium", 20, ["oreErebusAluminium", "oreErebusTin"], [0.7, 0.3], [66]);
addExcavator("Erebus Galena", 20, ["oreErebusLead", "oreErebusSilver"], [0.50, 0.50], [66]);
addExcavator("Erebus Coal", 20, ["oreErebusCoal", "orePetrifiedWood", "oreErebusPetrifiedQuartz"], [0.7, 0.15, 0.15], [66]);
addExcavator("Erebus Temple", 20, ["oreErebusTemple", "orePetrifiedWood", "oreErebusPetrifiedQuartz"], [0.5, 0.25, 0.25], [66]);

addExcavator("End Biotite", 25, ["oreEndBiotite", "oreEndProsperity", "oreEndInferium"], [0.75, 0.15, 0.1], [1]);
addExcavator("End Prosperity", 25, ["oreEndProsperity", "oreEndInferium"], [0.5, 0.5], [1]);
addExcavator("End Resonant Clathrate", 25, ["oreEndBiotite", "oreEndProsperity", "oreClathrateEnder"], [0.25, 0.25, 0.5], [1]);

addExcavator("Nether Glowstone", 25, ["blockGlowstone", "oreClathrateGlowstone"], [0.7, 0.3], [-1]);
addExcavator("Nether Quartz", 25, ["oreQuartz", "oreNetherInferium", "oreNetherProsperity"], [0.7, 0.15, 0.15], [-1]);
addExcavator("Nether Iron", 25, ["oreNetherIron", "oreNetherTin", "dustSulfur"], [0.5, 0.25, 0.25], [-1]);
addExcavator("Nether Magnetite", 25, ["oreNetherIron", "oreNetherGold"], [0.85, 0.15], [-1]);
addExcavator("Nether Copper", 30, ["oreNetherCopper", "oreNetherGold", "blockGlowstone"], [0.65, 0.25, 0.1], [-1]);
addExcavator("Nether Cassiterite", 15, ["oreNetherTin"], [1.0], [-1]);
addExcavator("Nether Gold", 20, ["oreNetherGold", "oreNetherCopper", "blockGlowstone"], [0.65, 0.25, 0.1], [-1]);
addExcavator("Nether Coal", 15, ["oreNetherCoal", "oreNetherDiamond", "oreNetherEmerald"], [0.7, 0.25, 0.05], [-1]);
addExcavator("Nether Blood", 25, ["oreNetherRedstone", "oreArdite", "oreBloodgem", "oreNetherite"], [0.4, 0.2, 0.2, 0.2], [-1]);
addExcavator("Nether Cobalt", 25, ["oreCobalt", "oreArdite", "oreCincinnasite"], [0.4, 0.3, 0.3], [-1]);
addExcavator("Nether Lapis", 25, ["oreNetherLapis", "oreCincinnasite", "oreCobalt"], [0.5, 0.3, 0.2], [-1]);
addExcavator("Nether Cincinnasite", 25, ["oreCincinnasite", "dustSulfur"], [0.9, 0.1], [-1]);

addExcavator("Iron", 25, ["oreIron", "oreNickel", "oreTin"], [0.55, 0.25, 0.20], [0, 9, -11325]);
addExcavator("Magnetite", 25, ["oreIron", "oreGold"], [0.85, 0.15], [0, 9, -11325]);
addExcavator("Pyrite", 20, ["oreIron", "dustSulfur"], [0.5, 0.5], [0, 9, -11325]);
addExcavator("Copper", 30, ["oreCopper", "oreGold", "oreNickel"], [0.7, 0.25, 0.05], [0, 9, -11325]);
addExcavator("Cassiterite", 15, ["oreTin"], [1.0], [0, 9, -11325]);
addExcavator("Gold", 20, ["oreGold", "oreCopper", "oreNickel"], [0.65, 0.25, 0.1], [0, 9, -11325]);
addExcavator("Nickel", 20, ["oreNickel", "oreIron"], [0.85, 0.15], [0, 9, -11325]);
addExcavator("Yellorium", 10, ["oreYellorium"], [1.0], [0, 9, -11325]);
addExcavator("Certus Quartz", 15, ["oreCertusQuartz", "oreChargedCertusQuartz", "oreQuartzBlack"], [0.6, 0.1, 0.3], [0, 9, -11325]);
addExcavator("Quartzite", 5, ["oreOverworldQuartz", "oreCertusQuartz", "oreChargedCertusQuartz", "oreQuartzBlack"], [0.5, 0.35, 0.05, 0.1], [0, 9, -11325]);
addExcavator("Galena", 15, ["oreLead", "oreSilver"], [0.50, 0.50], [0, 9, -11325]);
addExcavator("Lapis", 10, ["oreLapis", "oreIron", "dustSulfur"], [0.65, 0.3, 0.05], [0, 9, -11325]);
addExcavator("Cinnabar", 15, ["oreRedstone", "oreCinnabar", "oreClathrateRedstone"], [0.65, 0.20, 0.15], [0, 9, -11325]);
addExcavator("Coal", 25, ["oreCoal", "oreDiamond", "oreEmerald"], [0.84, 0.15, 0.01], [0, 9, -11325]);
addExcavator("Silt", 25, ["blockClay", "blockSalt", "oreAquamarine", "sand", "gravel"], [0.3, 0.2, 0.1, 0.2, 0.2], [0, 9, -11325]);
addExcavator("Osmium", 35, ["oreOsmium", "oreIron"], [0.8, 0.2], [0, 9, -11325]);
addExcavator("Aluminum", 10, ["oreAluminum", "oreTin"], [0.7, 0.3], [0, 9, -11325]);
addExcavator("Inferium", 25, ["oreInferium", "oreProsperity"], [0.6, 0.4], [0, 9, -11325]);
addExcavator("Garnet", 25, ["oreGarnet", "oreRedstone", "oreAmethyst"], [0.5, 0.25, 0.25], [0, 9, -11325]);
addExcavator("Opal", 25, ["oreOpal", "oreDark"], [0.6, 0.4], [0, 9, -11325]);
addExcavator("Oilsand", 25, ["oreClathrateOilSand", "sand"], [0.9, 0.1], [0, 9, -11325]);
addExcavator("Oilgravel", 25, ["oreClathrateOilShale", "gravel"], [0.9, 0.1], [0, 9, -11325]);
addExcavator("Divine", 25, ["oreRupee", "oreRealmite", "oreArlemite"], [0.33, 0.33, 0.33], [0, 9, -11325]);
addExcavator("Amethyst", 25, ["oreAmethyst", "oreCinnabar", "oreDiamond"], [0.6, 0.3, 0.1], [0, 9, -11325]);


*/
