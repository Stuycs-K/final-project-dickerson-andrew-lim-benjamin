public class Lever extends Tile {
  private String type;
  private boolean collision;
  private boolean breakable;
  private boolean permeable;
  private boolean toggled;

  public Lever(){
    super(false, false, true, "Lever");
    toggled = false;
  }
  
  public void drawTile(int xcor, int ycor){
    super.drawTile(xcor, ycor, floor);
    if(isToggled()){
      image(lever, xcor, ycor);
    }else{
      image(levertoggled, xcor, ycor); 
    }
  }
  
  public boolean isToggled(){
    return toggled;
  }
  
  public void setToggle(boolean toggled){
    this.toggled = toggled;
  }
    
  public void toggleLever(){
    if(!isToggled()) {
      toggled = true;
      leversPressed++;
      //print(leversPressed);
    }
  }

}
