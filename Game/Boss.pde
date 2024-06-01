public class Boss extends Enemy {
  
  public Boss(int hp, int speed, String name, int radius, int x, int y, int roomRow, int roomCol) {
    super(hp, speed, name, radius, x, y, roomRow, roomCol);
  }

  //public Bullet(int damage, float lifespan, float size, color c, float startX, float startY, float endX, float endY, int speed, boolean ally, Room currentRoom){ // should only construct on mouse click
  void shoot() {
    if (frameCount - getLastShotTime() >= getShootDelay()) {
      int dmg = 1;
      float lifespan = 50;
      float size = 30;
      color c = color(252,26,82);
      int speed = 9;
      bulletList.add(new Bullet(dmg, lifespan, size, c, getX(), getY(), p1.getX(), p1.getY(), speed, getAllyStatus(), getCurrentRoom()));
      setLastShotTime(frameCount);
    }
  }

  public void drawEnemy(){
    fill(128,0,128);
    circle(this.getX(), this.getY(), getRadius()+20); // hurtbox is buggy
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
    int hp = 20;
    int speed = 3;
    String name = "BeezleBob";
    int radius = 100;
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
