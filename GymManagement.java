import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

class GymManagement {

  private static final int TREADMILL = 0;
  private static final int DUMBBELL = 1;
  private static final int TRAINER = 0;
  private static final int CUSTOMER = 1;
  private static final int ENTER = 0;
  private static final int START = 1;
  private static final int FINISH = 2;

  private GymEquipmentable[] gymEquipment;
  private Personable[] people;
  private Gym gym;
  private Action[] actions;

  public void printEquipment() {
    for (int i = 0; i < gymEquipment.length; i++) {
      System.out.println(gymEquipment[i]);
    }
  }

  public void printPeople() {
    for (int i = 0; i < people.length; i++) {
      System.out.println(people[i]);
    }
  }
  
  public GymManagement() {
    Scanner scanner = new Scanner(System.in);

    int numEquipment = scanner.nextInt();
    gymEquipment = new GymEquipmentable[numEquipment];
    for (int i = 0; i < numEquipment; i++) {
      int equipmentType = scanner.nextInt();
      double details = scanner.nextDouble();
      if (equipmentType == GymManagement.TREADMILL) {
        gymEquipment[i] = new Treadmill(details);
      } else if (equipmentType == GymManagement.DUMBBELL) {
        gymEquipment[i] = new Dumbbell(details);
      }
    }

    int numPeople = scanner.nextInt();
    people = new Personable[numPeople];
    for (int i = 0; i < numPeople; i++) {
      int peopleKind = scanner.nextInt();
      String currName = scanner.next();
      if (peopleKind == 0) {
        people[i] = new Trainer(currName); 
      } else {
        people[i] = new Customer(currName);
      }
    }

    int capacity = scanner.nextInt();
    gym = new Gym(capacity, gymEquipment, people);
    int numActions = scanner.nextInt();
    actions = new Action[numActions];
    for (int i = 0; i < numActions; i++) {
      int action = scanner.nextInt();
      if (action == 0) {
        int customer = scanner.nextInt();
        actions[i] = new Entering(gym, people[customer]);
      } else if (action == 1) {
        int trainer = scanner.nextInt();
        Trainer t = (Trainer) people[trainer];
        int customer = scanner.nextInt();
        Customer c = (Customer) people[customer];
        int equipment = scanner.nextInt();
        GymEquipmentable e = gymEquipment[equipment];
        actions[i] = new Training(gym, t, c, e);
      } else {
        int trainer = scanner.nextInt();
        actions[i] = new Finish(gym, (Trainer) people[trainer]);
      }
    }

    for (int i = 0; i < actions.length; i++) {
      System.out.println(actions[i].doAction());
    }
  }
}
