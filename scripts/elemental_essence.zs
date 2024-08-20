import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import mods.ctutils.utils.Math;

function essenceGood(item as IItemStack) as bool{
    if (item.tag.memberGet("fire")) //§4
    if (item.tag.memberGet("water"))//§b
    if (item.tag.memberGet("earth"))//§2
    if (item.tag.memberGet("wind"))//§6
        return true;
    return false;
}


<contenttweaker:elemental_essence_base>.addAdvancedTooltip(function(item){
	if (essenceGood(item))
		return "§4" ~ item.tag.fire ~ " §b" ~ item.tag.water ~ " §2" ~ item.tag.earth ~ " §6" ~ item.tag.wind;
	return "*";
});
recipes.addShaped("ia_elemental_essence_base", <contenttweaker:elemental_essence_base>, [
        [<contenttweaker:elemental_clay>, <botania:rune:6>, <contenttweaker:elemental_clay>], 
        [<botania:rune:4>, <contenttweaker:elf_mana_circuit>, <botania:rune:5>], 
        [<contenttweaker:elemental_clay>, <botania:rune:7>, <contenttweaker:elemental_clay>]
    ],
    function(out, ins, cInfo){
        var div1 as int = ((Math.floor(Math.random() * 5) + 1) as IData).asInt();
        var div2 as int = ((Math.floor(Math.random() * 5) + 1) as IData).asInt();
        var div3 as int = ((Math.floor(Math.random() * 5) + 1) as IData).asInt();
        var div4 as int = ((Math.floor(Math.random() * 5) + 1) as IData).asInt();
        
        
        return <contenttweaker:elemental_essence_base>.withTag({
            fire: div1,
            water: div2,
            earth: div3,
            wind: div4
        });
    }, null
);

recipes.addShapeless("ia_ee_fire", <contenttweaker:elemental_essence_base>,
    [<contenttweaker:elemental_essence_base>.marked("essence"), <botania:rune:1>],
    function(out, ins, cInfo){
        var essence as IItemStack = ins.essence;

        if (essenceGood(essence)){
            return <contenttweaker:elemental_essence_base>.withTag(
                essence.tag + {
                    fire: essence.tag.fire.asInt() + 1
                }
            );
        }
                
        return null; 
    }, null
);
recipes.addShapeless("ia_ee_water", <contenttweaker:elemental_essence_base>,
    [<contenttweaker:elemental_essence_base>.marked("essence"), <botania:rune:0>],
    function(out, ins, cInfo){
        var essence as IItemStack = ins.essence;

        if (essenceGood(essence)){
            return <contenttweaker:elemental_essence_base>.withTag(
                essence.tag + {
                    water: essence.tag.water.asInt() + 1
                }
            );
        }
                
        return null; 
    }, null
);
recipes.addShapeless("ia_ee_earth", <contenttweaker:elemental_essence_base>,
    [<contenttweaker:elemental_essence_base>.marked("essence"), <botania:rune:2>],
    function(out, ins, cInfo){
        var essence as IItemStack = ins.essence;

        if (essenceGood(essence)){
            return <contenttweaker:elemental_essence_base>.withTag(
                essence.tag + {
                    earth: essence.tag.earth.asInt() + 1
                }
            );
        }
                
        return null; 
    }, null
);
recipes.addShapeless("ia_ee_wind", <contenttweaker:elemental_essence_base>,
    [<contenttweaker:elemental_essence_base>.marked("essence"), <botania:rune:3>],
    function(out, ins, cInfo){
        var essence as IItemStack = ins.essence;

        if (essenceGood(essence)){
            return <contenttweaker:elemental_essence_base>.withTag(
                essence.tag + {
                    wind: essence.tag.wind.asInt() + 1
                }
            );
        }
                
        return null; 
    }, null
);



recipes.addShaped("ia_elemental_essence", <contenttweaker:elemental_essence> * 8, [
        [<botania:manaresource:22>, <contenttweaker:mana_dust_singularity>, <botania:manaresource:22>], 
        [<contenttweaker:entangled_matter_a>.marked("em_a"), <contenttweaker:elemental_essence_base>.marked("essence"), <contenttweaker:entangled_matter_b>.marked("em_b")], 
        [<botania:manaresource:22>, <extendedcrafting:singularity_custom:37>, <botania:manaresource:22>],
    ],
    function(out, ins, cInfo){
        var em_a as IItemStack = ins.em_a;
        var em_b as IItemStack = ins.em_b;
        var essence as IItemStack = ins.essence;

        if (em_a.tag.memberGet("id"))
        if (em_b.tag.memberGet("id"))
        if (em_a.tag.id == em_b.tag.id)
            if (essenceGood(essence))
            if (essence.tag.fire == essence.tag.water)
            if (essence.tag.fire == essence.tag.earth)
            if (essence.tag.fire == essence.tag.wind)
                    return <contenttweaker:elemental_essence> * 4;
                
        return null; 
    }, null
);