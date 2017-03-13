public class Montania {

  private int x; 
  private float a = 3.4;

  public Montania(int x) {
    this.x = x;
  }

  public void formar() {
    pushMatrix();
    translate(34 + x, 3, -325);

    //Cara frontal
    fill(105, 57, 6);
    beginShape();
    vertex(0, 0, 0);
    vertex(50*a, 100*a, 50*a);
    vertex(-50*a, 100*a, 50*a);
    endShape();

    //Cara derecha
    fill(105, 57, 6);
    beginShape();
    vertex(0, 0, 0);
    vertex(50*a, 100*a, 50*a);
    vertex(50*a, 100*a, -50*a);
    endShape();

    //Cara izquierda
    fill(105, 57, 6);
    beginShape();
    vertex(0, 0, 0);
    vertex(-50*a, 100*a, 50*a);
    vertex(-50*a, 100*a, -50*a);
    endShape();

    //Cara trasera
    fill(105, 57, 6);
    beginShape();
    vertex(0, 0, 0);
    vertex(-50*a, 100*a, -50*a);
    vertex(50*a, 100*a, -50*a); 
    endShape();

    //Cara de debajo
    fill(105, 57, 6);
    beginShape();
    vertex(50*a, 100*a, 50*a);
    vertex(-50*a, 100*a, 50*a);
    vertex(-50*a, 100*a, -50*a);
    vertex(50*a, 100*a, -50*a); 
    endShape();

    popMatrix();
  }
}