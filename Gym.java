class Gym {
  private int capacity;
  private int currCapacity = 0;
  private GymEquipmentable[] gymEquipment;
  private Personable[] people;

  public Gym(int capacity, GymEquipmentable[] gymEquipment, Personable[] people) {
    this.capacity = capacity;
    this.gymEquipment = gymEquipment;
    this.people = people;
  }

  public boolean isFull() {
    if (currCapacity == capacity) {
      return true;
    }
    return false;
  }

  public int capacity() {
    return this.capacity;
  }

  public int currCapacity() {
    return this.currCapacity;
  }
  
  public void incrementCapacity() {
    this.currCapacity++;
  }
  
  @Override
  public String toString() {
    String str = "";
    str = String.format("Gym Capacity: %d/%d", this.currCapacity, this.capacity);
    return str;
  }
}
