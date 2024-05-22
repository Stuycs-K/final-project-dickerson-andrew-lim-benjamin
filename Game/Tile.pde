public class Tile {
  private boolean collision;
  private boolean breakable;
  private boolean permeable;

  public Tile(boolean coll, boolean breack, boolean perm){
    collision = coll;
    breakable = breack;
    permeable = perm;
  }
  
  public void drawTile(int xcor, int ycor){
    rect(xcor, ycor, 10, 10);
  }

}
