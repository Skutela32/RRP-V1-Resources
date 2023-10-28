QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.QBJobsStatus = false -- true: integrate qb-jobs into the whole of qb-core | false: treat qb-jobs as an add-on resource.
QBShared.Jobs = {} -- All of below has been migrated into qb-jobs
if QBShared.QBJobsStatus then return end
QBShared.Jobs = {
	['unemployed'] = {
		label = 'Civilian',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Freelancer',
                payment = 5
            },
        },
	},
	['whitewidow'] = {
		label = 'White Widow',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 20
            },
			['1'] = {
                name = 'Deliveries',
                payment = 25
            },
			['2'] = {
                name = 'Sales',
                payment = 30
            },
			['3'] = {
                name = 'Grower',
                payment = 50
            },
			['4'] = {
                name = 'Assistant Manager',
                payment = 60
            },
			['5'] = {
                name = 'Manager',
				isboss = true,
                payment = 75
            },
			['6'] = {
                name = 'Owner',
				isboss = true,
                bankAuth = true,
                payment = 100
            },
        },
	},
	['burgershot'] = {
		label = 'BurgerShot',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 10 },
			['1'] = { name = 'Novice', payment = 20 },
			['2'] = { name = 'Experienced', payment = 30 },
			['3'] = { name = 'Advanced', payment = 30 },
			['4'] = { name = 'Manager', isboss = true, bankAuth = true, payment = 45 },
        },
	},
	['dominos'] = {
		label = 'Dominos Pizza',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 10 },
			['1'] = { name = 'Novice', payment = 20 },
			['2'] = { name = 'Experienced', payment = 30 },
			['3'] = { name = 'Advanced', payment = 30 },
			['4'] = { name = 'Manager', isboss = true, bankAuth = true, payment = 45 },
        },
	},
	['kebab'] = {
		label = 'King Kebab',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 10 },
			['1'] = { name = 'Novice', payment = 20 },
			['2'] = { name = 'Experienced', payment = 30 },
			['3'] = { name = 'Advanced', payment = 30 },
			['4'] = { name = 'Manager', isboss = true, bankAuth = true, payment = 45 },
        },
	},
	['bennysgarage'] = {
		label = 'Bennys',
		defaultDuty = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 10 },
			['1'] = { name = 'Novice', payment = 20 },
			['2'] = { name = 'Experienced', payment = 30 },
			['3'] = { name = 'Advanced', payment = 35 },
			['4'] = { name = 'Manager', isboss = true, bankAuth = true, payment = 50 },
        },
	},
	['catcafe'] = {
		label = 'Cat Cafe',
		defaultDuty = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 10 },
			['1'] = { name = 'Novice', payment = 20 },
			['2'] = { name = 'Experienced', payment = 30 },
			['3'] = { name = 'Advanced', payment = 35 },
			['4'] = { name = 'Manager', isboss = true, bankAuth = true, payment = 50 },
        },
	},
    ['midnightsyn'] = {
		label = 'Midnight Syndicate',
		defaultDuty = false,
		grades = {
            ['0'] = { name = 'Employee', payment = 10 },
			['1'] = { name = 'Senior Employee', payment = 20 },
			['2'] = { name = 'Experienced', payment = 30 },
			['3'] = { name = 'Manager', payment = 35 },
			['4'] = { name = 'CEO', isboss = true, bankAuth = true, payment = 50 },
        },
	},
    ['pipedown'] = {
		label = 'Pipe Down Cigars',
		defaultDuty = false,
		grades = {
            ['0'] = { name = 'Employee', payment = 10 },
			['1'] = { name = 'Senior Sales', payment = 20 },
			['2'] = { name = 'CEO', isboss = true, bankAuth = true,payment = 50 },
        },
	},
    ----------------------------Business & Construction----------------------------------------------------
    ['spbc'] = {
		label = 'Business & Construction',
		defaultDuty = false,
		grades = {
            ['0'] = { name = 'Apprentice', payment = 10 },
			['1'] = { name = 'Resturant Worker', payment = 20 },
            ['2'] = { name = 'Resturant Supvervisor', payment = 20 },
            ['3'] = { name = 'Resturant Manager', payment = 20 },
            ['4'] = { name = 'Global Employee', payment = 20 },
            ['5'] = { name = 'HR', payment = 20 },
            ['6'] = { name = 'Global Manager', payment = 20 },
            ['7'] = { name = 'Council Member', payment = 20 },
			['8'] = { name = 'CEO', isboss = true, bankAuth = true, payment = 50 },
        },
	},
    ['itcomp'] = {
		label = 'Pieces of IT',
		defaultDuty = false,
		grades = {
            ['0'] = { name = 'Employee', payment = 10 },
			['1'] = { name = 'Manager', payment = 20 },
            ['2'] = { name = 'HR - B&C', payment = 20 },
			['3'] = { name = 'CEO - B&C', isboss = true, bankAuth = true, payment = 50 },
        },
	},
    ['lockjelw'] = {
		label = 'Lockos Jewellers',
		defaultDuty = false,
		grades = {
            ['0'] = { name = 'Employee', payment = 10 },
			['1'] = { name = 'Manager', payment = 20 },
            ['2'] = { name = 'HR - B&C', payment = 20 },
			['3'] = { name = 'CEO', isboss = true, bankAuth = true, payment = 50 },
        },
	},
    ['gym'] = {
		label = 'Pump n Run',
		defaultDuty = false,
		grades = {
            ['0'] = { name = 'Employee', payment = 10 },
			['1'] = { name = 'Manager', payment = 20 },
            ['2'] = { name = 'HR - B&C', payment = 20 },
			['3'] = { name = 'CEO', isboss = true, bankAuth = true, payment = 50 },
        },
	},
    --------------------------------------------------------------------------------
    ['storagewars'] = {
		label = 'Storage Wars',
		defaultDuty = false,
		grades = {
            ['0'] = { name = 'Employee', payment = 10 },
			['1'] = { name = 'Manager', isboss = true, bankAuth = true, payment = 25 },
        },
	},
    ['casino'] = {
        label = 'Casino',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = { 
                name = 'Employee', 
                payment = 50 
            },
            ['1'] = { 
                name = 'Boss', 
                isboss = true, 
                bankAuth = true,
                payment = 100 
            },
        },
    },
	['pizzeria'] = {
		label = 'The Pizza Zone',
		defaultDuty = false,
		grades = {
            ['0'] = { name = 'Employee', payment = 10 },
			['1'] = { name = 'Chef', payment = 20 },
			['2'] = { name = 'Manager', payment = 30 },
			['3'] = { name = 'Owner', isboss = true, bankAuth = true, payment = 35 },
        },
	},
    ['bahama'] = {
		label = 'Bahama Mamas',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 5
            },
			['1'] = {
                name = 'Employee',
                payment = 10
            },
			['2'] = {
                name = 'Manager',
                payment = 15
            },
			['3'] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 15
            },
        },
	},
	['police'] = {
		label = 'Met Police',
        type = "leo",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Patrol',
                payment = 100
            },
			['1'] = {
                name = 'MO8',
                payment = 150
            },
			['2'] = {
                name = 'MO19',
                payment = 200
            },
			['3'] = {
                name = 'Commander',
                isboss = true,
                payment = 250
            },
			['4'] = {
                name = 'Commissioner',
				isboss = true,
                bankAuth = true, 
                payment = 300
            },
        },
	},
	['ambulance'] = {
		label = 'National Health Services',
        type = 'ems',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Student Paramedic ',
                payment = 100
            },
			['1'] = {
                name = 'Advanced Paramedic',
                payment = 150
            },
			['2'] = {
                name = 'Senior Paramedic',
                payment = 200
            },
			['3'] = {
                name = 'High Command',
                payment = 250
            },
			['4'] = {
                name = 'CEO',
				isboss = true,
                bankAuth = true,
                payment = 300
            },
        },
	},
	['repo'] = {
		label = 'Repo',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Repo',
                payment = 50
            },
			['1'] = {
                name = 'Repo',
                payment = 100
            },
			['2'] = {
                name = 'Repo',
                payment = 150
            },
			['3'] = {
                name = 'Repo',
                payment = 200
            },
			['4'] = {
                name = 'Repo Boss',
				isboss = true,
                bankAuth = true,
                payment = 250
            },
        },
	},
	['lfb'] = {
		label = 'London Fire Brigade',
        type = 'ems',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Trainee Firefighter',
                payment = 100
            },
			['1'] = {
                name = 'Firefighter',
                payment = 150
            },
			['2'] = {
                name = 'Advanced Firefighter',
                payment = 200
            },
			['3'] = {
                name = 'Lead Firefighter',
                payment = 250
            },
			['4'] = {
                name = 'Chief Firefighter',
				isboss = true,
                bankAuth = true,
                payment = 300
            },
        },
	},
	['realestate'] = {
		label = 'Real Estate',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 5
            },
			['1'] = {
                name = 'House Sales',
                payment = 10
            },
			['2'] = {
                name = 'Business Sales',
                payment = 15
            },
			['3'] = {
                name = 'Broker',
                payment = 20
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                bankAuth = true,
                payment = 25
            },
        },
	},
	['taxis'] = {
		label = 'Lukes Cabs',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 5
            },
			['1'] = {
                name = 'Advanced Driver',
                payment = 10
            },
			['2'] = {
                name = 'Events Driver',
                payment = 15
            },
			['3'] = {
                name = 'Business Driver',
                payment = 20
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                bankAuth = true,
                payment = 30
            },
        },
	},
    ['bus-driver'] = {
		label = 'Bus',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 15
            },
		},
	},
    ['forklift-driver'] = {
		label = 'ForkLift Driver',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 15
            },
		},
	},
	['cardealer'] = {
		label = 'Vehicle Dealer',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 10
            },
			['1'] = {
                name = 'Showroom Sales',
                payment = 15
            },
			['2'] = {
                name = 'Business Sales',
                payment = 20
            },
			['3'] = {
                name = 'Finance',
                payment = 25
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                bankAuth = true,
                payment = 40
            },
        },
	},
	['mechanic'] = {
		label = 'Essex Customs',
        type = "mechanic",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Apprentice',
                payment = 30
            },
			['1'] = {
                name = 'Mechanic',
                payment = 40
            },
			['2'] = {
                name = 'Experienced Mechanic',
                payment = 60
            },
			['3'] = {
                name = 'Head Mechanic',
                payment = 80
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                bankAuth = true,
                payment = 100
            },
        },
	},
	['mechanic2'] = {
		label = 'TunerShop',
        type = "mechanic",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Apprentice',
                payment = 30
            },
			['1'] = {
                name = 'Mechanic',
                payment = 40
            },
			['2'] = {
                name = 'Experienced Mechanic',
                payment = 60
            },
			['3'] = {
                name = 'Head Mechanic',
                payment = 80
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                bankAuth = true,
                payment = 100
            },
        },
	},
	['srs'] = {
		label = 'Yanamize',
        type = "mechanic",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Apprentice',
                payment = 30
            },
			['1'] = {
                name = 'Mechanic',
                payment = 40
            },
			['2'] = {
                name = 'Experienced Mechanic',
                payment = 60
            },
			['3'] = {
                name = 'Head Mechanic',
                payment = 80
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                bankAuth = true,
                payment = 100
            },
        },
	},
	['redline'] = {
		label = 'Redline',
        type = "mechanic",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Apprentice',
                payment = 30
            },
			['1'] = {
                name = 'Mechanic',
                payment = 40
            },
			['2'] = {
                name = 'Experienced Mechanic',
                payment = 60
            },
			['3'] = {
                name = 'Head Mechanic',
                payment = 80
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                bankAuth = true,
                payment = 100
            },
        },
	},
	['judge'] = {
		label = 'Honorary',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Judge',
                payment = 100
            },
        },
	},
	['lawyer'] = {
		label = 'Law Firm',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Associate',
                payment = 75
            },
        },
	},
	['reporter'] = {
		label = 'Reporter',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Journalist',
                payment = 10
            },
        },
	},
	['trucker'] = {
		label = 'Trucker',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 10
            },
        },
	},
	['tow'] = {
		label = 'Towing',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 10
            },
        },
	},
	['heli-driver'] = {
		label = 'Helicopter User',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'In Training',
                payment = 15
            },
        },
	},
    ['lifeguard'] = {
		label = 'Southend Lifeguard',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Employee',
                payment = 15
            },
        },
	},
	['vineyard'] = {
		label = 'Vineyard',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Picker',
                payment = 10
            },
        },
	},
	['lifeguard'] = {
		label = 'Southend Lifeguard',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Sales',
                payment = 10
            },
        },
	},
	
	["telco"] = {
		label = "Technician",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Communications",
                payment = 10
            },
        },
    },
}
