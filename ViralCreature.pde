class ViralCreature extends Creature {
  
  public ViralCreature(int x, int y, int r) {
    super(x, y, r);
    ellipseMode(RADIUS);
  }  
  
  public void draw_shape(){
    PShape v;
      
    PShape arc1,arc2,arc3,arc4,arc5,arc6,arc7,arc8,arc9,arc10,arc11,arc12;

    float w = 5;
    float h = 5;
    float startA = 0;
    float stopA = PIE;

    stroke(232, 104, 187, 200);
    fill(232, 104, 187, 30);

    v = createShape(GROUP);

    arc1 = createShape(ARC, 6, 4, w, h, startA, stopA);
    arc2 = createShape(ARC, 10, 0, w, h, startA, stopA);
    arc3 = createShape(ARC, 14, 4, w, h, startA, stopA);

    arc4 = createShape(ARC, 16, 6, w, h, startA, stopA);
    arc5 = createShape(ARC, 20, 10, w, h, startA, stopA);
    arc6 = createShape(ARC, 16, 14, w, h, startA, stopA);

    arc7 = createShape(ARC, 14, 16, w, h, startA, stopA);
    arc8 = createShape(ARC, 10, 20, w, h, startA, stopA);
    arc9 = createShape(ARC, 6, 16, w, h, startA, stopA);

    arc10 = createShape(ARC, 4, 16, w, h, startA, stopA);
    arc11 = createShape(ARC, 0, 10, w, h, startA, stopA);
    arc12 = createShape(ARC, 4, 6, w, h, startA, stopA);

    v.addChild(arc1);
    v.addChild(arc2);
    v.addChild(arc3);
    v.addChild(arc4);
    v.addChild(arc5);
    v.addChild(arc6);
    v.addChild(arc7);
    v.addChild(arc8);
    v.addChild(arc9);
    v.addChild(arc10);
    v.addChild(arc11);
    v.addChild(arc12);

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
