class Entering implements Action {
  private Gym g;
  private Personable p;

  public Entering(Gym g, Personable p) {
    this.g = g;
    this.p = p;
  }
  
  @Override
  public String doAction() {
    String str = "";
    if (this.g.isFull()) {
      str = String.format("%s cannot enter\n%s", this.p, this.g);
      return str;
    }
    this.g.incrementCapacity();
    str = String.format("%s can enter \n%s", this.p, this.g);
    return str;
  }
  
  @Override
  public String toString() {
    return "Gym Capacity: " + g.currCapacity() + "/" + g.capacity();
  }
}
