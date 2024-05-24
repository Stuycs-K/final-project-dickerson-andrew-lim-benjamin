public class Tile {
  private boolean collision;
  private boolean breakable;
  private boolean permeable;
  private PVector position;

  public Tile(boolean collision, boolean breakable, boolean permeable){
    this.collision = collision;
    this.breakable = breakable;
    this.permeable = permeable;
  }
  
  PVector getPosition() {
    return position;
  }
  void setPosition(int x, int y) {
    this.position = new PVector(x, y);
  }
  void addPosition(PVector add) {
    (this.position).add(add);
  }
  int getX() {
    return (int)position.x;
  }
  int getY() {
    return (int)position.y;
  }
  void setX(int val) {
    this.position = new PVector(val, this.getY());
  }
  void setY(int val) {
    this.position = new PVector(this.getX(), val);
  }
  
  public void drawTile(int xcor, int ycor){
    rect(xcor, ycor, 100, 100);
  }
  public void drawTile(int xcor, int ycor, color c, boolean stroke){
    fill(c);
    if(!stroke){
      noStroke();
    }
    rect(xcor, ycor, TILE_SIZE, TILE_SIZE);
  }
  
  //private int distance(Tile t, Adventurer e){
  //  return(int)(e.getPosition()).dist(t.getPosition());
  //}
  
  boolean getCollision(){
    return collision;
  }
  
  public void run(){
    //int eList = entityList.size();
    //for(int i = 0; i < eList; i++){
    //  collide(entityList.get(i));
    //}
  }
  
  

}
