String tal;//Denne værdi er stringen der udkommer fra tekstfeltet "tekstfelttal"
String tekst;//Dette er stringværiden der udkommer fra det andet tekstfelt
String print="";//Dette er værdien der opdatere tekstboksen med indskrevet tidligere husket elementer.
String massevaerdi="";//Dette er en string værdi der hjælper til at konvertere float
String massevolume="";//Dette er volumens string når man indtaster det i masse og stof tekstfeltet

float massedata = 0;//Dette er den konverteret masse fra string til float
float atommertalhusk;//Dette er huskeværdien der huske molarmasse
float molmasse;//Dette er den endelige molmasse.
float talvaerdi;//Dette er tals floatværdi der er konveret.
float volume = 0;//Dette er den konveret fra massevolumes værdi.

FloatList Symbolatomhusker = new FloatList();//Laver en liste af float værdier, som kan havde komma i dem. (fx 9.82)

StringList Rawdata = new StringList();//Laver en stringListe der husker inputtet i tekst.


import controlP5.*;// importeret fra biblitoteket 

ControlP5 cp5;//sætter op en variabel.

void setup() {//Denne void kører en gang, fra starten af.
  size(1000, 500);//Dette laver et vinduet af (1000 pixels ad x aksen og 500 pixels ad y-aksen.
  background(71, 113, 72);//Dette sætter stemningen og baggrunden.
  cp5= new ControlP5(this);//Dette har i sammenhæng med controlP5, gjort at man kan sige cp5 istedet for ControlP5, og (this) gør det objektorienteret.

  PFont fonten = createFont("Arial", 18);//Dette laver fonten Arial (henter da den eksistere)
  ControlFont font = new ControlFont(fonten);//Dette gør så det er en font for alle cp5 enheder.

  cp5.setFont(font);//Dette sætter det som fonten.

  cp5.addButton("VOLUME")//Tilføjer en knap med Størrelse og position.
    .setPosition(545, 113)//Sætter position for knap volume.(langs x og y)
    .setSize(183, 35)// Sætter størrelse for knap volume langs x og y antal pixel.
    ;
      cp5.addButton("RESTART")//Tilføjer en knap der restarter
    .setPosition(20, 20)//Sætter position for knap restart (langs x og y)
    .setSize(93, 25)// Sætter størrelse for knap restart langs x og y antal pixel.
    ;
  cp5.addButton("masse")//Tilføjer en knap der kan tilføje masse når klikket
    .setPosition(750, 113)//Sætter position for knap masse (langs x og y)
    .setSize(183, 35)// Sætter størrelse for knap masse langs x og y antal pixel.
    ;
  cp5.addButton("next_stof")//Tilføjer en knap der kan springer til næste stof
    .setPosition(650, 13)//Sætter position for knap next sotf (langs x og y)
    .setSize(313, 55)//// Sætter størrelse for knap volume langs x og y antal pixel.
    ;
  cp5.addTextfield("Textfelt")//Dette sætter et tekstfelt fra bibloteket, herunder størrelse af textfelt og position.
    .setCaptionLabel("Stof & masse")//Sætter en label under tekstfeltet.
    .setPosition(145, 13)//Sætter position op for tekstfeltet med pixels
    .setSize(283, 62)// Sætter størrelse for tekstfeltet langs x og y antal pixel.
    .setAutoClear(false)// Sætter den til at ikke autoclear til at starte med
    ;
  cp5.addTextfield("Textfelttal")//Dette sætter et tekstfelt fra bibloteket, herunder størrelse af textfelt og position.
    .setCaptionLabel("Tal")//Det der står under tekstfeltet.
    .setPosition(445, 13)//Sætter position op for tekstfeltettal med pixels-
    .setSize(83, 62)//Sætter tekstfeltets størrelse op
    .setAutoClear(false)//Sætter den til at ikke autoclear til at starte med
    ;
  tabledata();//dette gør at ved startup loader den kommanden tabledata og gør det muligt at skabe en void der hedder tabledata.
}
void draw() {//dette er en konstant void, som kører 60 gange i sekunder. Medmindre Kommanden frameRate(x) er brugt. 

  rectMode(CENTER);//Gør rect mere centreret.

  fill(255);//Farver rectanglerne vide.
  rect(335, 183, 390, 70, 6);//Skaber en rektangel.
  rect(740, 183, 410, 70, 6);//Skaber en rektangel ved den x og y pos med den størrelse og 6 indikere at de bliver mere runde
  rect(335, 318, 390, 70, 6);//Skaber en rektangel ved den x og y pos med den størrelse og 6 indikere at de bliver mere runde
  rect(740, 318, 410, 70, 6);//Skaber en rektangel ved den x og y pos med den størrelse og 6 indikere at de bliver mere runde
  rect(740, 443, 410,70,6);//Concentration. //Skaber en rektangel ved den x og y pos med den størrelse og 6 indikere at de bliver mere runde
  rect(335,443,390,70,6);//Volume. //Skaber en rektangel ved den x og y pos med den størrelse og 6 indikere at de bliver mere runde
  textSize(22);//Sætter Tekststørrelsen til text.
  fill(201, 0, 61);//Farver teksten
  text("Molarmasse:", 145, 323);//Sætter en Tekst med molarmasse på X og Y pixel.
  text("Stofmængde:", 540, 323);//Sætter en stofmængde med molarmasse på X og Y pixel.
  text("Indtastede masse:"+massevaerdi+"g", 553, 190);////Sætter en Tekst med masse på X og Y pixel.
  text("Dit indtaste stof:"+print, 150, 190);//Sætter en tekst op med de endelige indtastede stof.
  text(molmasse+"mol", 283, 323);//Sætter molmasse op som tekst. ved x og y.
  text(massedata/molmasse+"g/mol", 688, 323);//Stofmænde sættes op.
  
  text("Dit indtastede volume:"+massevolume+"L",540,448);//Sætter tekst op med volume.
  text("Koncentration:",145,448);//Sætter tekst op med koncentration
  float koncvaerdi =massedata/molmasse;//Beregner koncentration.
  text(koncvaerdi/volume+"mol/L",303,448);//Sætter koncentration op med den endelige værdi.
  
          

  molmasse=0;
  for (int k=0; k < Symbolatomhusker.size(); k++) {//Et for loop der husker tidligere skrevet Symbolatomer.
    Symbolatomhusker.get(k);//Henter størrelsen fra for loopet.
    molmasse=molmasse+Symbolatomhusker.get(k);//Opdatere molmassen med nye indskrevet Symbolatomer.(og husker tidliger Symbolatomers molmasse)
  }
  print="";
  for (int l=0; l < Rawdata.size(); l++) {//her er et foorloop der checker størrelsen af listen Rawdata og kan derfor updatere programmet hvis listen bliver større.
    Rawdata.get(l);//Henter størrelsen fra for loopet.
    print=print+Rawdata.get(l);//gør så print bliver en ny værdi.
          }
}

