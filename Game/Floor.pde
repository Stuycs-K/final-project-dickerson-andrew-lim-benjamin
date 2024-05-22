public class Floor extends Tile {
  private boolean collision;
  private boolean breakable;
  private boolean permeable;

  public Floor(){
    super(false, false, true);
  }
  
  public void drawTile(int xcor, int ycor){
    fill(0);
    super.drawTile(xcor, ycor);
  }

}
