public class Floor extends Tile {
  private String type;
  private boolean collision;
  private boolean breakable;
  private boolean permeable;

  public Floor(){
    super(false, false, true, "Floor");
  }
  
  public void drawTile(int xcor, int ycor){
    color c = color(244,188,116);
    super.drawTile(xcor, ycor, c, false);
    //super.drawTile(xcor, ycor, grassimg);
  }

}
