class Treadmill implements GymEquipmentable {
  private boolean inUse = false;
  private String name = "Treadmill";
  private double details;

  public Treadmill(double details) {
    this.details = details;
  }
  
  @Override
  public boolean inUse() {
    return this.inUse;
  }

  @Override 
  public void setTraining() {
    this.inUse = !this.inUse;
  }
  
  @Override
  public String toString() {
    String str = "";
    str = String.format("Equipment: Treadmill at speed %.1f", this.details);
    return str;
  }
}
