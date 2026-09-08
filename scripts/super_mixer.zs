import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.WeightedItemStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeModifierBuilder;



scripts.content_machines.addAssemblerRecipe(
	[<contenttweaker:rotor>], 
	[
		<contenttweaker:crystal_metal_plate> * 4,
		<contenttweaker:living_motor>,
		<contenttweaker:ev_coil> * 4,
		<contenttweaker:tablet_evil>,
		<requious:advanced_mixer>,
		<bloodmagic:demon_extras:13> * 2
	], <liquid:watertight_steel> * 1500,
	20, 10000
);
scripts.content_machines.addAssemblerRecipe(
	[<contenttweaker:rotor2>], 
	[
		<contenttweaker:kikeridan_plate> * 4,
		<contenttweaker:rotor>,
		<contenttweaker:electric_core> * 4,
		<contenttweaker:vortexed_ingot>,
		<requious:advanced_mixer> * 4,
		<bloodmagic:demon_extras:13> * 2
	], <liquid:watertight_steel> * 1500,
	20, 10000
);
scripts.content_machines.addAssemblerRecipe(
	[<contenttweaker:rotor>], 
	[
		<contenttweaker:crystal_metal_plate> * 4,
		<contenttweaker:living_motor>,
		<contenttweaker:ev_coil> * 4,
		<contenttweaker:tablet_evil>,
		<requious:advanced_mixer>,
		<bloodmagic:demon_extras:13> * 2
	], <liquid:watertight_steel> * 1500,
	20, 10000
);











<ore:rocketFuelA>.addItems([
    <contenttweaker:singularity_dust>,
    <contenttweaker:moon_dust>,
    <contenttweaker:fuel_coral>
]);

<ore:rocketFuelB>.addItems([
    <extendedcrafting:singularity_custom:29>,
    <contenttweaker:polonium_dust>
]);





{var rec = RecipeBuilder.newBuilder("leap", "super_mixer", 20 * 1);

    rec.addEnergyPerTickInput(256000);

    rec.addItemInput(<alchemistry:ingot:52> * 4);
    rec.addItemInput(<taiga:vibranium_ingot> * 4);
    rec.addItemInput(<botania:manaresource:3>);
    rec.addItemInput(<contenttweaker:awaken_witherite> * 8);
    rec.addFluidInput(<liquid:yellow> * 2000);
    rec.addGridPowerInput(100);

    
    rec.addFluidOutput(<liquid:leap> * 10000);

    rec.build();
}



{var rec = RecipeBuilder.newBuilder("flower_plasma", "super_mixer", 20 * 1);

    rec.addEnergyPerTickInput(2560000);

    rec.addItemOutputs(
        <contenttweaker:methyst_dust>, <contenttweaker:methyst_dirty_dust>
    );
    rec.addItemInputs(
        <contenttweaker:activated_biopower> * 4,
        <moretcon:gemelectarite> * 2,
        <contenttweaker:methyst> * 2,
        <mysticalagriculture:crafting:6>
    );
    rec.addItemInput(<contenttweaker:plasma_gen>).setChance(0.0);
    
    rec.addFluidInputs(
        <liquid:biotite> * 1500,
        <liquid:fire> * 50
    );
    rec.addManaInput(10000, false);

    rec.addCatalystInput(
        <contenttweaker:flower_nether_eye> * 4,
        ["Output fluid x1.5"],
        [
            RecipeModifierBuilder.create("modularmachinery:fluid", "output", 1.5, 1, false).build()
        ]
    ).setChance(0.5);
    rec.addCatalystInput(
        <moretcon:gemechostone> * 4,
        ["Output fluid x1.5"],
        [
            RecipeModifierBuilder.create("modularmachinery:fluid", "output", 1.5, 1, false).build()
        ]
    ).setChance(0.5);
    
    
    rec.addFluidOutput(<liquid:flowers> * 3000);

    rec.build();

}
{var rec = RecipeBuilder.newBuilder("society", "super_mixer", 20 * 1);

    rec.addEnergyPerTickInput(25600000);

    rec.addItemOutputs(
        <contenttweaker:gaia_catalyst_used>
    );
    rec.addItemInputs(
        <contenttweaker:gaia_catalyst>
    );
    
    rec.addFluidInputs(
        <liquid:society> * 2000,
        <liquid:vile> * 2000
    );

    rec.addCatalystInput(
        <contenttweaker:joker_fish> * 4,
        ["Output fluid x1.5"],
        [
            RecipeModifierBuilder.create("modularmachinery:fluid", "output", 1.5, 1, false).build()
        ]
    ).setChance(0.5);
    
    
    rec.addFluidOutput(<liquid:society2> * 2000);

    rec.build();

}

{//sarahanium
    var rec = RecipeBuilder.newBuilder("sarahanium", "super_mixer", 20 * 1);

    rec.addEnergyPerTickInput(256 * 100 * 1000);

    rec.addItemOutputs(
        <contenttweaker:gaia_catalyst_used>,
        <contenttweaker:sarahanium> * 4
    );
    rec.addItemInputs(
        <contenttweaker:gaia_catalyst>,
        <contenttweaker:sarahanium_base> * 4,
        <contenttweaker:c14_dust> * 16,
        <contenttweaker:terra_base_dust> * 16
    );
    
    rec.addWillInput(
        "CORROSIVE", 50
    );
    

    rec.build();
}
mods.enderio.AlloySmelter.addRecipe(<contenttweaker:sarahanium_compressed>, 
    [
        <contenttweaker:sarahanium>,
        <contenttweaker:illagerite_compressed> * 16,
        <mekanism:compressedobsidian> * 16
    ], 5 * 1000 * 1000
);