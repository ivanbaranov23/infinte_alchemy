


{//conduits
	//item
	recipes.remove(<enderio:item_item_conduit>);
	recipes.addShaped("ia_item_conduit", <enderio:item_item_conduit> * 8, [
		[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>], 
		[<ore:ingotPulsatingIron>, <thermaldynamics:duct_32:2>, <ore:ingotPulsatingIron>], 
		[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>]
	]);

	//fluid
	recipes.addShaped("ia_fluid_conduit1", <enderio:item_liquid_conduit> * 8, [
		[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>], 
		[<contenttweaker:watertight_steel_dust>, <contenttweaker:watertight_steel_rod>, <contenttweaker:watertight_steel_dust>], 
		[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>]
	]);
	recipes.remove(<enderio:item_liquid_conduit:1>);
	recipes.remove(<enderio:item_liquid_conduit:2>);
	recipes.addShaped("ia_fluid_conduit2_1", <enderio:item_liquid_conduit:2> * 12, [
		[<enderio:item_liquid_conduit>, <contenttweaker:watertight_steel_rod>, <enderio:item_liquid_conduit>], 
		[<enderio:item_liquid_conduit>, <contenttweaker:research_fluids>.reuse(), <enderio:item_liquid_conduit>], 
		[<enderio:item_liquid_conduit>, <contenttweaker:watertight_steel_rod>, <enderio:item_liquid_conduit>]
	]);
	recipes.addShaped("ia_fluid_conduit2_2", <enderio:item_liquid_conduit:2> * 20, [
		[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>], 
		[<enderio:item_liquid_conduit>, <ore:nuggetVibrantAlloy>, <enderio:item_liquid_conduit>], 
		[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>]
	]);

	//gas
	recipes.remove(<enderio:item_gas_conduit:1>);
	recipes.remove(<enderio:item_gas_conduit:2>);
	recipes.addShaped("ia_gas_conduit", <enderio:item_gas_conduit:2> * 8, [
		[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>], 
		[<contenttweaker:gastight_steel_dust>, <contenttweaker:gastight_steel_rod>, <contenttweaker:gastight_steel_dust>], 
		[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>]
	]);

	//conduit
	<enderio:item_extract_speed_upgrade>.displayName = "Conduit Extract Speed Upgrade";
	recipes.remove(<enderio:item_extract_speed_upgrade>);
	recipes.addShaped("ia_item_extract_speed_upgrade", <enderio:item_extract_speed_upgrade> * 5, [
		[<enderio:item_material:4>, <moreplates:electrical_steel_gear>, <enderio:item_material:4>], 
		[<enderio:item_material:4>, <thermalexpansion:augment:128>, <enderio:item_material:4>], 
		[<enderio:item_material:4>, <moreplates:alumite_gear>, <enderio:item_material:4>]
	]);
	<enderio:item_extract_speed_downgrade>.displayName = "Conduit Extract Speed Downgrade";
	recipes.remove(<enderio:item_extract_speed_downgrade>);
	recipes.addShaped("ia_item_extract_speed_downgrade", <enderio:item_extract_speed_downgrade> * 3, [
		[<enderio:item_material:4>, <moreplates:alumite_gear>, <enderio:item_material:4>], 
		[<enderio:item_material:4>, <thermalexpansion:augment:128>, <enderio:item_material:4>], 
		[<enderio:item_material:4>, <moreplates:electrical_steel_gear>, <enderio:item_material:4>]
	]);

	{//energy
		recipes.remove(<enderio:item_endergy_conduit>);
		recipes.remove(<enderio:item_endergy_conduit:1>);
		recipes.remove(<enderio:item_endergy_conduit:5>);
		recipes.remove(<enderio:item_endergy_conduit:2>);

		recipes.remove(<enderio:item_endergy_conduit:3>);
		recipes.addShaped("ia_gold_conduit", <enderio:item_endergy_conduit:3> * 8, [
			[<enderio:item_material:4>, <enderio:item_material:4>, <enderio:item_material:4>], 
			[<contenttweaker:gold_wire>, <contenttweaker:gold_wire>, <contenttweaker:gold_wire>], 
			[<enderio:item_material:4>, <enderio:item_material:4>, <enderio:item_material:4>]
		]);
        scripts.content_machines.addAssemblerRecipe(
            [<enderio:item_endergy_conduit:3> * 12],
            [<enderio:item_material:4> * 6, <contenttweaker:gold_wire> * 3],
            null,
            10, 64
        );

		recipes.remove(<enderio:item_endergy_conduit:4>);
		recipes.addShaped("ia_copper_conduit", <enderio:item_endergy_conduit:4> * 8, [
			[<enderio:item_material:4>, <enderio:item_material:4>, <enderio:item_material:4>], 
			[<immersiveengineering:wirecoil>, <enderio:item_endergy_conduit:3>, <immersiveengineering:wirecoil>], 
			[<enderio:item_material:4>, <enderio:item_material:4>, <enderio:item_material:4>]
		]);
        scripts.content_machines.addAssemblerRecipe(
            [<enderio:item_endergy_conduit:4> * 12],
            [<enderio:item_material:4> * 6, <immersiveengineering:wirecoil> * 2, <enderio:item_endergy_conduit:3>],
            null,
            10, 64
        );

		recipes.remove(<enderio:item_endergy_conduit:6>);
		recipes.addShaped("ia_electrum_conduit", <enderio:item_endergy_conduit:6> * 8, [
			[<enderio:item_material:4>, <enderio:item_material:4>, <enderio:item_material:4>], 
			[<immersiveengineering:wirecoil:1>, <enderio:item_endergy_conduit:4>, <immersiveengineering:wirecoil:1>], 
			[<enderio:item_material:4>, <enderio:item_material:4>, <enderio:item_material:4>]
		]);
        scripts.content_machines.addAssemblerRecipe(
            [<enderio:item_endergy_conduit:6> * 12],
            [<enderio:item_material:4> * 6, <immersiveengineering:wirecoil:1> * 2, <enderio:item_endergy_conduit:4>],
            null,
            10, 64
        );
		
        recipes.remove(<enderio:item_endergy_conduit:7>);
        recipes.addShaped("ia_e_silver_conduit", <enderio:item_endergy_conduit:7> * 4, [
			[<enderio:item_material:4>, <contenttweaker:insulation_strand>, <enderio:item_material:4>], 
			[<enderio:item_alloy_endergy_ingot:5>, <enderio:item_endergy_conduit:6>, <enderio:item_alloy_endergy_ingot:5>], 
			[<enderio:item_material:4>, <contenttweaker:insulation_strand>, <enderio:item_material:4>]
		]);
        scripts.content_machines.addAssemblerRecipe(
            [<enderio:item_endergy_conduit:7> * 8],
            [<enderio:item_material:4> * 4, <contenttweaker:insulation_strand> * 2, <enderio:item_alloy_endergy_ingot:5> * 2, <enderio:item_endergy_conduit:6>],
            null,
            10, 64
        );

        recipes.remove(<enderio:item_endergy_conduit:8>);
        scripts.content_machines.addAssemblerRecipe(
            [<enderio:item_endergy_conduit:8> * 8],
            [
                <enderio:item_material:4> * 4, 
                <contenttweaker:insulation_strand> * 2, 
                <enderio:item_alloy_endergy_ingot:1> * 2,
                <contenttweaker:tungsten_coil> * 2,
                <enderio:item_endergy_conduit:7>
            ],
            <liquid:noble_gases> * 500,
            10, 64
        );

        recipes.remove(<enderio:item_endergy_conduit:9>);
        scripts.content_machines.addAssemblerRecipe(
            [<enderio:item_endergy_conduit:9> * 8],
            [
                <enderio:item_material:4> * 8, 
                <contenttweaker:insulation_strand> * 4, 
                <enderio:item_alloy_endergy_ingot:4> * 2,
                <enderio:item_material:42>,
                <enderio:item_endergy_conduit:8>
            ],
            <liquid:noble_gases> * 500,
            10, 64
        );

		recipes.remove(<enderio:item_endergy_conduit:10>);
        scripts.content_machines.addAssemblerRecipe(
            [<enderio:item_endergy_conduit:10> * 8, <contenttweaker:reinforced_cell>],
            [
                <enderio:item_material:4> * 24, 
                <contenttweaker:insulation_fabric> * 4, 
                <enderio:item_alloy_endergy_ingot:2> * 2,
                <contenttweaker:lightning_cell>,
                <enderio:item_endergy_conduit:9>
            ],
            <liquid:noble_gases> * 1000,
            10, 64
        );

        recipes.remove(<enderio:item_endergy_conduit:11>);
        scripts.content_machines.addAssemblerRecipe(
            [<enderio:item_endergy_conduit:11> * 8, <contenttweaker:reinforced_cell> * 4],
            [
                <enderio:item_material:4> * 64, 
                <enderio:block_industrial_insulation> * 4, 
                <enderio:item_alloy_endergy_ingot:3> * 4,
                <contenttweaker:star_polymer>,
                <contenttweaker:lightning_cell> * 4,
                <enderio:item_endergy_conduit:10>
            ],
            <liquid:noble_gases> * 1000,
            10, 64
        );


	}
}