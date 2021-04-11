import ipcapture.*;
//import processing.serial.*;
import processing.net.*;
IPCapture cam;
//Serial myPort;
Client myClient;

PImage horaire;
PImage antihoraire;
int rayon = 20;
int cerclePositionX;
int cerclePositionY;
int carrePostionX;
int carrePostionY;
int Selection = 0;
String Selection2;
String Selection3;
int DegreAngleA = 90;
int DegreAngleB = 180;
int DegreAngleC = 90;
int DegreAngleQ = 110;
float RadAngleA;
float RadAngleB;
float RadAngleC;
float RadAngleQ;
String Pince = "O";
String data1 = "";
String data2 = "";
boolean verif = true;
boolean verif2 = false;
String save;
int AB = 200;
int BC = 200;
int CD = 50;
float Xa;
float Ya;
float Xb;
float Yb;
float Xc;
float Yc;
float Xd;
float Yd;
float Xq;
float Yq;
float Xbsave;
float Ybsave;
float Xcsave;
float Ycsave;
float Xdsave;
float Ydsave;
float Xqsave;
float Yqsave;
float RadAngleAsave = radians(90);
float RadAngleBsave = radians(180);
float RadAngleCsave = radians(90);
float a;
float b;
float c;
float d;
float a2;
float b2;
float c2;
float d2;
boolean startSave = false;
BufferedReader reader;
String[] Save = {
    "450;540;450;470;O;"
};
String Fichier = "";
int largeurEcriture = displayWidth * 25 / 1800;
//String ippi = "192.168.1.23";
String ippi = "172.16.5.20";

void settings() {
    fullScreen();
}

void setup() {
    Xa = displayWidth * 300 / 1800;
    Ya = displayHeight * 400 / 1000;
    Xb = Xa;
    Yb = Ya - displayWidth * AB / 1800;
    Xc = Xb + displayWidth * BC / 1800;
    Yc = Yb;
    Xd = Xc + displayWidth * CD / 1800;
    Yd = Yc;
    //myPort = new Serial(this, Serial.list()[4], 9600);
    myClient = new Client(this, ippi, 5204);
    background(255, 255, 255);
    //size(1800, 1000);
    size(displayWidth, displayHeight);
    delay(5000);
    RadAngleA = radians(DegreAngleA + 180);
    RadAngleB = radians(DegreAngleB + 90);
    RadAngleC = radians(DegreAngleC + 180);
    a = displayWidth / 4 * 3 - displayWidth * 30 / 1800 - displayWidth * 25 / 1800;
    b = displayWidth / 4 * 3 - displayWidth * 140 / 1800 - displayWidth * 25 / 1800;
    c = displayWidth / 4 * 3 + displayWidth * 130 / 1800 - displayWidth * 25 / 1800;
    d = displayWidth / 4 * 3 + displayWidth * 240 / 1800 - displayWidth * 25 / 1800;
    a2 = displayWidth / 4 * 3 - displayWidth * 30 / 1800 - displayWidth * 25 / 1800;
    b2 = displayWidth / 4 * 3 - displayWidth * 140 / 1800 - displayWidth * 25 / 1800;
    c2 = displayWidth / 4 * 3 + displayWidth * 130 / 1800 - displayWidth * 25 / 1800;
    d2 = displayWidth / 4 * 3 + displayWidth * 240 / 1800 - displayWidth * 25 / 1800;
    horaire = loadImage("assets/horaire.png");
    antihoraire = loadImage("assets/antihoraire.png");
    cam = new IPCapture(this, "http://" + ippi + ":8081", "", "");
    cam.start();
}

void draw() {

    //Exécute les sous-fonctions destinées à la structure du programme
    demarrage();
    rotationQ();
    rotationE();
    update2();
    update3();
    affiche();
    controle();
    TableauSave();
    fichier();


    //Affiche des textes sur les boutons de commandes de lecture et d'enregistrement
    fill(0);
    textSize(displayWidth * 20 / 1800);
    text("Enregistrer", displayWidth * 115 / 1800, displayHeight * 20 / 1000);
    text("Arreter", displayWidth * 345 / 1800, displayHeight * 20 / 1000);
    text("Lecture", displayWidth * 550 / 1800, displayHeight * 20 / 1000);

    //Aplique l'image sur en haut à droite
    cam.read();
    image(cam, displayWidth / 2 + 3, 2, displayWidth / 2 - 5, displayHeight / 2 - 4);
}

