import crafttweaker.item.IItemStack;
import mods.modularmachinery.RecipeBuilder;

val singularity_dust as IItemStack = <contenttweaker:singularity_dust>;



//singularities
static expl_compressables as string[] = [
	"iron", "copper", "tin",
	"nickel", "aluminum", "zinc",
	"cobalt", "ardite", "antimony",
	"gold", "silver", "osmium", "lead",

	"platinum", "iridium", "tungsten", "titanium", "uranium", "yellorium",
	"steeleaf",
	"chrome", "gallium", "neodymium",
	"palladium", "draconium", "zirconium", "tantalum",

	"redstone",
	"coal", "diamond", "emerald", "lapis", "salt",

	"karmesine", "ovium", "jauxum"
];


static non_metallic_singularities as IItemStack[string][string] = {
	wood: {
		item: <minecraft:log>,
		singularity: <extendedcrafting:singularity_custom:100>
	},
	flint: {
		item: <minecraft:flint>,
		block: <excompressum:compressed_block:5>,
		singularity: <extendedcrafting:singularity_custom:1>
	},
	stone: {
		item: <minecraft:stone>,
		singularity: <extendedcrafting:singularity_custom:2>
	},
	glass: {
		item: <minecraft:glass>,
		singularity: <extendedcrafting:singularity_custom:3>
	},

	blood: {
		item: <tconstruct:edible:3>,
		singularity: <extendedcrafting:singularity_custom:9>
	},
	glowstone: {
		item: <minecraft:glowstone_dust>,
		block4: <minecraft:glowstone>,
		singularity: <extendedcrafting:singularity:4>
	},
	quartz: {
		item: <minecraft:quartz>,
		block4: <minecraft:quartz_block>,
		singularity: <extendedcrafting:singularity_custom:25>
	},

	pyrotheum: {
		item: <thermalfoundation:material:1024>,
		singularity: <extendedcrafting:singularity_custom:13>
	},
	cryotheum: {
		item: <thermalfoundation:material:1025>,
		singularity: <extendedcrafting:singularity_custom:14>
	},
	aerotheum: {
		item: <thermalfoundation:material:1026>,
		singularity: <extendedcrafting:singularity_custom:15>
	},
	petrotheum: {
		item: <thermalfoundation:material:1027>,
		singularity: <extendedcrafting:singularity_custom:16>
	},

	gravel_wool1: {
		item: <thermalfoundation:rockwool:7>,
		singularity: <contenttweaker:gravel_wool> * 128
	},
	gravel_wool2: {
		block: <thermalfoundation:rockwool:7>,
		singularity: <contenttweaker:gravel_wool> * 12
	}
};

function addBlockCompress(block as IItemStack, singul as IItemStack){
	var rec = RecipeBuilder.newBuilder(block.name ~ "_compression_" ~ singul.name, "explosion_compressor", 3 * 20);
	rec.addEnergyPerTickInput(2048);
	rec.addItemOutput(singul);

	rec.addItemInput(block * 32);
	//rec.addMekanismHeatInput(500, 499, 1.0/0);

	rec.addItemInput(<mekanism:obsidiantnt>);
	rec.build();
}
function addBlock4Compress(block as IItemStack, singul as IItemStack){
	var rec = RecipeBuilder.newBuilder(block.name ~ "_compression_" ~ singul.name, "explosion_compressor", 3 * 20);
	rec.addEnergyPerTickInput(2048);
	rec.addItemOutput(singul);

	rec.addItemInput(block * 64);
	//rec.addMekanismHeatInput(500, 499, 1.0/0);

	rec.addItemInput(<mekanism:obsidiantnt>);
	rec.build();
}
function addIngotCompress(ingot as IItemStack, singul as IItemStack){
	var rec2 = RecipeBuilder.newBuilder(ingot.name ~ "_compression_ingot_" ~ singul.name, "explosion_compressor", 3 * 20);
	rec2.addEnergyPerTickInput(2048);
	rec2.addItemOutput(singul);
		
	rec2.addItemInput(ingot * 256);

	//rec2.addMekanismHeatInput(700, 699, 1.0/0);
		
				
	rec2.addItemInput(<contenttweaker:explosion_device_full>);
	rec2.addItemOutput(<contenttweaker:explosion_device>);
	rec2.setChance(0.98);
		
	rec2.build();
}

