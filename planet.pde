import java.util.*;
import processing.sound.*;

TriOsc  waveform1;
TriOsc  waveform2;
TriOsc  waveform3;

//Sigils
ArrayList<String> prefixes = new ArrayList<String>(Arrays.asList("doz", "mar", "bin", "wan", "sam", "lit", "sig", "hid", "fid", "lis", "sog", "dir", "wac", "sab", "wis", "sib", "rig", "sol", "dop", "mod", "fog", "lid", "hop", "dar", "dor", "lor", "hod", "fol", "rin", "tog", "sil", "mir", "hol", "pas", "lac", "rov", "liv", "dal", "sat", "lib", "tab", "han", "tic", "pid", "tor", "bol", "fos", "dot", "los", "dil", "for", "pil", "ram", "tir", "win", "tad", "bic", "dif", "roc", "wid", "bis", "das", "mid", "lop", "ril", "nar", "dap", "mol", "san", "loc", "nov", "sit", "nid", "tip", "sic", "rop", "wit", "nat", "pan", "min", "rit", "pod", "mot", "tam", "tol", "sav", "pos", "nap", "nop", "som", "fin", "fon", "ban", "mor", "wor", "sip", "ron", "nor", "bot", "wic", "soc", "wat", "dol", "mag", "pic", "dav", "bid", "bal", "tim", "tas", "mal", "lig", "siv", "tag", "pad", "sal", "div", "dac", "tan", "sid", "fab", "tar", "mon", "ran", "nis", "wol", "mis", "pal", "las", "dis", "map", "rab", "tob", "rol", "lat", "lon", "nod", "nav", "fig", "nom", "nib", "pag", "sop", "ral", "bil", "had", "doc", "rid", "moc", "pac", "rav", "rip", "fal", "tod", "til", "tin", "hap", "mic", "fan", "pat", "tac", "lab", "mog", "sim", "son", "pin", "lom", "ric", "tap", "fir", "has", "bos", "bat", "poc", "hac", "tid", "hav", "sap", "lin", "dib", "hos", "dab", "bit", "bar", "rac", "par", "lod", "dos", "bor", "toc", "hil", "mac", "tom", "dig", "fil", "fas", "mit", "hob", "har", "mig", "hin", "rad", "mas", "hal", "rag", "lag", "fad", "top", "mop", "hab", "nil", "nos", "mil", "fop", "fam", "dat", "nol", "din", "hat", "nac", "ris", "fot", "rib", "hoc", "nim", "lar", "fit", "wal", "rap", "sar", "nal", "mos", "lan", "don", "dan", "lad", "dov", "riv", "bac", "pol", "lap", "tal", "pit", "nam", "bon", "ros", "ton", "fod", "pon", "sov", "noc", "sor", "lav", "mat", "mip", "fip"));
ArrayList<String> suffixes = new ArrayList<String>(Arrays.asList("zod", "nec", "bud", "wes", "sev", "per", "sut", "let", "ful", "pen", "syt", "dur", "wep", "ser", "wyl", "sun", "ryp", "syx", "dyr", "nup", "heb", "peg", "lup", "dep", "dys", "put", "lug", "hec", "ryt", "tyv", "syd", "nex", "lun", "mep", "lut", "sep", "pes", "del", "sul", "ped", "tem", "led", "tul", "met", "wen", "byn", "hex", "feb", "pyl", "dul", "het", "mev", "rut", "tyl", "wyd", "tep", "bes", "dex", "sef", "wyc", "bur", "der", "nep", "pur", "rys", "reb", "den", "nut", "sub", "pet", "rul", "syn", "reg", "tyd", "sup", "sem", "wyn", "rec", "meg", "net", "sec", "mul", "nym", "tev", "web", "sum", "mut", "nyx", "rex", "teb", "fus", "hep", "ben", "mus", "wyx", "sym", "sel", "ruc", "dec", "wex", "syr", "wet", "dyl", "myn", "mes", "det", "bet", "bel", "tux", "tug", "myr", "pel", "syp", "ter", "meb", "set", "dut", "deg", "tex", "sur", "fel", "tud", "nux", "rux", "ren", "wyt", "nub", "med", "lyt", "dus", "neb", "rum", "tyn", "seg", "lyx", "pun", "res", "red", "fun", "rev", "ref", "mec", "ted", "rus", "bex", "leb", "dux", "ryn", "num", "pyx", "ryg", "ryx", "fep", "tyr", "tus", "tyc", "leg", "nem", "fer", "mer", "ten", "lus", "nus", "syl", "tec", "mex", "pub", "rym", "tuc", "fyl", "lep", "deb", "ber", "mug", "hut", "tun", "byl", "sud", "pem", "dev", "lur", "def", "bus", "bep", "run", "mel", "pex", "dyt", "byt", "typ", "lev", "myl", "wed", "duc", "fur", "fex", "nul", "luc", "len", "ner", "lex", "rup", "ned", "lec", "ryd", "lyd", "fen", "wel", "nyd", "hus", "rel", "rud", "nes", "hes", "fet", "des", "ret", "dun", "ler", "nyr", "seb", "hul", "ryl", "lud", "rem", "lys", "fyn", "wer", "ryc", "sug", "nys", "nyl", "lyn", "dyn", "dem", "lux", "fed", "sed", "bec", "mun", "lyr", "tes", "mud", "nyt", "byr", "sen", "weg", "fyr", "mur", "tel", "rep", "teg", "pec", "nel", "nev", "fes"));

String patp = "";
String sigils[] = new String[4];
Integer sigilsInteger[] = new Integer[4];