//Sous-fonction destinée à attribuer une action lors de l'utilisation d'un bouton utilisant la sous-fonction "bouton2"
void update() {
    if (Selection == 1 && DegreAngleA != 180) {
        DegreAngleA = DegreAngleA + 1;
        rotationA();
        // Augmente l'angle A et l'aplique avec rotationA
    }
    if (Selection == 2 && DegreAngleA != 30) {
        DegreAngleA = DegreAngleA - 1;
        rotationA();
        // Baisse l'angle A et l'aplique avec rotationA
    }
    if (Selection == 3 && DegreAngleB != 260) {
        DegreAngleB = DegreAngleB + 1;
        rotationB();
    }
    if (Selection == 4 && DegreAngleB != 120) {
        DegreAngleB = DegreAngleB - 1;
        rotationB();
    }
    if (Selection == 5 && DegreAngleC != 180) {
        DegreAngleC = DegreAngleC + 1;
        rotationC();
    }
    if (Selection == 6 && DegreAngleC != 0) {
        DegreAngleC = DegreAngleC - 1;
        rotationC();
    }
    if (Selection == 7 && DegreAngleQ != 180) {
        DegreAngleQ = DegreAngleQ + 1;
        rotationC();
    }
    if (Selection == 8 && DegreAngleQ != 0) {
        DegreAngleQ = DegreAngleQ - 1;
        rotationC();
    }
}

//Sous-fonction destinée à attribuer une action lors de l'utilisation d'un bouton utilisant la sous-fonction "bouton"
void update2() {
    if (Selection2 == "Bouton1") {
        // Donne à l'angle A un angle de 90°
        DegreAngleA = 90;
        rotationA();
    }
    if (Selection2 == "Bouton2") {
        DegreAngleB = 180;
        rotationB();
    }
    if (Selection2 == "Bouton3") {
        DegreAngleC = 90;
        rotationC();
    }
    if (Selection2 == "Bouton4") {
        DegreAngleA = 90;
        DegreAngleB = 180;
        DegreAngleC = 90;
        rotationA();
        rotationB();
        rotationC();
    }
    if (Selection2 == "Bouton5") {
        DegreAngleA = 30;
        DegreAngleB = 120;
        DegreAngleC = 0;
        rotationA();
        rotationB();
        rotationC();
    }
    if (Selection2 == "Bouton6") {
        DegreAngleQ = 180;
        rotationQ();
    }
    if (Selection2 == "Bouton7") {
        DegreAngleQ = 0;
        rotationQ();
    }
    if (Selection2 == "Bouton8") {
        DegreAngleQ = 110;
        rotationQ();
    }
    if (Selection2 == "Bouton9") {
        Pince = "O";
    }
    if (Selection2 == "Bouton10") {
        Pince = "F";
    }
    if (Selection2 == "Bouton11") {
        startSave = true;
    }
    if (Selection2 == "Bouton12" && startSave == true) {
        startSave = false;
        save();
    }
    if (Selection2 == "Bouton13") {
        delay(50);
        lecture();
    }
    Selection2 = "";
}


