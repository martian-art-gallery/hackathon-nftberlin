import java.util.*;
import processing.sound.*;

SinOsc sine;
SinOsc sine2;

String text1 = "";
boolean play = false;

String sigils[] = new String[4];
Integer sigilsInteger[] = new Integer[4];

ArrayList<String> prefixes = new ArrayList<String>(Arrays.asList("doz", "mar", "bin", "wan", "sam", "lit", "sig", "hid", "fid", "lis", "sog", "dir", "wac", "sab", "wis", "sib", "rig", "sol", "dop", "mod", "fog", "lid", "hop", "dar", "dor", "lor", "hod", "fol", "rin", "tog", "sil", "mir", "hol", "pas", "lac", "rov", "liv", "dal", "sat", "lib", "tab", "han", "tic", "pid", "tor", "bol", "fos", "dot", "los", "dil", "for", "pil", "ram", "tir", "win", "tad", "bic", "dif", "roc", "wid", "bis", "das", "mid", "lop", "ril", "nar", "dap", "mol", "san", "loc", "nov", "sit", "nid", "tip", "sic", "rop", "wit", "nat", "pan", "min", "rit", "pod", "mot", "tam", "tol", "sav", "pos", "nap", "nop", "som", "fin", "fon", "ban", "mor", "wor", "sip", "ron", "nor", "bot", "wic", "soc", "wat", "dol", "mag", "pic", "dav", "bid", "bal", "tim", "tas", "mal", "lig", "siv", "tag", "pad", "sal", "div", "dac", "tan", "sid", "fab", "tar", "mon", "ran", "nis", "wol", "mis", "pal", "las", "dis", "map", "rab", "tob", "rol", "lat", "lon", "nod", "nav", "fig", "nom", "nib", "pag", "sop", "ral", "bil", "had", "doc", "rid", "moc", "pac", "rav", "rip", "fal", "tod", "til", "tin", "hap", "mic", "fan", "pat", "tac", "lab", "mog", "sim", "son", "pin", "lom", "ric", "tap", "fir", "has", "bos", "bat", "poc", "hac", "tid", "hav", "sap", "lin", "dib", "hos", "dab", "bit", "bar", "rac", "par", "lod", "dos", "bor", "toc", "hil", "mac", "tom", "dig", "fil", "fas", "mit", "hob", "har", "mig", "hin", "rad", "mas", "hal", "rag", "lag", "fad", "top", "mop", "hab", "nil", "nos", "mil", "fop", "fam", "dat", "nol", "din", "hat", "nac", "ris", "fot", "rib", "hoc", "nim", "lar", "fit", "wal", "rap", "sar", "nal", "mos", "lan", "don", "dan", "lad", "dov", "riv", "bac", "pol", "lap", "tal", "pit", "nam", "bon", "ros", "ton", "fod", "pon", "sov", "noc", "sor", "lav", "mat", "mip", "fip"));
ArrayList<String> suffixes = new ArrayList<String>(Arrays.asList("zod", "nec", "bud", "wes", "sev", "per", "sut", "let", "ful", "pen", "syt", "dur", "wep", "ser", "wyl", "sun", "ryp", "syx", "dyr", "nup", "heb", "peg", "lup", "dep", "dys", "put", "lug", "hec", "ryt", "tyv", "syd", "nex", "lun", "mep", "lut", "sep", "pes", "del", "sul", "ped", "tem", "led", "tul", "met", "wen", "byn", "hex", "feb", "pyl", "dul", "het", "mev", "rut", "tyl", "wyd", "tep", "bes", "dex", "sef", "wyc", "bur", "der", "nep", "pur", "rys", "reb", "den", "nut", "sub", "pet", "rul", "syn", "reg", "tyd", "sup", "sem", "wyn", "rec", "meg", "net", "sec", "mul", "nym", "tev", "web", "sum", "mut", "nyx", "rex", "teb", "fus", "hep", "ben", "mus", "wyx", "sym", "sel", "ruc", "dec", "wex", "syr", "wet", "dyl", "myn", "mes", "det", "bet", "bel", "tux", "tug", "myr", "pel", "syp", "ter", "meb", "set", "dut", "deg", "tex", "sur", "fel", "tud", "nux", "rux", "ren", "wyt", "nub", "med", "lyt", "dus", "neb", "rum", "tyn", "seg", "lyx", "pun", "res", "red", "fun", "rev", "ref", "mec", "ted", "rus", "bex", "leb", "dux", "ryn", "num", "pyx", "ryg", "ryx", "fep", "tyr", "tus", "tyc", "leg", "nem", "fer", "mer", "ten", "lus", "nus", "syl", "tec", "mex", "pub", "rym", "tuc", "fyl", "lep", "deb", "ber", "mug", "hut", "tun", "byl", "sud", "pem", "dev", "lur", "def", "bus", "bep", "run", "mel", "pex", "dyt", "byt", "typ", "lev", "myl", "wed", "duc", "fur", "fex", "nul", "luc", "len", "ner", "lex", "rup", "ned", "lec", "ryd", "lyd", "fen", "wel", "nyd", "hus", "rel", "rud", "nes", "hes", "fet", "des", "ret", "dun", "ler", "nyr", "seb", "hul", "ryl", "lud", "rem", "lys", "fyn", "wer", "ryc", "sug", "nys", "nyl", "lyn", "dyn", "dem", "lux", "fed", "sed", "bec", "mun", "lyr", "tes", "mud", "nyt", "byr", "sen", "weg", "fyr", "mur", "tel", "rep", "teg", "pec", "nel", "nev", "fes"));

