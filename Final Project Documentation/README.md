# **Project Documentation**


## Julián Carrera


**Overall project concept and description**


\

	Overall, my concept is the result of old memes. A call to nostalgia, if anything, considering the memes I’m using. I started out with the idea to use a Rick-Roll, an old meme that used Rick Astley’s Never Gonna Give You Up as a way to bait people. The meme was mostly confined to early YouTube, and consisted of videos advertised as something else. So, for example, a video with a thumbnail of a puppy and a title like “CUTEST PUPPY EVER” would open up and play the music video for Never Gonna Give You Up.
	
	
	In a way, a rick-Roll is similar in nature to the screamer tradition of including a loud scream and a scary image when not expected. While the Rick-Roll was meant to annoy, the screamer was meant to scare.
	
	
	Perhaps the best example of the screamer is Jeremy Winterrowd’s game The Maze, a 3-level maze game (advertised as having 4 levels) where players had to navigate a black square through progressively tighter spaces, eventually resulting in a screamer before the end of the third level. The game was shared via email and early social media, baiting people to play the maze game and find the screamer.
	
	
	I decided to mix these two examples, The Maze and Rick-Rolls, to create a 3-level maze game (that advertises 4 levels) that ends in a similar moment, with a Rick-Roll instead. I use the same general aesthetic as The Maze, which is to say, a black square the player controls, black maze walls, a red rectangle for the goal (which is exactly the RGB colour 255, 0, 0), and a cyan background (which is, also, exactly the RGB colour 0, 255, 255). On collision with the walls, the game ends and the player must start again from the beginning. On collision with the goal rectangle, the next level starts. I mimicked these colours and made 3 levels. Unlike the levels in The Maze, however, I made an easy level, a tedious level, and a tricky level. I also extended gameplay by making roundabout ways to the goal.
	All in all, my goal with the design of the game was to have a clear visual reference so people who play the game immediately think back to The Maze, a reference that, given the tediousness of my levels, builds up tension in expectation for the screamer. Since the surprise turns out to be a Rick-Roll, however, the nature of the Rick-Roll changes from an annoying trap to the relief of not being a screamer. I find this change of meaning interesting with the change of context.
	Now, as for the physical side of the game, I also take some reference to The Maze after testing the communication between Arduino and Processing, which tends to be not exact and seems to have some internal delay as Processing reads the serial communication. While the controls in The Maze are responsive, the game tends to be too fast. Using a physical Arduino controller, I replicate the feeling of loss of control in how controls can be a bit unresponsive at times.
	The design of the controller itself was more a result of applied design rather than inherited controller design. So instead of having the character movement on the left and other buttons on the right, I have the character movement on the right and the single Action button on the left. Since the focus of the game is movement and the Action button can be used to slow down movement, I figured that using the right hand for movement, which is, in the vast majority of cases, the dominant hand, would be a decent approach. It also literalises the beginning of the game, since the player character always starts on the right side of the screen.
	I also take pride in this approach: instead of relying on the normal left to right movement, I make the player go from right to left to go against the grain of reading, signifying something wrong and highlighting the tension of the jumpscare.
	Put together, then, the project adds up to create an “aesthetic of memes,” even relying on the fast nature of memes (represented in the use of cardboard), where trends die quickly and memes must be made and shared at breakneck speeds if they have any hope at


**Overall picture(s)**
	
	
	(See other files)


**System diagram of the hardware and software**
	
	
	(See Diagram files)


**List of important parts**

  
  5 buttons
  
  
  Breadboard
  
  
  Sparkfun Redboard
  
  
  Cardboard
  
  
  Hot glue
  
  
  Hot glue gun.
  
  
**Pictures of the electronics**


(See other files)
  
  
**Code**


