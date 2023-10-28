Config = Config or {}

Config.menu = 'keep-menu' -- keep-menu (recommended) / qb-menu

Config.model_loading = {
     timeout = 1500, --ms
     dealy = 50,     --ms
}

Config.MagicTouch = false

Config.categories = {
     ['misc'] = {
          key = 'misc',
          label = 'Weapons & Misc',
          icon = 'fa-solid fa-tags',
          jobs = {},
     },
     ['jel'] = {
          key = 'jel',
          label = 'Rings & Jewelry',
          icon = 'fa-solid fa-tags',
          jobs = {},
     },
     ['drugs'] = {
          key = 'drugs',
          label = 'Drug Access',
          icon = 'fa-solid fa-tags',
          jobs = {},
     },
     ['weapons'] = {
          key = 'weapons',
          label = 'Weapons',
          icon = 'fa-solid fa-gun',
          jobs = {},
     },
     ['weaponparts'] = {
          key = 'weaponparts',
          label = 'Weapon Parts',
          icon = 'fa-solid fa-gun',
          jobs = {},
     },
     ['weaponsa'] = {
          key = 'weaponsa',
          label = 'Crafting',
          icon = 'fa-solid fa-gun',
          jobs = {},
     },
     ['weaponsb'] = {
          key = 'weaponsb',
          label = 'Crafting',
          icon = 'fa-solid fa-gun',
          jobs = {},
     },
     ['weaponattachments'] = {
          key = 'weaponattachments',
          label = 'Weapon Attachments',
          icon = 'fa-solid fa-gun',
          jobs = {},
     },
     ['weaponguns'] = {
          key = 'weaponguns',
          label = 'Firearms',
          icon = 'fa-solid fa-gun',
          jobs = {},
     },
     ['melee'] = {
          key = 'melee',
          label = 'Melee',
          icon = 'fa-solid fa-gun',
          jobs = {},
     },
     ['medical'] = {
          key = 'medical',
          label = 'Medical',
          icon = 'fa-solid fa-hand-holding-medical',
          jobs = {}
     },
     ['blueprints'] = {
          key = 'blueprints',
          label = 'Blueprints Craft',
          icon = 'fa-solid fa-file',
          jobs = {}
     },
}

Config.permanent_items = {
     ['weapon_wrench'] = true
}

