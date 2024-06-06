public class Wall extends Tile {
  private String type;
  private boolean collision;
  private boolean breakable;
  private boolean permeable;

  public Wall(){
    super(true, false, false, "Wall");
  }
  
  public void drawTile(int xcor, int ycor){
    if (xcor >= 0 && xcor < width && ycor < TILE_SIZE) {
      image(grassydirtwall, xcor, ycor); 
    }else if (ycor < height-TILE_SIZE){
      image(dirtwallupper, xcor, ycor);//replace with brick wall ltr
    }else {
      image(dirtwalllower, xcor, ycor);//replace with brick wall ltr
    }
    if (xcor >= TILE_SIZE && xcor < width - TILE_SIZE && ycor >= TILE_SIZE && ycor < height - TILE_SIZE) {
      image(uncracked, xcor, ycor); 
    }

  }

}
