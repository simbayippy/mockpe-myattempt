class Training implements Action {
  private Gym g;
  private Trainer p;
  private Customer c;
  private GymEquipmentable e;

  public Training(Gym g, Trainer p, Customer c, GymEquipmentable e) {
    this.g = g;
    this.p = p;
    this.c = c;
    this.e = e;
  }

  @Override
  public String doAction() {
    if (p.isTraining() || e.inUse()) {
      return "Cannot Train!";
    }
    this.p.setTraining();
    this.c.setTraining();
    this.e.setTraining();

    this.p.customerTrained(c);
    this.p.setEquiptmentUsed(this.e);

    String str = "";
    if (e instanceof Treadmill) {
      Treadmill t = (Treadmill) this.e;
      str = String.format("%s training %s using %s", this.p, this.c, t);
      return str;
    } 
    Dumbbell d = (Dumbbell) this.e;
    str = String.format("%s training %s using %s", this.p, this.c, d);
    return str;

  }

  @Override
  public String toString() {
    String str = "";
    str = String.format("%s training %s", this.p, this.c);
    return str;
  }
}