void masse() {//Reagere med knappen hvis den bliver trykket.
background(226,189,57);//Skifter baggrund så brugeren ved det når man trykket.
  massevaerdi=cp5.get(Textfield.class, "Textfelt").getText();//Et string navn for værdien fra tekstfeltet
  massedata = Float.parseFloat(massevaerdi);//konvertering.
  
  cp5.get(Textfield.class, "Textfelt").clear();//Renser tekstfelt efter knap klikket
  cp5.get(Textfield.class, "Textfelttal").clear();//Renser tekstfeltal efter knap kliket.
  taeller=-2;//Reseter værdien.
}
void RESTART() {//Knap restart der reagere hvis trykket.
  clear();//Ryder baggrund.
    cp5.get(Textfield.class, "Textfelt").clear();//Renser tekstfelt efter trykket
  cp5.get(Textfield.class, "Textfelttal").clear();//Renser tekstfelttal efter trykket
  taeller=-2;//resetter værdi
  tal="";//Herunder bliver alle værdierne og listene resetet hvis man trykket på restart knappen.
tekst="";//resetter værdi til tom.
print="";//resetter værdi til tom.
massevaerdi="";//resetter værdi til tom.
massevolume="";//resetter værdi til tom.

massedata = 0;//resetter værdi til 0.
atommertalhusk =0;//resetter værdi til 0
molmasse=0;//resetter værdi til 0.
talvaerdi=0;//resetter værdi til 0
volume = 0;//resetter værdi til 0
Symbolatomhusker = new FloatList();//Tømmer Floatlisten.

Rawdata = new StringList();//Tømmer Stringlisten

}
void VOLUME() {//Knap volume der reagere hvis trykket.
  background(221,92,92);  //Sætter ny background til at indikere at den er trykket
  massevolume=cp5.get(Textfield.class, "Textfelt").getText();//Sætter værdien massevolume op til at blive tekstinputet i form af string.
  volume = Float.parseFloat(massevolume);//konvertering af stringen.
  
  cp5.get(Textfield.class, "Textfelt").clear();//Renser tekstfelt efter trykket
  cp5.get(Textfield.class, "Textfelttal").clear();//Renser tekstfelttal efter trykket
  taeller=-2;//resetter værdi
}
void next_stof() {//Aktivere hvis knappen bliver trykket.
background(252, 150, 107);//Ny background til indaktion at den er trykket.
  tekst=cp5.get(Textfield.class, "Textfelt").getText();//Henter Stringen fra tekstfelt.
  Rawdata.append(cp5.get(Textfield.class, "Textfelt").getText());//Her appelere den fra textfelt og tilføjer den til StringListen Rawdata.
  Rawdata.append(cp5.get(Textfield.class, "Textfelttal").getText());//Her appelere den fra textfelttal og tilføjer den til StringListen Rawdata.
  tal=cp5.get(Textfield.class, "Textfelttal").getText();//Her henter den værdien fra textfelttal og tilføjer det til Stringen tal.
  talvaerdi = Float.parseFloat(tal);//her konvertes der fra string til float.

  if (taeller==-2) {//Her appelere den til at hvis taelleren er -5, så starter programmet.
    if (Symbolatom.hasValue(tekst)) {//Her appelere den til at se tekstfeltet og hente Value hvis Tekstsfelte har noget som StringListenSymbolatom indeholder.
      for (int j=0; j < Symbolatom.size(); j++) {//Dette er et forlob der tæller kolloner herunder tæller dens size som er på 118 Strings.
        String Hukommelse =Symbolatom.get(j);//Her laves der en variable der gemmes som Symbolsatoms for-loop værdi.
        if (Hukommelse.equals(tekst)) {//Her appelere hvis For loopets værdi som er gemt er det samme som det der står i tekstfeltet.
          taeller=j;//Så er det sandt altså Taelleren har den rigtige for loop værdi.
          println(Atommasse.get(taeller));// Dette bliver brugt til at tjekke om programmet virker ved at sætte Tekstfeltets værdi i Console. 
         String atommer = Atommasse.get(taeller);//Her henter den værdien fra tekstfeltet og hvis den passer matcher den Stringlisten atomasse
         //og henter den ud fra kollonen på taeller.
          atommertalhusk =Float.parseFloat(atommer);//konvertering.Her gemmes værdien så den kan blive konverteret og husket-imens programmet
          //kører til at blive en float så det kan blive divideret med massen (herunder massedata).
            break;//Ender eksekvering af kode for for eller while loops og springer videre til næste sektion.
       
   
      }
    }
  }
  }
  Symbolatomhusker.append(atommertalhusk*talvaerdi);//her husker den atomets masse gange tallet, og putter det i listen.
  cp5.get(Textfield.class, "Textfelt").clear();//rydder tekstfelt efter tryk på knap
  cp5.get(Textfield.class, "Textfelttal").clear();//Ryder tekstefeltettal efter knap trykket
  taeller=-2;//gør denne værdi tilbage til normal så den kan genkende igen.
}
