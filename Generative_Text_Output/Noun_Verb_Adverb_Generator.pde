PFont font;  //defining the font
color black;  //defining font color
float x, y;  //defining position of words

//possible nouns
String[] nouns = new String[]{"I", "You", "We", "They"};

//possible verbs
String[] verbs = new String[]{"read", "run", "jump", "swim", "write", "type", "rest", "sit", "stand", "text", "create", "dress",
     "pick", "buy", "sell", "scroll", "laugh", "smile", "eat", "condescend", "look up", "exist", "attend", "listen", "see",
     "think", "speak", "shut off", "boot up", "load", "charge", "punch", "lean", "compose", "fix", "connect", "relate",
     "manipulate", "doodle", "wrinkle", "whisper", "bite", "snuggle", "fry", "ski"};

//possible adverbs
String[] adverbs = new String[]{"poorly", "excellently", "abruptly", "beautifully", "delicately", "violently", "quickly",
     "proficiently", "slowly", "excitedly", "clumsily", "expertly", "warmly", "sadly", "slyly", "arrogantly", "fairly",
     "scarcely", "ferociously", "idiosyncratically", "loudly", "absently", "energetically"};

void setup() {
  size(1500, 300);  //long to create space for the words
  
  font = createFont("Garamond", 32);  //Garamond since Penguin Books uses it
  textFont(font, 60);  //large enough to look good
  black=color(0);  //black text
  
  y = height/2;  //middle of the screen
  
  frameRate(0.5);  //slowing it down to be readable comfortably
}

void draw() {
  background(255); //erase previous frame's letters
  fill(black);  //black text
  textAlign(CENTER);  //aligned at the center to enable dividing text by quarters

  int nounChange = (int) random (nouns.length);  //randomising which noun it picks
  int verbChange = (int) random (verbs.length);  //randomising which verb it picks
  int adverbsChange = (int) random (adverbs.length);  //randomising which adverb it picks
  
  int wordPosition = width/4; //divided by 4 to enable words to sit at the quarter points

  text (nouns[nounChange], wordPosition, y);  //writes a random noun, at 1/4 of the width and at the middle of the height
  text (verbs[verbChange], (wordPosition*2), y);  //writes a random verb, at 2/4 of the width and at the middle of the height
  text (adverbs[adverbsChange], (wordPosition*3), y);  //writes a random noun, at 3/4 of the width and at the middle of the height
}
