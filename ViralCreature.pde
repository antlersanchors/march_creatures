class ViralCreature extends Creature {

  boolean alive = true;
  
  public ViralCreature(int x, int y, int r) {
    super(x, y, r);
    ellipseMode(RADIUS);
  }

  public void makeFriends(ViralCreature newC) {

    Creature newCreature = newC;
    Creature randomBuddy;
    int creaturesSize;
    int randomAddress;

    //Make a friend!
    creaturesSize = creatures.size();
    randomAddress = int(random(1, creaturesSize));
    randomBuddy = creatures.get(randomAddress);
    spring = physics.makeSpring(newCreature, randomBuddy);
    
  }

  public void contractions(){

    int springLength;

    if ( creatures.size() % 7 == 0) {
      springLength = 3;
    } else { 
      springLength = 175;
      }

    for (int i = 0; i < physics.forces().size(); i++) {
      if (physics.forces().get(i) instanceof Spring) {
          Spring mSSpring = (Spring)physics.forces().get(i);
          mSSpring.restlength(springLength);
      }
    }
  }

  public float mutate() {

    float noisyOscValue;

    noisyOscValue = osc.update()*noise(0,0.3);

    return noisyOscValue;
  }

  public void cull() {

    this.alive = false;

  }
  
  public void draw_shape(){
    PShape v;

    float hormones = mutate();

    float outsideRadius = 0;
    float insideRadius = 0;
    int numPoints = 0;
    float angle = 0;
    float angleStep = 0;

    color creatureColor = color(232, 104, 187);

    // Colours for the more colourful version
    // color outerColor = color(232, 104, 187+(20*hormones));
    // color innerColor = color(15+(25*hormones), 232, 55);
    // color mouthColor = color(185, 185, 185, 20);
    
    float strokeOpacity = 200;
    float fillOpacity = (30 - (5 * hormones));
      
    float h = 8+(1*hormones);
    float w = 8+(1*hormones);

    int x = 5;
    int y = 5;

    if ( alive ) {     
      outsideRadius = 35+(0.3*hormones);
      insideRadius = 15+(0.6*hormones);
      numPoints = 7;
      angle = 0;
      angleStep = 180.0/numPoints;

    } else if ( !alive && fillOpacity > 1 ){
      outsideRadius += 30;
      insideRadius = 15+(0.6*hormones);
      numPoints = 7;
      angle = 0;
      angleStep = 180.0/numPoints;
      fillOpacity -= 1;

    } else {

      creatures.remove(0);
    }

    shapeMode(CENTER);
    v = createShape(GROUP);

    beginShape(TRIANGLE_STRIP); 
      for (int i = 0; i <= numPoints; i++) {
        float px = x + cos(radians(angle)) * outsideRadius;
        float py = y + sin(radians(angle)) * outsideRadius;
        angle += angleStep;
        stroke(creatureColor, strokeOpacity);
        fill(creatureColor, fillOpacity);
        ellipse(px, py, w, h);
        px = x + cos(radians(angle)) * insideRadius;
        py = y + sin(radians(angle)) * insideRadius;
        stroke(creatureColor, strokeOpacity-(hormones));
        fill(creatureColor, fillOpacity);
        ellipse(px, py, w+(2.5*hormones), h+(2.5*hormones)); 
        angle += angleStep;
      }
      ellipseMode(CENTER);
      noStroke();
      fill(creatureColor, fillOpacity);
      ellipse(5, 5, 3+(hormones), 3+(hormones));
      endShape();

    shape(v,0,0);
  }
  
  public boolean inside(int mx, int my) {    
    if(dist(mx, my, position().x, position().y) < radius()) return true;
    return false;
  }
  
};
