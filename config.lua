Config = {}

-- Usable items configuration
Config.UsableItems = {
    ['bandage'] = {
        label = 'Bandage',
        useTime = 5000,
        healAmount = 50,
        removeItem = true
    },
    ['medkit'] = {
        label = 'Medkit',
        useTime = 10000,
        healAmount = 100,
        removeItem = true
    }
}

-- Database configuration
Config.Database = {
    tableName = 'usable_items'
}