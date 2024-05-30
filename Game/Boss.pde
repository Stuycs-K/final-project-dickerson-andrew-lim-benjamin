public class Boss extends Enemy {
  
  public Boss(int hp, int speed, String name, int radius, int x, int y, int roomRow, int roomCol) {
    super(hp, speed, name, radius, x, y, roomRow, roomCol);
  }

  public void drawEnemy(){
    fill(245, 64, 118);
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
    entityList.add(new Boss(3, 3, "BeezleBob", 50, width/2, height/2, 1, 1)); 
  }
}