local misc_recipe = {
     ['radio'] = {
          categories = {
               main = 'misc',
          },
          item_settings = {
               label = 'Radio',
               image = 'radio', -- use inventory's images
               object = {
                    name = 'v_serv_radio',
                    rotation = vector3(0.0, 0.0, 0.0)
               },
               level = 0,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 60,
               materials = {
                    ["steel"] = 5,
                    ["plastic"] = 5,
               },
               exp_per_craft = 1
          }
     },
     ['lockpick'] = {
          categories = {
               main = 'misc',
          },
          item_settings = {
               label = 'Lockpick',
               image = 'lockpick', -- use inventory's images
               object = {
                    name = 'prop_tool_screwdvr01',
                    rotation = vector3(0.0, 0.0, 0.0)
               },
               level = 0,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },

          },
          crafting = {
               show_level_in_mail = true,
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 5,
               materials = {
                   ["steel"] = 20,
                   ["rubber"] = 20,
               },
               exp_per_craft = 3
          }
     },
	 ['advancedlockpick'] = {
          categories = {
               main = 'misc',
          },
          item_settings = {
               label = 'Advaced Lockpick',
               image = 'advancedlockpick', -- use inventory's images
               object = {
                    name = 'prop_tool_screwdvr01',
                    rotation = vector3(0.0, 0.0, 0.0)
               },
               level = 25,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },

          },
          crafting = {
               show_level_in_mail = true,
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 5,
               materials = {
                   ["steel"] = 40,
                   ["rubber"] = 40,
               },
               exp_per_craft = 6
          }
     },
     ['weapon_shiv'] = {
          categories = {
               sub = 'misc',
          },
          item_settings = {
               label = 'Shiv',
               image = 'weapon_shiv', -- use inventory's images
               object = {
                    name = 'prop_w_me_knife_01',
                    rotation = vector3(250.0, 0.0, 0.0)
               },
               level = 1,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 30,
               materials = {
                    ["steel"] = 10,
               },
               exp_per_craft = 5
          }
     },
     ['laptop_green'] = {
          categories = {
               sub = 'misc',
          },
          item_settings = {
               label = 'Green Laptop',
               image = 'laptop_green', -- use inventory's images
               object = {
                    name = 'prop_laptop_01a',
                    rotation = vector3(250.0, 0.0, 0.0)
               },
               level = 10,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 30,
               materials = {
                    ["steel"] = 6,
                    ["aluminum"] = 4,
                    ["rubber"] = 1,
               },
               exp_per_craft = 5
          }
     },
     ['laptop_blue'] = {
          categories = {
               sub = 'misc',
          },
          item_settings = {
               label = 'Blue Laptop',
               image = 'laptop_blue', -- use inventory's images
               object = {
                    name = 'prop_laptop_01a',
                    rotation = vector3(250.0, 0.0, 0.0)
               },
               level = 50,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 30,
               materials = {
                    ["steel"] = 50,
                    ["aluminum"] = 25,
                    ["rubber"] = 30,
               },
               exp_per_craft = 5
          }
     },
     ['laptop_red'] = {
          categories = {
               sub = 'misc',
          },
          item_settings = {
               label = 'Red Laptop',
               image = 'laptop_red', -- use inventory's images
               object = {
                    name = 'prop_laptop_01a',
                    rotation = vector3(250.0, 0.0, 0.0)
               },
               level = 80,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 30,
               materials = {
                    ["steel"] = 15,
                    ["aluminum"] = 8,
                    ["rubber"] = 2,
                    ["laptop_blue"] = 1,
               },
               exp_per_craft = 5
          }
     },
}

local weaponattachments = {
     ['pistol_flashlight'] = {
          categories = {
               sub = 'weaponattachments',
          },
          item_settings = {
               label = 'Flashlight',
               image = 'pistol_flashlight', -- use inventory's images
               level = 15,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 60,
               materials = {
                    ["aluminum"] = 120,
                    ["steel"] = 40,
                    ["rubber"] = 80,
                    ["plastic"] = 35,
               },
               exp_per_craft = 30
          }
     },
     ['pistol_extendedclip'] = {
          categories = {
               sub = 'weaponattachments',
          },
          item_settings = {
               label = 'Extended Clip',
               image = 'pistol_flashlight', -- use inventory's images
               level = 15,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 60,
               materials = {
                    ["aluminum"] = 320,
                    ["steel"] = 120,
                    ["rubber"] = 100,
                    ["plastic"] = 75,
               },
               exp_per_craft = 30
          }
     },
     ['pistol_suppressor'] = {
          categories = {
               sub = 'weaponattachments',
          },
          item_settings = {
               label = 'Suppressor',
               image = 'pistol_suppressor', -- use inventory's images
               level = 15,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 60,
               materials = {
                    ["aluminum"] = 320,
                    ["steel"] = 320,
                    ["rubber"] = 350,
                    ["plastic"] = 275,
               },
               exp_per_craft = 30
          }
     },
}

local weaponsa = {
     ['weapon_karambit'] = {
          categories = {
               sub = 'weaponsa',
          },
          item_settings = {
               label = 'Karambit',
               image = 'weapon_karambit', -- use inventory's images
               object = {
                    name = 'prop_w_me_knife_01',
                    rotation = vector3(45.0, 0.0, 0.0)
               },
               level = 40,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 60,
               materials = {
                    ["aluminum"] = 30,
                    ["steel"] = 15,
               },
               exp_per_craft = 30
          }
     },
     ['weapon_sledgehammer'] = {
          categories = {
               sub = 'weaponsa',
          },
          item_settings = {
               label = 'Sledgehammer',
               image = 'weapon_sledgehammer', -- use inventory's images
               object = {
                    name = 'gr_prop_gr_hammer_01',
                    rotation = vector3(45.0, 0.0, 0.0)
               },
               level = 30,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 60,
               materials = {
                    ["aluminum"] = 70,
                    ["rubber"] = 50,
               },
               exp_per_craft = 40
          }
     },
     ['vpn'] = {
          categories = {
               sub = 'weaponsa',
          },
          item_settings = {
               label = 'VPN',
               image = 'vpn', -- use inventory's images
               object = {
                    name = 'ex_prop_ex_laptop_01a',
                    rotation = vector3(250.0, 0.0, 0.0)
               },
               level = 1,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 5,
               materials = {
                    ["steel"] = 5,
                    ["aluminum"] = 6,
               },
               exp_per_craft = 5
          }
     },
}