// Sous-fonction destinée à afficher des effets lors du survol d'un bouton tel qu'un texte, une image, un fond ou une surbrillance 
void update3() {
    strokeWeight(5);
    stroke(255, 0, 0);
    fill(255, 0, 0);

    //AB -------------------------------
    if (Selection3 == "Effet1") {
        //Donne ces effet:
        //Met en surbrillance la ligne reliant la point A au point B
        //Donne un texte, une image ainsi qu'un fond
        line(Xa, Ya, Xb, Yb);
        ellipse(Xa, Ya, 7, 7);
        ellipse(Xb, Yb, 7, 7);
        fill(0, 0, 0, 125);
        noStroke();
        rect(mouseX + displayWidth * 20 / 1800, mouseY - displayHeight * 10 / 1800, displayWidth * 170 / 1800, displayHeight * 40 / 1000);
        fill(255);
        textSize(displayWidth * 20 / 1800);
        text("Position initiale", mouseX + displayWidth * 30 / 1800, mouseY + displayHeight * 20 / 1000);
    }
    if (Selection3 == "Effet11") {
        line(Xa, Ya, Xb, Yb);
        ellipse(Xa, Ya, 7, 7);
        ellipse(Xb, Yb, 7, 7);
        fill(0, 0, 0, 125);
        noStroke();
        rect(mouseX + displayWidth * 20 / 1800, mouseY - displayHeight * 10 / 1800, displayWidth * 200 / 1800, displayHeight * 60 / 1000);
        image(horaire, mouseX + displayWidth * 30 / 1800, mouseY, displayWidth * 50 / 1800, displayHeight * 50 / 1000);
        fill(255);
        textSize(displayWidth * 20 / 1800);
        text("Sens horaire", mouseX + displayWidth * 90 / 1800, mouseY + displayHeight * 40 / 1000);
    }
    if (Selection3 == "Effet12") {
        line(Xa, Ya, Xb, Yb);
        ellipse(Xa, Ya, 7, 7);
        ellipse(Xb, Yb, 7, 7);
        fill(0, 0, 0, 125);
        noStroke();
        rect(mouseX + displayWidth * 20 / 1800, mouseY - displayHeight * 10 / 1800, displayWidth * 250 / 1800, displayHeight * 60 / 1000);
        image(antihoraire, mouseX + displayWidth * 30 / 1800, mouseY, displayWidth * 50 / 1800, displayHeight * 50 / 1000);
        fill(255);
        textSize(displayWidth * 20 / 1800);
        text("Sens anti-horaire", mouseX + displayWidth * 90 / 1800, mouseY + displayHeight * 40 / 1000);
    }

    //BC -------------------------------
    if (Selection3 == "Effet2") {
        line(Xb, Yb, Xc, Yc);
        ellipse(Xc, Yc, 7, 7);
        ellipse(Xb, Yb, 7, 7);
        fill(0, 0, 0, 125);
        noStroke();
        rect(mouseX + displayWidth * 20 / 1800, mouseY - displayHeight * 10 / 1800, displayWidth * 170 / 1800, displayHeight * 40 / 1000);
        fill(255);
        textSize(displayWidth * 20 / 1800);
        text("Position initiale", mouseX + displayWidth * 30 / 1800, mouseY + displayHeight * 20 / 1000);
    }
    if (Selection3 == "Effet13") {
        line(Xb, Yb, Xc, Yc);
        ellipse(Xc, Yc, 7, 7);
        ellipse(Xb, Yb, 7, 7);
        fill(0, 0, 0, 125);
        noStroke();
        rect(mouseX + displayWidth * 20 / 1800, mouseY - displayHeight * 10 / 1800, displayWidth * 200 / 1800, displayHeight * 60 / 1000);
        image(horaire, mouseX + displayWidth * 30 / 1800, mouseY, displayWidth * 50 / 1800, displayHeight * 50 / 1000);
        fill(255);
        textSize(displayWidth * 20 / 1800);
        text("Sens horaire", mouseX + displayWidth * 90 / 1800, mouseY + displayHeight * 40 / 1000);
    }
    if (Selection3 == "Effet14") {
        line(Xb, Yb, Xc, Yc);
        ellipse(Xc, Yc, 7, 7);
        ellipse(Xb, Yb, 7, 7);
        fill(0, 0, 0, 125);
        noStroke();
        rect(mouseX + displayWidth * 20 / 1800, mouseY - displayHeight * 10 / 1800, displayWidth * 250 / 1800, displayHeight * 60 / 1000);
        image(antihoraire, mouseX + displayWidth * 30 / 1800, mouseY, displayWidth * 50 / 1800, displayHeight * 50 / 1000);
        fill(255);
        textSize(displayWidth * 20 / 1800);
        text("Sens anti-horaire", mouseX + displayWidth * 90 / 1800, mouseY + displayHeight * 40 / 1000);
    }

    //BC -------------------------------
    if (Selection3 == "Effet3") {
        line(Xd, Yd, Xc, Yc);
        ellipse(Xc, Yc, 7, 7);
        ellipse(Xd, Yd, 7, 7);
        fill(0, 0, 0, 125);
        noStroke();
        rect(mouseX + displayWidth * 20 / 1800, mouseY - displayHeight * 10 / 1800, displayWidth * 200 / 1800, displayHeight * 40 / 1000);
        fill(255);
        textSize(displayWidth * 20 / 1800);
        text("Position initiale", mouseX + displayWidth * 30 / 1800, mouseY + displayHeight * 20 / 1000);
    }
    if (Selection3 == "Effet15") {
        line(Xd, Yd, Xc, Yc);
        ellipse(Xc, Yc, 7, 7);
        ellipse(Xd, Yd, 7, 7);
        fill(0, 0, 0, 125);
        noStroke();
        rect(mouseX + displayWidth * 20 / 1800, mouseY - displayHeight * 10 / 1800, displayWidth * 200 / 1800, displayHeight * 60 / 1000);
        image(horaire, mouseX + displayWidth * 30 / 1800, mouseY, displayWidth * 50 / 1800, displayHeight * 50 / 1000);
        fill(255);
        textSize(displayWidth * 20 / 1800);
        text("Sens horaire", mouseX + displayWidth * 90 / 1800, mouseY + displayHeight * 40 / 1000);
    }
    if (Selection3 == "Effet16") {
        line(Xd, Yd, Xc, Yc);
        ellipse(Xc, Yc, 7, 7);
        ellipse(Xd, Yd, 7, 7);
        fill(0, 0, 0, 125);
        noStroke();
        rect(mouseX + displayWidth * 20 / 1800, mouseY - displayHeight * 10 / 1800, displayWidth * 250 / 1800, displayHeight * 60 / 1000);
        image(antihoraire, mouseX + displayWidth * 30 / 1800, mouseY, displayWidth * 50 / 1800, displayHeight * 50 / 1000);
        fill(255);
        textSize(displayWidth * 20 / 1800);
        text("Sens anti-horaire", mouseX + displayWidth * 90 / 1800, mouseY + displayHeight * 40 / 1000);
    }

    //Total -------------------------------
    if (Selection3 == "Effet4") {
        line(Xa, Ya, Xb, Yb);
        line(Xb, Yb, Xc, Yc);
        line(Xd, Yd, Xc, Yc);
        ellipse(Xa, Ya, 7, 7);
        ellipse(Xb, Yb, 7, 7);
        ellipse(Xc, Yc, 7, 7);
        ellipse(Xd, Yd, 7, 7);
        fill(0, 0, 0, 125);
        noStroke();
        rect(mouseX + displayWidth * 20 / 1800, mouseY - displayHeight * 10 / 1800, displayWidth * 170 / 1800, displayHeight * 40 / 1000);
        fill(255);
        textSize(displayWidth * 20 / 1800);
        text("Position initiale", mouseX + displayWidth * 30 / 1800, mouseY + displayHeight * 20 / 1000);
    }
    if (Selection3 == "Effet5") {
        line(Xa, Ya, Xb, Yb);
        line(Xb, Yb, Xc, Yc);
        line(Xd, Yd, Xc, Yc);
        ellipse(Xa, Ya, 7, 7);
        ellipse(Xb, Yb, 7, 7);
        ellipse(Xc, Yc, 7, 7);
        ellipse(Xd, Yd, 7, 7);
        fill(0, 0, 0, 125);
        noStroke();
        rect(mouseX + displayWidth * 20 / 1800, mouseY - displayHeight * 10 / 1800, displayWidth * 200 / 1800, displayHeight * 40 / 1000);
        fill(255);
        textSize(displayWidth * 20 / 1800);
        text("Position maximale", mouseX + displayWidth * 30 / 1800, mouseY + displayHeight * 20 / 1000);
    }

    //Q -------------------------------
    if (Selection3 == "Effet17") {
        line(displayWidth * 450 / 1800, displayHeight * 750 / 1000, Xq, Yq);
        ellipse(displayWidth * 450 / 1800, displayHeight * 750 / 1000, 5, 5);
        ellipse(Xq, Yq, 5, 5);
        fill(0, 0, 0, 125);
        noStroke();
        rect(mouseX + displayWidth * 20 / 1800, mouseY - displayHeight * 10 / 1800, displayWidth * 200 / 1800, displayHeight * 60 / 1000);
        image(horaire, mouseX + displayWidth * 30 / 1800, mouseY, displayWidth * 50 / 1800, displayHeight * 50 / 1000);
        fill(255);
        textSize(displayWidth * 20 / 1800);
        text("Sens horaire", mouseX + displayWidth * 90 / 1800, mouseY + displayHeight * 40 / 1000);
    }
    if (Selection3 == "Effet18") {
        line(displayWidth * 450 / 1800, displayHeight * 750 / 1000, Xq, Yq);
        ellipse(displayWidth * 450 / 1800, displayHeight * 750 / 1000, 5, 5);
        ellipse(Xq, Yq, 5, 5);
        fill(0, 0, 0, 125);
        noStroke();
        rect(mouseX + displayWidth * 20 / 1800, mouseY - displayHeight * 10 / 1800, displayWidth * 250 / 1800, displayHeight * 60 / 1000);
        image(antihoraire, mouseX + displayWidth * 30 / 1800, mouseY, displayWidth * 50 / 1800, displayHeight * 50 / 1000);
        fill(255);
        textSize(displayWidth * 20 / 1800);
        text("Sens anti-horaire", mouseX + displayWidth * 90 / 1800, mouseY + displayHeight * 40 / 1000);
    }
    if (Selection3 == "Effet6") {
        line(displayWidth * 450 / 1800, displayHeight * 750 / 1000, Xq, Yq);
        ellipse(displayWidth * 450 / 1800, displayHeight * 750 / 1000, 5, 5);
        ellipse(Xq, Yq, 5, 5);
        fill(0, 0, 0, 125);
        noStroke();
        rect(mouseX + displayWidth * 20 / 1800, mouseY - displayHeight * 10 / 1800, displayWidth * 270 / 1800, displayHeight * 40 / 1000);
        fill(255);
        textSize(displayWidth * 20 / 1800);
        text("Position maximale (droite)", mouseX + displayWidth * 30 / 1800, mouseY + displayHeight * 20 / 1000);
    }
    if (Selection3 == "Effet7") {
        line(displayWidth * 450 / 1800, displayHeight * 750 / 1000, Xq, Yq);
        ellipse(displayWidth * 450 / 1800, displayHeight * 750 / 1000, 5, 5);
        ellipse(Xq, Yq, 5, 5);
        fill(0, 0, 0, 125);
        noStroke();
        rect(mouseX + displayWidth * 20 / 1800, mouseY - displayHeight * 10 / 1800, displayWidth * 280 / 1800, displayHeight * 40 / 1000);
        fill(255);
        textSize(displayWidth * 20 / 1800);
        text("Position maximale (gauche)", mouseX + displayWidth * 30 / 1800, mouseY + displayHeight * 20 / 1000);
    }
    if (Selection3 == "Effet8") {
        line(displayWidth * 450 / 1800, displayHeight * 750 / 1000, Xq, Yq);
        ellipse(displayWidth * 450 / 1800, displayHeight * 750 / 1000, 5, 5);
        ellipse(Xq, Yq, 5, 5);
        fill(0, 0, 0, 125);
        noStroke();
        rect(mouseX + displayWidth * 20 / 1800, mouseY - displayHeight * 10 / 1800, displayWidth * 170 / 1800, displayHeight * 40 / 1000);
        fill(255);
        textSize(displayWidth * 20 / 1800);
        text("Position initiale", mouseX + displayWidth * 30 / 1800, mouseY + displayHeight * 20 / 1000);
    }

    //Pince -------------------------------
    if (Selection3 == "Effet9") {
        fill(0, 0, 0, 125);
        noStroke();
        rect(mouseX + displayWidth * 20 / 1800, mouseY - displayHeight * 10 / 1800, displayWidth * 90 / 1800 - 6, displayHeight * 40 / 1000);
        fill(255);
        textSize(displayWidth * 20 / 1800);
        text("Ouvrir", mouseX + displayWidth * 30 / 1800, mouseY + displayHeight * 20 / 1000);
    }
    if (Selection3 == "Effet10") {
        fill(0, 0, 0, 125);
        noStroke();
        rect(mouseX + displayWidth * 20 / 1800, mouseY - displayHeight * 10 / 1800, displayWidth * 90 / 1800, displayHeight * 40 / 1000);
        fill(255);
        textSize(displayWidth * 20 / 1800);
        text("Fermer", mouseX + displayWidth * 30 / 1800, mouseY + displayHeight * 20 / 1000);
    }


    Selection3 = "";
    strokeWeight(2);
    stroke(0);
    fill(0);
}

