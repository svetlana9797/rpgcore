# SwiftFMIRPCore

This project defines the main building blocks for a RolePlayingGame. It conatians a stub implementation to show that a game can be build. The project is separaetd to several modules and each module, can be re-defined.

--------------------------------------------------------------------------------------------------------

Map Generation & Player Movement Implementation

The initialization of the map is as follows:

For n players, the map's dimensions are 3n X 3n. The map contains 3n treasure chests, 3n stones, 3n walls and 2n teleports. The other tiles on the map are empty.

After insertion, all tiles in the map are shuffled and the playersPositions and teleportsPositions are initialized. The n players are positioned on empty tiles.

When a player steps on a "special" tile, an action is performed based on the tile type. After that the tile becomes an empty tile.
- stone - the player looses 1 energy to break the stone and "step" on the tile
- chest - the player receives an award - armor, weapon or energy points
- teleport - the player is transferred to a random teleport X from the list of all teleports. After the transfer, the teleport X becomes empty.

All players are of different race. The tile where the player is currently situated contains information about his race. The MapRenderer visualizes the players on the map based on their race by checking the tile's "state".

If two players are on the same tile a fight is generated. The player which last stepped on this tile is the attacker and he looses 1 energy point to start the fight. Then the players pick their weapon and armor for the battle. Only one player survives the fight.