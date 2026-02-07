import mods.immersiveengineering.DieselHandler;

import mods.thermalexpansion.NumisticDynamo;

import mods.enderio.CombustionGen;


import mods.modularmachinery.RecipeBuilder;

import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;



function DieselHandler_addFuel_jei(fuel as ILiquidStack, time as int){
    scripts.jei.addJEIhint(
        [<ae2fc:fluid_drop>.withTag({Fluid: fuel.name}).withDisplayName("Consumed per tick") * (1000 / time)], [fuel],
        [
            <immersiveengineering:metal_multiblock:10>
        ], [], []
    );
}
function DieselHandler_addFuel(fuel as ILiquidStack, time as int){
    DieselHandler_addFuel_jei(fuel, time);
    DieselHandler.addFuel(fuel, time);
}
{//diesel engine fuels
	// 20 mb/t = 50
	// 10 mb/t = 100
	//biodiesel 8 mb/t = 125 
	//diesel 5 mb/t = 200
	// 4 mb/t = 250
	// 3 mb/t = 333.3
	// 2 mb/t = 500
	// 1 mb/t = 1000
	//DieselHandler.addFuel(ILiquidStack fuel, int time);
    DieselHandler_addFuel_jei(<liquid:biodiesel>, 125);
    DieselHandler_addFuel_jei(<liquid:diesel>, 200);

	//thermal
	DieselHandler_addFuel(<liquid:refined_fuel>, 125);
	DieselHandler_addFuel(<liquid:refined_biofuel>, 100);
	//canola
	DieselHandler_addFuel(<liquid:refinedcanolaoil>, 100);
	DieselHandler_addFuel(<liquid:crystaloil>, 200);
	DieselHandler_addFuel(<liquid:empoweredoil>, 500);

	DieselHandler_addFuel(<liquid:biofuel>, 100);

    //contenttweaker
    DieselHandler_addFuel(<liquid:enriched_diesel1>, 250);
    DieselHandler_addFuel(<liquid:enriched_diesel2>, 1000);
    DieselHandler_addFuel(<liquid:nuit_fuel>, 500);

	
}

{//NumisticDynamo
    NumisticDynamo.addGemFuel(<erebus:materials:11>, 250*1000);

    NumisticDynamo.addGemFuel(<contenttweaker:malachite_vase>, 2000000);
    NumisticDynamo.addGemFuel(<contenttweaker:gem_steel_ingot>, 1000*1000*1000);

    NumisticDynamo.addGemFuel(<aether_legacy:ambrosium_shard>, 350*1000);
    NumisticDynamo.addGemFuel(<aether_legacy:zanite_gemstone>, 400*1000);

    NumisticDynamo.addGemFuel(<taiga:dilithium_crystal>, 750*1000);
    NumisticDynamo.addGemFuel(<integrateddynamics:crystalized_chorus_chunk>, 250*1000);
    NumisticDynamo.addGemFuel(<biomesoplenty:crystal_shard>, 500*1000);
}

{//enderio combustion gen
    CombustionGen.removeFuel(<liquid:hootch>);
    CombustionGen.removeFuel(<liquid:oil>);
    CombustionGen.removeFuel(<liquid:tree_oil>);
    CombustionGen.removeFuel(<liquid:seed_oil>);
    CombustionGen.removeFuel(<liquid:refined_oil>);
    CombustionGen.removeFuel(<liquid:crude_oil>);
    CombustionGen.removeFuel(<liquid:coal>);
    CombustionGen.removeFuel(<liquid:creosote>);
    CombustionGen.removeFuel(<liquid:if.protein>);
    CombustionGen.removeFuel(<liquid:biofuel>);
    CombustionGen.removeFuel(<liquid:fire_water>);
    
    CombustionGen.removeFuel(<liquid:refined_fuel>);
    CombustionGen.removeFuel(<liquid:empoweredoil>);
    CombustionGen.removeFuel(<liquid:biodiesel>);
    CombustionGen.removeFuel(<liquid:diesel>);
    CombustionGen.removeFuel(<liquid:gasoline>);
    CombustionGen.removeFuel(<liquid:refined_biofuel>);


    CombustionGen.removeFuel(<liquid:canolaoil>);
    CombustionGen.removeFuel(<liquid:refinedcanolaoil>);
    CombustionGen.removeFuel(<liquid:crystaloil>);

    

    CombustionGen.removeCoolant(<liquid:water>);

    //conclusion
    //addFual(fuel, rft, tick per mb at 1 capacitor * 1000)


    //addFuel(ILiquidStack fuel, int powerPerCycleRF, int totalBurnTime);
    CombustionGen.addFuel(<liquid:enriched_diesel1>, 25 * 1000, 120 * 1000);
    CombustionGen.addFuel(<liquid:nuit_fuel>, 25 * 1000, 120 * 1000);
    CombustionGen.addFuel(<liquid:sunnarium_base>, 20 * 1000, 60 * 1000);
    CombustionGen.addFuel(<liquid:flowers_depleted>, 500 * 1000, 30 * 1000);
    //expected rf
    //basic, 3 cap -> 4 -> 4*10+10 = 50    ---> 15
    //adv, 3 cap -> 110
    //1 cap -> 2 -> 2*10+10 = 30  ---> 10
    //adv 1 cap -> 70

    //alt rf = (cap+3)*power

    CombustionGen.addCoolant(<liquid:cold_nitrogen>, 1.0 / 6.0);
    CombustionGen.addCoolant(<liquid:society>, 20.0 / 6.0);
    
    //100.0/6
    //expect  ~730
    //got 2 342 391

    //1.0/6
    //expect 23 423 
    //got 23 424

    //CombustionGen.addCoolant(<liquid:pure_water>, 100.0 / 6.0 / 2342391.0 * 73.0);
    //100.0 / 6.0 / 2342391.0 * 73.0
    //expect 73 = water
    //got 17?

    /*
    public class CombustionMath {

  public static final double HEAT_PER_RF = 0.00023F / 2f;

  private final int ticksPerCoolant;
  private final int ticksPerFuel;
  private final int energyPerTick;

  machineQuality = 1, 2
    
    energyPerTick = Math.round(fuel.getPowerPerCycle() * capQuality * machineQuality);

    cooling = coolant.getDegreesCoolingPerMB(); // heat absorbed per mB
    toCool = HEAT_PER_RF * energyPerTick * machineQuality; // heat per tick
    ticksPerCoolant = Math.max((int) Math.round(cooling / toCool), 1);
    = 2 * coolant.getDegreesCoolingPerMB / (0.00023F * energyPerTick * machineQuality)
    = 2 * coolant.getDegreesCoolingPerMB / (0.00023F * energyPerTick)

    ticksPerFuel = Math.max((int) (fuel.getTotalBurningTime() / capQuality / 1000), 1);
    =fuel.getTotalBurningTime() / capQuality / 1000
  
    canola
    1 cap, basic -> 20rf/t, f 6 t/mb, c 73 t/mb,    50, , 15
    2 cap, basic -> 25rf/t, 4, 59                   60, , 12
    3 cap, basic -> 30rf/t, 4, 49                   70, , 10
    4 cap, basic -> 35rf/t,                         80, , 9
    5 cap, basic -> 40rf/t                          90, , 8

    rft
    basic->advanced = x -> 2x+10

    3 cap -> 4 -> 4*5+10
    3 cap adv -> 4 -> 2*(4*5+10)+10

    cooling


    fuel



    */
}
