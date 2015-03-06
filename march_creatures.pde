import teilchen.Physics;
import teilchen.force.Spring;
import teilchen.force.ViscousDrag;
import teilchen.force.Attractor;
import teilchen.util.CollisionManager;

final int CANVAS_WIDTH = 750;
final int CANVAS_HEIGHT = 750;

// This is the global variable for radius of creature, but I didn't implement it yet
float r;

// Max number of creatures
int maxCreatures = 40;

Physics physics;
Spring spring;
CollisionManager collision;
Herd herd;
Oscillator osc;

ArrayList<Creature> creatures = new ArrayList<Creature>();

Creature c1;
Creature c2;

PImage petriDish;

public void setup() {
	size(CANVAS_WIDTH, CANVAS_HEIGHT, OPENGL);
	frameRate(30);
	petriDish = loadImage("petriDish.png");
	
	physics = new Physics();
	
	collision = new CollisionManager();
	collision.minimumDistance(25);  
	
	herd = new Herd(physics, collision);  

	// create a global drag
	ViscousDrag drag = new ViscousDrag();
	drag.coefficient = 0.25f;
	//physics.add(drag);  
	
	c1 = new ViralCreature((int)random(width), (int)random(height), 20);
	c2 = new ViralCreature((int)random(width), (int)random(height), 20);
	creatures.add(c1);
	creatures.add(c2);
	herd.add(c1);
	herd.add(c2);

	//SPRING
	physics.add(c1); physics.add(c2);
	
	spring = physics.makeSpring(c1, c2);
	spring.restlength(100);

	//OSCILLATOR
	osc = new Oscillator(-5, 5, 0.03);

}

public void draw() {

	background(23, 68, 250);

	//HERD
	collision.createCollisionResolvers();
	collision.loop(1.0 / frameRate);

	physics.step(1.0 / frameRate);

	herd.update();

	//THE MAIN DISPLAY LOOP
	stroke(255);
	noFill();

	for(int i = 0; i < creatures.size(); i++) {
	Creature c = creatures.get(i);
	c.display();
	// c.contractions();
	}

	collision.removeCollisionResolver();

	//Check and cull the herd if necessary
	if ( creatures.size() > maxCreatures ) {
		Creature oldCreature = creatures.get(0);
		oldCreature.cull();
	}
	// println("creatures.size(): "+creatures.size());

	

	imageMode(CORNER);
	image(petriDish,0,0);
}

public void keyPressed() {
	if ( key == 'u' || key == 'U' ) {

		float randomChance = random(0,10);

		if ( randomChance < 5 ) {

			ViralCreature newCreature;

			newCreature = new ViralCreature((int)random(width), (int)random(height), 20);
			creatures.add(newCreature);
			herd.add(newCreature);
			physics.add(newCreature);

			newCreature.makeFriends(newCreature);

			}

		else if ( randomChance < 7 ) {
			for (int i = 0; i < physics.forces().size(); i++) {
					if (physics.forces().get(i) instanceof Spring) {
					    Spring mSSpring = (Spring)physics.forces().get(i);
					    	if ( mSSpring.restlength() == 3 ){
					    		mSSpring.restlength(175);
					    	} else {
					    		mSSpring.restlength(3);
					    	}
					} 
			}
		}
	}

	else if ( key == 'c' || key == 'C' ) {
		for (int j = 0; j < creatures.size()-1; j++ ) {
			creatures.remove(j);
			
		}
	} 

}



