class Trainer implements Personable {
  private String name;
  private Customer customerTrained;
  private GymEquipmentable equiptmentUsed;
  private boolean isTraining = false;

  public Trainer(String name) {
    this.name = name;
  }
 
  public void customerTrained(Customer c) {
    this.customerTrained = c;
  }

  public void setEquiptmentUsed(GymEquipmentable e) {
    this.equiptmentUsed = e;
  }

  public GymEquipmentable equiptmentUsed() {
    return this.equiptmentUsed;
  }
  
  @Override
  public boolean isTraining() {
    return this.isTraining;
  }
  
  @Override 
  public void setTraining() {
    isTraining = !isTraining;
  }
  
  @Override
  public String toString() {
    String str = "";
    str = String.format("Trainer: %s", this.name);
    return str;
  }
}