//Fonction permettant de détecter un survol et un clic sur un bouton en forme de cercle
boolean DansUnCercle(float x, float y, float rayon) {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < rayon / 2 && mousePressed && (mouseButton == LEFT)) {
        return true;
    } else {
        return false;
    }
}

//Fonction permettant de détecter un survol sur un bouton en forme de cercle
boolean DansUnCerclenoclick(float x, float y, float rayon) {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < rayon / 2) {
        return true;
    } else {
        return false;
    }
}

//Fonction permettant de détecter un survol et un clic sur bouton en forme de carré
boolean DansUnCarre(float Xa, float Ya, float Xb, float Yb) {
    if (mouseX > Xa && mouseX < Xb && mouseY > Ya && mouseY < Yb && mousePressed && (mouseButton == LEFT)) {
        return true;
    } else {
        return false;
    }
}

//Fonction permettant de détecter un survol sur bouton en forme de carré
boolean DansUnCarrenoclick(float Xa, float Ya, float Xb, float Yb) {
    if (mouseX > Xa && mouseX < Xb && mouseY > Ya && mouseY < Yb) {
        return true;
    } else {
        return false;
    }
}

//Fonction facilitant la création d'un bouton en forme de carré
void bouton(float XBouton, float YBouton, float longueurBouton, float largeurBouton, String retourBouton, String Effet) {
    strokeWeight(3);
    stroke(30);
    XBouton = displayWidth * XBouton / 1800;
    YBouton = displayHeight * YBouton / 1000;
    longueurBouton = displayWidth * longueurBouton / 1800;
    largeurBouton = displayWidth * largeurBouton / 1800;
    if (DansUnCarre(XBouton, YBouton, XBouton + longueurBouton, YBouton + largeurBouton)) {
        fill(0, 255, 0);
        rect(XBouton, YBouton, longueurBouton, largeurBouton);
        Selection2 = retourBouton;
    } else {
        fill(120);
        rect(XBouton, YBouton, longueurBouton, largeurBouton);
    }
    if (DansUnCarrenoclick(XBouton, YBouton, XBouton + longueurBouton, YBouton + largeurBouton)) {
        Selection3 = Effet;
    }
    stroke(0);
}

