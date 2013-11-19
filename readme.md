# Elite.JS
## The original Elite, implemented in Javascript

### Motivation

Because I can :)

### Roadmap

Version 0.1 - Space station trading mechanic implemented (buy, sell, update cargohold)

Version 0.2 - Basic equipment handling implemented (ability to buy and sell equipment)

Version 0.3 - Galaxy implemented, basic planet info (government, tech level, position in the galaxy)

Version 0.4 - Ability to leave the station, fly and look around

Version 0.5 - Collision detection

Version 0.6 - Station rotation, Planet and Sun. Lasers.

Version 0.7 - Docking, altitude and sun heat. Shield Damage, shield recharge. Torus Drive. Complete planetary information.

Version 0.8 - Equipment is only active when installed on the spacecraft. External heat shielding, Shields, hyperdrive, fuel, fuel scoops.

Version 0.9 - All ship models. Dummy AI (random ships flying in straight line or chase). Legal Status implemented. Missiles.

Version 1.0 - Basic Pirate AI. Basic Viper AI. Formation flying. Bounties. Minimum playable version.

Version 1.1 - Witchdrive Fuel injectors. Cargohold Expansion. ECM system (player-only). Energy Bombs. Galactic Hyperdrive.

Version 1.2 - Docking computer. AI docking. ECM system (AI). Extra energy unit. Shield boosters.

Version 1.3 - Rock hermits

Version 1.4 - Traders (with escorts)

Version 1.5 - Miners

Version 1.6 - Combat between AI ships

Version 1.7 - Thargoids (with Thargons!)! Witchspace

Version 2.0 - Missions!

Version 3.0 - Multiplayer

Version 4.0+ - OOlite feature parity

Version 5.0 - Plugins

Version 99.99 - Generation Ships.


### Design considerations

#### Cargo

We should be able to abstract the concept of 'containers' and their items. A cargohold is a specialized type of container, which goes on ships, which stores commodities. However, other types of containers can exist.

For instance, a ship's equipment can be stored in its 'equipment bay'. It differs from a cargohold because (in the Elite universe) it only accepts a single type of item (can't have two 'Forward Laser', or two 'Escape Capsule'). It is possible to have a 'Missile Bay' too, which accepts only instances of 'Missile'.

Other examples:

A floating cargo canister in space can contain an arbitrary amount of a single commodity. A floating 'platelet' contains 1 tonne of alloys. A small asteroid piece contains 1 tonne of minerals. A Space Station can have a Police Dock which contains only 'Vipers'. And so on.

This can be taken to extremes by having a 'Fuel Tank', which only takes fuel.
