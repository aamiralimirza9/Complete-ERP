package Util;

import java.util.Random;

public class GeneratePassword
{
	public String getPassword()
	{
		String password="";
		for(int i=0;i<4;i++)
		{
			Random rand = new Random();
			int  digit = rand.nextInt(9) + 1;
			password=password+digit;
		}
		
		
		for(int i=0;i<2;i++)
		{
			Random rand = new Random();
			int  digit = rand.nextInt(25) + 97;
			
			char character=(char) digit;
			password=password+character;
		}
		
		for(int i=0;i<2;i++)
		{
			Random rand = new Random();
			int  digit = rand.nextInt(25) + 65;

			char character=(char) digit;
			password=password+character;
		}
		
		return password;
	}
}