//Fonction facilitant la création d'un bouton en forme de cercle
void bouton2(float XBouton2, float YBouton2, float rayonBouton2, int RBouton2, int GBouton2, int BBouton2, int R2Bouton2, int G2Bouton2, int B2Bouton2, int retourBouton2, String Effet) {
    strokeWeight(3);
    stroke(30);
    XBouton2 = displayWidth * XBouton2 / 1800;
    YBouton2 = displayHeight * YBouton2 / 1000;
    rayonBouton2 = displayWidth * rayonBouton2 / 1800;
    fill(RBouton2, GBouton2, BBouton2);
    if (DansUnCercle(XBouton2, YBouton2, rayonBouton2)) {
        fill(R2Bouton2, G2Bouton2, B2Bouton2);
        Selection = retourBouton2;
        delay(30);
    }
    if (DansUnCerclenoclick(XBouton2, YBouton2, rayonBouton2)) {
        Selection3 = Effet;
    }
    ellipse(XBouton2, YBouton2, rayonBouton2, rayonBouton2);
    update();
    stroke(0);
}

//Actualise la rotation de la simulation du bras par rapport au point A
void rotationA() {
    RadAngleA = radians(DegreAngleA);
    RadAngleB = radians(DegreAngleB);
    RadAngleC = radians(DegreAngleC);
    Xbsave = Xb - Xa;
    Ybsave = Yb - Ya;
    Xcsave = Xc - Xa;
    Ycsave = Yc - Ya;
    Xdsave = Xd - Xa;
    Ydsave = Yd - Ya;
    Xb = (Xbsave * cos(RadAngleA - RadAngleAsave) - Ybsave * sin(RadAngleA - RadAngleAsave)) + Xa;
    Yb = (Xbsave * sin(RadAngleA - RadAngleAsave) + Ybsave * cos(RadAngleA - RadAngleAsave)) + Ya;
    Xc = (Xcsave * cos(RadAngleA - RadAngleAsave) - Ycsave * sin(RadAngleA - RadAngleAsave)) + Xa;
    Yc = (Xcsave * sin(RadAngleA - RadAngleAsave) + Ycsave * cos(RadAngleA - RadAngleAsave)) + Ya;
    Xd = (Xdsave * cos(RadAngleA - RadAngleAsave) - Ydsave * sin(RadAngleA - RadAngleAsave)) + Xa;
    Yd = (Xdsave * sin(RadAngleA - RadAngleAsave) + Ydsave * cos(RadAngleA - RadAngleAsave)) + Ya;
    RadAngleAsave = RadAngleA;
}

