public class Floor extends Tile {
  private String type;
  private boolean collision;
  private boolean breakable;
  private boolean permeable;

  public Floor(){
    super(false, false, true, "Floor");
  }
  
  public void drawTile(int xcor, int ycor){
    super.drawTile(xcor, ycor, floor);
  }

}