local weaponsb = {
     ['weapon_katana'] = {
          categories = {
               sub = 'weaponsb',
          },
          item_settings = {
               label = 'Katana',
               image = 'weapon_katana', -- use inventory's images
               object = {
                    name = 'prop_cs_katana_01',
                    rotation = vector3(250.0, 0.0, 0.0)
               },
               level = 1,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 30,
               materials = {
                    ["steel"] = 40,
                    ["iron"] = 5,
                    ["aluminum"] = 25,
               },
               exp_per_craft = 5
          }
     },
     ['weapon_keyboard'] = {
          categories = {
               sub = 'weaponsb',
          },
          item_settings = {
               label = 'Keyboard',
               image = 'weapon_keyboard', -- use inventory's images
               object = {
                    name = 'prop_keyboard_01a',
                    rotation = vector3(250.0, 0.0, 0.0)
               },
               level = 1,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 15,
               materials = {
                    ["steel"] = 40,
                    ["aluminum"] = 25,
               },
               exp_per_craft = 5
          }
     },
     ['weapon_guitar'] = {
          categories = {
               sub = 'weaponsb',
          },
          item_settings = {
               label = 'Guitar',
               image = 'weapon_guitar', -- use inventory's images
               object = {
                    name = 'prop_acc_guitar_01_d1',
                    rotation = vector3(250.0, 0.0, 0.0)
               },
               level = 1,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 15,
               materials = {
                    ["steel"] = 23,
                    ["aluminum"] = 12,
               },
               exp_per_craft = 5
          }
     },
     ['weapon_switchblade'] = {
          categories = {
               sub = 'weaponsb',
          },
          item_settings = {
               label = 'Switch Blade',
               image = 'weapon_switchblade', -- use inventory's images
               object = {
                    name = 'prop_w_me_knife_01',
                    rotation = vector3(250.0, 0.0, 0.0)
               },
               level = 1,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 15,
               materials = {
                    ["steel"] = 40,
                    ["aluminum"] = 15,
                    ["plastic"] = 2,
               },
               exp_per_craft = 5
          }
     },
     ['vpn'] = {
          categories = {
               sub = 'weaponsb',
          },
          item_settings = {
               label = 'VPN',
               image = 'vpn', -- use inventory's images
               object = {
                    name = 'ex_prop_ex_laptop_01a',
                    rotation = vector3(250.0, 0.0, 0.0)
               },
               level = 1,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 5,
               materials = {
                    ["steel"] = 5,
                    ["aluminum"] = 6,
               },
               exp_per_craft = 5
          }
     },
     ['houselaptop'] = {
          categories = {
               sub = 'weaponsb',
          },
          item_settings = {
               label = 'House Hacking Laptop',
               image = 'houselaptop', -- use inventory's images
               object = {
                    name = 'ex_prop_ex_laptop_01a',
                    rotation = vector3(250.0, 0.0, 0.0)
               },
               level = 1,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 5,
               materials = {
                    ["steel"] = 5,
                    ["aluminum"] = 3,
                    ["iron"] = 2,
                    ["aluminum"] = 4,
               },
               exp_per_craft = 5
          }
     },

}

