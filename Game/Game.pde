int leversPressed = 0;
boolean bossSpawned = false;
int dead = -1;
ArrayList<Adventurer> entityList = new ArrayList<Adventurer>();
ArrayList<Bullet> bulletList = new ArrayList<Bullet>();
int TILE_SIZE = 100;
boolean mouseLeft = false;
PImage waterimg;
PImage dirtwallimg;
PImage grassimg;
PImage p1up;
PImage p1down;
PImage p1left;
PImage p1right;
Map gameMap;
Player p1;

void setup() {
  size(1500, 1000);
  surface.setResizable(true);
  //fullScreen();

  keyboardInput = new KeyboardBuffer();
  gameMap = initializeMap();
  p1 = new Player(6, 8, "eggie", 50);
  entityList.add(p1);
  
  waterimg = loadImage("Images/water.jpg");
  dirtwallimg = loadImage("Images/grassydirtwall.jpg");
  grassimg = loadImage("Images/grass.jpg");
  p1up = loadImage("Images/p1up.png");
  p1down = loadImage("Images/p1down.png");
  p1left = loadImage("Images/p1left.png");
  p1right = loadImage("Images/p1right.png");
  waterimg.resize(TILE_SIZE, TILE_SIZE);
  dirtwallimg.resize(TILE_SIZE, TILE_SIZE);
  grassimg.resize(TILE_SIZE, TILE_SIZE);
  int playerImgSize = (int)(p1.getRadius()*1.5);
  p1up.resize(playerImgSize, playerImgSize);
  p1down.resize(playerImgSize, playerImgSize);
  p1left.resize(playerImgSize, playerImgSize);
  p1right.resize(playerImgSize, playerImgSize);

  //COMMENT THIS OUT TO REMOVE ENEMY SPAWNING FOR TESTING PURPOSES:
  for(int r = 0; r<gameMap.getRows(); r++){
    for(int c = 0; c<gameMap.getCols(); c++){
      int randEnemyCount = (int)random(3)+1;
      //randEnemyCount = 3;
      spawnEnemy(r, c, randEnemyCount);
    }
  }
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
    fill(0);
    textSize(128);
    text("Enemies Win!", 2*width/7-25, height/2);   
  }
  if (dead == 1) {
    // player win
    //println("You win");
    fill(0);
    textSize(128);
    text("Player Win!", width/3-50, height/2);   
  }
  // stop draw
}
