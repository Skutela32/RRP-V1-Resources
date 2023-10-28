Config = {};

Config.IdCardSettings = {
   closeKey = 'Backspace',
   autoClose = {
      status = true, -- or true
      time = 6000
   }
};

Config.Licenses = {
   ['id_card'] = {
      header = 'Passport',
      background = '#ebf7fd',
      prop = 'prop_franklin_dl'
   },
   ['B'] = {
      header = 'Driver License',
      background = '#febbbb',
      prop = 'prop_franklin_dl',
   },
   ['N'] = {
      header = 'Theory',
      background = '#c7ffe5',
      prop = 'prop_franklin_dl',
   },
   ['lawyerpass'] = {
      header = 'Lawyer Pass',
      background = '#f9c491',
      prop = 'prop_cs_r_business_card'
   },
   ['nhsbluecard'] = {
      header = 'NHS Blue Card',
      background = '#319cd1ff',
      prop = 'prop_cs_r_business_card',
    }
}