//Actualise la rotation de la simulation du bras par rapport au point B
void rotationB() {
    RadAngleA = radians(DegreAngleA);
    RadAngleB = radians(DegreAngleB);
    RadAngleC = radians(DegreAngleC);
    Xcsave = Xc - Xb;
    Ycsave = Yc - Yb;
    Xdsave = Xd - Xb;
    Ydsave = Yd - Yb;
    Xc = (Xcsave * cos(RadAngleB - RadAngleBsave) - Ycsave * sin(RadAngleB - RadAngleBsave)) + Xb;
    Yc = (Xcsave * sin(RadAngleB - RadAngleBsave) + Ycsave * cos(RadAngleB - RadAngleBsave)) + Yb;
    Xd = (Xdsave * cos(RadAngleB - RadAngleBsave) - Ydsave * sin(RadAngleB - RadAngleBsave)) + Xb;
    Yd = (Xdsave * sin(RadAngleB - RadAngleBsave) + Ydsave * cos(RadAngleB - RadAngleBsave)) + Yb;
    RadAngleBsave = RadAngleB;
}

//Actualise la rotation de la simulation du bras par rapport au point C
void rotationC() {
    RadAngleA = radians(DegreAngleA);
    RadAngleB = radians(DegreAngleB);
    RadAngleC = radians(DegreAngleC);
    Xdsave = Xd - Xc;
    Ydsave = Yd - Yc;
    Xd = (Xdsave * cos(RadAngleC - RadAngleCsave) - Ydsave * sin(RadAngleC - RadAngleCsave)) + Xc;
    Yd = (Xdsave * sin(RadAngleC - RadAngleCsave) + Ydsave * cos(RadAngleC - RadAngleCsave)) + Yc;
    RadAngleCsave = RadAngleC;
}

//Actualise la rotation de la simulation de la base par rapport au point Q
void rotationQ() {
    fill(50, 50, 50);
    ellipse(displayWidth * 450 / 1800, displayHeight * 750 / 1000, 300, 300);
    RadAngleQ = radians(DegreAngleQ + 160);
    Xq = cos(RadAngleQ) * (displayWidth * 220 / 1800) + displayWidth * 450 / 1800;
    Yq = sin(RadAngleQ) * (displayHeight * 220 / 1000) + displayHeight * 750 / 1000;
    fill(0);
}

//Actualise le status de la pince
void rotationE() {
    if (Pince == "F" && a2 <= c2) {
        a2 = a2 + 1;
        b2 = b2 + 1;
        c2 = c2 - 1;
        d2 = d2 - 1;
    }
    if (Pince == "O" && a2 >= displayWidth / 4 * 3 - displayWidth * 30 / 1800 - displayWidth * 25 / 1800 && c2 <= displayWidth / 4 * 3 + displayWidth * 130 / 1800 - displayWidth * 25 / 1800) {
        a2 = a2 - 1;
        b2 = b2 - 1;
        c2 = c2 + 1;
        d2 = d2 + 1;
    }
    /**a = displayWidth/4*3-displayWidth*30/1800-displayWidth*25/1800;
    b = displayWidth/4*3-displayWidth*140/1800-displayWidth*25/1800;
    c = displayWidth/4*3+displayWidth*130/1800-displayWidth*25/1800;
    d = displayWidth/4*3+displayWidth*240/1800-displayWidth*25/1800;**/
    fill(50);
    quad(a2, displayHeight * 1150 / 1800, a2, displayHeight * 1150 / 1800, b2, displayHeight * 1400 / 1800, a2, displayHeight * 1400 / 1800);
    quad(c2, displayHeight * 1150 / 1800, c2, displayHeight * 1150 / 1800, d2, displayHeight * 1400 / 1800, c2, displayHeight * 1400 / 1800);
    rect(b, displayHeight * 1400 / 1800, d - b, displayHeight * 90 / 1800);
    rect(a, displayHeight * 1400 / 1800 + displayHeight * 90 / 1800, c - a, displayHeight - displayHeight * 90 / 1800);
}

