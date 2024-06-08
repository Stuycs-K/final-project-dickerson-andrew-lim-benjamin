int leversPressed = 0;
boolean bossSpawned = false;
int dead = -1;
int mode = 0;
ArrayList<Adventurer> entityList = new ArrayList<Adventurer>();
ArrayList<Bullet> bulletList = new ArrayList<Bullet>();
int TILE_SIZE = 100;
boolean mouseLeft = false;
HashMap<String, PImage> imageMap;
PImage sky, floor, water, grassydirtwall, dirtwallupper, dirtwalllower, lever, levertoggled, door, uncracked, cracked, p1up, p1down, p1left, p1right, arrow, bossLeft, bossRight;
Map gameMap;
Player p1;

void setup() {
  
  size(1500, 1000);
  surface.setResizable(false);
  //fullScreen();
  
  PFont PixeloidSans = createFont("PixeloidSans.ttf", 128);
  textFont(PixeloidSans);
      
  gameMap = initializeMap();
  p1 = new Player(15, 8, "eggie", 50);
  entityList.add(p1);
  
  if(mode == 0){
  
    keyboardInput = new KeyboardBuffer();
    
    imageMap = new HashMap<String, PImage>();
  
    String[] imageNames = {"floor", "water", "grassydirtwall(3)", "dirtwallupper(2)", "dirtwalllower(2)", "lever", "levertoggled", "door", "uncracked", "cracked", "p1up", "p1down", "p1left", "p1right", "bossLeft", "bossRight"};
    int playerImgSize = (int)(p1.getRadius() * 1.5);
    int[] imageSizes = {TILE_SIZE, TILE_SIZE, TILE_SIZE, TILE_SIZE, TILE_SIZE, TILE_SIZE, TILE_SIZE, TILE_SIZE, TILE_SIZE, TILE_SIZE, playerImgSize, playerImgSize, playerImgSize, playerImgSize, 100, 100};
  
    for (int i = 0; i < imageNames.length; i++) {
      String imageName = imageNames[i];
      String imagePath = "Images/" + imageName + ".png";
      PImage img = loadImage(imagePath);
      img.resize(imageSizes[i], imageSizes[i]);
      imageMap.put(imageName, img);
    }
    
    floor = imageMap.get("floor");
    water = imageMap.get("water");
    grassydirtwall = imageMap.get("grassydirtwall(3)");
    dirtwallupper = imageMap.get("dirtwallupper(2)");
    dirtwalllower = imageMap.get("dirtwalllower(2)");
    lever = imageMap.get("lever");
    levertoggled = imageMap.get("levertoggled");
    door = imageMap.get("door");
    uncracked = imageMap.get("uncracked");
    cracked = imageMap.get("cracked");
    p1up = imageMap.get("p1up");
    p1down = imageMap.get("p1down");
    p1left = imageMap.get("p1left");
    p1right = imageMap.get("p1right");
    bossLeft = imageMap.get("bossLeft");
    bossRight = imageMap.get("bossRight");
    arrow = loadImage("Images/arrow.png");
    arrow.resize(9, 45);
   
    int[][] startMenuLayout = {
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
      {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
      {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
    };
    Room startMenuRoom = new Room(startMenuLayout);
  
    startMenuRoom.drawRoom();
        
    sky = loadImage("Images/sky(1).png");
    sky.resize(TILE_SIZE*15, TILE_SIZE*7);
    image(sky, 0, 0);
    
    fill(251, 205, 5);
    textAlign(CENTER, BOTTOM);
    text("Press Start", width/2, height/2);
    
  }

}

void draw() {
  if(mode==0 && keyPressed){
    spawnAllEnemies();//COMMENT THIS OUT TO REMOVE ENEMY SPAWNING FOR TESTING PURPOSES:
    mode = 1;
  }
  
  if(mode==1){
    //gameMap = initializeMap();
    gameMap.drawMap();
    // other idea: make currentRoom an empty room for bossArena
    //dead = 1;
    // if player or boss dead then win("player"/"boss")
    if (dead != -1) { // if game is over
      //print(dead);
      win();
    }
    else{ // run game loop
      spawnBoss();
      lockDoors();
      int eList = entityList.size();
      if(eList > 1){
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
      }

      //println(bulletList.size());
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
    
    showBossWin();
    showPlayerWin();
    reset();
  }

}
void win() {
  // display a win screen
  if (dead == 0) {
    // enemy/boss win
    //println("You lose");
    fill(0);
    textAlign(CENTER, CENTER);
    text("Enemies Win!", width/2, height/2);
  }
  if (dead == 1) {
    // player win
    //println("You win");
    fill(0);
    textAlign(CENTER, CENTER);
    text("Player Win!", width/2, height/2);
  }
  // stop draw
}

public void spawnAllEnemies(){
  for(int r = 0; r<gameMap.getRows(); r++){
    for(int c = 0; c<gameMap.getCols(); c++){
      int randEnemyCount = (int)random(3)+1;
      spawnEnemy(r, c, randEnemyCount);
    }
  }  
}
