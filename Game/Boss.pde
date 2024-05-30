public class Boss extends Enemy {
  
  public Boss(int hp, int speed, String name, int radius, int x, int y, int roomRow, int roomCol) {
    super(hp, speed, name, radius, x, y, roomRow, roomCol);
  }

  //public Bullet(int damage, float lifespan, float size, color c, float startX, float startY, float endX, float endY, int speed, boolean ally, Room currentRoom){ // should only construct on mouse click
  void shoot() {
    if (frameCount - getLastShotTime() >= getShootDelay()) {
      int dmg = 1;
      float lifespan = 30;
      float size = 20;
      color c = color(252,26,82);
      int speed = 9;
      bulletList.add(new Bullet(dmg, lifespan, size, c, getX(), getY(), p1.getX(), p1.getY(), speed, getAllyStatus(), getCurrentRoom()));
      setLastShotTime(frameCount);
    }
  }

  public void drawEnemy(){
    fill(128,0,128);
    circle(this.getX(), this.getY(), getRadius());
  }

  void run() {
    shoot();
    move();
    drawEnemy(); 
  }

}

public void spawnBoss(){
  if(leversPressed >= 3 && !bossSpawned){
    bossSpawned = true;
    int hp = 10;
    int speed = 3;
    String name = "BeezleBob";
    int radius = 75;
    entityList.add(new Boss(hp, speed, name, radius, width/2, height/2, 1, 1)); 
  }
}
