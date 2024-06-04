public class Cracked extends Tile {
  private String type;
  private boolean collision;
  private boolean breakable;
  private boolean permeable;

  public Cracked(){
    super(true, true, false, "Cracked");
  }
  
  public void drawTile(int xcor, int ycor){
    image(cracked, xcor, ycor); 
  }

}
