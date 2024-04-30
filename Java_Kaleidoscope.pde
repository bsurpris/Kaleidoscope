import static javax.swing.JOptionPane.*;
import javax.swing.*;

// Number of triangles to create
int numTriangles;
// Angle increment for rotation
float angleIncrement; 
// X-coordinates of vertices
float[] x; 
// Y-coordinates of vertices
float[] y; 

void setup() {
  size(600, 600);
  smooth();
  numTriangles = int(JOptionPane.showInputDialog("How many triangles should be mirrored?"));
  angleIncrement = 360.0 / numTriangles;
  
  x = new float[numTriangles]; 
  y = new float[numTriangles]; 
  
  // Calculate vertex positions
  for (int i = 0; i < numTriangles; i++) {
    x[i] = cos(i * angleIncrement) * 200 + width / 2;
    y[i] = sin(i * angleIncrement) * 200 + height / 2;
  }
}

void draw() {
  background(255,0,0);
  for (int i = 0; i < numTriangles; i++) {
    // Draw each triangle
    fill(0,0,255);
    triangle(x[i], y[i], mouseX, mouseY, x[(i+1) % numTriangles], y[(i+1) % numTriangles]);
    
    //Mirrored triangles
    triangle(width - x[i], y[i], width - mouseX, mouseY, width - x[(i+1) % numTriangles], y[(i+1) % numTriangles]);
    triangle(x[i], height - y[i], mouseX, height - mouseY, x[(i+1) % numTriangles], height - y[(i+1) % numTriangles]);
    triangle(width - x[i], height - y[i], width - mouseX, height - mouseY, width - x[(i+1) % numTriangles], height - y[(i+1) % numTriangles]);
  }
}
