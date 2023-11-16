// ************** Creating and Populating Songs Collection  ***************

db.songs.insertMany([
    {
        _id: 'Liarinth001001',
        name: 'Pygmalion',
        duration: 189
    },
    {
        _id: 'Liarinth001002',
        name: 'Vesper',
        duration: 259
    },
    {
        _id: 'Liarinth001003',
        name: 'Western Digital',
        duration: 324
    },
    {        
        _id: 'KanyeWest001001',
        name: 'Yeezus',
        duration: 259
        
    },
    {
        _id: 'KanyeWest001002',
        name: 'Yeezy210',
        duration: 259
    },
    {
        _id: 'KanyeWest001003',
        name: 'Yeezy840',
        duration: 259
    },
    {
        _id: 'KayRab001001',
        name: 'Kaboom',
        duration: 259
    },
    {
        _id: 'KayRab001002',
        name: 'Dissolve',
        duration: 259
    },
    {
        _id: 'JongXina001001',
        name: 'Xuehua',
        duration: 256
    },
    {
        _id: 'JongXina001002',
        name: 'Not that red',
        duration: 159
    },
    {
        _id: 'BullMan001001',
        name: 'Cowboy blues',
        duration: 149
    },
    {
        _id: 'ASAP001001',
        name: 'Pretty Flacko',
        duration: 171
    },
    {
        _id: 'ASAP001002',
        name: 'Peso',
        duration: 196
    },
    {
        _id: 'ASAP001003',
        name: 'Gold',
        duration: 301
    }
])



// ************** Creating and Populating Artist Collection  ***************



db.artist.insertMany([
    {
        _id: '1',
        name: 'Liarinth',
        songs: [
            "Liarinth001001",
            "Liarinth001002",
            "Liarinth001003"
        ],
        joinDate: new Date(),
        genre: 'Electronic/Techno/Downtempo',
        bio:'Introducing you to a new world'
    },
    {
        _id: '2',
        name: 'Kanye West',
        songs: [
            "KanyeWest001001",
            "KanyeWest001002",
            "KanyeWest001003"
        ],
        joinDate: new Date(),
        genre: 'HIp Hop',
        bio:'Beyonce had the greatest video of all time'
    },
    {
        _id: '3',
        name: 'KayRab',
        songs: [
            "KayRab001001",
            "KayRab001002"
        ],
        joinDate: new Date(),
        genre: 'Experimental',
        bio:'A young and upcoming producer that likes to play around with new sound'
    },
    {
        _id: '4',
        name: 'Jong Xina',
        songs: [
            "JongXina001001",
            "JongXina001002"
        ],
        joinDate: new Date() , //new Date(2012-02-12),
        genre: 'Experimental',
        bio:'Representing the Republic'
    },
    {
        _id: '5',
        name: 'BullMan',
        songs: [
            "BullMan001001"
        ],
        joinDate: new Date(),
        genre: 'HIp Hop',
        bio:'Beyond your regular CowBoy'
    },
    {
        _id: '6',
        name: 'ASAP',
        songs: [
            "ASAP001001",
            "ASAP001002",
            "ASAP001003"
        ],
        joinDate: new Date(),
        genre: 'HIp Hop',
        bio:'Always Strive And Prosper'
    }
])



// ************** Creating and Populating Music Listener Collection  ***************

db.musicListener.insertMany([
    {
        _id: "ml001",
        name: "GloriaM12",
        dateCreated: new Date()
    },
    {
        _id: "ml002",
        name: "JustinTime99",
        dateCreated: new Date()
    },
    {
        _id: "ml003",
        name: "Goblinslayer22",
        dateCreated: new Date()
    }

])



// ************** Creating and Populating Currently Playing Collection  ***************

db.currentlyPlaying.insertMany([
    {
        _id: "cp001",
        musicListener_id: "ml003",
        songs: [
            "Liarinth001001",
            "Liarinth001002"
        ]
    },
    {
        _id: "cp002",
        musicListener_id: "ml002",
        songs: [
            "Liarinth001001",
            "ASAP001002",
            "ASAP001003",
            "KanyeWest001002"
        ]
    },
    {
        _id: "cp003",
        musicListener_id: "ml001",
        songs: [
            "Liarinth001001"
        ]
    }
    
])

// ************** Creating and Populating Playlist Collection  ***************

db.playlist.insertMany([
    {
        _id: "pl001",
        name: "relaxation",
        musicListener_id: "ml002",
        songs: [
            "Liarinth001001",
            "Liarinth001002"
        ]
    },
    {
        _id: "pl002",
        name: "hype",
        musicListener_id: "ml002",
        songs: [
            "Liarinth001002",
            "KayRab001002"
        ]
    },
    {
        _id: "pl003",
        name: "chilling",
        musicListener_id: "ml001",
        songs: [
            "Liarinth001001",
            "KayRab001002",
            "JongXina001002"
        ]
    },
    {
        _id: "pl004",
        name: "workout",
        musicListener_id: "ml002",
        songs: [
            "ASAP001002",
            "KayRab001002"
        ]
    },
    {
        _id: "pl005",
        name: "chilling",
        musicListener_id: "ml001",
        songs: [
            "Liarinth001001",
            "KayRab001002",
            "ASAP001002",
            "ASAP001003"
        ]
    },
    {
        _id: "pl006",
        name: "chilling",
        musicListener_id: "ml003",
        songs: [
            {"song_id":"Liarinth001001"},
            {"song_id":"KayRab001002"},
            {"song_id":"ASAP001002"},
            {"song_id":"KayRab001002"}
        ]
    }
])



// ************** Mongo Join equivalent  ***************

db.MusicListener.aggregate([
    
    {
        "$match":{ name:"JustinTime99"}
    },
    {
        $lookup:{
            from: "playlist",
            localField: "_id",
            foreignField: "musicListener_id",
            as: "playlistsbyUser"
        }
    },
    {
        $lookup:{
            from: "currentlyPlaying",
            localField: "_id",
            foreignField: "musicListener_id",
            as: "currentlyPlayedbyUser"
        }
    }
])




// ************** SHOWING SUBTYPE  ***************

db.getCollection("playlist").find( { "songs": "Liarinth001001" } )  //{"name":""}


// ************** OLUP Similar Mongo evuivalent  ***************

db.songs.aggregate([
    {
        $match: { }
    },
    {
        $group:{_id: "songs", totalLength:{$sum:"$duration"}} //"duration"
    }
])