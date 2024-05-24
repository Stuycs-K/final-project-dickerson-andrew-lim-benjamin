int leversPressed = 0;
String dead;
ArrayList<Adventurer> entityList = new ArrayList<Adventurer>();
ArrayList<Bullet> bulletList = new ArrayList<Bullet>();
Map gameMap;
Player p1;

void setup(){
  size(1500,1000);
  keyboardInput = new KeyboardBuffer();
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

  p1 = new Player(20, 10, "eggie");
  entityList.add(p1);
}

void draw(){
  gameMap.drawMap();
  int eList = entityList.size();
  for(int i = 0; i < eList; i++){
    (entityList.get(i)).run();
  }
  for(int i = 0; i < bulletList.size(); i++) {
    //println(bulletList.get(i).lifespan);
    if (bulletList.get(i).run()) {
      i--;
    }
  }
}

void mouseClicked() {
  p1.shoot();
  println(entityList);
  println(bulletList + " | ");
}
