public class Bullet {
  private int damage;
  private int speed;
  private Room currentRoom;
  public float lifespan;
  private float size;
  private color c;
  private float endX;
  private float endY;
  private PVector pos;
  private PVector velocity;
  private boolean ally;
  //private PImage img;

  public Bullet(float startX, float startY, float endX, float endY, boolean ally, Room currentRoom){ // must call with location
    this(1, 100, 20, color(252,26,82), startX, startY, endX, endY, 8, ally, currentRoom);
  }
  public Bullet(int damage, float lifespan, float size, color c, float startX, float startY, float endX, float endY, int speed, boolean ally, Room currentRoom){ // should only construct on mouse click
    this.damage = damage;
    this.lifespan = lifespan;
    this.size = size;
    this.c = c;
    this.endX = endX;
    this.endY = endY;
    this.speed = speed;
    this.ally = ally;
    this.currentRoom = currentRoom;
    
    pos = new PVector(startX, startY);
    
    if(ally){
      velocity = (PVector.fromAngle(atan2(endY, endX))).mult(speed); // unit vector
    }else{
      velocity = new PVector(endX - startX, endY - startY);
      velocity.normalize();
      velocity.mult(speed); 
    }
  }
  
  public void drawBullet(float xcor, float ycor, float endX, float endY){
    if(ally){
      image(arrow, xcor, ycor);
      //translate(width/2, height/2);
      //rotate(atan2(endY, endX)); 
    }else{
      drawBullet(xcor, ycor);
    }
  }
  
  public void drawBullet(float xcor, float ycor){
    fill(c);
    noStroke();
    circle(xcor, ycor, size);
  }
  
  public void move() {
    PVector newPos = pos.add(velocity);
    int newTileX = (int)(newPos.x/TILE_SIZE);
    int newTileY = (int)(newPos.y/TILE_SIZE);
    if(newTileX >= 0 && newTileX < currentRoom.room[0].length && newTileY >= 0 && newTileY < currentRoom.room.length){
      Tile newTile = currentRoom.room[newTileY][newTileX];
      if(newTile.getBreakability()){
        currentRoom.room[newTileY][newTileX] = new Floor();
      }
      if(newTile.getPermeability()){
        this.pos = newPos;
      }else{
        bulletList.remove(this); 
      }
    }
  }
  public boolean run() { // return if collision
    lifespan--; // need life span to work
    move();
    if (collide()) {
      return true;
    }
    if (lifespan <= 0) {
      bulletList.remove(this);
      return true;
    }
    drawBullet(pos.x, pos.y, endX, endY);
    return false;
  }
  
  boolean getAllyStatus() {
    return ally;
  }
  
  public boolean collide() {
    if(entityList.size() > 1){
      for(Adventurer e : entityList) {
        if ((e.getCurrentRoom()).equals(p1.getCurrentRoom()) && pos.dist(e.position) < Math.abs(e.getRadius()-size) && e.getAllyStatus() != this.getAllyStatus()) {
          //println(e);
          e.setHP(e.hp - damage);
          bulletList.remove(this);
          return true;
        }
      } 
    }
    return false;
  }
  public float getLifeSpan() {
    return lifespan;
  }
  public void setLifeSpan(float val) {
    this.lifespan = val;
  }
}
