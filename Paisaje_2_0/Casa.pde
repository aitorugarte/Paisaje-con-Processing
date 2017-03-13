
public class Casa {

  private int x;
  private int y;
  private int z;

  public Casa(int x, int y, int z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }

  public void construir() {
    cimientos();
    tejado();
  }

  void cimientos() {
    //Bloque
    pushMatrix();
    fill(224, 110, 12);
    translate(221 + x, 312 + y, 5 + z);
    box(100/2);
    popMatrix();
    //Ventanas
    pushMatrix();
    fill(13, 215, 179);
    translate(235 + x, 299 + y, 31 + z);
    box(19/2, 19/2, 0/2);
    popMatrix();

    pushMatrix();
    fill(13, 215, 179);
    translate(209 + x, 299 + y, 31 + z);
    box(19/2, 19/2, 0/2);
    popMatrix();

    //Puerta
    pushMatrix();
    fill(162, 117, 4);
    translate(221 + x, 325 + y, 31 + z);
    box(29/2, 47/2, 0/2);
    popMatrix();
  }

  void tejado() {
    pushMatrix();
    translate(221 + x, 237 + y, 5 + z);

    //Cara frontal
    fill(229, 21, 21);
    beginShape();
    vertex(0, 0, 0);//top
    vertex(50/2, 100/2, 50/2);
    vertex(-50/2, 100/2, 50/2);
    endShape();

    //Cara derecha
    fill(229, 21, 21);
    beginShape();
    vertex(0, 0, 0);
    vertex(50/2, 100/2, 50/2);
    vertex(50/2, 100/2, -50/2);
    endShape();

    //Cara izquierda
    fill(229, 21, 21);
    beginShape();
    vertex(0, 0, 0);
    vertex(-50/2, 100/2, 50/2);
    vertex(-50/2, 100/2, -50/2);
    endShape();

    //Cara trasera
    fill(229, 21, 21);
    beginShape();
    vertex(0, 0, 0);
    vertex(-50/2, 100/2, -50/2);
    vertex(50/2, 100/2, -50/2); 
    endShape();

    //Cara de debajo
    fill(229, 21, 21);
    beginShape();
    vertex(50/2, 100/2, 50/2);
    vertex(-50/2, 100/2, 50/2);
    vertex(-50/2, 100/2, -50/2);
    vertex(50/2, 100/2, -50/2); 
    endShape();

    popMatrix();
  }
}