local weaponsb = {
     ['weapon_katana'] = {
          categories = {
               sub = 'weaponsb',
          },
          item_settings = {
               label = 'Katana',
               image = 'weapon_katana', -- use inventory's images
               object = {
                    name = 'prop_cs_katana_01',
                    rotation = vector3(250.0, 0.0, 0.0)
               },
               level = 1,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 30,
               materials = {
                    ["steel"] = 40,
                    ["iron"] = 5,
                    ["aluminum"] = 25,
               },
               exp_per_craft = 5
          }
     },
     ['weapon_keyboard'] = {
          categories = {
               sub = 'weaponsb',
          },
          item_settings = {
               label = 'Keyboard',
               image = 'weapon_keyboard', -- use inventory's images
               object = {
                    name = 'prop_keyboard_01a',
                    rotation = vector3(250.0, 0.0, 0.0)
               },
               level = 1,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 15,
               materials = {
                    ["steel"] = 40,
                    ["aluminum"] = 25,
               },
               exp_per_craft = 5
          }
     },
     ['weapon_guitar'] = {
          categories = {
               sub = 'weaponsb',
          },
          item_settings = {
               label = 'Guitar',
               image = 'weapon_guitar', -- use inventory's images
               object = {
                    name = 'prop_acc_guitar_01_d1',
                    rotation = vector3(250.0, 0.0, 0.0)
               },
               level = 1,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 15,
               materials = {
                    ["steel"] = 23,
                    ["aluminum"] = 12,
               },
               exp_per_craft = 5
          }
     },
     ['weapon_switchblade'] = {
          categories = {
               sub = 'weaponsb',
          },
          item_settings = {
               label = 'Switch Blade',
               image = 'weapon_switchblade', -- use inventory's images
               object = {
                    name = 'prop_w_me_knife_01',
                    rotation = vector3(250.0, 0.0, 0.0)
               },
               level = 1,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 15,
               materials = {
                    ["steel"] = 40,
                    ["aluminum"] = 15,
                    ["plastic"] = 2,
               },
               exp_per_craft = 5
          }
     },
     ['vpn'] = {
          categories = {
               sub = 'weaponsb',
          },
          item_settings = {
               label = 'VPN',
               image = 'vpn', -- use inventory's images
               object = {
                    name = 'ex_prop_ex_laptop_01a',
                    rotation = vector3(250.0, 0.0, 0.0)
               },
               level = 1,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 5,
               materials = {
                    ["steel"] = 5,
                    ["aluminum"] = 6,
               },
               exp_per_craft = 5
          }
     },
     ['houselaptop'] = {
          categories = {
               sub = 'weaponsb',
          },
          item_settings = {
               label = 'House Hacking Laptop',
               image = 'houselaptop', -- use inventory's images
               object = {
                    name = 'ex_prop_ex_laptop_01a',
                    rotation = vector3(250.0, 0.0, 0.0)
               },
               level = 1,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 5,
               materials = {
                    ["steel"] = 5,
                    ["aluminum"] = 3,
                    ["iron"] = 2,
                    ["aluminum"] = 4,
               },
               exp_per_craft = 5
          }
     },

}

local medial = {
     ['bandage'] = {
          categories = {
               main = 'medical',
          },
          item_settings = {
               label = 'Bandage',
               image = 'bandage', -- use inventory's images
               level = 0,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },
               -- gang = {
               --      allowed_list = {},
               --      allowed_grades = {}
               -- }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 3,
               materials = {
                    ["plastic"] = 5,
               },
               exp_per_craft = 1
          }
     },
	 ['painkillers'] = {
          categories = {
               main = 'medical',
          },
          item_settings = {
               label = 'Painkillers',
               image = 'painkillers', -- use inventory's images
               level = 0,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },
               -- gang = {
               --      allowed_list = {},
               --      allowed_grades = {}
               -- }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 3,
               materials = {
                    ["plastic"] = 5,
                    ["rubber"] = 5,
               },
               exp_per_craft = 2
          }
     },
}

