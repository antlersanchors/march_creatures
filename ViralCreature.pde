class ViralCreature extends Creature {
  
  public ViralCreature(int x, int y, int r) {
    super(x, y, r);
    ellipseMode(RADIUS);
  }  
  
  public void draw_shape(){
    PShape v;
      
    PShape arc0,arc1,arc2,arc3,arc4,arc5,arc6,arc7,arc8,arc9,arc10,arc11,arc12;

    float w = 5;
    float h = 5;

    int x = 5;
    int y = 5;
    float outsideRadius = 45;
    float insideRadius = 15;

    int numPoints = 8;
      float angle = 0;
      float angleStep = 180.0/numPoints;

    // float startA = 0;
    // float stopA = PIE;

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

    // arc0 = createShape(ELLIPSE, 0, 0, w*3, h*3);
    // arc1 = createShape(ELLIPSE, 6, 4, w, h);
    // arc2 = createShape(ELLIPSE, 10, 0, w, h);
    // arc3 = createShape(ELLIPSE, 14, 4, w, h);
    // arc4 = createShape(ELLIPSE, 16, 6, w, h);
    // arc5 = createShape(ELLIPSE, 20, 10, w, h);
    // arc6 = createShape(ELLIPSE, 16, 14, w, h);
    // arc7 = createShape(ELLIPSE, 14, 16, w, h);
    // arc8 = createShape(ELLIPSE, 10, 20, w, h);
    // arc9 = createShape(ELLIPSE, 6, 16, w, h);
    // arc10 = createShape(ELLIPSE, 4, 16, w, h);
    // arc11 = createShape(ELLIPSE, 0, 10, w, h);
    // arc12 = createShape(ELLIPSE, 4, 6, w, h);

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
