public class Cracked extends Tile {
  private String type = "Cracked";
  private boolean collision;
  private boolean breakable;
  private boolean permeable;

  public Cracked(){
    super(true, true, false);
  }
  
  public void drawTile(int xcor, int ycor){
    color c = color(189,127,79);
    super.drawTile(xcor, ycor, c, false);
  }

}
