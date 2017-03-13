public class Carretera {

  private int x;

  public Carretera(int x) {
    this.x = x;
  }

  public void pintarVertical() {
    pushMatrix();
    fill(143, 132, 80);
    translate(-182 + x, 348, 136);
    box(85, 2, 518);
    popMatrix();
  }

  public void pintarHorizontal() {
    pushMatrix();
    fill(143, 132, 80);
    translate(328, 348, -455 + x);
    box(542, 2, 85);
    popMatrix();
  }
}