//
// Created by Chandru Narayan
// for Bush School CPJava course
// Fall 2020
//
//  A purely static Java class for holding global
//  static variables and static methods
//  This should never be instantiated as an Object!!
//
//  A subset of the Processing related system variables
//  are created here as Java static variables such that
//  they can be used inside of Java class modules.  These 
//  variables are mapped from "Main" tab
//
//  A subset of the Boid related variables are also 
//  created here to facilitate the displaying of lines
//  polygons, colors etc. Also used for Java access
//  to Processing event related variables
//
//  Add additional variables as needed for your Java program

public class Cfg {

  // Processing Related System Variables
  static int pMouseX, pMouseY;
  static boolean pMousePressed, pKeyPressed;
  static char pKey;
  static int pWidth, pHeight;

  // Boid Related System Variables and Methods
  static int corners = 4;  
  static int [] xCorners = new int[] {-8, 16, -8, -2};
  static int [] yCorners = new int[] {-8, 0, 8, 0};
  static Vector [] vertices = new Vector[corners];

  static void buildBoid() {
    for (int i = 0; i < vertices.length; i++) {
      vertices[i] = new Vector(xCorners[i], yCorners[i]);
    }
  }
}
