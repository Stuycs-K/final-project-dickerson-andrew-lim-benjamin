public class Boss extends Enemy {
  private int chargelen;
  private int shotcount;
  private int nextact;
  PVector charge;
  
  public Boss(int hp, int speed, String name, int radius, int x, int y, int roomRow, int roomCol) {
    super(hp, speed, name, radius, x, y, roomRow, roomCol);
    chargelen = 0;
    nextact = 3;
    charge = new PVector();
  }

  //public Bullet(int damage, float lifespan, float size, color c, float startX, float startY, float endX, float endY, int speed, boolean ally, Room currentRoom){ // should only construct on mouse click
  void shoot() {
    if (frameCount - getLastShotTime() >= getShootDelay()) {
      int dmg = 1;
      float lifespan = 50;
      float size = 20;
      color c = color(252,26,82);
      int speed = 9;
      bulletList.add(new Bullet(dmg, lifespan, size, c, getX(), getY(), p1.getX(), p1.getY(), speed, getAllyStatus(), getCurrentRoom()));
      setLastShotTime(frameCount);
      shotcount++;
    }
  }
  void charge() {
    println("raah" + shotcount);
    chargelen = 25; // frames
  }
  void AOE() { // skystrike
    // highlight a square around player and update in run(), do damage and display graphic after x time
  }
  void shockWave() {
    // ideas: tiles emanating from boss update image w/ earthquake texture and deal damage if standing
    // new kind of bullet goes square by square
  }
  void bulletRing() {
    int dmg = 1;
    float lifespan = 200;
    float size = 40;
    color c = color(191,214,65);
    int speed = 5;
    for (int deg = 0; deg < 360; deg += (int) (Math.random() * 6) + 15) { // every 15-20 deg
      bulletList.add(new Bullet(dmg, lifespan, size, c, getX(), getY(), getX() + cos(deg), getY() + sin(deg), speed, getAllyStatus(), getCurrentRoom()));
    }
  }
  public void drawEnemy(){
    fill(128,0,128);
    circle(this.getX(), this.getY(), getRadius()); // hurtbox is buggy
  }

  void run() {
    shoot();
    if (shotcount >= nextact) {
      // random of 3 actions
      int choice = (int)(Math.random() * 3) + 1; // 1 - 3
      nextact = (int)(Math.random() * 2) + 1; // 1 - 2 cd
      if (choice == 1) {
        charge();
      }
      else if (choice == 2) {
        bulletRing(); // hitboxes def buggy, fix later, maybe by inc draw radius when above some size
      }
      else if (choice == 3) {
        shockWave();
      }
      else if (choice == 4) {
        AOE();
      }
      shotcount = 0;
    }
    if (chargelen == 0) {
      move();
    }
    else {
      if (chargelen == 25) {
        charge = new PVector(p1.getX() - this.getPosition().x, p1.getY() - this.getPosition().y);
        charge.normalize();
      }
      getPosition().add(PVector.mult(charge, 10));
      chargelen--;
    }
    drawEnemy(); 
    //println(chargelen);
  }

}

public void spawnBoss(){
  if(leversPressed >= 3 && !bossSpawned){
    bossSpawned = true;
    int hp = 20;
    int speed = 3;
    String name = "BeezleBob";
    int radius = 75;
    entityList.add(new Boss(hp, speed, name, radius, width/2, height/2, 1, 1));
    
    p1.setCurrentRoom(gameMap.getRoom(1,1));
    p1.setPosition(width/2, (int)((height/2)*1.5));
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
