#priority 500

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;

import mods.alfinivia.Milking;
import crafttweaker.entity.IEntityDefinition;

import mods.requious.Assembly;

import mods.requious.ComponentFace;
import mods.requious.SlotVisual;
import mods.requious.AssemblyRecipe;


static Hint as Assembly = <assembly:entity_hint>;
{
    Hint.setJEIItemSlot(0, 0, "input");
    Hint.setJEIItemSlot(0, 1, "input");
    Hint.setJEIFluidSlot(0, 2, "input");
    Hint.setJEIItemSlot(1, 0, "input");
    Hint.setJEIItemSlot(1, 1, "input");
    Hint.setJEIItemSlot(1, 2, "input");

    Hint.setJEIItemSlot(2, 0, "input_egg");
    Hint.setJEIItemSlot(2, 1, "input_vial");

    Hint.setJEIDecoration(3, 1, "duration", SlotVisual.create(1,1).addPart("requious:textures/gui/assembly_gauges.png", 0, 8));

    Hint.setJEIItemSlot(4, 0, "catalyst");
    Hint.setJEIItemSlot(4, 1, "catalyst");
    Hint.setJEIFluidSlot(4, 2, "catalyst");

    Hint.setJEIDecoration(5, 1, "duration", SlotVisual.create(1,1).addPart("requious:textures/gui/assembly_gauges.png", 0, 8));

    Hint.setJEIItemSlot(6, 0, "output_egg");
    Hint.setJEIItemSlot(6, 1, "output_vial");

    Hint.setJEIItemSlot(7, 0, "output");
    Hint.setJEIItemSlot(7, 1, "output");
    Hint.setJEIItemSlot(7, 2, "output");
    Hint.setJEIItemSlot(8, 0, "output");
    Hint.setJEIItemSlot(8, 1, "output");
    Hint.setJEIFluidSlot(8, 2, "output");
}
Hint.addJEICatalyst(<minecraft:skull:4>);

function addJEIentityHint(
    inputs as IIngredient[], input_fluids as ILiquidStack, input_ent as string,
    catalysts as IIngredient[], fluid_cat as ILiquidStack,
    outputs as IItemStack[], output_fluids as ILiquidStack, output_ent as string
    )
{
    var recipe = AssemblyRecipe.create(function(container) {
        for out in outputs{
            container.addItemOutput("output", out);
        }
        if output_fluids{
            container.addFluidOutput("output", output_fluids);
        }

        if output_ent != ""{
            container.addItemOutput("output_egg", <minecraft:spawn_egg>.withTag({EntityTag: {id: output_ent}}));
            container.addItemOutput("output_vial", <enderio:item_soul_vial:1>.withTag({entityId: output_ent}));
        }
        
        
    });

    for inp in inputs{
        recipe = recipe.requireItem("input", inp);
    }
    if input_fluids{
        recipe = recipe.requireFluid("input", input_fluids);
    }

    for catalyst in catalysts{
        recipe = recipe.requireItem("catalyst", catalyst);
    }
    if fluid_cat{
        recipe = recipe.requireFluid("catalyst", fluid_cat);
    }

    if input_ent != ""{
        recipe = recipe.requireItem("input_egg", <minecraft:spawn_egg>.withTag({EntityTag: {id: input_ent}}));
        recipe = recipe.requireItem("input_vial", <enderio:item_soul_vial:1>.withTag({entityId: input_ent}));
    }

    Hint.addJEIRecipe(recipe);	
}




//roots summoning






//milk
function addFluidMilking(ent as IEntityDefinition, fl as ILiquidStack){
    Milking.add(
        <minecraft:bucket>,
        ent,
        <forge:bucketfilled>.withTag({FluidName: fl.name, Amount: 1000}), false
    );
    addJEIentityHint(
        [<minecraft:bucket>], null, ent.id,
        [<exnihilocreatio:block_barrel0> | <exnihilocreatio:block_barrel1>, <industrialforegoing:animal_resource_harvester>], null,
        [<forge:bucketfilled>.withTag({FluidName: fl.name, Amount: 1000})], fl, ""
    );
    
}
function addFluidMilking_no_barrel(ent as IEntityDefinition, fl as ILiquidStack){
    Milking.add(
        <minecraft:bucket>,
        ent,
        <forge:bucketfilled>.withTag({FluidName: fl.name, Amount: 1000}), false
    );
    addJEIentityHint(
        [<minecraft:bucket>], null, ent.id,
        [<industrialforegoing:animal_resource_harvester>], null,
        [<forge:bucketfilled>.withTag({FluidName: fl.name, Amount: 1000})], fl, ""
    );
    
}
function addFluidMilking_only_IF(ent as IEntityDefinition, fl as ILiquidStack){
    addJEIentityHint(
        [], null, ent.id,
        [<industrialforegoing:animal_resource_harvester>], null,
        [<forge:bucketfilled>.withTag({FluidName: fl.name, Amount: 1000})], fl, ""
    );
}

addFluidMilking(<entity:minecraft:zombie>, <liquid:rot>);
addFluidMilking(<entity:twilightforest:fire_beetle>, <liquid:fiery_essence>);
addFluidMilking(<entity:erebus:erebus.beetle>, <liquid:beetle_juice>);
addFluidMilking_only_IF(<entity:minecraft:skeleton>, <liquid:notmilk>);
{
    Milking.add(
        <minecraft:bucket>,
        <entity:twilightforest:roving_cube>,
        <forge:bucketfilled>.withTag({FluidName: "roving_milk", Amount: 1000}), false
    );
    addJEIentityHint(
        [<minecraft:bucket>], null, <entity:twilightforest:roving_cube>.id,
        [], null,
        [<forge:bucketfilled>.withTag({FluidName: "roving_milk", Amount: 1000})], <liquid:roving_milk>, ""
    );
}


addJEIentityHint(
    [], null, "minecraft:snowman",
    [<exnihilocreatio:block_barrel0> | <exnihilocreatio:block_barrel1>], null,
    [], <liquid:water>, ""
);

//trading
addJEIentityHint(
    [<minecraft:emerald_block>], null, "primitivemobs:traveling_merchant",
    [], null,
    [<minecraft:bed>.withDisplayName("Makes him stay")], null, "primitivemobs:traveling_merchant"
);
addJEIentityHint(
    [], null, "primitivemobs:traveling_merchant",
    [], null,
    [<minecraft:emerald>], null, ""
);
addJEIentityHint(
    [<minecraft:emerald>], null, "primitivemobs:traveling_merchant",
    [], null,
    [<minecraft:chorus_fruit>, <minecraft:ghast_tear>, <minecraft:prismarine_crystals>], null, ""
);

//fluid transform
addJEIentityHint(
    [], null, "minecraft:squid", 
    [], <liquid:lifeessence>,
    [], null, "minecraft:guardian"
);
addJEIentityHint(
    [], null, "minecraft:villager", 
    [], <liquid:lifeessence>,
    [], null, "minecraft:vindication_illager"
);
addJEIentityHint(
    [], null, "minecraft:chicken", 
    [], <liquid:lifeessence>,
    [], null, "primitivemobs:dodo"
);

addJEIentityHint(
    [], null, "minecraft:skeleton", 
    [], <liquid:witchwater>,
    [], null, "minecraft:wither_skeleton"
);
addJEIentityHint(
    [], null, "minecraft:creeper", 
    [], <liquid:witchwater>,
    [<xreliquary:mob_ingredient:8>], null, "minecraft:creeper"
);