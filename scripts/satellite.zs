/*
big idea:
    -launch satellite
    -search for asteroids
    -launch drones for res

asteroids: 
    -res
    -uniq res
    -weight + min

*/



import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;

import crafttweaker.data.IData;


import mods.requious.Assembly;

import mods.requious.AssemblyRecipe;

import mods.modularmachinery.RecipeBuilder;


static Colors as string[string] = {
    red: "§4",
    yellow: "§6",
    green: "§2",
    reset: "§r"
};
static NewLine as string = "\n";
function getColor(v as double){
    if (v > 0.0)
        return Colors.green;
    if (0.0 > v)
        return Colors.red;
    return Colors.yellow;
}
//{\"text\":\"\\n\"}

<contenttweaker:space_data>.addAdvancedTooltip(function(item){
    if (item.tag.memberGet("data")){
        return "Data: " ~ Colors.yellow ~ item.tag.data;
    }
    
    return "Data: " ~ Colors.red ~ "unspecified";
});
<contenttweaker:satellite_chip>.addAdvancedTooltip(function(item){
    if (item.tag.memberGet("data")){
        


        return "Data: " ~ Colors.yellow ~ item.tag.data;
    }
    
    return "Data: " ~ Colors.red ~ "unspecified";
});
<contenttweaker:space_navigator>.addAdvancedTooltip(function(item){
    if (item.tag.memberGet("target")){
        


        return "Target: " ~ Colors.yellow ~ item.tag.target;
    }
    
    return "Target: " ~ Colors.red ~ "none";
});


<contenttweaker:satellite_computer>.addAdvancedTooltip(function(item){
    if (item.tag.memberGet("satellite_power")){
        


        return "Satellite Power: " ~ Colors.yellow ~ item.tag.satellite_power;
    }
    
    return "Satellite Power: " ~ Colors.red ~ "0";
});


<contenttweaker:satellite1>.addTooltip("Satellite Power: 10");
<contenttweaker:satellite2>.addTooltip("Satellite Power: 100");
<contenttweaker:satellite3>.addTooltip("Satellite Power: 1000");



