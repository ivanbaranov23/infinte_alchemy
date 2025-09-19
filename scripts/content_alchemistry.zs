#loader alchemistry

import mods.alchemistry.Util.createElement;
import mods.alchemistry.Util.createCompound;
//createCompound(int meta, String name, int red, int green, int blue, Object[][] components);

createElement(250, "bouncium", "Bn", 0, 0, 0);
createElement(500, "transendium", "Trs", 0, 0, 0);
createElement(1500, "galaxium", "Glx", 93, 42, 172);





{//missing
    createCompound(200, "fluorite", 52, 209, 96,
        [
            ["calcium", 1],
            ["fluorine", 2]
        ]
    );
    createCompound(201, "sodium_hydroxide", 199, 194, 48,
        [
            ["sodium", 1],
            ["oxygen", 1],
            ["hydrogen", 1]
        ]
    );
    createCompound(202, "oganesson_tetratennessine", 55, 123, 64,
        [
            ["oganesson", 1],
            ["tennessine", 4]
        ]
    );
    createCompound(203, "hydrogen_chloride", 100, 47, 93,
        [
            ["hydrogen", 1],
            ["chlorine", 1]
        ]
    );
    createCompound(204, "ferric_chloride", 55, 55, 70,
        [
            ["iron", 1],
            ["chlorine", 3]
        ]
    );
    createCompound(205, "ethylene", 203, 184, 214,
        [
            ["carbon", 2],
            ["hydrogen", 4]
        ]
    );
    createCompound(206, "sulfur_dichloride", 67, 123, 247,
        [
            ["sulfur", 1],
            ["chlorine", 2]
        ]
    );
    createCompound(207, "hydrogen_cyanide", 109, 244, 90,
        [
            ["hydrogen", 1],
            ["carbon", 1],
            ["nitrogen", 1]
        ]
    );
    createCompound(208, "aluminum_chloride", 90, 77, 126,
        [
            ["aluminum", 1],
            ["chlorine", 3]
        ]
    );
    createCompound(209, "ammonia", 47, 62, 88,
        [
            ["nitrogen", 1],
            ["hydrogen", 3]
        ]
    );
    createCompound(210, "hydrazine", 100, 230, 9,
        [
            ["amide", 2]
        ]
    );
    createCompound(211, "sulfiric_acid", 220, 188, 78,
        [
            ["hydrogen", 2],
            ["sulfur", 1],
            ["oxygen", 4]
        ]
    );
    createCompound(212, "nitric_acid", 85, 116, 125,
        [
            ["hydrogen", 1],
            ["nitrogen", 1],
            ["oxygen", 3]
        ]
    );
    createCompound(213, "formaldehyde", 125, 92, 44,
        [
            ["hydrogen", 2],
            ["carbon", 1],
            ["oxygen", 1]
        ]
    );
    createCompound(214, "formic_acid", 112, 160, 154,
        [
            ["hydrogen", 1],
            ["carbon", 1],
            ["oxygen", 1],
            ["hydroxide", 1]
        ]
    );
    createCompound(215, "methanol", 20, 88, 190,
        [
            ["hydrogen", 3],
            ["carbon", 1],
            ["hydroxide", 1]
        ]
    );
}

{//metals
    
    createCompound(501, "magnesium_bromide_chloride", 23, 11, 87,
        [
            ["magnesium", 1],
            ["bromine", 1],
            ["chlorine", 1]
        ]
    );
    createCompound(502, "hydrogen_bromide", 67, 155, 55,
        [
            ["hydrogen", 1],
            ["bromine", 1]
        ]
    );

    createCompound(503, "vanadium_oxide", 55, 23, 99,
        [
            ["vanadium", 2],
            ["oxygen", 5]
        ]
    );
    createCompound(504, "molybdenum_oxide", 87, 188, 11,
        [
            ["molybdenum", 1],
            ["oxygen", 3]
        ]
    );
    createCompound(505, "zirconium_tetrachloride", 155, 66, 234,
        [
            ["zirconium", 1],
            ["chlorine", 4]
        ]
    );
    createCompound(506, "barium_carbonate", 12, 12, 34,
        [
            ["barium", 1],
            ["carbon", 1],
            ["oxygen", 3]
        ]
    );
    createCompound(507, "sodium_iodide", 64, 32, 64,
        [
            ["sodium", 1],
            ["iodine", 1]
        ]
    );
    createCompound(508, "hydrogen_iodide", 114, 32, 164,
        [
            ["hydrogen", 1],
            ["iodine", 1]
        ]
    );
}


createCompound(1204, "sodium_chlorate", 42, 44,79,
    [
        ["sodium", 1],
        ["chlorine", 1],
        ["oxygen", 3]
    ]
);
createCompound(1205, "sodium_chlorate_mixture", 42, 44, 130,
    [
        ["sodium_chlorate", 1],
        ["hydrogen_chloride", 1]
    ]
);

createCompound(1206, "phosphorus_trichloride", 142, 144, 79,
    [
        ["phosphorus", 1],
        ["chlorine", 3]
    ]
);