Particle [] orbiters;
void setup()
{
	background(0);
	size(500, 500);
	orbiters = new Particle[55];
	for (int i=0; i<orbiters.length; i++)
	{
		if (i==1)
		{
			orbiters[1]=new Meteor();
		}
		else if(i==2) {orbiters[i]=new Comet();}
		else 
		{
			orbiters[i] = new Meteor();
		}
	}
}
public void draw()
{
	for (int i=0; i<orbiters.length; i++)
	{
		orbiters[i].show();
		orbiters[i].move();
		orbiters[i].reroll();
	}
}
interface Particle
{
	public void show();
	public void move();
	public void reroll();
}
class Meteor implements Particle
{
	double x, y, speed, angle, siz;
	color colour;
	Meteor()
	{
		x=(float)(Math.random()*500);
		y=(float)(Math.random()*500);
		siz=(float)(Math.random()*3);
		speed=2;
		colour=color(253, 255, 255);
		if (x<250)
		{
			if (y<250)
			{
				angle=Math.atan((float)((250-y)/(-(250-x))));
			}
			else 
			{
				angle=atan((float)((y-250)/(-(250-x))));
			}
		}
		else 
		{
			if (y<250)
			{
				angle=Math.atan((float)((250-y)/(x-250)));
			}
			else 
			{
				angle=Math.atan((float)((y-250)/(x-250)));
			}
		}
	}
	public void show()
	{
		fill(colour);
		ellipse((float)(x), (float)(y), (float)(siz), (float)(siz));
	}
	public void move()
	{
		if(Math.random()*10>5)
		{
			x=x+(Math.cos(angle))*speed;
		}
		else 
		{
			x=x-(Math.cos(angle))*speed;
		}
		if (Math.random()*10>5)
		{
			y=y+(Math.sin(angle))*speed;
		}
		else 
		{
			y=y-(Math.sin(angle))*speed;
		}
	}
	public void reroll()
	{
		if(y>500 || x>500)
		{
			x=(int)(Math.random()*500);
			y=(int)(Math.random()*500);
		}
	}
}
class Comet implements Particle
{
	double x, y, siz, angle, speed;
	color colour;
	Comet()
	{
		x=(float)(Math.random()*500);
		y=(float)(Math.random()*500);
		siz=(float)(Math.random()*3);
		speed=2;
		colour=color(253, 243, 165);
		if (x<250)
		{
			if (y<250)
			{
				angle=Math.atan((float)((250-y)/(-(250-x))));
			}
			else 
			{
				angle=atan((float)((y-250)/(-(250-x))));
			}
		}
		else 
		{
			if (y<250)
			{
				angle=Math.atan((float)((250-y)/(x-250)));
			}
			else 
			{
				angle=Math.atan((float)((y-250)/(x-250)));
			}
		}
	}
	void show()
	{
		fill(colour);
		ellipse((float)(x), (float)(y), (float)(siz), (float)(siz));
	}
	void move()
	{
		if(Math.random()*10>5)
		{
			x=x+(Math.cos(angle))*(2*speed);
		}
		else 
		{
			x=x-(Math.cos(angle))*(2*speed);
		}
		if (Math.random()*10>5)
		{
			y=y+(Math.sin(angle))*(2*speed);
		}
		else 
		{
			y=y-(Math.sin(angle))*(2*speed);
		}
	}
	void reroll()
	{
		if(y>500 || x>500)
		{
			x=(int)(Math.random()*500);
			y=(int)(Math.random()*500);
		}
	}
}