{//recipes
    scripts.content_machines.addAssemblerRecipe(
        [<contenttweaker:satellite_plating_base1> * 2],
        [
            <contenttweaker:explosion_resistant_plate> * 4,
            <contenttweaker:gastight_steel_plate> * 2,
            <contenttweaker:advanced_plating2_2>,
            <contenttweaker:vibralcum_plate>,
            <contenttweaker:acid_resistant_steel_plate>,
            <contenttweaker:advanced_plating1_4>
        ],
        <liquid:tignalum> * (144 * 8), 20, 2000
    );
    {
        var rec = RecipeBuilder.newBuilder("satellite_plating_base2", "explosion_compressor", 30);

        rec.addEnergyPerTickInput(3000);

        rec.addItemOutput(<contenttweaker:satellite_plating_base2>);
        rec.addItemOutput(<contenttweaker:explosion_device>);
        
        rec.addItemInput(<contenttweaker:satellite_plating_base1>);
        rec.addItemInput(<redstonearsenal:material:224>);
        rec.addItemInput(<contenttweaker:superglue> * 6);
        rec.addItemInput(<contenttweaker:explosion_device_full>);

        rec.build();
    }

	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:satellite_plating>],
		[
			<contenttweaker:satellite_plating_base2> * 8,
            <contenttweaker:living_steel_plate>,
			<contenttweaker:star_polymer>,
			<contenttweaker:nitinol_plate>,
			<contenttweaker:starmetal_plate> * 2,
            <botania:manaresource:22> * 8
		],
		<liquid:mirion2> * 576, 40, 4096
	);
    scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:satellite_plating2>],
		[
			<contenttweaker:satellite_plating> * 4,
            <contenttweaker:bedrockium_alloy_plate> * 16,
            <contenttweaker:fluxed_invar_plate> * 4,
            <contenttweaker:sunnarium_core>,
            <contenttweaker:pandemonium_plate>,
            <contenttweaker:moon_plate> * 3
		],
		<liquid:dark_matter> * 576, 40, 4096
	);

	scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:satellite_chip>.withTag({data: "none"})], 
		[
			<contenttweaker:star_polymer>,
			<contenttweaker:elf_mana_circuit> * 4,
			<contenttweaker:neuronium_plate>,
			<contenttweaker:nitinol_wire> * 4,
			<contenttweaker:conductive_alloy_wire> * 16,
			<contenttweaker:gambrosium_processor> * 4
		],
		<liquid:polyethylene> * 1000, 40, 4096
	);
    recipes.addShapeless("ia_sat_chip_reset", <contenttweaker:satellite_chip>.withTag({data: "none"}),
        [<contenttweaker:satellite_chip>]
    );

	scripts.content_machines.addAssemblerRecipe(
        [<contenttweaker:satellite1>],
        [
            <contenttweaker:signal_reciever>,
            <contenttweaker:satellite_plating> * 2,
            <contenttweaker:satellite_chip> * 2,
            <solarflux:solar_panel_6> * 4,
            <contenttweaker:robot_brain> * 4,
            <contenttweaker:rtg>
        ],
        <liquid:mirion2> * (8 * 144), 40, 4096
    );


    scripts.content_machines.addAssemblerRecipe(
        [<contenttweaker:satellite_computer>],
        [
            <contenttweaker:signal_reciever> * 3,
            <contenttweaker:satellite_plating> * 2,
            <contenttweaker:satellite_chip> * 4,
            <contenttweaker:mana_star>,
            <botania:managlass> * 16
        ],
        <liquid:mirion2> * (8 * 144), 40, 4096
    );

    //antenna
    scripts.content_machines.addAssemblerRecipe(
        [<contenttweaker:antenna_mk1>],
        [
            <contenttweaker:signal_reciever> * 5,
            <contenttweaker:satellite_plating>,
            <contenttweaker:satellite_chip> * 4,
            <contenttweaker:zirconium_mirror>
        ],
        <liquid:mirion2> * (8 * 144), 40, 4096
    );


    //drone
    scripts.content_machines.addAssemblerRecipe(
        [<contenttweaker:drone_base>],
        [
            <contenttweaker:satellite_plating> * 2,
            <contenttweaker:mechanical_eye>,
            <contenttweaker:rtg> * 4,
            <contenttweaker:robot_arm> * 2,
            <contenttweaker:satellite_chip> * 2
        ],
        <liquid:mirion2> * (8 * 144), 40, 4096
    );
    scripts.content_machines.addAssemblerRecipe(
        [<contenttweaker:drone>],
        [
            <contenttweaker:drone_base>,
            <contenttweaker:robot_arm> * 2,
            <actuallyadditions:item_drill:3>,
            <contenttweaker:rocket_engine> * 4
        ],
        null, 40, 4096
    );

    scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:crawler> * 4],
		[
			<contenttweaker:mechanical_eye>,
            <bloodmagic:component:30>,
            <contenttweaker:robot_arm> * 6,
            <contenttweaker:rtg>,
            <contenttweaker:elf_mana_circuit>
		],
		<liquid:mirion2> * 144, 40, 4096
	);
    scripts.content_machines.addAssemblerRecipe(
		[<contenttweaker:webbing_unit>],
		[
			<contenttweaker:crawler> * 8,
            <contenttweaker:nitinol_wire> * 8,
            <contenttweaker:satellite_chip> * 2
		],
		<liquid:mirion2> * 576, 40, 4096
	);
    

    scripts.content_machines.addAssemblerRecipe(
        [<contenttweaker:space_navigator>],
        [
            <contenttweaker:signal_reciever> * 3,
            <biomesoplenty:biome_finder>,
            <contenttweaker:mana_star>,
            <contenttweaker:satellite_chip> * 2
        ],
        null, 20, 1024
    );
}



/*

chip data
    -none
    -satellite linked
    -observations
    -meteor coords

*/
static satelliteController as Assembly = <assembly:satellite_controller>;
static sat_comp as IIngredient = <contenttweaker:satellite_computer>.marked("computer");