local jel = {
     ['gallery_aquamarine-ring'] = {
          categories = {
               main = 'jel',
          },
          item_settings = {
               label = 'Aquamarine Ring',
               image = 'gallery_aquamarine-ring', -- use inventory's images
               level = 0,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },
               -- gang = {
               --      allowed_list = {},
               --      allowed_grades = {}
               -- }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 3,
               materials = {
                    ["emerald"] = 2,
                    ["gold_ring"] = 1,
               },
               exp_per_craft = 1
          }
     },
	 ['gallery_citrine-ring'] = {
          categories = {
               main = 'jel',
          },
          item_settings = {
               label = 'Citrine Ring',
               image = 'gallery_citrine-ring', -- use inventory's images
               level = 0,
               job = {
                    allowed_list = { 'lockjelw' },
                    allowed_grades = { ['lockjelw'] = "0, 1, 2, 3"}
               },
               -- gang = {
               --      allowed_list = {},
               --      allowed_grades = {}
               -- }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 3,
               materials = {
                    ["gold_ring"] = 2,
                    ["diamond"] = 4,
               },
               exp_per_craft = 2
          }
     },
     ['gallery_diamond-ring'] = {
          categories = {
               main = 'jel',
          },
          item_settings = {
               label = 'Diamond Ring',
               image = 'gallery_diamond-ring', -- use inventory's images
               level = 0,
               job = {
                    allowed_list = { 'lockjelw' },
                    allowed_grades = { ['lockjelw'] = "0, 1, 2, 3"}
               },
               -- gang = {
               --      allowed_list = {},
               --      allowed_grades = {}
               -- }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 3,
               materials = {
                    ["gold_ring"] = 1,
                    ["diamond"] = 2,
               },
               exp_per_craft = 2
          }
     },
     ['gallery_jade-ring'] = {
          categories = {
               main = 'jel',
          },
          item_settings = {
               label = 'Jade Ring',
               image = 'gallery_jade-ring', -- use inventory's images
               level = 0,
               job = {
                    allowed_list = { 'lockjelw' },
                    allowed_grades = { ['lockjelw'] = "0, 1, 2, 3"}
               },
               -- gang = {
               --      allowed_list = {},
               --      allowed_grades = {}
               -- }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 3,
               materials = {
                    ["gold_ring"] = 1,
                    ["sapphire"] = 2,
                    ["ruby"] = 1,
               },
               exp_per_craft = 2
          }
     },
     ['gallery_onyx-ring'] = {
          categories = {
               main = 'jel',
          },
          item_settings = {
               label = 'Oynx Ring',
               image = 'gallery_onyx-ring', -- use inventory's images
               level = 0,
               job = {
                    allowed_list = { 'lockjelw' },
                    allowed_grades = { ['lockjelw'] = "0, 1, 2, 3"}
               },
               -- gang = {
               --      allowed_list = {},
               --      allowed_grades = {}
               -- }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 3,
               materials = {
                    ["gold_ring"] = 2,
                    ["ruby"] = 2,
               },
               exp_per_craft = 2
          }
     },
}

local drugs = {
     ['coke_access'] = {
          categories = {
               main = 'drugs',
          },
          item_settings = {
               label = 'Coke Access',
               image = 'coke_access', -- use inventory's images
               level = 20,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },
               -- gang = {
               --      allowed_list = {},
               --      allowed_grades = {}
               -- }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 3,
               materials = {
                    ["weed_package"] = 20,
               },
               exp_per_craft = 1
          }
     },
	 ['meth_access'] = {
          categories = {
               main = 'drugs',
          },
          item_settings = {
               label = 'Meth Access',
               image = 'meth_access', -- use inventory's images
               level = 50,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },
               -- gang = {
               --      allowed_list = {},
               --      allowed_grades = {}
               -- }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 3,
               materials = {
                    ["coke_figure"] = 5,
               },
               exp_per_craft = 2
          }
     },
}

