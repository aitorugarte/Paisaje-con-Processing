public class Arbol {

  private int x;
  private int y;
  private int z;

  public Arbol(int x, int y, int z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }

  void generar() {
    //Hojas
    pushMatrix();
    translate(150 + x, 276 + y, 191 + z);
    fill(12, 175, 46);
    sphere(23);
    popMatrix();
    //Tronco
    pushMatrix();
    fill(135, 77, 9);
    translate(150 + x, 309 + y, 192 + z); 
    box(5, 47, 8);
    popMatrix();
  }
}