function addSatelliteChip(chip_data_in as string, sel_item as IItemStack, chip_data_out as string, min_sat as int, chance as float){
    print("[satellite]" ~ chip_data_in ~ chip_data_out);
    var recipe = AssemblyRecipe.create(function(container) {
        
        var comp as IItemStack = container.getItem("computer");
        if (comp){
            if (comp.tag.memberGet("satellite_power")){
                if (comp.tag.satellite_power >= min_sat){
                    
                    
                    //roll chances
                    var newSatNum = 0;
                    for i in 0 .. comp.tag.satellite_power{
                        if(container.random.nextDouble() > chance) newSatNum += 1;
                    }
                    container.addItemOutput("computer2", comp.withTag({satellite_power: newSatNum}));


                    

                    container.addItemOutput("output", <contenttweaker:satellite_chip>.withTag({data: chip_data_out}));





                }else{
                    //not enough sats
                    container.addItemOutput("output", <contenttweaker:satellite_chip>.withTag({data: "failed"}));
                    container.addItemOutput("computer2", comp);
                }

                
            }
            else{
                container.addItemOutput("computer2", comp);
            }
            
        }

        
    });
    

    recipe = recipe.requireItem("computer", sat_comp);
    recipe = recipe.requireItem("input", <contenttweaker:satellite_chip>.withTag({data: chip_data_in}));

    recipe = recipe.requireSelection("selection", sel_item.withLore([
        "Minimum Satellites: " ~ min_sat,
        "Satellite Breaking Chance: " ~ chance * 100.0 ~ "%" 
    ]), true);
    
    recipe = recipe.requireDuration("duration", 20);
    recipe = recipe.requireEnergy("power", 1000);

    satelliteController.addRecipe(recipe);
}
function addDroneMiningRecipe(chip_data_in as string, out as IItemStack, time_t as int, rft as int){
    recipes.addShapeless("ia_program_space_navigator_" ~ chip_data_in, <contenttweaker:space_navigator>.withTag({target: chip_data_in}),
        [
            <contenttweaker:space_navigator>,
            <contenttweaker:satellite_chip>,
            <contenttweaker:space_data>.withTag({data: chip_data_in})
        ]
    );

    var rec = RecipeBuilder.newBuilder(chip_data_in ~ "_drone", "satellite_launch_pad", time_t);
	rec.addEnergyPerTickInput(rft);

	rec.addItemInput(<contenttweaker:space_navigator>.withTag({target: chip_data_in}));
    rec.addItemOutput(<contenttweaker:space_navigator>.withTag({target: chip_data_in}));

    rec.addItemInput(<contenttweaker:drone>);
    rec.addItemInput(<contenttweaker:laser>);
    rec.addItemOutput(<contenttweaker:drone>);
    rec.addItemOutput(<contenttweaker:laser>);
	rec.addFluidInput(<liquid:rocket_fuel> * 1000);
	

	rec.addItemOutput(out);

	rec.build();
}
function addDroneVortexRecipe(it_in as IItemStack, it_out as IItemStack, time_t as int, rft as int){
    

    var rec = RecipeBuilder.newBuilder(it_in.name ~ "_drone", "satellite_launch_pad", time_t);
	rec.addEnergyPerTickInput(rft);

	rec.addItemInput(<contenttweaker:space_navigator>.withTag({target: "energy_vortex"}));
    rec.addItemOutput(<contenttweaker:space_navigator>.withTag({target: "energy_vortex"}));

    rec.addItemInput(<contenttweaker:drone>);
    rec.addItemInput(it_in);
    rec.addItemOutput(<contenttweaker:drone>);
    rec.addItemOutput(it_out);
	rec.addFluidInput(<liquid:rocket_fuel> * 1000);
	

	rec.build();
}