for mat in expl_compressables{
	if (scripts.metalworks.all_metals[mat] has "singularity"){
		addBlockCompress(scripts.metalworks.all_metals[mat].block, scripts.metalworks.all_metals[mat].singularity);

		addIngotCompress(scripts.metalworks.all_metals[mat].ingot, scripts.metalworks.all_metals[mat].singularity);
	}
}
for mat in scripts.metalworks.all_metals{
	if ( (scripts.metalworks.all_metals[mat] has "singularity") && (scripts.metalworks.all_metals[mat] has "element") ) {

		mods.extendedcrafting.CompressionCrafting.addRecipe(
			scripts.metalworks.all_metals[mat].singularity, scripts.metalworks.all_metals[mat].element, 192 * 16, 
			<contenttweaker:research_singularity>, 5000000
		);

	}
}


for mat in non_metallic_singularities{
	if (non_metallic_singularities[mat] has "item"){
		addIngotCompress(non_metallic_singularities[mat].item, non_metallic_singularities[mat].singularity);
	}
	if (non_metallic_singularities[mat] has "block"){
		addBlockCompress(non_metallic_singularities[mat].block, non_metallic_singularities[mat].singularity);
	}
	if (non_metallic_singularities[mat] has "block4"){
		addBlock4Compress(non_metallic_singularities[mat].block4, non_metallic_singularities[mat].singularity);
	}
}


//fix brass
mods.extendedcrafting.CompressionCrafting.remove(<extendedcrafting:singularity:21>);
mods.extendedcrafting.CompressionCrafting.addRecipe(<extendedcrafting:singularity:21>, <tconstruct:ingots:5>, 256, <extendedcrafting:material:11>, 5000000);

//my singularities
mods.extendedcrafting.CompressionCrafting.addRecipe(<contenttweaker:mushroomite_singularity>, <contenttweaker:mushroomite_ingot>, 256, <extendedcrafting:material:11>, 5000000);

mods.extendedcrafting.CompressionCrafting.addRecipe(<contenttweaker:fiery_singularity>, <twilightforest:fiery_ingot>, 256, <extendedcrafting:material:11>, 5000000);
mods.extendedcrafting.CompressionCrafting.addRecipe(<contenttweaker:solar_silicon_singularity>, <contenttweaker:solar_silicon>, 256, <extendedcrafting:material:11>, 5000000);
mods.extendedcrafting.CompressionCrafting.addRecipe(<contenttweaker:mana_dust_singularity>, <thermalfoundation:material:1028>, 256, <extendedcrafting:material:11>, 5000000);
mods.extendedcrafting.CompressionCrafting.addRecipe(<contenttweaker:neuro_singularity>, <contenttweaker:basic_neuron>, 256, <extendedcrafting:material:11>, 5000000);
mods.extendedcrafting.CompressionCrafting.addRecipe(<contenttweaker:evil_singularity>, <extrautils2:ingredients:17>, 256, <extendedcrafting:material:11>, 5000000);

mods.extendedcrafting.CompressionCrafting.addRecipe(<contenttweaker:neutronium_singularity>, <avaritia:resource:4>, 256, <extendedcrafting:material:11>, 5000000);

//singularity
mods.extendedcrafting.CompressionCrafting.addRecipe(<contenttweaker:meta_singularity>, <contenttweaker:singularity_dust>, 256, <extendedcrafting:material:11>, 5000000);

mods.extendedcrafting.CompressionCrafting.addRecipe(
	<extendedcrafting:singularity_custom:68>, <thermalfoundation:material:160>, 256 * 256, 
	<extendedcrafting:singularity_custom:68>, 5000000
);
mods.extendedcrafting.CompressionCrafting.addRecipe(
	<extendedcrafting:singularity_custom:69>, <thermalfoundation:material:160>, 256 * 256 * 256, 
	<extendedcrafting:singularity_custom:69>, 5000000
);


//extra recs
scripts.content_machines.addBioAssemblerRecipeRandom(
	[
		<extendedcrafting:singularity_custom:3> % 60,
		<extendedcrafting:singularity_custom:3> % 60,
		<extendedcrafting:singularity_custom:3> % 60,
		<extendedcrafting:singularity_custom:3> % 60
	], null, [
		<contenttweaker:reagent_glass>
	], [], <contenttweaker:research_singularity>,
	300, 1000
);

