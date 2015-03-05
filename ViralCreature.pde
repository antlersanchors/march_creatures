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
    float outsideRadius = 35;
    float insideRadius = 10;

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
        vertex(px, py);
        px = x + cos(radians(angle)) * insideRadius;
        py = y + sin(radians(angle)) * insideRadius;
        vertex(px, py); 
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

    // arc1 = createShape(ARC, 6, 4, w, h, startA, stopA);
    // arc2 = createShape(ARC, 10, 0, w, h, startA, stopA);
    // arc3 = createShape(ARC, 14, 4, w, h, startA, stopA);

    // arc4 = createShape(ARC, 16, 6, w, h, startA, stopA);
    // arc5 = createShape(ARC, 20, 10, w, h, startA, stopA);
    // arc6 = createShape(ARC, 16, 14, w, h, startA, stopA);

    // arc7 = createShape(ARC, 14, 16, w, h, startA, stopA);
    // arc8 = createShape(ARC, 10, 20, w, h, startA, stopA);
    // arc9 = createShape(ARC, 6, 16, w, h, startA, stopA);

    // arc10 = createShape(ARC, 4, 16, w, h, startA, stopA);
    // arc11 = createShape(ARC, 0, 10, w, h, startA, stopA);
    // arc12 = createShape(ARC, 4, 6, w, h, startA, stopA);

    // v.addChild(arc0);
    // v.addChild(arc1);
    // v.addChild(arc2);
    // v.addChild(arc3);
    // v.addChild(arc4);
    // v.addChild(arc5);
    // v.addChild(arc6);
    // v.addChild(arc7);
    // v.addChild(arc8);
    // v.addChild(arc9);
    // v.addChild(arc10);
    // v.addChild(arc11);
    // v.addChild(arc12);

    // shapeMode(CENTER);
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
