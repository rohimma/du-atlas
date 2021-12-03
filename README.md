# DU-Atlas
an atlas for dual universe.  
activate the programming board and click on the location where you want to go

## Example
![alt text](https://raw.githubusercontent.com/rohimma/du-atlas/main/du-atlas.png "example image")

## How to set up

1. Place a programming board and a screen
2. Connect the programming board to the screen
3. Paste the lua code from lua.json to the board (click on the file and then on the raw button for easy copy)
4. Enjoy :)

## How to edit the waypoint list
edit the lua board (ctrl + l)  
go to `library` > `start`  
here you see the default list:  
```
locations = {
    {
        name = 'My Spots',
        list = {
            {
                name = 'My Base',
                location = '::pos{0,2,-67.2215,171.6768,83.4687}'
            }
        }
    },
    {
        name = 'Special Locations',
        list = {
            {
                name = 'The Hedronic library',
                location = '::pos{0,8,1.3405,133.7848,55.9334}'
            },
            {
                name = 'Jasper spacebase',
                location = '::pos{0,2,-9.1616,162.6723,621410.9375}'
            },
            {
                name = 'NQ pixel art',
                location = '::pos{0,0,7541779.0000,22300232.0000,6489264.0000}'
            },
            {
                name = 'Metallic Dugo and Fonds',
                location = '::pos{0,26,7.9501,-19.0057,10.3428}'
            },
            {
                name = 'TicTacs Ship Shop',
                location = '::pos{0,2,-66.2150,156.4984,-0.0000}'
            },
            {
                name = 'Snowhex Sanc',
                location = '::pos{0,26,88.4855,-30.5057,143.2993}'
            },
            {
                name = 'd4nkknight Showroom',
                location = '::pos{0,2,6.6084,80.3590,2.3621}'
            },
            {
                name = 'Infinity Spaceport',
                location = '::pos{0,2,7.9912,79.3320,0.0004}'
            },
            {
                name = 'Utopia Space Center',
                location = '::pos{0,0,13662322.5694,7547220.7030,-215970.4049}'
            }
        }
    },
    {
        name = 'Markets',
        list = {
            {
                name = 'Disctrict market 6',
                location = '::pos{0,2,36.0044,101.3503,220.0897}'
            }
        }
    },
    {
        name = 'Race tracks',
        list = {
            {
                name = 'Obsidian Race Area',
                location = '::pos{0,2,-14.5771,-12.0537,-0.0008}'
            },
            {
                name = 'PINTDeathBlossom',
                location = '::pos{0,2,-9.7257,-166.9100,4.1896}'
            },
            {
                name = 'GWNC',
                location = '::pos{0,2,0.3699,-178.1286,45.0133}'
            },
            {
                name = 'Melanuma',
                location = '::pos{0,2,0.2342,108.8616,62.4634}'
            },
            {
                name = 'Anvilworks ',
                location = '::pos{0,2,-4.9108,94.8415,1.2653}'
            },
            {
                name = 'Pure Velocity Raceway',
                location = '::pos{0,2,4.9829,147.5784,594.0582}'
            },
            {
                name = 'DesertOasis',
                location = '::pos{0,2,-4.1999,117.2064,55.3775}'
            },
            {
                name = 'GTFOval',
                location = '::pos{0,2,0.2342,108.8616,62.4634}'
            }
        }
    }
}

```

to add an second location to the `my spots` tab you change that part to:
```
    {
        name = 'My Spots',
        list = {
            {
                name = 'My Base',
                location = '::pos{0,2,-67.2215,171.6768,83.4687}'
            },
            {
                name = 'My second location',
                location = '::pos{0,2,-67.2215,171.6768,83.4687}'
            }
        }
    },
```

you can also add or remove tabs from the list if you want.


## how to configure the color
right click on the programming board and then `Advanced` > `Edit Lua parameters`

![alt text](https://raw.githubusercontent.com/rohimma/du-atlas/main/parameters.png "example image")
- r: value between 0 and 1
- g: value between 0 and 1
- b: value between 0 and 1