(See folders for Arduino and Processing)
  
  
**Explain how your project works and how you built it**
	
	
	My project is easily divided into 3 parts: Arduino, Processing, and Controller.
	The Arduino part is simple: there are 5 buttons, 4 of them write a character in the Serial communication: W for the up button, A for the left button, S for the down button, and D for the right button. The specific choice of letters is to mimic the keyboard tradition of the WASD keys as movement in video games, and is also a shortcut to avoid dealing with Serial strings. The fifth button, which serves as the Action button, sends out a P, which shows the scars of the code, since the Action button used to be the Start button, but since the S was taken, it got the P for Pause.
	The Processing part is a bit more complicated. The first thing the game keeps track of is the game state integer, set with different integers that represent 3 levels, 3 transitions, the starting screen, the losing screen, the Rick-Roll, and the ending screen. On the Draw function, if statements track the game state and draws something differently on the screen.
	For controls, Processing reads the W, A, S, D, and P. W, A, S, and D add the integer speed to the integers for the player’s centre on X and on Y. P is active on the start, end, loss, Rick-Roll, and the transitions, and it turns the Boolean StartPress to true. Using the game state integers, W, A, S, and D are set to be active only on levels. In-game, the action button, or P, slows the player down, but not because it changes the speed integer, but because it occupies another spot in the serial, meaning that, instead of adding speed every frame with the read of a W, A, S, or D, it adds speed every other frame as it reads W, A, S, or D, and P.
	The transitions, loss screen, start, and end are just black screens with white text. The Rick-Roll is an image of Rick Astley and the song Never Gonna Give You Up (I will develop on why I used an image in the problems). The levels, on Draw, are a bunch of functions. Every function represents a different wall of the maze in every level, and, to avoid any kinds of glitches, collision detection is done on a local function level that only exists when the function is called on Draw. The collision detection also works tracking the player’s centre, rather than the edges (I will also develop this on the problems), so I ended up needing a workaround: making the player’s core a visible red and stating outwards that this is where collision worked.
	As for the controller itself, I reused 5 out of the 6 soldered and wired buttons I used on my midterm project, giving me some security that I wouldn’t need the extra labour time needed to solder. Since 5 of them were a dull red and 1 was bright red, I used the bright one for the Action button and 4 dull ones for the Directional-Pad. I used large pieces of cardboard to allow for a relatively large controller box that would be more durable than a small controller (and had more space for cables inside of it) by reinforcing the inner walls with extra pieces of cardboard. Instead of doing a build reliant on a typical pattern for building cubes (the cross pattern), I cut and put together different cardboard squares to make the cube, adding holes at the top for the buttons and a small flap with a hole on the side for A) easy access to the insides if anything goes wrong and B) a semi-aesthetic way for the red cable to go from inside the cube to the laptop. And to keep most of the cable inside there, too.
	I put the cube together using hot glue and reinforcing the sides with extra cardboard. The breadboard and the Arduino are glued and screwed to the black plastic board that came with the Sparkfun set, and then used hot glue to glue that board to the inside of the box, at the back to make sure to have space for the red cable. All in all, I like how it adds to a certain quick aesthetic, it looks unrefined, and it looks ready to share an idea without staying behind in meme currents.


**Discuss what problems you ran into and how you resolved them or worked around them**


•Collision detection on the whole character square: To draw the Player, I use 3 integers, PlayerCenterX, PlayerCenterY, and PlayerSize. Since the square is drawn from the centre, the X and Y centres change when moving. The size is the same for X and Y axes. Initially, I had 4 other variables: CollisionLeft, Right, Top, and Bottom; CenterX – Size, CenterX + Size, CenterY – Size, CenterY + Size, respectively. On testing collision with these integers, however, nothing would happen. Collision wouldn’t register at any point of contact. This was a recurring problem, too: integers that had some mathematical description of what they were tended to be ignored by the program, particularly for collision, which preferred the exact number of the player centres. I couldn’t fix the problem, but I rolled with it by using a red square inside the Player, which, despite being bigger than the actual collision detector, gives the illusion of a larger detector.


•Picture and music instead of video for the Rick-Roll: It is still unclear to me why the video didn’t work. The video file was good. My code was right as Processing’s examples said, and yet, I always got the message that VM failed to initialise. On googling this issue, I found that this was a graphic driver problem. I outdated my driver to what everyone online was recommending and found the same results. I tried updating to the latest version. No difference. It was not a problem with my code, but with my laptop, and since I would use my laptop for the show, I had to come to a roundabout solution: adding only the music and getting a screenshot of Rick Astley singing from the music video. This much worked.


•Random collision detection: Sometimes collision detection would randomly trigger, despite there being no apparent mistakes in the code. Rewriting the code in the exact same way seemed to fix it for whatever reason. In one instance, it was because of a misplaced bracket, but other than that, it didn’t seem to be because of anything in particular.


•The Action button buffered the Boolean StartPress to true on multiple frames: What happened was that, on pressing the button, StartPress was set to true. It needs to be set to false elsewhere in the code. For fault proofing, I set it to false in if statements that need it to be true, and at the start of every individual game state’s if statement. In most cases, this fixed the issue, but holding the button pressed, particularly in the last sequence, just skipped everything to the first level again.


•Coming up with a timer to avoid the StartPress buffer: I tried millis(). Tried FrameCount. Tried setting up an integer to increase by one every frame until 300 for a 5-second counter. Tried a delay. Nothing seemed to work, and what worked (which is to say, the delay) stopped everything. I chose to not add a timer.


**Discuss feedback you received during user testing, and what changes you made**


During feedback, I encountered some interesting suggestions. Namely, that the level design is too long. I like the level design, however.
I was also told that going back to level 1 after losing on any level was frustrating given how long the levels were. I fixed this using Booleans and if statements so that, on collision with the wall, the loss screen takes the player back to the same level.
A common comment was that having to rely on the Action button to slow everything down was not the best given how fast it moved. So I reduced the speed float from 0.5 to 0.3, so that, instead of moving one pixel every 2 frames, it moved one pixel every 3 frames or so. This small change made the speed more manageable.
For videos of users playing, see:
[Links]
