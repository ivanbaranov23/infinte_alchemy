
recipes.remove(<thermaldynamics:duct_0>);
recipes.addShaped("ia_lead_fluxduct", <thermaldynamics:duct_0> * 6, [
	[<immersiveengineering:wirecoil:5>, <immersiveengineering:wirecoil:5>, <immersiveengineering:wirecoil:5>], 
	[<moreplates:lead_stick>, <minecraft:glass>, <moreplates:lead_stick>], 
	[<immersiveengineering:wirecoil:5>, <immersiveengineering:wirecoil:5>, <immersiveengineering:wirecoil:5>]
]);

recipes.remove(<thermaldynamics:duct_16>);
recipes.addShaped("ia_fluiduct0", <thermaldynamics:duct_16> * 8, [
	[null, <moreplates:copper_stick>, null], 
	[<moreplates:copper_stick>, <minecraft:glass>, <moreplates:copper_stick>], 
	[null, <moreplates:copper_stick>, null]
]);
recipes.remove(<thermaldynamics:duct_16:1>);
recipes.addShaped("ia_fluiduct1", <thermaldynamics:duct_16:1> * 8, [
	[null, <moreplates:copper_stick>, null], 
	[<moreplates:copper_stick>, <thermalfoundation:material:131>, <moreplates:copper_stick>], 
	[null, <moreplates:copper_stick>, null]
]);

recipes.remove(<thermaldynamics:duct_16:2>);
recipes.addShaped("ia_fluiduct2", <thermaldynamics:duct_16:2> * 8, [
	[null, <moreplates:invar_stick>, null], 
	[<moreplates:invar_stick>, <thermalfoundation:glass:3>, <moreplates:invar_stick>], 
	[null, <moreplates:invar_stick>, null]
]);
recipes.remove(<thermaldynamics:duct_16:3>);
recipes.addShaped("ia_fluiduct3", <thermaldynamics:duct_16:3> * 8, [
	[null, <moreplates:invar_stick>, null], 
	[<moreplates:invar_stick>, <thermalfoundation:material:131>, <moreplates:invar_stick>], 
	[null, <moreplates:invar_stick>, null]
]);

recipes.remove(<thermaldynamics:duct_0:6>);
recipes.addShaped("ia_fluxduct6", <thermaldynamics:duct_0:6> * 8, [
	[null, <moreplates:electrum_stick>, null], 
	[<moreplates:electrum_stick>, <thermalfoundation:glass:3>, <moreplates:electrum_stick>], 
	[null, <moreplates:electrum_stick>, null]
]);