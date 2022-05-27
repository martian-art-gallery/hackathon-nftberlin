import java.util.*;
import processing.sound.*;

SinOsc sine;
SinOsc sine2;

String patp = "";
boolean play = false;
String sigils[] = new String[4];
Integer sigilsInteger[] = new Integer[4];


int[] cMajor = { 0, 2, 4, 5, 7, 9, 11, 12, 14, 16, 17, 19, 21, 23, 24, 26};


ArrayList<String> prefixes = new ArrayList<String>(Arrays.asList("doz", "mar", "bin", "wan", "sam", "lit", "sig", "hid", "fid", "lis", "sog", "dir", "wac", "sab", "wis", "sib", "rig", "sol", "dop", "mod", "fog", "lid", "hop", "dar", "dor", "lor", "hod", "fol", "rin", "tog", "sil", "mir", "hol", "pas", "lac", "rov", "liv", "dal", "sat", "lib", "tab", "han", "tic", "pid", "tor", "bol", "fos", "dot", "los", "dil", "for", "pil", "ram", "tir", "win", "tad", "bic", "dif", "roc", "wid", "bis", "das", "mid", "lop", "ril", "nar", "dap", "mol", "san", "loc", "nov", "sit", "nid", "tip", "sic", "rop", "wit", "nat", "pan", "min", "rit", "pod", "mot", "tam", "tol", "sav", "pos", "nap", "nop", "som", "fin", "fon", "ban", "mor", "wor", "sip", "ron", "nor", "bot", "wic", "soc", "wat", "dol", "mag", "pic", "dav", "bid", "bal", "tim", "tas", "mal", "lig", "siv", "tag", "pad", "sal", "div", "dac", "tan", "sid", "fab", "tar", "mon", "ran", "nis", "wol", "mis", "pal", "las", "dis", "map", "rab", "tob", "rol", "lat", "lon", "nod", "nav", "fig", "nom", "nib", "pag", "sop", "ral", "bil", "had", "doc", "rid", "moc", "pac", "rav", "rip", "fal", "tod", "til", "tin", "hap", "mic", "fan", "pat", "tac", "lab", "mog", "sim", "son", "pin", "lom", "ric", "tap", "fir", "has", "bos", "bat", "poc", "hac", "tid", "hav", "sap", "lin", "dib", "hos", "dab", "bit", "bar", "rac", "par", "lod", "dos", "bor", "toc", "hil", "mac", "tom", "dig", "fil", "fas", "mit", "hob", "har", "mig", "hin", "rad", "mas", "hal", "rag", "lag", "fad", "top", "mop", "hab", "nil", "nos", "mil", "fop", "fam", "dat", "nol", "din", "hat", "nac", "ris", "fot", "rib", "hoc", "nim", "lar", "fit", "wal", "rap", "sar", "nal", "mos", "lan", "don", "dan", "lad", "dov", "riv", "bac", "pol", "lap", "tal", "pit", "nam", "bon", "ros", "ton", "fod", "pon", "sov", "noc", "sor", "lav", "mat", "mip", "fip"));
ArrayList<String> suffixes = new ArrayList<String>(Arrays.asList("zod", "nec", "bud", "wes", "sev", "per", "sut", "let", "ful", "pen", "syt", "dur", "wep", "ser", "wyl", "sun", "ryp", "syx", "dyr", "nup", "heb", "peg", "lup", "dep", "dys", "put", "lug", "hec", "ryt", "tyv", "syd", "nex", "lun", "mep", "lut", "sep", "pes", "del", "sul", "ped", "tem", "led", "tul", "met", "wen", "byn", "hex", "feb", "pyl", "dul", "het", "mev", "rut", "tyl", "wyd", "tep", "bes", "dex", "sef", "wyc", "bur", "der", "nep", "pur", "rys", "reb", "den", "nut", "sub", "pet", "rul", "syn", "reg", "tyd", "sup", "sem", "wyn", "rec", "meg", "net", "sec", "mul", "nym", "tev", "web", "sum", "mut", "nyx", "rex", "teb", "fus", "hep", "ben", "mus", "wyx", "sym", "sel", "ruc", "dec", "wex", "syr", "wet", "dyl", "myn", "mes", "det", "bet", "bel", "tux", "tug", "myr", "pel", "syp", "ter", "meb", "set", "dut", "deg", "tex", "sur", "fel", "tud", "nux", "rux", "ren", "wyt", "nub", "med", "lyt", "dus", "neb", "rum", "tyn", "seg", "lyx", "pun", "res", "red", "fun", "rev", "ref", "mec", "ted", "rus", "bex", "leb", "dux", "ryn", "num", "pyx", "ryg", "ryx", "fep", "tyr", "tus", "tyc", "leg", "nem", "fer", "mer", "ten", "lus", "nus", "syl", "tec", "mex", "pub", "rym", "tuc", "fyl", "lep", "deb", "ber", "mug", "hut", "tun", "byl", "sud", "pem", "dev", "lur", "def", "bus", "bep", "run", "mel", "pex", "dyt", "byt", "typ", "lev", "myl", "wed", "duc", "fur", "fex", "nul", "luc", "len", "ner", "lex", "rup", "ned", "lec", "ryd", "lyd", "fen", "wel", "nyd", "hus", "rel", "rud", "nes", "hes", "fet", "des", "ret", "dun", "ler", "nyr", "seb", "hul", "ryl", "lud", "rem", "lys", "fyn", "wer", "ryc", "sug", "nys", "nyl", "lyn", "dyn", "dem", "lux", "fed", "sed", "bec", "mun", "lyr", "tes", "mud", "nyt", "byr", "sen", "weg", "fyr", "mur", "tel", "rep", "teg", "pec", "nel", "nev", "fes"));