{//adding computer
    print("[REQ] adding computer");
    var recipe = AssemblyRecipe.create(function(container) {
        //container.addItemOutput("output", out);

        var comp as IItemStack = container.getItem("computer");
        container.addItemOutput("computer", comp);
    });

    recipe = recipe.requireItem("input", sat_comp);
    satelliteController.addRecipe(recipe);
}
{//readding computer
    print("[REQ] readding computer");
    var recipe = AssemblyRecipe.create(function(container) {
        //container.addItemOutput("output", out);

        var comp as IItemStack = container.getItem("computer");
        container.addItemOutput("computer", comp);
    });

    recipe = recipe.requireItem("computer2", sat_comp);
    satelliteController.addRecipe(recipe);
}
{//removing computer
    print("[REQ] removing computer");
    var recipe = AssemblyRecipe.create(function(container) {
        //container.addItemOutput("output", out);

        var comp as IItemStack = container.getItem("computer");
        container.addItemOutput("output0", comp);
    });
    recipe = recipe.requireSelection("selection", <minecraft:hopper>.withDisplayName("Remove Controller"), true);
    recipe = recipe.requireItem("computer", sat_comp);
    
    satelliteController.addRecipe(recipe);
}
{//adding satellite
    print("[REQ] adding satellite");
    var recipe = AssemblyRecipe.create(function(container) {
        //container.addItemOutput("output", out);

        var comp as IItemStack = container.getItem("computer");
        
        if (comp){
            var newTag as IData;

            if (comp.tag.memberGet("satellite_power")){
                newTag = {
                    satellite_power: comp.tag.satellite_power.asInt() + 10
                } as IData;
            }
            else{
                newTag = {
                    satellite_power: 10
                } as IData;
            }
            container.addItemOutput("computer2", comp.withTag(newTag));
        }
    });
    recipe = recipe.requireSelection("selection", <minecraft:chest>.withDisplayName("Add Satellite"), false);
    recipe = recipe.requireItem("computer", sat_comp);
    recipe = recipe.requireItem("input", <contenttweaker:satellite_chip>.withTag({data: "linked"}));
    
    recipe = recipe.requireEnergy("power", 1000);
    recipe = recipe.requireDuration("duration", 20);
    

    satelliteController.addRecipe(recipe);
    //satelliteController.addJEIRecipe(recipe);	
    
}



static chip_data as float[string][string] = {
    //name: [min_sat, weight, sat bonus, luck bonus]
    iron_asteroid: {
        minimum: 0, 
        weight: 1000, 
        min_tier: 0
    },
    copper_asteroid: {
        minimum: 5, 
        weight: 1000, 
        min_tier: 0
    },
    tin_asteroid: {
        minimum: 5, 
        weight: 1000, 
        min_tier: 0
    },

    nickel_asteroid: {
        minimum: 5, 
        weight: 1000, 
        min_tier: 0
    },
    aluminum_asteroid: {
        minimum: 5, 
        weight: 1000, 
        min_tier: 0
    },
    zinc_asteroid: {
        minimum: 5, 
        weight: 1000, 
        min_tier: 0
    },
    /*
    cobalt
    ardite

    gold
    silver
    lead
    osmium

    platinum
    

    */
    zirconium_asteroid: {
        minimum: 100, 
        weight: 1000, 
        min_tier: 0
    },
    dense_zirconium_asteroid: {
        minimum: 1000, 
        weight: 1000, 
        min_tier: 2
    },

    ice_comet: {
        minimum: 25, 
        weight: 400, 
        min_tier: 1
    },
    ice_comet: {
        minimum: 25, 
        weight: 400, 
        min_tier: 1
    },
    moon: {
        minimum: 50, 
        weight: 400, 
        min_tier: 1
    },
    energy_vortex: {
        minimum: 100, 
        weight: 350, 
        min_tier: 1
    },
    
};


