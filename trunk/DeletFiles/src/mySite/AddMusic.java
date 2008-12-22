package mySite;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringReader;
public class AddMusic {
	private String str1=new String();
	private String str2=new String();
	private String str3=new String();
	public AddMusic() throws IOException {
		 
	
		//getInfo( the path of a file)
		//String oldFile = AddMusic.getInfo("music.m3u"); 
		//replace "lanlianhua.mp3" with "a.mp3"
		//String newStmt = oldFile.replaceAll("default1.mp3",  "a.mp3");
		//newStmt = oldFile.replaceAll("default2.mp3",  "a.mp3");
		//newStmt = oldFile.replaceAll("default3.mp3",  "a.mp3");
		//store string in a file 
		
		
		AddMusic.stringToFile(AddMusic.changeFile(str1,str2,str3),"music.m3u");
		
//		System.out.println("BEFORE:\n" + oldFile + "\n");
//		System.out.println("AFTER:\n" + newStmt); 
		
	}
	
	//Read file and store it in a string,and a string will be returned.
	 public   static   String   getInfo(String   tmpFile)   throws   IOException   {   
         StringBuffer   sbFile=new StringBuffer();   
         FileReader   in   =   new   FileReader(tmpFile);   
        // char[]   buffer   =   new   char[4096];  
         char[]   buffer   =   new   char[9192];  
         int   len;   
         sbFile   =   new   StringBuffer();   
         while   (   (len   =   in.read(buffer))   !=   -1)   {   
             String   s   =   new   String(buffer,   0,   len);   
             sbFile.append(s);   
         }   
         return   sbFile.toString();   
	 }
	 
	 //string to file
	 public static void stringToFile(String str,String filename){
			try 
			{
				BufferedReader in = new BufferedReader(new StringReader(str));

				PrintWriter out = new PrintWriter(new FileWriter(filename));

				String s=new String();

				while ((s = in.readLine()) != null){
					out.println(s);
				}

				out.close();

			}catch (IOException e4) {}
			
		}
	 
	 
	 public  static String changeFile(String song1,String song2,String str3) throws IOException {
		 String oldFile = AddMusic.getInfo("music.m3u");
		 String newStmt = oldFile.replaceAll("default1",  "song1");
			newStmt = oldFile.replaceAll("default2",  "song2");
			newStmt = oldFile.replaceAll("default3",  "song3");
		return newStmt;
		 
	 }

	public String getStr1() {
		return str1;
	}

	public void setStr1(String str1) {
		System.out.println(str1);
		this.str1 = str1;
	}

	public String getStr2() {
		return str2;
	}

	public void setStr2(String str2) {
		this.str2 = str2;
	}

	public String getStr3() {
		return str3;
	}

	public void setStr3(String str3) {
		this.str3 = str3;
	}
} 




