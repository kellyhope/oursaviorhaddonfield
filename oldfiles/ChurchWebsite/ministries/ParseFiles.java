import java.io.*;
import java.util.Scanner;


public class ParseFiles {

	public static void main(String[] args) {
		
		Scanner stdin = new Scanner(System.in);
		String file = stdin.nextLine();		
		try {
			Scanner infile = new Scanner(new File(file));
			file = file + ".erb";
			FileWriter outfile = new FileWriter(new File(file));
			
			String next = infile.nextLine();
			
			while(!next.contains("<title>")) {
				next = infile.nextLine();
			}

			String title;
			Scanner parseTitle = new Scanner(next).useDelimiter("<title>");
			title = parseTitle.next();
			parseTitle = new Scanner(title).useDelimiter("</title>");
			title = parseTitle.next();
			
			outfile.append("<% @title = \"" +title +"\" %>\n\n");
			
			while(!next.contains("<div id=\"container\">")) {
				next = infile.nextLine();
			}
			
			next = infile.nextLine();
			outfile.append("<% content_for :content_header do %>\n");
		
			while(!next.contains("<div id=\"content\">")) {
				outfile.append(next +"\n");
				next = infile.nextLine();
			}
			
			outfile.append("<% end %>\n\n");
			
		/*	while(!next.contains("<div id=\"content\">")) {
				next = infile.nextLine();
			}*/
			
			int counter = 1;
			
			while(counter > 0) {
				next = infile.nextLine();
				if(next.contains("</div>")) {
					counter--;
				}
				else if(next.contains("<div")) {
					counter++;
				}
				
				if(counter != 0) outfile.append(next + "\n");
				
			}
				outfile.close();
				infile.close();
		}
		catch(FileNotFoundException e) {
			System.err.println("Load of input file failed; exiting.");
			System.exit(1);
		} catch (IOException e) {
			System.err.println("Load of output file failed; exiting.");
			System.exit(1);
		}
		
		
	}
	
}
