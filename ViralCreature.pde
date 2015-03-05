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

    color outerColor = color(232, 104, 187+(20*hormones));
    color innerColor = color(15+(30*hormones), 232, 55);
    
    float strokeOpacity = 200;
    float fillOpacity = 30;
      
    float h = 5+(0.8*hormones);
    float w = 5+(0.8*hormones);

    int x = 5;
    int y = 5;
    float outsideRadius = 35+(0.02*hormones);
    float insideRadius = 15+(0.05*hormones);

    int numPoints = 7;
    float angle = 0;
    float angleStep = 180.0/numPoints;

    shapeMode(CENTER);
    v = createShape(GROUP);

    beginShape(TRIANGLE_STRIP); 
      for (int i = 0; i <= numPoints; i++) {
        float px = x + cos(radians(angle)) * outsideRadius;
        float py = y + sin(radians(angle)) * outsideRadius;
        angle += angleStep;
        stroke(outerColor, strokeOpacity);
        fill(outerColor, fillOpacity-(5*hormones));
        ellipse(px, py, w, h);
        px = x + cos(radians(angle)) * insideRadius;
        py = y + sin(radians(angle)) * insideRadius;
        stroke(innerColor, strokeOpacity);
        fill(innerColor, fillOpacity-(5*hormones));
        ellipse(px, py, w+(0.5*hormones), h+(0.5*hormones)); 
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
