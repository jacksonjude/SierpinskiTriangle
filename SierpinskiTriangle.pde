public void setup()
{
  size(300, 300);
  sierpinski(width/2-sizeToDraw/2, height/2-sizeToDraw, sizeToDraw);
}

int timesToDraw = 20;
int sizeToDraw = 50;
public void draw()
{
}

public void sierpinski(float x, float y, float len)
{
  if (len <= 2)
  {
    triangle(x, y, x+len/2, y-len, x+len, y);
  }
  else
  {
    triangle(x, y, x+len/2, y-len, x+len, y);
    sierpinski(x-len/2, y-len/2, len/2);
  }
}
