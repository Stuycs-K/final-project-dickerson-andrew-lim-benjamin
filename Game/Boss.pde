public class Boss extends Enemy {
  private int chargelen;
  private int shotcount;
  private int nextact;
  private PVector charge;
  private int AOEcd;
  private PVector AOEtarget;
  private float AOEsize;
  private boolean nextShockwave;
  
  public Boss(int hp, int speed, String name, int radius, int x, int y, int roomRow, int roomCol) {
    super(hp, speed, name, radius, x, y, roomRow, roomCol);
    chargelen = 0;
    nextact = 3;
    charge = new PVector();
    AOEtarget = new PVector();
    AOEcd = 0;
    AOEsize = p1.getRadius()*4;
    nextShockwave = false;
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
    //println("raah" + shotcount); // testing
    chargelen = 25; // frames
  }
  void AOE() { // skystrike
    // highlight a square around player and update in run(), do damage and display graphic after x time
    AOEcd = 50; // target circle from 50-45, damage display 5-0
  }
  void shockWave() {
    int dmg = 1;
    float lifespan = 200;
    float size = 40;
    color c = color(191,214,65);
    int speed = 5;
    for (int deg = 0; deg < 360; deg += (int) (Math.random() * 6) + 10) { // every 10-15 deg
      bulletList.add(new Bullet(dmg, lifespan, size, c, getX(), getY(), getX() + cos(deg), getY() + sin(deg), speed, getAllyStatus(), getCurrentRoom()));
    }
  }
  void bulletRing() {
  }
  public void drawEnemy(){
    fill(128,0,128);
    circle(this.getX(), this.getY(), getRadius()); // hurtbox is buggy
  }

  void run() {
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
        bulletRing();
        AOE();
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
      if(newTileX >= 0 && newTileX < getCurrentRoom().room[0].length && newTileY >= 0 && newTileY < getCurrentRoom().room.length){
        Tile newTile = getCurrentRoom().room[newTileY][newTileX];
        if(!newTile.getCollision()){
          this.setPosition(newPos);
        }else{
          hitCollideTile = true; 
          chargelen = 1;
        }
      }
      chargelen--;
    }
    if (AOEcd > 0) {
      if (AOEcd == 50) {
        AOEtarget = p1.getPosition().copy();
      }
      if (AOEcd >= 46) { // 46 - 50
        fill(color(255,0,255));
        //square(AOEtarget.x-AOEsize, AOEtarget.y-AOEsize, AOEsize*2);
        circle(AOEtarget.x, AOEtarget.y, AOEsize*2);
      }
      else if (AOEcd > 0 && AOEcd <=5) { // 5 - 1
        if (AOEcd == 5) { // damage
        println("AOE");
          // collision w square
          //float collx = AOEtarget.x; // center of square coords
          //float colly = AOEtarget.y;
          //float px = p1.getX(); 
          //float py = p1.getY();
          //float locx = 0; // the point being tested
          //float locy = 0; 
          //if (px < collx) { // AOEsize = width /2 and height /2 of square
          //  locx = collx - AOEsize; // left edge
          //}
          //else {
          //  locx = collx + AOEsize; // right edge
          //}
          //if (py < colly) { // top edge
          //  locy = colly - AOEsize;
          //}
          //else { // bottom edge
          //  locy = colly + AOEsize;
          //}
          //println(pow(locx - px, 2));
          //println(locx + " " + px);
          //println((sqrt(pow(locx - px, 2) + pow(locy - py, 2))));
          //if (sqrt(pow(locx - px, 2) + pow(locy - py, 2)) < p1.getRadius()) { 
          if (p1.getPosition().dist(AOEtarget) < AOEsize + p1.getRadius()) {
            println("hit");
            p1.setHP(p1.getHP() - 2);
          }
        }
        fill(color(255,0,0));
        circle(AOEtarget.x, AOEtarget.y, AOEsize*2);
      }
      AOEcd--;
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
    entityList.add(0,new Boss(hp, speed, name, radius, width/2, height/2, 1, 1));
    
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
