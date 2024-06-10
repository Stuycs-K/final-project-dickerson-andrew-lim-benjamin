public class Boss extends Enemy {
  private int chargelen;
  private int shotcount;
  private int prevchoice;
  private int nextact;
  private boolean isBeyblade;
  private int beybladeStartTime;
  private int beybladeDuration;
  private int shootInterval;
  private int lastShotTime;
  private PVector charge;
  //private int AOEcd;
  //private PVector AOEtarget;
  private ArrayList<AOE> AOElist;
  private float AOEsize;
  private boolean nextShockwave;
  
  public Boss(int hp, int speed, String name, int radius, int x, int y, int roomRow, int roomCol) {
    super(hp, speed, name, radius, x, y, roomRow, roomCol);
    chargelen = 0;
    prevchoice = -1;
    nextact = 3;
    charge = new PVector();
    isBeyblade = false;
    beybladeDuration = 5000;
    shootInterval = 50;
    //AOEtarget = new PVector();
    //AOEcd = 0;
    AOEsize = p1.getRadius()*4;
    nextShockwave = false;
    AOElist = new ArrayList<AOE>();
    setMoveDir("left");
  }

  //public Bullet(int damage, float lifespan, float size, color c, float startX, float startY, float endX, float endY, int speed, boolean ally, Room currentRoom)
  void shoot(PVector dir, int dmg, float lifespan, float size, int speed, color c) {
    bulletList.add(new Bullet(dmg, lifespan, size, c, getX(), getY(), dir.x, dir.y, speed, getAllyStatus(), getCurrentRoom(), true, slimebullet));
    setLastShotTime(frameCount);
    shotcount++;
  }
  
  void shoot() {
    if (frameCount - getLastShotTime() >= getShootDelay()) {
      int dmg = 1;
      float lifespan = 50;
      float size = 20;
      int speed = 9;
      color c = color(252,26,82);
      shoot(new PVector(p1.getX(), p1.getY()), dmg, lifespan, size, speed, c);
    }
  }
  
  void charge() {
    //println("raah" + shotcount); // testing
    prevchoice = 0;
    chargelen = 25; // frames
  }
  
  void AOE() { // skystrike
    // highlight a square around player and update in run(), do damage and display graphic after x time
    //AOEcd = 50; // target circle from 50-45, damage display 5-0
    AOElist.add(new AOE(p1.getPosition().copy(), AOEsize));
  }
  
  void shockWave() {
    int dmg = 1;
    float lifespan = 200;
    float size = 40;
    color c = color(255);
    int speed = 5;
    for (int deg = 0; deg < 360; deg += 3) { // every 6 deg
      bulletList.add(new Bullet(dmg, lifespan, size, c, getX(), getY(), getX() + cos(deg), getY() + sin(deg), speed, getAllyStatus(), getCurrentRoom(), false, null));
    }
  }
  
  void beyblade() {
    if(!isBeyblade){
      isBeyblade = true;
      beybladeStartTime = millis();
      lastShotTime = millis();
      //println("doing beyblade rn");
    }
  }
  
  public void drawEnemy(){
    //fill(128,0,128);
    //circle(this.getX(), this.getY(), getRadius());
    if(getMoveDir().equals("left")){
      image(bossLeft, getX()-bossLeft.width/2, getY()-bossLeft.height/2);
    }else{
      image(bossRight, getX()-bossRight.width/2, getY()-bossRight.height/2);
    }
  }

  void run() {
    if(!isBeyblade){
      shoot();
      if (shotcount >= nextact) {
        int choice = (int)(Math.random() * 4) + 1; // 1 - 4
        nextact = (int)(Math.random() * 4) + 1; // 1 - 4 cd
        if (choice == 1) {
          charge();
          //AOE();
          nextact = 1;
        }
        else if (choice == 2) {
          nextShockwave = true;
          charge();
          shockWave();
        }
        else if (choice == 3  && prevchoice != 3) {
          beyblade();
        }
        else if (choice == 4) {
          AOE();
        }
        shotcount = 0;
      }
      if (chargelen == 0) {
        move();
        if (nextShockwave) {
          shockWave();
          nextShockwave = false;
        }
      }else {
        if(chargelen == 25){
          charge = new PVector(p1.getX() - getX(), p1.getY() - getX());
          charge.normalize();
        }
        applyMoveCollision(charge.x, charge.y, 10);
        chargelen--;
      }
    }else if(abs(getX()-width/2) >= 5 && abs(getY()-height/2) >= 5){
      PVector walk = new PVector(width/2 - getX(), height/2 - getY());
      walk.normalize();
      walk.mult(this.getSpeed());
      applyMoveCollision(walk);
    }else{
      if(millis() - beybladeStartTime < beybladeDuration) {
        if (millis() - lastShotTime > shootInterval) {
          int dmg = 2;
          float lifespan = 500;
          float size = 30;
          int speed = 5;
          color c = color(252, 26, 82);
          float randAngle = random(TWO_PI);
          PVector randBuldir = PVector.fromAngle(randAngle);
          bulletList.add(new Bullet(dmg, lifespan, size, c, getX(), getY(), getX()-randBuldir.x, getY()-randBuldir.y, speed, getAllyStatus(), getCurrentRoom(), false, null));
          lastShotTime = millis();
        }
      }else{
        isBeyblade = false;
      }
    }
    for (int i = 0; i < AOElist.size(); i++) {
      if (AOElist.get(i).getCD() == 0) {
        AOElist.remove(i);
      }
      else {
        AOElist.get(i).run();
      }
    }
    drawEnemy(); 
    //println(chargelen); 
  }

}

public void spawnBoss(){
  if(leversPressed >= 3 && !bossSpawned){
    bossSpawned = true;
    int hp = 80;
    int speed = 4;
    String name = "BeezleBob";
    int radius = 75;
    entityList.add(0, new Boss(hp, speed, name, radius, width/2, height/2, 1, 1));
    
    //p1.setCurrentRoom(gameMap.getRoom(1,1));
    //p1.setPosition(width/2, (int)((height/2)*1.5));
  }
}

public void lockDoors(){
  if(bossSpawned && p1.getCurrentRoomRow() == 1 && p1.getCurrentRoomCol() == 1){
    for(int r = 0; r<p1.getCurrentRoomHeight(); r++){
      for(int c = 0; c<p1.getCurrentRoomLength(); c++){
        Tile newTile = p1.getCurrentRoom().room[r][c];
        if(newTile.isOfType("Door")){
          p1.getCurrentRoom().room[r][c] = new Wall();
        }
      }
    }
  }
}
