int leversPressed = 0;
boolean bossSpawned = false;
int dead = -1;
int mode = 0;
ArrayList<Adventurer> entityList = new ArrayList<Adventurer>();
ArrayList<Bullet> bulletList = new ArrayList<Bullet>();
int TILE_SIZE = 100;
boolean mouseLeft = false;
HashMap<String, PImage> squareImageMap;
HashMap<String, PImage> spriteImageMap;
PImage healthbaroutline, healthbar6, healthbar5, healthbar4, healthbar3, healthbar2, healthbar1, healthbar0, sky, floor, water, grassydirtwall, dirtwallupper, dirtwalllower, grassydirtwallwithshadow, lever, levertoggled, door, uncracked, cracked, p1up, p1down, p1left, p1right, arrow, slimedown, slimeleft, slimeright, slimeup, bossLeft, bossRight, AOE, slimebullet;
Map gameMap;
Player p1;

void setup() {
  
  size(1500, 1000);
  surface.setResizable(false);
  //fullScreen();
  
  PFont PixeloidSans = createFont("PixeloidSans.ttf", 128);
  textFont(PixeloidSans);
      
  gameMap = initializeMap();
  p1 = new Player(12, 8, "eggie", 50);
  entityList.add(p1);
  
  if(mode == 0){
  
    keyboardInput = new KeyboardBuffer();
    
    squareImageMap = new HashMap<String, PImage>();
    String[] squareImageNames = {"floor", "water", "grassydirtwall(3)", "dirtwallupper(2)", "dirtwalllower(2)", "grassydirtwallwithshadow", "lever", "levertoggled", "door", "uncracked", "cracked", "AOE", "slimebullet"};
    int[] squareImageSizes = {TILE_SIZE, TILE_SIZE, TILE_SIZE, TILE_SIZE, TILE_SIZE, TILE_SIZE, TILE_SIZE, TILE_SIZE, TILE_SIZE, TILE_SIZE, TILE_SIZE, 255, 19};
    for (int i = 0; i < squareImageNames.length; i++) {
      String imageName = squareImageNames[i];
      String imagePath = "Images/" + imageName + ".png";
      PImage img = loadImage(imagePath);
      img.resize(squareImageSizes[i], squareImageSizes[i]);
      squareImageMap.put(imageName, img);
    }
    floor = squareImageMap.get("floor");
    water = squareImageMap.get("water");
    grassydirtwall = squareImageMap.get("grassydirtwall(3)");
    dirtwallupper = squareImageMap.get("dirtwallupper(2)");
    dirtwalllower = squareImageMap.get("dirtwalllower(2)");
    grassydirtwallwithshadow = squareImageMap.get("grassydirtwallwithshadow");
    lever = squareImageMap.get("lever");
    levertoggled = squareImageMap.get("levertoggled");
    door = squareImageMap.get("door");
    uncracked = squareImageMap.get("uncracked");
    cracked = squareImageMap.get("cracked");
    AOE = squareImageMap.get("AOE");
    slimebullet = squareImageMap.get("slimebullet");
    
    spriteImageMap = new HashMap<String, PImage>();
    String[] spriteImageNames = {"p1up", "p1down", "p1left", "p1right", "arrow", "slimeup", "slimedown", "slimeleft", "slimeright", "bossLeft", "bossRight", "healthbaroutline", "healthbar6", "healthbar5", "healthbar4", "healthbar3", "healthbar2", "healthbar1", "healthbar0"};
    int[] spriteImageSizes = {72, 72, 72, 72, 72, 72, 72, 72, 9, 45, 22*2, 18*2, 22*2, 18*2, 22*2, 18*2, 22*2, 18*2, 120, 100, 120, 100, 185, 100, 160, 100, 165, 100, 160, 100, 160, 100, 160, 100, 160, 100, 160, 100};
    for (int i = 0; i < spriteImageNames.length; i++) {
      String imageName = spriteImageNames[i];
      String imagePath = "Images/" + imageName + ".png";
      PImage img = loadImage(imagePath);
      img.resize(spriteImageSizes[i*2], spriteImageSizes[i*2+1]);
      spriteImageMap.put(imageName, img);
    }
    p1up = spriteImageMap.get("p1up");
    p1down = spriteImageMap.get("p1down");
    p1left = spriteImageMap.get("p1left");
    p1right = spriteImageMap.get("p1right");
    slimeup = spriteImageMap.get("slimeup");
    slimedown = spriteImageMap.get("slimedown");
    slimeleft = spriteImageMap.get("slimeleft");
    slimeright = spriteImageMap.get("slimeright");
    bossLeft = spriteImageMap.get("bossLeft");
    bossRight = spriteImageMap.get("bossRight");
    arrow = spriteImageMap.get("arrow");
    healthbaroutline = spriteImageMap.get("healthbaroutline");
    healthbar6 = spriteImageMap.get("healthbar6");
    healthbar5 = spriteImageMap.get("healthbar5");
    healthbar4 = spriteImageMap.get("healthbar4");
    healthbar3 = spriteImageMap.get("healthbar3");
    healthbar2 = spriteImageMap.get("healthbar2");
    healthbar1 = spriteImageMap.get("healthbar1");
    healthbar0 = spriteImageMap.get("healthbar0");
    
   
    int[][] startMenuLayout = {
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
      {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
    };
    Room startMenuRoom = new Room(startMenuLayout);
  
    startMenuRoom.drawRoom();
        
    sky = loadImage("Images/sky(2).png");
    sky.resize(TILE_SIZE*15, TILE_SIZE*8);
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
