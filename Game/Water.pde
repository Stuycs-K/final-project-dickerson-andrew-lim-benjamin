public class Water extends Tile {
  private String type;
  private boolean collision;
  private boolean breakable;
  private boolean permeable;

  public Water(){
    super(true, false, true, "Water");
  }
  
  public void drawTile(int xcor, int ycor){
    super.drawTile(xcor, ycor, water);    
  }

}
