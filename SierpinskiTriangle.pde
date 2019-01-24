public void setup()
{
  size(300, 300);
}

int timesToDraw = 20;
int sizeToDraw = 200;
int[] colorValues = {(int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255)};
int[] colorSpeeds = {(int)(Math.random()*20)-10, (int)(Math.random()*20)-10, (int)(Math.random()*20)-10};

public void draw()
{
  for (int i=0; i < colorValues.length; i++)
  {
    colorValues[i] += colorSpeeds[i];
    if (colorValues[i] > 255 || colorValues[i] < 0)
    {
      colorSpeeds[i] *= -1;
      colorValues[i] = colorValues[i] > 255 ? 255 : colorValues[i] < 0 ? 0 : 0;
    }
  }
  sierpinski((width/2)-(sizeToDraw/2), (height/2)+(sizeToDraw/2), sizeToDraw);
}

public void sierpinski(float x, float y, float len)
{
  if (len >= 1)
  {
    //fill((int)(len/(mouseX*1.0/50.0)), (int)(len/(mouseY*1.0/50.0)), (int)(1.0*len/(1.0*(width-mouseX))));
    fill(colorValues[0], colorValues[1], colorValues[2]);
    triangle(x, y, x+len/2, y-len, x+len, y);
    sierpinski(x,y,len/2);
    sierpinski(x+(len/2),y,len/2);
    sierpinski(x+(len/4),y-(len/2),len/2);
  }
}