local weaponparts = {
    ['handcuffs'] = {
          categories = {
               main = 'weaponparts',
          },
          item_settings = {
               label = 'Handcuffs',
               image = 'weapon_handcuffs', -- use inventory's images
               object = {
                    name = 'p_cs_cuffs_02_s',
                    rotation = vector3(250.0, 0.0, 0.0)
               },
               level = 1,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 30,
               materials = {
                    ["steel"] = 30,
               },
               exp_per_craft = 5
          }
    },
	['pistol_barrel'] = {
          categories = {
               main = 'weaponparts',
          },
          item_settings = {
               label = 'Barrel',
               image = 'pistol_barrel', -- use inventory's images
               level = 1,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 30,
               materials = {
                    ["steel"] = 120,
                    ["iron"] = 150,
                    ["metalscrap"] = 100,
                    ["plastic"] = 100,
               },
               exp_per_craft = 5
          }
    },
	['pistol_magazine'] = {
          categories = {
               main = 'weaponparts',
          },
          item_settings = {
               label = 'Magazine',
               image = 'pistol_magazine', -- use inventory's images
               level = 1,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 30,
               materials = {
                    ["steel"] = 130,
                    ["iron"] = 230,
                    ["metalscrap"] = 160,
                    ["plastic"] = 120,
               },
               exp_per_craft = 5
          }
    },
	['pistol_grip'] = {
          categories = {
               main = 'weaponparts',
          },
          item_settings = {
               label = 'Grip',
               image = 'pistol_grip', -- use inventory's images
               level = 1,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 30,
               materials = {
                    ["steel"] = 180,
                    ["iron"] = 250,
                    ["metalscrap"] = 100,
                    ["plastic"] = 180,
               },
               exp_per_craft = 5
          }
    },
	['pistol_trigger'] = {
          categories = {
               main = 'weaponparts',
          },
          item_settings = {
               label = 'Trigger',
               image = 'pistol_trigger', -- use inventory's images
               level = 1,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 30,
               materials = {
                    ["steel"] = 120,
                    ["iron"] = 175,
                    ["metalscrap"] = 150,
                    ["plastic"] = 140,
               },
               exp_per_craft = 5
          }
    },
	['pistol_trigerguard'] = {
          categories = {
               main = 'weaponparts',
          },
          item_settings = {
               label = 'Trigger Guard',
               image = 'pistol_trigerguard', -- use inventory's images
               level = 1,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 30,
               materials = {
                    ["steel"] = 120,
                    ["iron"] = 150,
                    ["metalscrap"] = 120,
                    ["plastic"] = 200,
               },
               exp_per_craft = 5
          }
    },
    ['pistol_ammo'] = {
     categories = {
          main = 'weaponparts',
     },
     item_settings = {
          label = 'Pistol Ammo',
          image = 'pistol_ammo', -- use inventory's images
          object = {
               name = 'v_serv_radio',
               rotation = vector3(0.0, 0.0, 0.0)
          },
          level = 0,
          job = {
               allowed_list = {},
               allowed_grades = {}
          }
     },
     crafting = {
          success_rate = 100,
          amount = 5, -- crafted amount
          duration = 15,
          materials = {
               ["steel"] = 15,
               ["iron"] = 18,
               ["plastic"] = 18,
          },
          exp_per_craft = 1
     }
   },
}

