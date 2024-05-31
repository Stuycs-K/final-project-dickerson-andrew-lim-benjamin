int leversPressed = 0;
boolean bossSpawned = false;
int dead = -1;
ArrayList<Adventurer> entityList = new ArrayList<Adventurer>();
ArrayList<Bullet> bulletList = new ArrayList<Bullet>();
int TILE_SIZE = 100;
boolean mouseLeft = false;
PImage waterimg;
Map gameMap;
Player p1;

void setup() {
  waterimg = loadImage("water.jpg");
  surface.setResizable(false);
  size(1500, 1000);
  keyboardInput = new KeyboardBuffer();
  int[][] room00Layout = {
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9},
    {1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1}
  };
  Room room00 = new Room(room00Layout);

  int[][] room01Layout = {
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9},
    {1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1}
  };
  Room room01 = new Room(room01Layout);

  int[][] room02Layout = {
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1}
  };
  Room room02 = new Room(room02Layout);

  int[][] room10Layout = {
    {1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1}
  };
  Room room10 = new Room(room10Layout);

  int[][] room11Layout = {
    {1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1},
    {1, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {9, 0, 0, 0, 3, 0, 0, 0, 0, 0, 4, 4, 0, 7, 1},
    {1, 0, 3, 1, 1, 0, 0, 0, 0, 4, 4, 4, 0, 0, 1},
    {1, 0, 0, 0, 7, 0, 0, 0, 0, 4, 4, 4, 4, 0, 9},
    {1, 0, 0, 0, 7, 0, 0, 0, 0, 0, 4, 4, 4, 4, 1},
    {1, 0, 0, 0, 7, 0, 0, 0, 0, 0, 4, 4, 4, 4, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1}
  };
  Room room11 = new Room(room11Layout);

  int[][] room12Layout = {
    {1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1}
  };
  Room room12 = new Room(room12Layout);

  int[][] room20Layout = {
    {1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
  };
  Room room20 = new Room(room20Layout);

  int[][] room21Layout = {
    {1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
  };
  Room room21 = new Room(room21Layout);

  int[][] room22Layout = {
    {1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
  };
  Room room22 = new Room(room22Layout);

  gameMap = new Map(new Room[3][3]);
  gameMap.setRoom(0, 0, room00);
  gameMap.setRoom(0, 1, room01);
  gameMap.setRoom(0, 2, room02);
  gameMap.setRoom(1, 0, room10);
  gameMap.setRoom(1, 1, room11);
  gameMap.setRoom(1, 2, room12);
  gameMap.setRoom(2, 0, room20);
  gameMap.setRoom(2, 1, room21);
  gameMap.setRoom(2, 2, room22);

  p1 = new Player(3, 8, "eggie", 50);
  entityList.add(p1);

  //COMMENT THIS OUT TO REMOVE ENEMY SPAWNING FOR TESTING PURPOSES:
  for(int r = 0; r<gameMap.getRows(); r++){
    for(int c = 0; c<gameMap.getCols(); c++){
      int randEnemyCount = (int)random(3)+1;
      //randEnemyCount = 3;
      spawnEnemy(r, c, randEnemyCount);
    }
  }
  //
}

void draw() {
  gameMap.drawMap();
  //dead = 1;
  // if player or boss dead then win("player"/"boss")
  if (dead != -1) { // if game is over
    //print(dead);
    win();
  }
  else{ // run game loop
    spawnBoss();
    int eList = entityList.size();
    for (int i = 0; i < eList; i++) {
      if((entityList.get(i).getCurrentRoom()).equals(p1.getCurrentRoom())){
        if((entityList.get(i)).getHP() > 0){
          (entityList.get(i)).run();
        }
        else{
          if (Player.class.isInstance(entityList.get(i))) {
            dead = 0;
          }
          if (Boss.class.isInstance(entityList.get(i))) {
            dead = 1;
          }
          entityList.remove(entityList.get(i));
          i--;
          eList--;
        }
      }
    }
    for (int i = 0; i < bulletList.size(); i++) {
      //println(bulletList.get(i).lifespan);
      if (bulletList.get(i).run()) {
        i--;
      }
    }
  }

  if (mousePressed && mouseButton == LEFT) {
    mouseLeft = true;
  } else {
    mouseLeft = false;
  }

  if (mouseLeft && (frameCount - p1.getLastShotTime() >= p1.getShootDelay())) {
    p1.shoot();
    p1.setLastShotTime(frameCount);
  }
}
void win() {
  // display a win screen
  if (dead == 0) {
    // enemy/boss win
    //println("You lose");
    textSize(128);
    text("Enemies Win!", 2*width/7-25, height/2);   
  }
  if (dead == 1) {
    // player win
    //println("You win");
    textSize(128);
    text("Player Win!", width/3-50, height/2);   
  }
  // stop draw
}
