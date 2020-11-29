class TerrainSeg {
  Vector beg, end, mid;  
  double len, rot;

  // Constructor
  TerrainSeg(double x1_, double y1_, double x2_, double y2_) {
    beg = new Vector(x1_, y1_);
    end = new Vector(x2_, y2_);
    mid = Vector.mid(beg, end);
    len = Vector.dis(beg, end);
    rot = Vector.angleBetween(beg, end);
  }
}
