public class Coche {

  private int x;
  private int y;
  private int z;
  private float giroCoche;

  public Coche(int x, int y, int z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }

  public void ensamblar() {
    //Cuerpo
    pushMatrix();
    fill(168, 9, 9);
    translate(373 + x, 321 + y, 78 + z); 
    rotateY(giroCoche);
    box(43, 16, 86);
    popMatrix();
    //Cabina
    pushMatrix();
    fill(168, 9, 9);
    translate(373 + x, 304 + y, 78 + z); 
    rotateY(giroCoche);
    box(19, 17, 32);
    popMatrix();
    //Ruedas
    pushMatrix();
    fill(7, 0, 0);
    translate(345 + x, 246 + y, 14 + z); 
    rotateY(1.7);
    ellipse(-46, 82, 18, 17);
    popMatrix();

    pushMatrix();
    fill(7, 0, 0);
    translate(345 + x, 246 + y, 57 + z); 
    rotateY(1.7);
    ellipse(-46, 82, 18, 17);
    popMatrix();

    pushMatrix();
    fill(7, 0, 0);
    translate(389 + x, 246 + y, 14 + z); 
    rotateY(1.7);
    ellipse(-46, 82, 18, 17);
    popMatrix();

    pushMatrix();
    fill(7, 0, 0);
    translate(389 + x, 246 + y, 57 + z); 
    rotateY(1.7);
    ellipse(-46, 82, 18, 17);
    popMatrix();
  }

  void girar() {
    this.giroCoche = 1.6;
  }
}