int color1;
int color2;
float rotationZ;

int timer;

float lightX;
float lightY;
float lightZ;

float speed;

void setup() {
  size(800, 600, P3D);
  background(0);
  colorMode(HSB, 360, 1, 1);

  //Create the sine oscillator.
  sine = new SinOsc(this);
  sine2 = new SinOsc(this);
}

void loadProps() {
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

float angleX;
float angleY;
float angleZ;

void playFreq(float FREQ, float FREQ2) {
  sine.stop();
  sine2.stop();
  sine.freq(FREQ);
  sine2.freq(FREQ2);
  sine.play();
  sine2.play();
}

void playByte(int b, int[] scale) {
  playFreq(noteToFreq(scale[leftNibble(b)]), noteToFreq(scale[rightNibble(b)]));
}

void stopSound() {
  sine.stop();
  sine2.stop();
}

void playSequence(int p1, int s1, int p2, int s2) {

  if ((millis() - timer) >= 0 && (millis() - timer) < 400) {
    playByte(p1, cMajor);
  } else if ((millis() - timer) > 400 && (millis() - timer) < 800) {
    playByte(s1, cMajor);
  } else if ((millis() - timer) > 900 && (millis() - timer) < 1300) {
    playByte(p2, cMajor);
  } else if ((millis() - timer) > 1300 && (millis() - timer) < 1700) {
    playByte(s2, cMajor);
  } else {
    stopSound();
  }
}



float angle;

void draw() {
  noStroke();
  lights();

  background(0);

  //Text
  fill(255);
  textSize(32);

  text(patp, 300, 50);


  //x, y, z location
  translate(400, 300, 0);

  if (play) {
    directionalLight(float(color1), float(1), 1, lightX, lightY, lightZ);

    fill(color1, 1, 0.5);

    angleY = angleY + speed;

    rotateZ(rotationZ);
    rotateY(angleY);

    sphereDetail(7);
    sphere(800 / 4);

    loadProps();
    playSequence(sigilsInteger[0], sigilsInteger[1], sigilsInteger[2], sigilsInteger[3]);
  } else {
    sine.stop();
    sine2.stop();
  }
}

void keyPressed() {
  if (key ==  BACKSPACE) {
    if (patp.length()>0 && !play) {
      patp = patp.substring(0, patp.length() - 1);
    }
  } else if ((key ==  RETURN || key ==  ENTER) && patp.length() >= 14) {
    timer = millis();
    play= !play;
  } else {
    if (patp.length()<15) {
      patp += key;
    }
  }
}


// This helper function calculates the respective frequency of a MIDI note
float noteToFreq(int note) {
  return (pow(2, ((note - 9)/12.0))) * 440 / 2;
}


int leftNibble(int x) {
  return (x & 0xF0) / 16;
}

int rightNibble(int x) {
  return x & 0xF;
}
