void setup () {
  size (500, 500);
  background (255); //white background to stand out

  stroke (0); //full black outline

  fill (0); //hair colour
  ellipse (width/2, 240, 290, 300); //base of hair
  rect (105, 230, 100, 230, 1, 1, 18, 9); //left hang of hair
  rect (295, 230, 100, 230, 1, 1, 9, 18); //right hang of hair

  fill (241, 194, 125); //face colour
  ellipse (width/2, height/2, 250, 300); //face shape

  fill (255); //eye white colour
  ellipse (200, 200, 60, 30); //left eye
  ellipse (300, 200, 60, 30); //right eye

  fill (77, 14, 14); //iris colour
  ellipse (200, 200, 30, 28); //left iris
  ellipse (300, 200, 30, 28); //right iris

  fill (0); //pupil colour
  ellipse (200, 200, 5, 5); //left pupil
  ellipse (300, 200, 5, 5); //right pupil

  line (250, 210, 225, 285); //descending nose line
  line (225, 285, 260, 285); //base of nose line

  fill (0); //eyebrow colour
  rect (170, 170, 70, 10, 20); //left eyebrow
  rect (260, 170, 70, 10, 20); //right eyebrow

  fill (30); //beard colour
  arc (width/2, 290, 240, 220, radians (10), radians (170)); //beard arc

  fill (241, 194, 125); //skin colour for mouth in beard
  ellipse (width/2, 325, 100, 50); //gap for the mouth in the beard

  noFill (); //removing white from smile ard
  arc (265, 310, 80, 30, radians (90), radians (180)); //smile, unintentionally a smirk but works better
  
  noFill (); //removing fill for glasses
  strokeWeight (3); //making glass rim thicker
  rect (165, 183, 70, 40, 1, 3, 18, 10); //left glass
  rect (265, 183, 70, 40, 3, 1, 10, 18); //right glass
  
  strokeWeight (4); //making ear thing (?) thicker
  line (165, 183, 335, 183); //line in-between glasses
  line (165, 183, 120, 200); //left... ear thing?
  line (335, 183, 380, 200); //right... ear thing?
}