{//search 1
    print("[satellite] search no bonus");
    var recipe = AssemblyRecipe.create(function(container) {
        var comp as IItemStack = container.getItem("computer");
        if (comp){
            //good
            if (comp.tag.memberGet("satellite_power")){
                //good

                //tier
                var tier as int = 0;
                var state1 = container.machine.world.getBlockState(container.machine.pos.getOffset(crafttweaker.world.IFacing.up(),1));
                var state2 = container.machine.world.getBlockState(container.machine.pos.getOffset(crafttweaker.world.IFacing.up(),2));
                var state3 = container.machine.world.getBlockState(container.machine.pos.getOffset(crafttweaker.world.IFacing.up(),3));
                if (state1.block.definition.id == "contenttweaker:antenna_mk1"){
                    tier += 1;
                    if (state2.block.definition.id == "contenttweaker:antenna_mk2"){
                        tier += 1;
                        if (state3.block.definition.id == "contenttweaker:antenna_mk3")
                            tier += 1;
                    }
                }
                
                
                if (comp.tag.satellite_power >= 1){
                    var satellite_power = comp.tag.satellite_power.asFloat();

                    var totalWeight = 0.0;
                    for posData in chip_data{
                        if ((satellite_power >= chip_data[posData].minimum)&&(tier >= chip_data[posData].min_tier)){
                            var weight = chip_data[posData].weight;
                            totalWeight += weight;
                        }
                    }

                    var result = container.random.nextDouble() * totalWeight;
                    var chip_data_out as string = "error";
                    for posData in chip_data{
                        if ((satellite_power >= chip_data[posData].minimum)&&(tier >= chip_data[posData].min_tier)){
                            var weight = chip_data[posData].weight;
                            if (weight >= result){
                                //roll is this
                                chip_data_out = posData;
                                break;
                            }
                            //roll is not this
                            result -= weight;
                        }
                    }


                    container.addItemOutput("output2", <contenttweaker:space_data>.withTag({"data": chip_data_out}));

                    
                    //good
                    //roll chances
                    //var newSatNum = 0;
                    //for i in 0 .. comp.tag.satellite_power{
                    //    if(container.random.nextDouble() > 0.01) newSatNum += 1;
                    //}
                    container.addItemOutput("computer2", comp.withTag({satellite_power: (comp.tag.satellite_power - 1)}));


                }else{
                    //good
                    //not enough sats
                    container.addItemOutput("computer2", comp);
                    container.addItemOutput("output2", <contenttweaker:space_data>.withTag({data: "error"}));
                }

                
            }
            else{
                container.addItemOutput("computer2", comp);
                container.addItemOutput("output2", <contenttweaker:space_data>.withTag({data: "error"}));
            }
            
        }
    });

    recipe = recipe.requireItem("computer", sat_comp);
    recipe = recipe.requireItem("input", <contenttweaker:space_paper>);

    recipe = recipe.requireSelection("selection", <minecraft:compass>.withDisplayName("Search").withLore([
        "Satellite cost 1."
    ]), false);
    
    
    recipe = recipe.requireEnergy("power", 1000000);
    recipe = recipe.requireDuration("duration", 20 * 1);

    satelliteController.addRecipe(recipe);
}



{//info 1
    print("[satellite] info 1");
    var recipe = AssemblyRecipe.create(function(container) {
        var comp as IItemStack = container.getItem("computer");
        if (comp){
            //good
            if (comp.tag.memberGet("satellite_power")){
                //good
                var satellite_power = comp.tag.satellite_power.asFloat();

                var totalWeight = 0.0;
                var lore = [""] as string[];
                for posData in chip_data{
                    if (satellite_power >= chip_data[posData].minimum){
                    var weight = chip_data[posData].weight;
                        totalWeight += weight;
                    }
                }
                for posData in chip_data{
                    if (satellite_power >= chip_data[posData].minimum){
                        var weight = chip_data[posData].weight;

                        lore += posData ~ ": " ~ scripts.helper.turnFloatToString(100.0 * weight / totalWeight);
                    }
                }

                //lore += "Total Weight: " ~ totalWeight;


                container.addItemOutput("output2", <minecraft:paper>.withDisplayName("Search Options").withLore(lore));

                container.addItemOutput("computer2", comp);
            }
            else{
                container.addItemOutput("computer2", comp);
            }
            
        }
    });

    recipe = recipe.requireItem("computer", sat_comp);
    recipe = recipe.requireItem("input", <minecraft:paper>);

    recipe = recipe.requireSelection("selection", <atum:coin_dirty>.withDisplayName("No Bonus Search").withLore([
        "No bonus from satellites or luck.",
        "Satellite breaking chance: 1%."
    ]), true);
    
    
    recipe = recipe.requireEnergy("power", 1000);
    recipe = recipe.requireDuration("duration", 20 * 1);

    satelliteController.addRecipe(recipe);

}

