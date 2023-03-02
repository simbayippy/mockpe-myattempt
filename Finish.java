class Finish implements Action {
  private Gym g;
  private Trainer t;

  public Finish(Gym g, Trainer t) {
    this.g = g;
    this.t = t;
  }

  @Override
  public String doAction() {
    if (!t.isTraining()) {
      String str = "";
      str = String.format("%s is not training", this.t);
      return str;
    }
    t.setTraining();
    t.equiptmentUsed().setTraining();
    t.customerTrained(null);
    t.setEquiptmentUsed(null);
    String str = "";
    str = String.format("%s has finished training", this.t);
    return str;
  }
}
