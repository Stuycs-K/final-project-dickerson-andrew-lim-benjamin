int leversPressed = 0;
String dead;
Map gameMap;
Player p1;

void setup(){
  size(1500,1000);
  int[][] testerRoomLayout = {
    {1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1},
    {1, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {9, 0, 0, 0, 3, 0, 0, 0, 0, 0, 4, 4, 0, 7, 1},
    {1, 3, 3, 1, 1, 0, 0, 0, 0, 4, 4, 4, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 4, 4, 0, 9},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 4, 4, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 4, 4, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1}
  };
  Room basicRoom = new Room(testerRoomLayout);
  
  gameMap = new Map(new Room[3][3]);
  for(int r = 0; r < gameMap.getRows(); r++){
    for(int c = 0; c < gameMap.getCols(); c++){
      gameMap.setRoom(r, c, basicRoom);
    }
  }

  p1 = new Player(20, "eggie");
}

void draw(){
  gameMap.drawMap();
}