local weaponguns = {
     ['handcuffs'] = {
          categories = {
               main = 'weaponparts',
          },
          item_settings = {
               label = 'Handcuffs',
               image = 'weapon_handcuffs', -- use inventory's images
               object = {
                    name = 'p_cs_cuffs_02_s',
                    rotation = vector3(250.0, 0.0, 0.0)
               },
               level = 1,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 30,
               materials = {
                    ["steel"] = 30,
               },
               exp_per_craft = 5
          }
    },
	['weapon_deagle'] = {
          categories = {
               main = 'weaponguns',
          },
          item_settings = {
               label = 'Desert Deagle',
               image = 'weapon_deagle', -- use inventory's images
               level = 100,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 99,
               amount = 1, -- crafted amount
               duration = 30,
               materials = {
                    ["pistol_trigerguard"] = 1,
                    ["pistol_trigger"] = 1,
                    ["pistol_barrel"] = 1,
                    ["pistol_magazine"] = 1,
                    ["steel"] = 40,
                    ["aluminum"] = 25,

               },
               exp_per_craft = 5
          }
    },
    	['weapon_m1911'] = {
          categories = {
               main = 'weaponguns',
          },
          item_settings = {
               label = 'M19-11',
               image = 'weapon_m1911', -- use inventory's images
               level = 100,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 99,
               amount = 1, -- crafted amount
               duration = 30,
               materials = {
                    ["pistol_trigerguard"] = 1,
                    ["pistol_trigger"] = 1,
                    ["pistol_barrel"] = 1,
                    ["pistol_magazine"] = 1,
               },
               exp_per_craft = 5
          }
    },
     ['weapon_glock19gen4'] = {
          categories = {
               main = 'weaponguns',
          },
          item_settings = {
               label = 'Glock 19 GEN 4',
               image = 'weapon_glock19gen4', -- use inventory's images
               level = 100,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 99,
               amount = 1, -- crafted amount
               duration = 30,
               materials = {
                    ["pistol_trigerguard"] = 2,
                    ["pistol_trigger"] = 1,
                    ["pistol_barrel"] = 1,
                    ["pistol_magazine"] = 1,
                    ["steel"] = 60,
                    ["aluminum"] = 40,
               },
               exp_per_craft = 5
          }
    },
}

Config.workbench_default_model = 'gr_prop_gr_bench_04a'

Config.workbenches = {
     -- -- items
     -- {
          -- table_model = "gr_prop_gr_bench_04b",
          -- coords = vector3(2704.33, -351.82, -55.19),
          -- item_show_case_offset = vector3(0.0, 0.0, 1.3),
          -- rotation = vector3(0.0, 0.0, 350),
          -- -- just use either job or gang using both at same time won't work.
          -- job = {
               -- allowed_list = {},
               -- allowed_grades = {}
          -- },
          -- -- gang = {
          -- --      allowed_list = { 'ballas' },
          -- --      allowed_grades = { ['ballas'] = { 1, 2, 3, 4 } }
          -- -- },
          -- categories = { Config.categories.blueprints, Config.categories.misc, Config.categories.medical },
          -- recipes = { misc_recipe, medial },
          -- radius = 3.0
     -- },
     -- {
          -- table_model = 'gr_prop_gr_bench_04b',
          -- coords = vector3(2702.93, -355.69, -55.19),
          -- rotation = vector3(0.0, 0.0, 225.0),
          -- job = {
               -- allowed_list = {},
               -- allowed_grades = {}
          -- },
          -- categories = { Config.categories.blueprints, Config.categories.misc, Config.categories.medical, Config.categories.weapons },
          -- recipes = { misc_recipe, medial },
          -- radius = 3.0
     -- },
     {
          table_model = 'gr_prop_gr_bench_02b',
          coords = vector3(-98.49, 6216.12, 30.03),
          item_show_case_offset = vector3(0.0, 0.0, 0.0),
          rotation = vector3(0.0, 0.0, 225.0),
          gang = {
               allowed_list = {},
               allowed_grades = {}
          },
          categories = { Config.categories.misc, Config.categories.medical, Config.categories.melee },
          recipes = {meele_recipe, misc_recipe, medial },
          radius = 3.0
     },
     {
          table_model = 'gr_prop_gr_bench_02b',
          coords = vector3(-1030.8, -433.5, 71.46),
          item_show_case_offset = vector3(0.0, 0.0, 0.0),
          rotation = vector3(0.0, 0.0, 360.0),
          gang = {
               allowed_list = {},
               allowed_grades = {}
          },
          categories = { Config.categories.jel},
          recipes = {jel},
          radius = 3.0
     },
     {
          table_model = 'gr_prop_gr_bench_02b',
          coords = vector3(-162.43, -1636.17, 36.25),
          item_show_case_offset = vector3(0.0, 0.0, 0.0),
          rotation = vector3(0.0, 0.0, -299.0),
          gang = {
               allowed_list = {},
               allowed_grades = {}
          },
          categories = { Config.categories.drugs},
          recipes = {drugs},
          radius = 3.0
     },
     {
          table_model = 'gr_prop_gr_bench_02b',
          coords = vector3(567.98, -2966.46, 5.23),
          item_show_case_offset = vector3(0.0, 0.0, 0.0),
          rotation = vector3(0.0, 0.0, -84.0),
          gang = {
               allowed_list = {},
               allowed_grades = {}
          },
          categories = { Config.categories.weaponguns, Config.categories.weaponparts, Config.categories.weaponsb},
          recipes = {weaponguns, weaponparts, weaponsb},
          radius = 3.0
     },
     {  --- Luke Crafting
          table_model = 'prop_laptop_01a',
          coords = vector3(1597.93, -1667.26, 88.02),
          item_show_case_offset = vector3(0.0, 0.0, 0.0),
          rotation = vector3(0.0, 0.0, -300.89),
          gang = {
               allowed_list = {},
               allowed_grades = {}
          },
          categories = { Config.categories.weaponguns, Config.categories.weaponparts, Config.categories.weaponsb},
          recipes = {weaponguns, weaponparts, weaponsb},
          radius = 0.2
     },
     {   --- Jimmy Crafting
          table_model = 'prop_laptop_01a',
          coords = vector3(-1233.64, -2077.35, 13.90),
          item_show_case_offset = vector3(0.0, 0.0, 0.0),
          rotation = vector3(0.0, 0.0, -360.89),
          gang = {
               allowed_list = {},
               allowed_grades = {}
          },
          categories = { Config.categories.weaponguns, Config.categories.weaponparts, Config.categories.weaponsb},
          recipes = {weaponguns, weaponparts, weaponsb},
          radius = 0.2
     },
     {  --- JJB Crafting
          table_model = 'prop_laptop_01a',
          coords = vector3(-590.52, -1789.53, 22.85),
          item_show_case_offset = vector3(0.0, 0.0, 0.0),
          rotation = vector3(0.0, 0.0, 210.89),
          gang = {
               allowed_list = {},
               allowed_grades = {}
          },
          categories = { Config.categories.weaponattachments },
          recipes = {weaponattachments },
          radius = 0.2
     },
}