{//jei
    /*input_chip");
    "input_comp");
    
    "output_chip");
    "output_info*/
    for chip_data_out in chip_data{
        var recipe = AssemblyRecipe.create(function(container) {
            container.addItemOutput("output_chip", <contenttweaker:space_data>.withTag({data: chip_data_out}));
            container.addItemOutput("output_info", <minecraft:paper>.withLore(
                [
                    "Minimum: " ~ chip_data[chip_data_out].minimum,
                    "Weight: " ~ chip_data[chip_data_out].weight,
                    "Tier: " ~ chip_data[chip_data_out].min_tier
                ]
            ));
            
            container.addItemOutput("output_sat", <contenttweaker:satellite1> * chip_data[chip_data_out].minimum);
            if (chip_data[chip_data_out].min_tier == 1)
                container.addItemOutput("output_antenna", <contenttweaker:antenna_mk1>);
            if (chip_data[chip_data_out].min_tier == 2)
                container.addItemOutput("output_antenna", <contenttweaker:antenna_mk2>);
            if (chip_data[chip_data_out].min_tier == 3)
                container.addItemOutput("output_antenna", <contenttweaker:antenna_mk3>);
        });

        recipe = recipe.requireItem("input_comp", <contenttweaker:satellite_computer>);
        recipe = recipe.requireItem("input_chip", <contenttweaker:space_paper>);

        satelliteController.addJEIRecipe(recipe);


        mods.thermalexpansion.Crucible.addRecipe(
            <liquid:data> * 250, <contenttweaker:space_data>.withTag({data: chip_data_out}), 10000
        );
    }
}



/*
addSatelliteChip("none", <minecraft:iron_nugget>.withDisplayName("Explore Local Asteroid Belt"), "explore_space1", 10, 0.15);
addSatelliteChip("none", <minecraft:iron_ingot>.withDisplayName("Explore Outer Asteroid Belt"), "explore_space2", 50, 0.1);
addSatelliteChip("none", <minecraft:iron_block>.withDisplayName("Explore Neighbouring Star Systems"), "explore_space3", 150, 0.05);
addSatelliteChip("none", <extendedcrafting:singularity:1>.withDisplayName("Explore Local Cluster"), "explore_space4", 500, 0.05);
addSatelliteChip("none", <avaritia:singularity>.withDisplayName("Explore Universe"), "explore_space5", 1500, 0.01);
addSatelliteChip("none", <extendedcrafting:singularity_ultimate>.withDisplayName("Explore Multiverse"), "explore_space6", 50000, 0.01);


addSatelliteChip("explore_space1", <minecraft:iron_ingot>.withDisplayName("Search for Iron"), "iron_asteroid", 10, 0.01);
*/
addDroneMiningRecipe("iron_asteroid", <densemetals:dense_iron_ore> * 8, 20 * 60, 500 * 1000);
addDroneMiningRecipe("copper_asteroid", <densemetals:dense_copper_ore> * 8, 20 * 60, 500 * 1000);
addDroneMiningRecipe("zirconium_asteroid", <contenttweaker:zirconium_ore> * 8, 20 * 60, 500 * 1000);

recipes.addShapeless("ia_program_space_navigator_energy_vortex", <contenttweaker:space_navigator>.withTag({target: "energy_vortex"}),
    [
        <contenttweaker:space_navigator>,
        <contenttweaker:satellite_chip>,
        <contenttweaker:space_data>.withTag({data: "energy_vortex"})
    ]
);
addDroneVortexRecipe(<contenttweaker:worm_glass> * 4, <contenttweaker:sick_worm>, 20 * 60, 10 * 1000 * 1000);