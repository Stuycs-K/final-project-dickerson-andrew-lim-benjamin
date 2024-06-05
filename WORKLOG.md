# Work Log

## Andrew Dickerson

### 5/22/24

 - Added setup. Began constructors for Map/Room/Tile(s)

### 5/23/24

 - Fixed implementation of Map/Room/Tile data structure.
 - Added basic drawTile functionality for all tile extensions.
 - Added default testerRoomLayout for testing purposes.
 - Added basic player moving functionality using WASD.

### 5/24/24

 - Reworked player movement to use KeyboardBuffer class.
 - Added tile collision to prevent player from moving into tiles where collision is true.

### 5/26/24

- Fixed getType() in Tile class and all subclasses. 
- Fixed implementation of changeRoom() on entering door to work properly. 
- Added very basic designs for all 9 rooms.
- Added lever functionality.

### 5/27/24

- Reworked bullet class to only hit opposite 'team' adventurers. 
- Added collision to bullets with tiles that are not permeable.
- Added speed modifier to bullet class.
- Implemented delay between shots. 
- Player can now hold left click to fire continuously.
- Added breaking of breakable tiles by shooting.

### 5/28/24

- Added basic enemy movement using random ints.
- Added enemy spawning at valid random locations.
- Made enemies only run if they are in the same room as the player.
- Changed Bullet class and shoot() implementation to be compatible with shoot() for enemies later.
- Crash issue where player enters top door before any others.

### 5/29/24

- Fixed door issues created by overlap of variables in player and adventurer classes.
- Added random number of enemy spawns to each room. 
- Adjusted random movement patterns to choose a different direction upon hitting wall and to occasionally move towards the player.
- Adjusted bullet base speed to be more playable.
- Implemented enemy shooting towards player.

### 5/30/24

- Implemented basic boss enemy extension.
- Changed boss spawning method to also change players current room to center room, position to below boss, and to change all surrounding doors to walls.

### 5/31/24

- Added a basic health bar that changes color based on percentage of player hp.

### 6/1/24

- Fixed issue where game crashes on boss spawn. 
- Moved initialization of map rooms and all images to seperate files for visibility.
- Added player model that changes based on direction of movement.
- Issue with image loading causing game to run very slow.

### 6/3/24

- Fixed issue of game slowing due to image resizing
- Added more tile images


### 6/4/24

- Added images for all tile draw methods


## Benjamin Lim

### 5/22/24

Created structure for Adventurer abstract class + Player and Enemy classes extending it

### 5/23/24

Worked on shooting Bullet logic using angle, current issue of color registering as int when calling Bullet constructor with a color. 

### 5/24/24

Resolved color issue by using this keyword. Changed bullet, working on collision and lifespan effect on bullet. Need correct angle and triggers for bullet too.

### 5/26/24

Added radius field to adventurers for bullet collision detection
Got direction and hitboxes working for bullets

### 5/28/24

Working dodge and dodgeImmunity
Working lifeSpan
Delete bullets when swap room

### 5/29/24

Displayed win/loss after player/boss deaths
Added avatar displayed

### 5/30/24

Found and replaced player image with a svg image

### 6/1/24

Updated tile drawTile()s and tiles to display image by calling drawTile in Tile class
Added image for walls: edge walls are grass, interior are dirt w grass top
Found a bug with boss room spawning having index oob exception
