public class Lever extends Tile {
  private String type;
  private boolean collision;
  private boolean breakable;
  private boolean permeable;
  private boolean toggled;

  public Lever(){
    super(true, false, false, "Lever");
    toggled = false;
  }
  
  public void drawTile(int xcor, int ycor){
    color c = color(214, 201, 192);
    super.drawTile(xcor, ycor, c, false);
  }
  
  public boolean isPressed(){
    return toggled;
  }

}
