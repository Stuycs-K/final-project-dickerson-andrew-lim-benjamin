public class Water extends Tile {
  private boolean collision;
  private boolean breakable;
  private boolean permeable;

  public Water(){
    super(true, false, true);
  }
  
  public void drawTile(int xcor, int ycor){
    color c = color(100,236,244);
    super.drawTile(xcor, ycor, c, false);
  }

}
