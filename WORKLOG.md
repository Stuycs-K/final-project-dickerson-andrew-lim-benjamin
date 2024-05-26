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
 - Began development on tile collision.

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