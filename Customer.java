class Customer implements Personable {
  private String name;
  private boolean isTraining = false;
  public Customer(String name) {
    this.name = name;
  }

  @Override
  public boolean isTraining() {
    return this.isTraining;
  }

  @Override
  public void setTraining() {
    this.isTraining = !isTraining;
  }

  @Override
  public String toString() {
    String str = "";
    str = String.format("Customer: %s", this.name);
    return str;
  }
}