--gr_prop_gr_jailer_keys_01a

-- gr_prop_gr_missle_long
-- gr_prop_gr_missle_short
-- gr_int02_generator_01
-- gr_prop_gr_hammer_01

-- w_sr_heavysnipermk2_mag2
-- w_sb_smgmk2_mag2
-- w_sb_smgmk2_mag1
-- w_pi_pistolmk2_mag1
-- w_mg_combatmgmk2_mag1
-- w_ar_carbineriflemk2_mag1
-- w_ar_assaultriflemk2_mag1
-- w_ex_vehiclemissile_3
-- w_ex_vehiclemissile_1
-- w_ex_vehiclemissile_2
-- w_ex_vehiclemortar

-- w_sg_pumpshotgunmk2_mag1
-- w_sg_pumpshotgunh4_mag1
-- gr_prop_gr_adv_case

-- w_at_pi_flsh_2
-- w_at_afgrip_2
-- w_at_muzzle_1
-- w_at_muzzle_3
-- w_at_muzzle_2
-- w_at_muzzle_5
-- w_at_muzzle_6
-- w_at_muzzle_7
-- w_at_muzzle_8
-- w_at_muzzle_9

-- w_at_pi_comp_1
-- w_at_pi_rail_1
-- w_at_scope_macro_2_mk2
-- w_at_scope_small_mk2
-- w_at_scope_medium_2
-- w_at_scope_nv
-- w_at_sights_1
-- w_at_sights_smg
-- w_at_sr_supp3


-- gr_prop_gr_drill_01a

-- gr_prop_gr_driver_01a
-- gr_prop_gr_pliers_01
-- gr_prop_gr_pliers_02
-- gr_prop_gr_rasp_01
-- gr_prop_gr_rasp_02
-- gr_prop_gr_rasp_03
-- gr_prop_gr_sdriver_01
-- gr_prop_gr_sdriver_02
-- gr_prop_gr_sdriver_03

-- gr_prop_gr_vice_01a
