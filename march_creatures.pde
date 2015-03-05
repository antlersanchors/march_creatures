import teilchen.Physics;
import teilchen.force.Spring;
import teilchen.force.ViscousDrag;
import teilchen.force.Attractor;
import teilchen.util.CollisionManager;

final int CANVAS_WIDTH = 650;
final int CANVAS_HEIGHT = 650;

// This is the global variable for number of creatures?
float r;

Physics physics;
Spring spring;
CollisionManager collision;
Herd herd;
Oscillator osc;

ArrayList<Creature> creatures = new ArrayList<Creature>();

Creature c1;
Creature c2;

public void setup() {
	size(CANVAS_WIDTH, CANVAS_HEIGHT, OPENGL);
	background(23, 68, 250);
	frameRate(30);
	
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
	}

	collision.removeCollisionResolver();

}

public void keyPressed() {
	if ( key == 'f' || key == 'F' ) {
		println("pressed!");

		Creature newCreature;
		Creature randomBuddy;
		int creaturesSize;
		int randomAddress;

		newCreature = new ViralCreature((int)random(width), (int)random(height), 20);
		creatures.add(newCreature);
		herd.add(newCreature);
		physics.add(newCreature);

		//Make a friend!
		creaturesSize = creatures.size();
		randomAddress = int(random(1, creaturesSize));
		randomBuddy = creatures.get(randomAddress);
		spring = physics.makeSpring(newCreature, randomBuddy);
	}

	if ( key == 's' || key == 'S') {
		for (int i = 0; i < physics.forces().size(); i++) {
			if (physics.forces().get(i) instanceof Spring) {
			    Spring mSSpring = (Spring)physics.forces().get(i);
			    mSSpring.restlength(3);
			}
		}
	}
	if ( key == 'd' || key == 'D') {
		for (int i = 0; i < physics.forces().size(); i++) {
			if (physics.forces().get(i) instanceof Spring) {
			    Spring mSSpring = (Spring)physics.forces().get(i);
			    mSSpring.restlength(175);
			}
		}
	}
}