int sol1 = 237, sol2 = 251, sol3 = 17;
int cielo1 = 26, cielo2 = 151, cielo3 = 230;
int pos1 = 0, pos2 = 0, pos3 = 0;

void setup() {
  size(500, 500, P3D);
  thread("myThread");
}

//Todos los objetos en 3D deben estar dentro del draw
void draw() {
  background(255);
  lights();
  //Descomentar para mover Objeto
  // rotateY(0.0);
  //Para moverse por la pantalla gracias a los eventos del teclado
  translate(pos1, pos2, pos3);

  tejado();
  cimientos();
  terreno();
  cielo();
  sol();
  carretera();
  arbol();
  coche();
}

int posZ = 0;
boolean avanzar = true;

void coche() {
  //Profundidad máxima de la carretera
  if (posZ == -140) {
    avanzar = true;
  }
  //Profundidad mínima de la carretera
  if (posZ == 140) {
    avanzar = false;
  }
  if (avanzar == true) {
    posZ++;
  } else {
    posZ--;
  }
  //Cuerpo del coche
  pushMatrix();
  fill(168, 9, 9);
  translate(373, 321, 78 + posZ); 
  box(43, 16, 86);
  popMatrix();
  //Cabina
  pushMatrix();
  fill(168, 9, 9);
  translate(373, 304, 78 + posZ); 
  box(19, 17, 32);
  popMatrix();
  //Ruedas
  pushMatrix();
  fill(7, 0, 0);
  translate(344, 246, 14 + posZ); 
  rotateY(1.7);
  ellipse(-46, 82, 18, 17);
  popMatrix();

  pushMatrix();
  fill(7, 0, 0);
  translate(344, 246, 57 + posZ); 
  rotateY(1.7);
  ellipse(-46, 82, 18, 17);
  popMatrix();

  pushMatrix();
  fill(7, 0, 0);
  translate(393, 246, 14 + posZ); 
  rotateY(1.7);
  ellipse(-46, 82, 18, 17);
  popMatrix();

  pushMatrix();
  fill(7, 0, 0);
  translate(393, 246, 57 + posZ); 
  rotateY(1.7);
  ellipse(-46, 82, 18, 17);
  popMatrix();
}

void arbol() {
  //Hojas
  pushMatrix();
  translate(150, 234, 191);
  fill(12, 175, 46);
  sphere(36);
  popMatrix();
  //Tronco
  pushMatrix();
  fill(135, 77, 9);
  translate(150, 297, 192); 
  box(8, 82, 8);
  popMatrix();
}

void carretera() {
  //Lineas discontinuas
  pushMatrix();
  fill(255, 255, 255);
  translate(373, 333, 16); 
  box(19, 0, 65);
  popMatrix();

  pushMatrix();
  fill(255, 255, 255);
  translate(373, 333, 157); 
  box(19, 0, 65);
  popMatrix();
  //Carretera
  pushMatrix();
  fill(222, 221, 160);
  translate(373, 337, 70); 
  box(98, 0, 361);
  popMatrix();
}

void cielo() {
  pushMatrix();
  fill(cielo1, cielo2, cielo3);
  translate(257, 133, -122);
  box(382, 417, 15);
  popMatrix();
}

void sol() {
  //Esfera
  pushMatrix();
  fill(sol1, sol2, sol3);
  lights();
  noStroke();
  translate(371, 23, -84);
  sphere(33);
  popMatrix();
}

void terreno() {
  pushMatrix();
  fill(7, 183, 15);
  translate(256, 350, 67);
  box(379, 24, 364);
  popMatrix();
}

void cimientos() {
  //Bloque
  pushMatrix();
  fill(224, 110, 12);
  translate(221, 288, 5);
  box(99);
  popMatrix();
  //Ventanas
  pushMatrix();
  fill(13, 215, 179);
  translate(245, 265, 55);
  box(19, 19, 0);
  popMatrix();

  pushMatrix();
  fill(13, 215, 179);
  translate(197, 265, 55);
  box(19, 19, 0);
  popMatrix();

  //Puerta
  pushMatrix();
  fill(162, 117, 4);
  translate(222, 316, 55);
  box(30, 46, 0);
  popMatrix();
}

void tejado() {
  pushMatrix();
  translate(221, 139, 5);

  //Cara frontal
  fill(229, 21, 21);
  beginShape();
  vertex(0, 0, 0);//top
  vertex(50, 100, 50);
  vertex(-50, 100, 50);
  endShape();

  //Cara derecha
  fill(229, 21, 21);
  beginShape();
  vertex(0, 0, 0);
  vertex(50, 100, 50);
  vertex(50, 100, -50);
  endShape();

  //Cara izquierda
  fill(229, 21, 21);
  beginShape();
  vertex(0, 0, 0);
  vertex(-50, 100, 50);
  vertex(-50, 100, -50);
  endShape();

  //Cara trasera
  fill(229, 21, 21);
  beginShape();
  vertex(0, 0, 0);
  vertex(-50, 100, -50);
  vertex(50, 100, -50); 
  endShape();

  //Cara de debajo
  fill(229, 21, 21);
  beginShape();
  vertex(50, 100, 50);
  vertex(-50, 100, 50);
  vertex(-50, 100, -50);
  vertex(50, 100, -50); 
  endShape();

  popMatrix();
}

/*
* Hilo que aumenta/disminuye los colores
* del cielo y de la luna/sol para que amanezca
* y anochezca
*/
void myThread() {
  boolean cambioSol = false;
  boolean cambioCielo = false;
  //Cada 3/4 de segundo modifica el valor
  for (;; delay(750)) {

    if (sol3 < 255) {
      sol1 = sol1 + 10;
      sol2 = sol2 + 10;
      sol3 = sol3 + 30;
      cambioSol = false;
    } else {
      cambioSol = true;
    }

    if (cielo3 > 76) {
      cielo1 = cielo1 - 10;
      cielo2 = cielo2 - 15;
      cielo3 = cielo3 - 20;
      cambioCielo = false;
    } else {
      cambioCielo = true;
    }
    if (cambioCielo == true && cambioSol == true) {
      sol1 = sol1 - 13;
      sol2 = sol2 - 4;
      sol3 = sol3 - 238;

      cielo1 = cielo1 + 80;
      cielo2 = cielo2 + 120;
      cielo3 = cielo3 + 160;
    }
  }
}
//Eventos de teclado
void keyPressed() {

  if (key==CODED) {
    //Flecha izquierda
    if (keyCode == 37) {
      pos1 = pos1 + 10;
    }
    //Flecha derecha
    if (keyCode == 39) {
      pos1 = pos1 - 10;
    }
    //Flecha arriba
    if (keyCode == 38) {
      pos2 = pos2 + 10;
    }
    //Flecha abajo
    if (keyCode == 40) {
      pos2 = pos2 - 10;
    }
  } else {
    if (key == '+') {
      pos3 = pos3 + 10;
    }
    if (key == '-') {
      pos3 = pos3 - 10;
    }
    //Barra espaciadora
    if (key == ' ') {
      pos1 = 0;
      pos2 = 0;
      pos3 = 0;
    }
  }
}