//Fonction affichant les données importantes 
void affiche() {
    if (keyPressed == true) {
        if (keyCode == UP) {
            if (verif2 == false) {
                verif2 = true;
                delay(100);
            } else {
                verif2 = false;
                delay(100);
            }
        }
    }

    if (verif2 == true) {
        fill(0, 0, 0, 125);
        rect(displayWidth / 2 + 50, 20, displayWidth * 350 / 1800, displayHeight * 330 / 1000);
        fill(255);
        textSize(32);
        text("A: " + Xa + " " + Ya, displayWidth / 2 + 100, 60);
        text("B: " + Xb + " " + Yb, displayWidth / 2 + 100, 90);
        text("C: " + Xc + " " + Yc, displayWidth / 2 + 100, 120);
        text("D: " + Xd + " " + Yd, displayWidth / 2 + 100, 150);
        text("a: " + DegreAngleA, displayWidth / 2 + 100, 180);
        text("b: " + DegreAngleB, displayWidth / 2 + 100, 210);
        text("c: " + DegreAngleC, displayWidth / 2 + 100, 240);
        text("q: " + DegreAngleQ, displayWidth / 2 + 100, 270);
        text("Selection: " + Selection, displayWidth / 2 + 100, 300);
        text("Pince: " + Pince, displayWidth / 2 + 100, 330);
        fill(0);
    }

    strokeWeight(3);
    stroke(0, 0, 0);
    line(Xa, Ya, Xb, Yb);
    line(Xb, Yb, Xc, Yc);
    line(Xc, Yc, Xd, Yd);
    line(displayWidth * 450 / 1800, displayHeight * 750 / 1000, Xq, Yq);
    strokeWeight(2);
    fill(255, 255, 255);
    ellipse(Xa, Ya, 5, 5);
    ellipse(Xb, Yb, 5, 5);
    ellipse(Xc, Yc, 5, 5);
    ellipse(Xd, Yd, 5, 5);
    ellipse(displayWidth * 450 / 1800, displayHeight * 750 / 1000, 5, 5);
    ellipse(Xq, Yq, 5, 5);
}

//Fonction envoyant au bras les commandes par internet à un programme en python stocké sur le Raspberry Pi
void controle() {
    DegreAngleA = DegreAngleA + 360;
    DegreAngleB = DegreAngleB + 360;
    DegreAngleC = DegreAngleC + 360;
    DegreAngleQ = DegreAngleQ + 360;
    data1 = DegreAngleA + ";" + DegreAngleB + ";" + DegreAngleC + ";" + DegreAngleQ + ";" + Pince + ";";

    if (!data1.equals(data2)) {
        delay(10);
        data2 = DegreAngleA + ";" + DegreAngleB + ";" + DegreAngleC + ";" + DegreAngleQ + ";" + Pince + ";";
        //myPort.write(data2);
        myClient.write(data2);
        println("SEND : " + data2 + "\n");
    }


    save = DegreAngleA + ";" + DegreAngleB + ";" + DegreAngleC;
    DegreAngleA = DegreAngleA - 360;
    DegreAngleB = DegreAngleB - 360;
    DegreAngleC = DegreAngleC - 360;
    DegreAngleQ = DegreAngleQ - 360;
}

//Fonction sauvegardant les données d'un mouvement dans un fichier texte
void save() {
    String title = String.format("%02d%02d%02d", hour(), minute(), second());
    saveStrings(title + ".txt", Save);
    Save = new String[0];
}

//Fonction stockant les données d'un mouvement dans un tableau
void TableauSave() {
    if (startSave == true) {
        DegreAngleA = DegreAngleA + 360;
        DegreAngleB = DegreAngleB + 360;
        DegreAngleC = DegreAngleC + 360;
        DegreAngleQ = DegreAngleQ + 360;
        Save = append(Save, DegreAngleA + ";" + DegreAngleB + ";" + DegreAngleC + ";" + DegreAngleQ + ";" + Pince + ";");
        DegreAngleA = DegreAngleA - 360;
        DegreAngleB = DegreAngleB - 360;
        DegreAngleC = DegreAngleC - 360;
        DegreAngleQ = DegreAngleQ - 360;
    }
}

