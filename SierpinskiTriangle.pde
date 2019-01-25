public void setup()
{
  size(300, 300);
}

int timesToDraw = 20;
int sizeToDraw = 200;
int[] colorValues = {(int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255)};
//int[] colorSpeeds = {(int)(Math.random()*2)-1, (int)(Math.random()*4)-2, (int)(Math.random()*4)-2};
int[] colorSpeeds = {1, 1, 1};

public void draw()
{
  updateColorValues();
  //frameColorValues = colorValues;
  sierpinski((width/2)-(sizeToDraw/2), (height/2)+(sizeToDraw/2), sizeToDraw, true);
}

public void updateColorValues()
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
}

int[] frameColorValues = new int[3];
public void sierpinski(float x, float y, float len, boolean shouldUpdateColor)
{
  //if (shouldUpdateColor)
    //updateColorValues();
  if (len >= 2)
  {
    //fill((int)(len/(mouseX*1.0/50.0)), (int)(len/(mouseY*1.0/50.0)), (int)(1.0*len/(1.0*(width-mouseX))));
    //stroke(255-colorValues[0], 255-colorValues[1], 255-colorValues[2], len);
    fill(colorValues[0], colorValues[1], colorValues[2], len);
    triangle(x, y, x+len/2, y-len, x+len, y);
    sierpinski(x,y,len/2,true);
    sierpinski(x+(len/2),y,len/2,false);
    sierpinski(x+(len/4),y-(len/2),len/2,false);
  }
  /*else if (shouldUpdateColor)
  {
    colorValues = frameColorValues;
    updateColorValues();
  }*/
}
