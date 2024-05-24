public class Floor extends Tile {
  private String type = "Floor";
  private boolean collision;
  private boolean breakable;
  private boolean permeable;

  public Floor(){
    super(false, false, true);
  }
  
  public void drawTile(int xcor, int ycor){
    color c = color(244,188,116);
    super.drawTile(xcor, ycor, c, false);
  }

}
