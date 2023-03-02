class Dumbbell implements GymEquipmentable {
  private boolean inUse = false;
  private String name = "Dumbbell";
  private double details;

  public Dumbbell(double details) {
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
    str = String.format("Equipment: Dumbbell with weight %.1f", this.details);
    return str;
  }
}

