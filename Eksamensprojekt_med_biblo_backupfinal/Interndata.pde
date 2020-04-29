StringList Symbolatom = new StringList();//Sætter Stringlisten op til senere brug af Symbolatom
StringList Atommasse = new StringList();// Sætter Stringlisten op til senere brug af hentninger af molarmasse
int taeller = -2;//Gør så programmet kan køre fordi den passer med en == kommand senere.

void tabledata() {//Dette kører en gang pga af det er sat op i void setup med tabledata();

String[] lines = loadStrings("PTOF.csv");//Loader filen PTOF.csv som en stringlist med linjer


  for (int i =1; i < lines.length; i++) {//Et for loop der læser linje længde i csv filen.
     String[]list=(split(lines[i],','));//Her splitter den filen ad, da det er en komma seperated fil, så splitter den ved komma.
     Symbolatom.append(list[2]); //Gør så Stringlisten Symbolatom er nu passer med række 2 i csv filen.
     Atommasse.append(list[3]);  //Gør så Stringlisten Molarmassen er nu passer med række 3 i csv filen.
  }
  }
