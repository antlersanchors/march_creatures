class ViralCreature extends Creature {
  
  public ViralCreature(int x, int y, int r) {
    super(x, y, r);
    ellipseMode(RADIUS);
  }

  private float mutate() {
    float noisyOscValue;

    noisyOscValue = osc.update()*noise(0,0.03);

    return noisyOscValue;
  }
  
  public void draw_shape(){
    PShape v;

    float hormones = mutate();
    println("hormones: "+hormones);
      
    float h = 5+(hormones);
    float w = 5+(hormones);

    int x = 5;
    int y = 5;
    float outsideRadius = 35;
    float insideRadius = 15;

    int numPoints = 7;
    float angle = 0;
    float angleStep = 180.0/numPoints;

    stroke(232, 104, 187, 200);
    fill(232, 104, 187, 30);

    shapeMode(CENTER);
    v = createShape(GROUP);

    beginShape(TRIANGLE_STRIP); 
      for (int i = 0; i <= numPoints; i++) {
        float px = x + cos(radians(angle)) * outsideRadius;
        float py = y + sin(radians(angle)) * outsideRadius;
        angle += angleStep;
        ellipse(px, py, w, h);
        px = x + cos(radians(angle)) * insideRadius;
        py = y + sin(radians(angle)) * insideRadius;
        ellipse(px, py, w, h); 
        angle += angleStep;
      }
      endShape();

    shape(v,0,0);
  }

  public void old_draw_shape(){
    ellipse(0, 0, radius(), radius());  
    line(0, 0, radius(), 0);
  }
  
  public boolean inside(int mx, int my) {    
    if(dist(mx, my, position().x, position().y) < radius()) return true;
    return false;
  }
  
};