int color1;
float rotationX;

int timer;
void setup() {
  size(800, 600, P3D);
  background(0);
  colorMode(HSB, 360, 1, 1);

  //Create the sine oscillator.
  sine = new SinOsc(this);
  sine2 = new SinOsc(this);
}

void loadProps() {
  sigils[0] = text1.substring(0, 3);
  sigils[1] = text1.substring(3, 6);
  sigils[2] = text1.substring(6, 9);
  sigils[3] = text1.substring(9, 12);

  sigilsInteger[0] = prefixes.indexOf(sigils[0]);
  sigilsInteger[1] = suffixes.indexOf(sigils[1]);
  sigilsInteger[2] = prefixes.indexOf(sigils[2]);
  sigilsInteger[3] = suffixes.indexOf(sigils[3]);

  color1 = int((float(sigilsInteger[0]) / 255) * 359);
  rotationX = (float(sigilsInteger[2]) / 255) * (float)Math.PI;
}

float angleX;
float angleY;
float angleZ;


void playSound(int FREQ, int FREQ2) {
  sine.stop();
  sine2.stop();
  sine.freq(FREQ);
  sine2.freq(FREQ2);
  sine.play();
  sine2.play();
}

void stopSound() {
  sine.stop();
  sine2.stop();
}

void playSequence() {
  if ((millis() - timer) >= 0 && (millis() - timer) < 400) {
    playSound(400, 800);
  } else if ((millis() - timer) > 400 && (millis() - timer) < 800) {
    playSound(300, 600);
  } else if ((millis() - timer) > 900 && (millis() - timer) < 1300) {
    playSound(400, 800);
  } else if ((millis() - timer) > 1300 && (millis() - timer) < 1700) {
    playSound(300, 600);
  } else {
    stopSound();
  }
}

float angle;
float jitter = 0.1;

void draw() {
  noStroke();
  lights();

  background(0);

  //Text
  fill(255);
  textSize(32);
  text("-", 320, 50);
  text(text1, 300, 50);

  //x, y, z location
  translate(400, 300, 0);

  if (play) {
    fill(color1, 1, 1);

    angleX = angleX + jitter;
    angleY = angleY + jitter;
    angleZ = angleZ + jitter;
    rotateX(angleX);
    rotateY(angleY);
    rotateZ(angleZ);

    sphereDetail(7);
    sphere(800 / 4);

    loadProps();
    playSequence();
  } else {
    sine.stop();
    sine2.stop();
  }
}

void keyPressed() {
  if (key ==  BACKSPACE) {
    if (text1.length()>0 && !play) {
      text1 = text1.substring(0, text1.length() - 1);
    }
  } else if ((key ==  RETURN || key ==  ENTER) && text1.length() == 12) {
    timer = millis();
    play= !play;
  } else {
    if (text1.length()<12) {
      text1 += key;
    }
  }
}
