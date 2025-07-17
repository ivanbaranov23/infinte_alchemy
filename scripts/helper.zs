#priority 1000

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import extrautilities2.Tweaker.IMachine;

import mods.actuallyadditions.Crusher as AACrusher;
import mods.thermalexpansion.RedstoneFurnace;
import mods.thermalexpansion.Pulverizer;
import mods.immersiveengineering.Crusher as IECrusher;
import mods.extrautils2.Crusher as EUCrusher;
import mods.appliedenergistics2.Grinder;
import mods.enderio.SagMill;
import mods.roots.Mortar;
import mods.mekanism.enrichment;
import mods.mekanism.purification;
import mods.mekanism.chemical.injection;
import mods.mekanism.chemical.dissolution;
import mods.integrateddynamics.MechanicalSqueezer;

import mods.ctutils.utils.Math;

//functions
function addSimpleCrushingRecipe(ingot as IItemStack, dust as IItemStack){
    IECrusher.addRecipe(dust, ingot, 4000);
	AACrusher.addRecipe(dust, ingot);
	Grinder.addRecipe(dust, ingot, 4);
	mods.thermalexpansion.Pulverizer.addRecipe(dust, ingot, 2000);
	EUCrusher.add(dust, ingot);
	mods.enderio.SagMill.addRecipe([dust], [1.0], ingot);
	mods.mekanism.crusher.addRecipe(ingot, dust);
}
function addSimpleCrushingRecipeWByproduct(ingot as IItemStack, dust as IItemStack, byprod as IItemStack, chance100 as int){
    IECrusher.addRecipe(dust, ingot, 4000, byprod, (chance100 as float) / 100.0);
	AACrusher.addRecipe(dust, ingot, byprod, chance100);
	Grinder.addRecipe(dust, ingot, 4, byprod, (chance100 as float) / 100.0);
	Pulverizer.addRecipe(dust, ingot, 2000, byprod, chance100);
	EUCrusher.add(dust, ingot, byprod, (chance100 as float) / 100.0);
	SagMill.addRecipe([dust, byprod], [1.0, (chance100 as float) / 100.0], ingot, "CHANCE_ONLY");
	//mods.mekanism.crusher.addRecipe(ingot, dust);
}

function addSawRecipe(log as IItemStack, planks as IItemStack){
	mods.prodigytech.heatsawmill.addRecipe(log, planks);
	mods.thermalexpansion.Sawmill.addRecipe(planks, log, 1500);
	mods.mekanism.sawmill.addRecipe(log, planks);
}
function addSawRecipeWByproduct(log as IItemStack, planks as IItemStack, byprod as IItemStack, chance100 as int){
	mods.thermalexpansion.Sawmill.addRecipe(planks, log, 2000, byprod, chance100);
	mods.mekanism.sawmill.addRecipe(log, planks, byprod, (chance100 as float) / 100.0);
}


//recipe_name as string, machine_name as string, time as int, energy as int,
//    out as IItemStack[], 
//input_iis as IItemStack[], input_iode as IOreDictEntry[], input_iode_amounts as int[], input_unconsumed as IItemStack[]
static HOA_time as int[] = [5, 10, 20, 40, 120];
static HOA_energy as int[] = [32, 256, 1000, 10000, 100000];

function addHighOvenAlloy(rname as string, level as int, output as IItemStack[], inputs as IItemStack[]){
    scripts.modular_machines.addMMRecipe(
        rname, "high_oven", HOA_time[level] * 20, HOA_energy[level],
        output,
        inputs, [], [], []
    );    
}
function addHighOvenSmelting(output as IItemStack[], inputs as IItemStack[], fluids as ILiquidStack[], time as int, energy as int){
	var rec = RecipeBuilder.newBuilder("high_oven_" + output[0].name, "high_oven", time);

    if (energy != 0) {rec.addEnergyPerTickInput(energy);}

    for o in output{
        rec.addItemOutput(o);
    }

    for i in inputs{
        rec.addItemInput(i);
    }
    
	for f in fluids{
		rec.addFluidInput(f);
	}
    rec.build();
}

function addPlantStationRecipe(
	catalyst as IItemStack, out as IItemStack[], inp as IItemStack[], fl as ILiquidStack, time_sec as int
){
	var rec = RecipeBuilder.newBuilder("ps_" + out[0].name + "_" + inp[0].name, "plant_station", time_sec * 20);
	rec.addEnergyPerTickInput(128);

	for o in out{
        rec.addItemOutput(o);
    }

    for i in inp{
        rec.addItemInput(i);
    }
	if (catalyst){
		rec.addItemInput(catalyst);
		rec.setChance(0.0);
    }
	if (fl){rec.addFluidInput(fl);}
    rec.build();
}



function addFluidMixerRecipe(out as ILiquidStack, inp1 as ILiquidStack, inp2 as ILiquidStack, inp as IItemStack, rf_tick as int, time as int){


	//req recipe
	scripts.content_machines.addFluidMixerRecipe(
		out, 
		inp1, inp2, 
		inp, 
		time, rf_tick
	);
}
function addFluidAlloyerRecipe(out as IItemStack, inp1 as IItemStack, inp2 as IItemStack, fluid as ILiquidStack, rf_tick as int, time as int){

	//
	scripts.content_machines.addFluidAlloyerRecipe(
		out, 
		inp1, inp2, 
		fluid, 
		time, rf_tick
	);
}


function addCarryRecipe(out as IItemStack, inp as IItemStack, other as IIngredient[][]){
	recipes.addShaped("ia_carry_" ~ out.displayName, out, [
		[other[0][0], other[0][1], other[0][2]],
		[other[1][0], inp.marked("mark"), other[1][1]],
		[other[2][0], other[2][1], other[2][2]],
	],function(out, ins, cInfo){
		return out.withTag(ins.mark.tag);
	}, 
	null);
}


static numberLetters as string[] = [
	"K",
	"M",
	"B",
	"T"
];
function turnNumberToString(n as int) as string{
	var ends = "";
	var nn = n;

	for i in 0 to 4{
		if (nn % 1000 == 0){
			ends = numberLetters[i];
			nn /= 1000;
		}else if (nn % 1000 == 500){
			ends = ".5" ~ numberLetters[i];
			nn /= 1000;
			break;
		}else break;
	}

	return nn ~ ends;
}
function turnIntToStringWithLeadingZeros(n as int, tot as int){
	var ans as string = "" ~ n;
	while (tot > ans.length()){
		ans = "0" ~ ans;
	}
	return ans;
}
function turnFloatToString(n as float, prec as int = 2){
	var power = 1 as int;
	for i in 0 .. prec
		power *= 10;
	
	var num as int = Math.round(n * power);

	return "" ~ (num / power) ~ "." ~ turnIntToStringWithLeadingZeros(num % power, prec);
}