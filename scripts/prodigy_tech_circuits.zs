#priority 10
import mods.prodigytech.solderer;
import mods.prodigytech.infusion;

//circuits
recipes.remove(<prodigytech:circuit_plate>);

//patterns
recipes.remove(<prodigytech:pattern_circuit_crude>);
recipes.addShapeless("ia_pattern_circuit_crude", <prodigytech:pattern_circuit_crude>, [<prodigytech:inferno_crystal>, <ore:ingotAluminum>, <prodigytech:circuit_plate>]);

recipes.remove(<prodigytech:pattern_circuit_refined>);
recipes.addShaped("ai_pattern_circuit_refined", <prodigytech:pattern_circuit_refined>, [
	[null, <prodigytech:circuit_plate>, null], 
	[<ore:stickConstantan>, <prodigytech:pattern_circuit_crude>, <ore:stickConstantan>], 
	[null, <prodigytech:circuit_crude>, null]
]);

recipes.remove(<prodigytech:pattern_circuit_perfected>);
recipes.addShaped("ia_pattern_circuit_perfected", <prodigytech:pattern_circuit_perfected>, [
	[<prodigytech:heat_capacitor_0>, <prodigytech:circuit_refined>, <prodigytech:heat_capacitor_0>], 
	[<prodigytech:circuit_refined>, <prodigytech:pattern_circuit_refined>, <prodigytech:circuit_refined>], 
	[<prodigytech:heat_capacitor_0>, <prodigytech:circuit_refined>, <prodigytech:heat_capacitor_0>]
]);


//infusions


infusion.addInfusion("pure_gold", 3, "ia.pt_infusion.pure_gold.name")
    .addMachine("solderer")
    .addItem(<contenttweaker:pure_gold_dust>, 9)
    .register();







solderer.removeAll();
{//crude
	solderer.addRecipe(<prodigytech:pattern_circuit_crude>,
		<contenttweaker:zinc_ingot> * 8, <prodigytech:circuit_crude>, 12
	);
	solderer.addRecipe(<prodigytech:pattern_circuit_crude>,
		<contenttweaker:zinc_wire> * 4, <prodigytech:circuit_crude>, 12
	);

	solderer.addRecipe(<contenttweaker:research_circuit1>,
		<contenttweaker:bocuit>, <prodigytech:circuit_crude> * 4, 12
	);
    solderer.addRecipe(<contenttweaker:research_circuit1>,
        <contenttweaker:bocuit>, <prodigytech:circuit_plate>, <prodigytech:circuit_crude> * 32, "pure_gold", 9
    );
}{//refined
	recipes.addShaped("ia_pt_crude_chip1", <contenttweaker:pt_crude_chip>, [
		[<moreplates:hammer>.anyDamage().transformDamage(), <contenttweaker:gold_coil>],
		[null, <contenttweaker:zinc_plate>],
		[null, <prodigytech:circuit_crude>]
	]);
	mods.appliedenergistics2.Inscriber.addRecipe(
		<contenttweaker:pt_crude_chip>, <contenttweaker:zinc_plate>, false, 
		<contenttweaker:gold_coil>, <prodigytech:circuit_crude>
	);

	recipes.addShaped("ia_pt_crude_chip2", <contenttweaker:pt_crude_chip>, [
		[<moreplates:hammer>.anyDamage().transformDamage(), <thermalfoundation:material:25>],
		[null, <contenttweaker:zinc_plate>],
		[null, <prodigytech:circuit_crude>]
	]);
	mods.appliedenergistics2.Inscriber.addRecipe(
		<contenttweaker:pt_crude_chip>, <contenttweaker:zinc_plate>, false, 
		<thermalfoundation:material:25>, <prodigytech:circuit_crude>
	);

	solderer.addRecipe(<prodigytech:pattern_circuit_refined>,
		<contenttweaker:pt_crude_chip>, <prodigytech:circuit_refined>, 24
	);

	solderer.addRecipe(<contenttweaker:research_circuit1>,
		<contenttweaker:pt_crude_chip>, <prodigytech:circuit_refined> * 2, 24
	);

    solderer.addRecipe(<contenttweaker:research_circuit1>,
        <contenttweaker:pt_crude_chip>, <prodigytech:circuit_plate>, <prodigytech:circuit_refined> * 32, "pure_gold", 18
    );
}{//perfected
	recipes.addShaped("ia_pt_refined_chip", <contenttweaker:pt_refined_chip>, [
		[<moreplates:hammer>.anyDamage().transformDamage(), <contenttweaker:gold_coil>],
		[null, <moreplates:diamond_plate>],
		[null, <prodigytech:circuit_refined>]
	]);
	mods.appliedenergistics2.Inscriber.addRecipe(
		<contenttweaker:pt_refined_chip>, <moreplates:diamond_plate>, false, 
		<contenttweaker:gold_coil>, <prodigytech:circuit_refined>
	);

	solderer.addRecipe(<prodigytech:pattern_circuit_perfected>,
		<contenttweaker:pt_refined_chip>, <prodigytech:circuit_perfected>, 36
	);

	solderer.addRecipe(<contenttweaker:research_circuit1>,
		<contenttweaker:pt_refined_chip>, <prodigytech:circuit_perfected> * 2, 36
	);

    solderer.addRecipe(<contenttweaker:research_circuit1>,
        <contenttweaker:pt_refined_chip>, <prodigytech:circuit_plate>, <prodigytech:circuit_perfected> * 32, "pure_gold", 27
    );
}
