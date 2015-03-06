class ViralCreature extends Creature {
  
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
    println("newCreature: "+newCreature);
    println("randomBuddy: "+randomBuddy);
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
  
  public void draw_shape(){
    PShape v;

    float hormones = mutate();

    color outerColor = color(232, 104, 187+(20*hormones));
    color innerColor = color(15+(25*hormones), 232, 55);
    color mouthColor = color(185, 185, 185, 20);
    
    float strokeOpacity = 200;
    float fillOpacity = 30;
      
    float h = 8+(1*hormones);
    float w = 8+(1*hormones);

    int x = 5;
    int y = 5;
    float outsideRadius = 35+(0.2*hormones);
    float insideRadius = 15+(0.5*hormones);

    int numPoints = 7;
    float angle = 0;
    float angleStep = 180.0/numPoints;

    shapeMode(CENTER);
    v = createShape(GROUP);

    beginShape(TRIANGLE_STRIP); 
      for (int i = 0; i <= numPoints; i++) {
        float px = x + hormones + cos(radians(angle)) * outsideRadius;
        float py = y + hormones + sin(radians(angle)) * outsideRadius;
        angle += angleStep;
        stroke(outerColor, strokeOpacity);
        fill(outerColor, fillOpacity-(5*hormones));
        ellipse(px, py, w, h);
        px = x + cos(radians(angle)) * insideRadius;
        py = y + sin(radians(angle)) * insideRadius;
        stroke(innerColor, strokeOpacity);
        fill(innerColor, fillOpacity-(5*hormones));
        ellipse(px, py, w+(2.5*hormones), h+(2.5*hormones)); 
        angle += angleStep;
      }
      ellipseMode(CENTER);
      noStroke();
      fill(mouthColor);
      ellipse(5, 5, 8+(0.1*hormones), 20);
      endShape();

    shape(v,0,0);
  }
  
  public boolean inside(int mx, int my) {    
    if(dist(mx, my, position().x, position().y) < radius()) return true;
    return false;
  }
  
};
