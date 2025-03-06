Config = {}

Config.DirtyMoney = 'black_money'

Config.MoneyWash = {
    
    vanila = {
        job = 'vanila',
        minToClean = 5,
        location = vector3(21.9828, -1710.5082, 29.2944),
    },

    tequila = {
        job = 'tequila',
        minToClean = 5,
        location = vector3(21.9828, -1710.5082, 29.2944),
    },

}

Config.Drugs = {

    coke = {
        collectLocations = {
            vector3(-313.7083, -983.2488, 31.0846),
        },
        processLocations = {
            vector3(-313.7083, -983.2488, 31.0846),
        },
        sellPedLocation = {
            vector4(-313.7083, -983.2488, 31.0846, 180.0),
        },
        collectItem = 'weed',
        processItem = 'weed_packaged',
        collectItemLabel = 'Erva',
        processItemLabel = 'Erva',
        minToProcess = 5,
        quantityToSell = 100,
        sellValue = 20000,
    },

    meta = {
        collectLocations = {
            vector3(-313.7083, -985.2488, 31.0846),
        },
        processLocations = {
            vector3(-313.7083, -987.2488, 31.0846),
        },
        sellPedLocation = {
            vector4(-316.4042, -980.2789, 31.0846, 180.0),
        },
        collectItem = 'chemicals',
        processItem = 'meth',
        collectItemLabel = 'Quimicos',
        processItemLabel = 'Meta',
        minToProcess = 5,
        quantityToSell = 100,
        sellValue = 20000,
    }

}