//Fonction capable de lire un fichier texte contenant des mouvements enregistrés par la programme
void lecture() {
    String[] lines = loadStrings(Fichier + ".txt");
    if (lines != null) {
        for (int i = 0; i < lines.length; i++) {
            String[] list = split(lines[i], ';');


            DegreAngleA = int(list[0]) - 360;
            DegreAngleB = int(list[1]) - 360;
            DegreAngleC = int(list[2]) - 360;
            DegreAngleQ = int(list[3]) - 360;
            Pince = list[4];

            println(DegreAngleA + "-" + DegreAngleB + "-" + DegreAngleC + "-" + DegreAngleQ + "-" + Pince);

            rotationC();
            rotationB();
            rotationA();
            rotationQ();
            rotationE();
            demarrage();
            controle();

            demarrage();
            affiche();

            delay(10);

            fill(0);
            textSize(displayWidth * 20 / 1800);
            text("Enregistrer", displayWidth * 115 / 1800, displayHeight * 20 / 1000);
            text("Arreter", displayWidth * 345 / 1800, displayHeight * 20 / 1000);
            text("Lecture", displayWidth * 550 / 1800, displayHeight * 20 / 1000);
        }
    }
}

//Fonction de préparation au void draw
void demarrage() {
    cerclePositionX = displayWidth * 25 / 1800;
    cerclePositionY = displayHeight * 110 / 1000;
    rayon = displayWidth * 20 / 1800;
    fill(50, 50, 50);
    rect(0, 0, displayWidth, displayHeight);
    Selection = 0;
    fill(100, 100, 100);
    rect(displayWidth * 50 / 1800, 0, displayWidth * 850 / 1800, displayHeight * 500 / 1000);
    rect(displayWidth * 50 / 1800, displayHeight / 2, displayWidth * 850 / 1800, displayHeight);
    rect(displayWidth / 2 + displayWidth * 50 / 1800, displayHeight / 2, displayWidth * 850 / 1800, displayHeight);
    strokeWeight(5);
    line(0, displayHeight / 2, displayWidth, displayHeight / 2);
    line(displayWidth / 2, displayHeight, displayWidth / 2, 0);
    strokeWeight(2);
    fill(0);
    rect(displayWidth * 250 / 1800, displayHeight * 400 / 1000, displayWidth * 100 / 1800, displayHeight * 50 / 1000);


    //DEBUT MODULE BOUTON//  
    // void bouton(XBouton, YBouton, longueurBouton, largeurBouton, retourBouton)
    bouton(10, 60, 30, 30, "Bouton1", "Effet1");
    bouton(10, 155, 30, 30, "Bouton2", "Effet2");
    bouton(10, 255, 30, 30, "Bouton3", "Effet3");
    bouton(10, 375, 30, 30, "Bouton4", "Effet4");
    bouton(10, 415, 30, 30, "Bouton5", "Effet5");
    bouton(10, 605, 30, 30, "Bouton6", "Effet6");
    bouton(10, 645, 30, 30, "Bouton7", "Effet7");
    bouton(10, 685, 30, 30, "Bouton8", "Effet8");
    bouton(910, 530, 30, 30, "Bouton9", "Effet9");
    bouton(910, 570, 30, 30, "Bouton10", "Effet10");

    bouton(70, 0, 200, 30, "Bouton11", "Effet19");
    bouton(280, 0, 200, 30, "Bouton12", "Effet20");
    bouton(490, 0, 200, 30, "Bouton13", "Effet21");
    //void bouton2(XBouton2, YBouton2, rayonBouton2, RBouton2, GBouton2, BBouton2, R2Bouton2, G2Bouton2, B2Bouton2, retourBouton2)
    bouton2(25, 105, 20, 0, 100, 0, 0, 255, 0, 1, "Effet11");
    bouton2(25, 130, 20, 100, 0, 0, 255, 0, 0, 2, "Effet12");
    bouton2(25, 200, 20, 0, 100, 0, 0, 255, 0, 3, "Effet13");
    bouton2(25, 225, 20, 100, 0, 0, 255, 0, 0, 4, "Effet14");
    bouton2(25, 300, 20, 0, 100, 0, 0, 255, 0, 5, "Effet15");
    bouton2(25, 325, 20, 100, 0, 0, 255, 0, 0, 6, "Effet16");
    bouton2(25, 530, 20, 0, 100, 0, 0, 255, 0, 7, "Effet17");
    bouton2(25, 555, 20, 100, 0, 0, 255, 0, 0, 8, "Effet18");
    //FIN MODULE BOUTON//
}

//Fonction d'ouverture du fichier de sauvegarde
void fichier() {
    rect(displayWidth * 700 / 1800, 0, largeurEcriture, 30);
    if (keyPressed) {
        if (keyCode == CONTROL) {
            Fichier = "";
            largeurEcriture = displayWidth * 25 / 1800;
        }
    }

    if (keyPressed) {
        int num = (int) key;
        if (num < 128) {
            Fichier = Fichier + key;
            println("key");
            delay(100);
            largeurEcriture = largeurEcriture + 15;
        }

    }
    fill(0);
    textSize(displayWidth * 20 / 1800);
    text(Fichier, displayWidth * 705 / 1800, displayHeight * 20 / 1000);
}

//Fonction de capture de la caméra
void keyPressed() {
    if (key == ' ') {
        String picname = String.format("capture_%4d-%02d-%02d-%02d-%02d-%02d.png", day(), month(), year(), hour(), minute(), second());
        cam.save(picname);
    }
}
