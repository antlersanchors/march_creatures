import teilchen.Physics;
import teilchen.force.Spring;
import teilchen.force.ViscousDrag;
import teilchen.force.Attractor;
import teilchen.util.CollisionManager;

final int CANVAS_WIDTH = 650;
final int CANVAS_HEIGHT = 650;

// This is the global variable for 
float r;

Physics physics;
Spring spring;
CollisionManager collision;
Herd herd;

ArrayList<Creature> creatures = new ArrayList<Creature>();

public void setup() {
	size(CANVAS_WIDTH, CANVAS_HEIGHT);
	background(23, 68, 250);
	frameRate(30);
	
	physics = new Physics();
	
	collision = new CollisionManager();
	collision.minimumDistance(25);  
	
	herd = new Herd(physics, collision);  
	
}

public void draw() {
	
}