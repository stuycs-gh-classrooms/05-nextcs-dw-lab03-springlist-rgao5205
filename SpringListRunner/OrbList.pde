/*===========================
  OrbList (ALL WORK GOES HERE)

  Class to represent a Linked List of OrbNodes.

  Instance Variables:
    OrbNode front:
      The first element of the list.
      Initially, this will be null.

  Methods to work on:
    0. addFront
    1. populate
    2. display
    3. applySprings
    4. applyGravity
    5. run
    6. removeFront
    7. getSelected
    8. removeNode

  When working on these methods, make sure to
  account for null values appropraitely. When the program
  is run, no NullPointerExceptions should occur.x
  =========================*/

class OrbList {

  OrbNode front;

  /*===========================
    Contructor
    Does very little.
    You do not need to modify this method.
    =========================*/
  OrbList() {
    front = null;
  }//constructor

  /*===========================
    addFront(OrbNode o)

    Insert o to the beginning of the list.
    =========================*/
  void addFront(OrbNode o) {
    front = o;

  }//addFront


  /*===========================
    populate(int n, boolean ordered)

    Clear the list.
    Add n randomly generated  orbs to the list,
    using addFront.
    If ordered is true, the orbs should all
    have the same y coordinate and be spaced
    SPRING_LENGTH apart horizontally.
    =========================*/
  void populate(int n, boolean ordered) {
    front = null;
    float y = height / 2;
    float s = random(MIN_SIZE, MAX_SIZE);
    float m = random(MIN_MASS, MAX_MASS);
    
    //clear list here idfk 
    for(int i = 0; i < n; i++){
      OrbNode temp;
      if(ordered){
        temp = new OrbNode(width/SPRING_LENGTH * i, y,s,m);
        }
      else{
        temp = new OrbNode(random(MAX_SIZE, width - MAX_SIZE), random(MAX_SIZE,height - MAX_SIZE),s,m);
        }
      addFront(temp);
      }
    }

  }//populate

  /*===========================
    display(int springLength)

    Display all the nodes in the list using
    the display method defined in the OrbNode class.
    =========================*/
  void display() {
    front.display();
    OrbNode temp = front;
    while(temp.next != null){
      temp = temp.next;
      temp.display();
    }
  }//display

  /*===========================
    applySprings(int springLength, float springK)

    Use the applySprings method in OrbNode on each
    element in the list.
    =========================*/
  void applySprings(int springLength, float springK) {
    front.applySprings(SPRING_LENGTH,SPRING_K);
    OrbNode temp = front;
    while(temp.next != null){
      temp = temp.next;
      temp.applySprings(SPRING_LENGTH,SPRING_K);
    }
  }//applySprings

  /*===========================
    applyGravity(Orb other, float gConstant)

    Use the getGravity and applyForce methods
    to apply gravity crrectly.
    =========================*/
  void applyGravity(Orb other, float gConstant) {
    gravityForce = front.getGravity(front.next,G_CONSTANT);
    front.applyForce(gravityForce);
    OrbNode temp = front;
    while(temp.next != null){
      temp = temp.next;
      temp.getGravity(temp.next,G_CONSTANT);
      temp.applyForce(gravityForce);
    }
  }//applySprings

  /*===========================
    run(boolean bounce)

    Call run on each node in the list.
    =========================*/
  void run(boolean bounce) {
    front.move(bounce);
    OrbNode temp = front;
    while(temp.next != null){
      temp = temp.next;
      temp.move(bounce);
    }
  }//applySprings

  /*===========================
    removeFront()

    Remove the element at the front of the list, i.e.
    after this method is run, the former second element
    should now be the first (and so on).
    =========================*/
  void removeFront() {
    front = front.next;
  }//removeFront


  /*===========================
    getSelected(float x, float y)

    If there is a node at (x, y), return
    a reference to that node.
    Otherwise, return null.

    See isSlected(float x, float y) in
    the Orb class (line 115).
    =========================*/
  OrbNode getSelected(int x, int y) {

    return null;
  }//getSelected

  /*===========================
    removeNode(OrbNode o)

    Removes o from the list. You can
    assume o is an OrbNode in the list.
    You cannot assume anything about the
    position of o in the list.
    =========================*/
  void removeNode(OrbNode o) {
    o.previous.next = o.nxet;
  }
}//OrbList