//tiers
static singularity_tiers as IItemStack[][] = [
	[//0
		<extendedcrafting:singularity_custom:1>,
		<extendedcrafting:singularity_custom:2>,
		<extendedcrafting:singularity_custom:3>
	],[//1
		<extendedcrafting:singularity>,
		<extendedcrafting:singularity:1>,
		<extendedcrafting:singularity:5>,
		<extendedcrafting:singularity:16>,
		<extendedcrafting:singularity:17>,
		<extendedcrafting:singularity:18>,
		<extendedcrafting:singularity:20>,
		<extendedcrafting:singularity:22>,
		<extendedcrafting:singularity:23>,
		<extendedcrafting:singularity:25>,
		<extendedcrafting:singularity:65>,
		<extendedcrafting:singularity:64>,
		<extendedcrafting:singularity_custom:6>,
		<extendedcrafting:singularity:2>,
		<extendedcrafting:singularity:3>,
		<extendedcrafting:singularity:4>,
		<extendedcrafting:singularity_custom:5>,
		<extendedcrafting:singularity_custom:8>,
		<extendedcrafting:singularity_custom:9>,

		<extendedcrafting:singularity_custom:13>,
		<extendedcrafting:singularity_custom:14>,
		<extendedcrafting:singularity_custom:15>,
		<extendedcrafting:singularity_custom:16>,

		<extendedcrafting:singularity_custom:28>,
		<extendedcrafting:singularity_custom:25>,
		<extendedcrafting:singularity_custom:26>,

		<extendedcrafting:singularity_custom:32>,
		<extendedcrafting:singularity_custom:33>,

		<extendedcrafting:singularity_custom:54>
	],[//2
		<extendedcrafting:singularity:6>,
		<extendedcrafting:singularity:7>,
		<extendedcrafting:singularity:21>,
		<extendedcrafting:singularity:24>,
		<extendedcrafting:singularity:26>,
		<extendedcrafting:singularity:27>,
		<extendedcrafting:singularity:28>,
		<extendedcrafting:singularity:34>,
		<extendedcrafting:singularity:66>,
		<extendedcrafting:singularity:19>,
		<extendedcrafting:singularity_custom:7>,
		<extendedcrafting:singularity:48>,
		<extendedcrafting:singularity:49>,
		<extendedcrafting:singularity_custom:4>,
		<extendedcrafting:singularity_custom:12>,
		<extendedcrafting:singularity_custom:10>,
		<extendedcrafting:singularity_custom:11>,

		<extendedcrafting:singularity_custom:27>,
		<extendedcrafting:singularity_custom:34>,
		<extendedcrafting:singularity_custom:35>,
		<extendedcrafting:singularity_custom:36>,
		<extendedcrafting:singularity_custom:39>,

		<extendedcrafting:singularity_custom:41>,
		<extendedcrafting:singularity_custom:42>
	],[//3
		<extendedcrafting:singularity:29>,
		<extendedcrafting:singularity:30>,
		<extendedcrafting:singularity:35>,
		<extendedcrafting:singularity:31>,
		<extendedcrafting:singularity:32>,
		<extendedcrafting:singularity:33>,
		<extendedcrafting:singularity:50>,
		<extendedcrafting:singularity_custom:17>,

		<extendedcrafting:singularity_custom:18>,
		<extendedcrafting:singularity_custom:19>,
		<extendedcrafting:singularity_custom:20>,
		<extendedcrafting:singularity_custom:21>,
		<extendedcrafting:singularity_custom:22>,
		<extendedcrafting:singularity_custom:23>,
		<extendedcrafting:singularity_custom:24>,

		<extendedcrafting:singularity_custom:29>,
		<extendedcrafting:singularity_custom:37>,

		<contenttweaker:mana_dust_singularity>,
		<extendedcrafting:singularity_custom:55>
	],[//4
		<extendedcrafting:singularity_custom:30>,
		<extendedcrafting:singularity_custom:31>,
		<contenttweaker:fiery_singularity>,
		<contenttweaker:solar_silicon_singularity>,
		<contenttweaker:neuro_singularity>
	],[//5
		<extendedcrafting:singularity_custom:40>,
		<extendedcrafting:singularity_custom:52>
	],[//6
		<extendedcrafting:singularity_custom:38>,
		<extendedcrafting:singularity_custom:50>,
		<extendedcrafting:singularity_custom:51>,
		<extendedcrafting:singularity_custom:53>
	],[//7

	]
];