//Status
boolean play = false;
int timer;

//Sound
int[][] patp2chord = new int [336][3];
int[] cMajor = { 0, 2, 4, 5, 7, 9, 11, 12, 14, 16, 17, 19, 21, 23, 24, 26};

// Visual elements
star[] stars = new star[500];

int color1;
int color2;

float angleX;
float angleY;
float angleZ;

float lightX;
float lightY;
float lightZ;

float rotationZ;
float speed;

void setup() {
  size(800, 600, P3D);
  background(0);
  colorMode(HSB, 360, 1, 1);

  //Create the sine oscillator.
  waveform1 = new TriOsc (this);
  waveform2 = new TriOsc(this);
  waveform3 = new TriOsc (this);

  for (int i=0; i < stars.length; i++) {
    stars[i] = new star();
  }

  // drawing three notes without replacement from a set of 8 notes (e.g. c major across an entire octave) gives 8*7*6=336 possible choices.
  int cntr = 0;
  for (int i1  = 0; i1 < 8; i1++) {
    for (int i2 = 0; i2 < 8; i2++) {
      for (int i3  = 0; i3 < 8; i3++) {
        if ( (i3 != i2) && (i2 != i1)  && (i1 != i3) ) {
          patp2chord[cntr][0] = i1;
          patp2chord[cntr][1] = i2;
          patp2chord[cntr][2] = i3;
          cntr++;
        }
      }
    }
  }
}

void loadProps() {
  // windows
  //sigils[0] = patp.substring(3, 6);
  //sigils[1] = patp.substring(6, 9);
  //sigils[2] = patp.substring(10, 13);
  //sigils[3] = patp.substring(13, 16);

  // mac
  sigils[0] = patp.substring(2, 5);
  sigils[1] = patp.substring(5, 8);
  sigils[2] = patp.substring(9, 12);
  sigils[3] = patp.substring(12, 15);

  sigilsInteger[0] = prefixes.indexOf(sigils[0]);
  sigilsInteger[1] = suffixes.indexOf(sigils[1]);
  sigilsInteger[2] = prefixes.indexOf(sigils[2]);
  sigilsInteger[3] = suffixes.indexOf(sigils[3]);

  color1 = int((float(sigilsInteger[0]) / 255) * 359);
  lightX = cos((255 * 2 * PI) / sigilsInteger[1]);
  lightY = sin((255 * 2 * PI) / sigilsInteger[1]);
  lightZ = 0;
  rotationZ = map(sigilsInteger[2], 0, 255, 0.006, 3.141532);

  speed = map(sigilsInteger[3], 0, 255, 0.006, 0.016);
}

void playChordFreq(float freq1, float freq2, float freq3) {
  waveform1.stop();
  waveform2.stop();
  waveform3.stop();
  waveform1.freq(freq1);
  waveform2.freq(freq2);
  waveform3.freq(freq3);
  waveform1.play();
  waveform2.play();
  waveform3.play();
}

void playByteToChord(int b, int[] scale) {
  playChordFreq(noteToFreq(scale[patp2chord[b][0]]), noteToFreq(scale[patp2chord[b][1]]), noteToFreq(scale[patp2chord[b][2]]));
}

void stopSound() {
  waveform1.stop();
  waveform2.stop();
  waveform3.stop();
}

void playChordSequence(int p1, int s1, int p2, int s2) {
  if ((millis() - timer) >= 0 && (millis() - timer) < 600) {
    playByteToChord(p1, cMajor);
  } else if ((millis() - timer) > 600 && (millis() - timer) < 1200) {
    playByteToChord(s1, cMajor);
  } else if ((millis() - timer) > 1400 && (millis() - timer) < 2000) {
    playByteToChord(p2, cMajor);
  } else if ((millis() - timer) > 2000 && (millis() - timer) < 2600) {
    playByteToChord(s2, cMajor);
  } else if ((millis() - timer) > 4500 ) {
    timer = millis();
  } else {
    stopSound();
  }
}

float angle;

void draw() {
  noStroke();
  lights();

  background(0);

  fill(255);
  for (int i=0; i < stars.length; i++) {
    stars[i].show();
  }

  //Text
  fill(255);
  textSize(32);
  text(patp, 300, 50);


  //x, y, z location
  translate(400, 300, 0);

  if (play) {
    directionalLight(float(color1), float(1), 1, lightX, lightY, lightZ);

    stroke(color1, 1, 0.5);

    fill(color1, 1, 0.5);

    angleY = angleY + speed;

    rotateZ(rotationZ);
    rotateY(angleY);

    sphereDetail(7);
    sphere(800 / 4);

    loadProps();
    playChordSequence(sigilsInteger[0], sigilsInteger[1], sigilsInteger[2], sigilsInteger[3]);
  } else {
    waveform1.stop();
    waveform2.stop();
    waveform3.stop();
  }
}

void keyPressed() {
  if (key ==  BACKSPACE) {
    if (patp.length()>0 && !play) {
      patp = patp.substring(0, patp.length() - 1);
    }
  } else if ((key ==  RETURN || key ==  ENTER) && patp.length() >= 15) {
    timer = millis();
    play= !play;
  } else {
    if (patp.length()<16) {
      patp += key;
    }
  }
}


// This helper function calculates the respective frequency of a MIDI note
float noteToFreq(int note) {
  return (pow(2, ((note - 9)/12.0))) * 440;
}


int leftNibble(int x) {
  // "left half" of a byte
  return (x & 0xF0) / 16;
}

int rightNibble(int x) {
  // "right half" of a byte
  return x & 0xF;
}
