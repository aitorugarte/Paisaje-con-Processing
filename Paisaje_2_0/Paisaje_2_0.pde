int cielo1 = 26, cielo2 = 151, cielo3 = 230;
int sol1 = 237, sol2 = 251, sol3 = 17;
int cocheX = 0, cocheZ = 0;
int posX = 0, posY = 0, posZ = 0;
int izqdch = 0, arribabajo = 0; //Para ojear alrededor
boolean wPulsada = false, sPulsada = false, aPulsada = false, dPulsada = false;
boolean izqPulsada = false, dchPulsada = false, arribPulsada = false, abajPulsada = false;
boolean avanzarX = false, avanzarZ = false, girado = false;
int cont = 0; 

void setup() {
  size(800, 600, P3D);
  thread("myThread");
}

void draw() {
  background(cielo1, cielo2, cielo3);

  //Definimos los límite de giro
  if (izqdch <= -630) {
    izqPulsada = false;
  }
  if (izqdch >= 630) {
    dchPulsada = false;
  }
  if (arribabajo <= -460) {
    arribPulsada = false;
  }
  if (arribabajo >= 460) {
    abajPulsada = false;
  }

  camera(width/2.0 + 0.0, height/2.0 + 0.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0 + izqdch, height/2.0 + arribabajo, 0, 0, 1, 0);
  translate(posX, posY, posZ);
  movimiento();
  noStroke();
  //Generamos el paisaje
  terreno();
  sol();
  //Formamos las montañas
  for (int q = 0; q < 7; q++) {
    new Montania(104*q).formar();
  }
  //Creamos las carreteras
  new Carretera(200).pintarVertical(); 
  new Carretera(807).pintarVertical(); 
  new Carretera(375).pintarHorizontal(); 
  new Carretera(807).pintarHorizontal(); 
  //Colocamos las casas
  new Casa(0, 13, 62).construir();
  new Casa(99, 13, 215).construir();
  new Casa(202, 13, 62).construir();
  new Casa(274, 13, 171).construir();
  new Casa(-87, 13, 171).construir();
  //Generamos los árboles
  new Arbol(64, 13, 32).generar();
  new Arbol(250, 13, 32).generar();
  new Arbol(167, 13, -91).generar();
  new Arbol(387, 13, -88).generar();
  new Arbol(-49, 13, -101).generar();
  //Montamos el coche
  Coche c1 = new Coche(254 + cocheX, 10, 264 + cocheZ);

  if (girado == false) {
    c1.ensamblar();
  } else {
    c1.girar();
    c1.ensamblar();
  }
  //Cuando llega a la derecha del todo (frente)
  if (cocheZ == 0 && cont == 0) {
    girado = false;
    avanzarZ = true;
  }
  //Cuando llega a la izquierda del todo (frente)
  if (cocheZ == 0 && cont == 1) {
    avanzarZ = false;
    girado = true;
    avanzarX = false;
  }
  //Cuando llega a la derecha del todo (fondo)
  if (cocheZ == -415 && cocheX == 0) {
    girado = true;
    avanzarX = true;
  }
  //Cuando llega a la izquierda del todo (fondo)
  if (cocheX == -600 && girado == true && cont == 0) {
    avanzarX = false;
    girado = false;
    avanzarZ = false;
    cont = 1;
  }


  //Movimiento coche

  if (avanzarZ == true && girado == false) { 
    cocheZ--;
  } else if (avanzarZ == false && girado == false) {
    cocheZ++;
  }
  if (avanzarX == true && girado == true) { //Hacia la izquierda
    cocheX--;
  } else if (avanzarX == false && girado == true) { //Hacia la derecha
    cocheX++;
    if (cocheX == -3 ) {
      cont = 0;
      cocheZ = 0;
      cocheX = 0;
    }
  }
}

void terreno() {
  pushMatrix();
  fill(7, 183, 15);
  translate(330, 361, 0);
  box(1000, 21, 1000);
  popMatrix();
}

void sol() {
  pushMatrix();
  fill(sol1, sol2, sol3);
  lights();
  noStroke();
  translate(822, -679, -727);
  sphere(126);
  popMatrix();
}

/*
*Movimiento de la cámara
 */
void movimiento() {
  if (izqPulsada == true) {
    izqdch = izqdch - 10;
  }
  if (dchPulsada == true) {
    izqdch = izqdch + 10;
  }
  if (arribPulsada == true) {
    arribabajo = arribabajo - 10;
  }
  if (abajPulsada == true) {
    arribabajo = arribabajo + 10;
  }
  if (wPulsada == true) {
    posZ = posZ + 10;
  }
  if (sPulsada == true) {
    posZ = posZ - 10;
  }
  if (aPulsada == true) {
    posX = posX + 10;
  }
  if (dPulsada == true) {
    posX = posX - 10;
  }
}

void keyPressed() {

  //Flecha izquierda
  if (keyCode == LEFT) {
    izqPulsada = true;
  }
  //Flecha derecha
  if (keyCode == RIGHT) {
    dchPulsada = true;
  }
  //Flecha arriba
  if (keyCode == UP) {
    arribPulsada = true;
  }
  //Flecha abajo
  if (keyCode == DOWN) {
    abajPulsada = true;
  }
  if (key == 'w') {
    wPulsada = true;
  }
  if (key == 's') {
    sPulsada = true;
  }
  if (key == 'a') {
    aPulsada = true;
  }
  if (key == 'd') {
    dPulsada = true;
  }
}

void keyReleased() {
  //Flecha izquierda
  if (keyCode == LEFT) {
    izqPulsada = false;
  }
  //Flecha derecha
  if (keyCode == RIGHT) {
    dchPulsada = false;
  }
  //Flecha arriba
  if (keyCode == UP) {
    arribPulsada = false;
  }
  //Flecha abajo
  if (keyCode == DOWN) {
    abajPulsada = false;
  }
  if (key == 'w') {
    wPulsada = false;
  }
  if (key == 's') {
    sPulsada = false;
  }
  if (key == 'a') {
    aPulsada = false;
  }
  if (key == 'd') {
    dPulsada = false;
  }
}

/*
* Amanece y anochece 
 */
void myThread() {
  boolean cambioSol = false;
  boolean cambioCielo = false;
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