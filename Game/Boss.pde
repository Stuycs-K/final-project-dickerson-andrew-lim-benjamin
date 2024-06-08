public class Boss extends Enemy {
  private int chargelen;
  private int shotcount;
  private int nextact;
<<<<<<< HEAD
  private boolean isBeyblade;
  private int beybladeStartTime;
  private int beybladeDuration;
  private int shootInterval;
  private int lastShotTime;
  PVector charge;
=======
  private PVector charge;
  //private int AOEcd;
  //private PVector AOEtarget;
  private ArrayList<AOE> AOElist;
  private float AOEsize;
  private boolean nextShockwave;
>>>>>>> 31f33ce781b15d7b8223742c98d54cec90ac9cf9
  
  public Boss(int hp, int speed, String name, int radius, int x, int y, int roomRow, int roomCol) {
    super(hp, speed, name, radius, x, y, roomRow, roomCol);
    chargelen = 0;
    nextact = 3;
    charge = new PVector();
<<<<<<< HEAD
    isBeyblade = false;
    isBeyblade = false;
    beybladeDuration = 5000;
    shootInterval = 50;
=======
    //AOEtarget = new PVector();
    //AOEcd = 0;
    AOEsize = p1.getRadius()*4;
    nextShockwave = false;
    AOElist = new ArrayList<AOE>();
>>>>>>> 31f33ce781b15d7b8223742c98d54cec90ac9cf9
  }

  //public Bullet(int damage, float lifespan, float size, color c, float startX, float startY, float endX, float endY, int speed, boolean ally, Room currentRoom)
  void shoot(PVector dir, int dmg, float lifespan, float size, int speed, color c) {
    bulletList.add(new Bullet(dmg, lifespan, size, c, getX(), getY(), dir.x, dir.y, speed, getAllyStatus(), getCurrentRoom()));
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
      bulletList.add(new Bullet(dmg, lifespan, size, c, getX(), getY(), getX() + cos(deg), getY() + sin(deg), speed, getAllyStatus(), getCurrentRoom()));
    }
  }
  
  void beyblade() {
    if(!isBeyblade){
      isBeyblade = true;
      beybladeStartTime = millis();
      lastShotTime = millis();
      println("doing beyblade rn");
    }
  }
  
  public void drawEnemy(){
    fill(128,0,128);
    circle(this.getX(), this.getY(), getRadius()); // hurtbox is buggy
  }

  void run() {
<<<<<<< HEAD
    if(!isBeyblade){
      shoot();
      if (shotcount >= nextact) {
        // random of 3 actions
        int choice = (int)(Math.random() * 3) + 1; // 1 - 3
        nextact = (int)(Math.random() * 3) + 2; // 2 - 4 cd
        if (choice == 1) {
          charge();
=======
    shoot();
    if (shotcount >= nextact) {
      // random of 3 actions
      int choice = (int)(Math.random() * 4) + 1; // 1 - 4
      nextact = (int)(Math.random() * 2) + 1; // 1 - 2 cd
      if (choice == 1) {
        charge();
        //AOE();
        nextact = 1;
      }
      else if (choice == 2) {
        nextShockwave = true;
        charge();
        //shockWave(); // hitboxes def buggy, fix later, maybe by inc draw radius when above some size
      }
      else if (choice == 3) {
        beyblade();
      }
      else if (choice == 4) {
        AOE();
        //println("AOEing");
      }
      shotcount = 0;
    }
    if (chargelen == 0) {
      move();
      if (nextShockwave) {
        shockWave();
        nextShockwave = false;
      }
    }
    else {
      if (chargelen == 25) {
        charge = new PVector(p1.getX() - this.getPosition().x, p1.getY() - this.getPosition().y);
        charge.normalize();
      }
      PVector newPos = PVector.add(this.getPosition(), PVector.mult(charge, 10));
      int newTileX = (int)(newPos.x/TILE_SIZE);
      int newTileY = (int)(newPos.y/TILE_SIZE);
      if(newTileX >= 0 && newTileX < p1.getCurrentRoomLength() && newTileY >= 0 && newTileY < p1.getCurrentRoomHeight()){
        Tile newTile = getCurrentRoom().room[newTileY][newTileX];
        if(!newTile.getCollision()){
          this.setPosition(newPos);
        }else{
          hitCollideTile = true; 
          chargelen = 1;
>>>>>>> 31f33ce781b15d7b8223742c98d54cec90ac9cf9
        }
        else if (choice == 2) {
          charge();
          shockWave(); // hitboxes def buggy, fix later, maybe by inc draw radius when above some size
        }
        else if (choice == 3) {
          beyblade();
        }
        else if (choice == 4) {
          AOE();
        }
        shotcount = 0;
      }
      if(chargelen == 0){
        move();
      }
      else {
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
      float randAngle = random(TWO_PI);
      PVector randomBulletdir = PVector.fromAngle(randAngle);
      if(millis() - beybladeStartTime < beybladeDuration) {
        if (millis() - lastShotTime > shootInterval) {
          int dmg = 2;
          float lifespan = 500;
          float size = 30;
          int speed = 5;
          color c = color(252,26,82);
          shoot(randomBulletdir, dmg, lifespan, size, speed, c);
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
    int hp = 40;
    int speed = 3;
    String name = "BeezleBob";
    int radius = 75;
    entityList.add(0,new Boss(hp, speed, name, radius, width/2, height/2, 1, 1));
    
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