for tier,arr in singularity_tiers{
	if (tier == 0){
		for sing in arr{
			recipes.addShapeless("ia_singulr" ~ tier ~ sing.name, singularity_dust, [sing, sing]);
		}
	}
	else{
		for sing in arr{
			recipes.addShapeless("ia_singulr" ~ tier ~ sing.name, singularity_dust * tier, [sing]);
		}
	}
	
}
recipes.addShapeless("ia_singulr_wooden", singularity_dust, [<extendedcrafting:singularity_custom:100>, <extendedcrafting:singularity_custom:100>, <extendedcrafting:singularity_custom:100>, <extendedcrafting:singularity_custom:100>]);


//recipes
recipes.remove(<engineersdecor:treated_wood_crafting_table>);
recipes.addShaped("ia_treated_wood_crafting_table", <engineersdecor:treated_wood_crafting_table>, [
	[<ore:plankTreatedWood>, <avaritia:compressed_crafting_table>, <ore:plankTreatedWood>], 
	[<contenttweaker:mekanized_steel_plate>, <erebus:petrified_crafting_table>, <contenttweaker:mekanized_steel_plate>], 
	[<engineersdecor:treated_wood_pole>, null, <engineersdecor:treated_wood_pole>]
]);

recipes.remove(<avaritia:double_compressed_crafting_table>);
recipes.addShaped("ia_double_compressed_crafting_table", <avaritia:double_compressed_crafting_table>, [
	[<avaritia:compressed_crafting_table>, <extrautils2:analogcrafter>, <avaritia:compressed_crafting_table>], 
	[<avaritia:compressed_crafting_table>, <engineersdecor:treated_wood_crafting_table>, <avaritia:compressed_crafting_table>], 
	[<avaritia:compressed_crafting_table>, <extrautils2:analogcrafter>, <avaritia:compressed_crafting_table>]
]);

recipes.remove(<extendedcrafting:compressor>);
mods.extendedcrafting.TableCrafting.addShaped(0, <extendedcrafting:compressor>, [
	[<extendedcrafting:storage>, <extendedcrafting:material:14>, <aeadditions:storage.component>, <extendedcrafting:material:14>, <extendedcrafting:storage>], 
	[<extendedcrafting:singularity_custom:67>, <mekanism:machineblock:1>, <avaritia:double_compressed_crafting_table>, <mekanism:machineblock:1>, <extendedcrafting:singularity_custom:67>], 
	[<extendedcrafting:singularity_custom:67>, <modularmachinery:explosion_compressor_controller>, <extendedcrafting:frame>, <modularmachinery:explosion_compressor_controller>, <extendedcrafting:singularity_custom:67>], 
	[<extendedcrafting:singularity_custom:67>, <mekanism:machineblock:1>, <avaritia:double_compressed_crafting_table>, <mekanism:machineblock:1>, <extendedcrafting:singularity_custom:67>], 
	[<extendedcrafting:storage>, <extendedcrafting:material:14>, <aeadditions:storage.component>, <extendedcrafting:material:14>, <extendedcrafting:storage>]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <extendedcrafting:compressor> * 2, [
	[<extendedcrafting:storage>, <extendedcrafting:material:14>, <aeadditions:storage.component>, <extendedcrafting:material:14>, <extendedcrafting:storage>], 
	[<bloodmagic:component:14>, <mekanism:machineblock:1>, <avaritia:double_compressed_crafting_table>, <mekanism:machineblock:1>, <bloodmagic:component:14>], 
	[<bloodmagic:component:14>, <modularmachinery:explosion_compressor_controller>, <extendedcrafting:frame>, <modularmachinery:explosion_compressor_controller>, <bloodmagic:component:14>], 
	[<bloodmagic:component:14>, <mekanism:machineblock:1>, <avaritia:double_compressed_crafting_table>, <mekanism:machineblock:1>, <bloodmagic:component:14>], 
	[<extendedcrafting:storage>, <extendedcrafting:material:14>, <aeadditions:storage.component>, <extendedcrafting:material:14>, <extendedcrafting:storage>]
]);

