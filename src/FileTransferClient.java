import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.*;
import java.io.*;
import java.net.InetAddress;
import java.net.Socket;


public class FileTransferClient { 
    
    public static void main(String[] args) throws Exception{
        
        //Initialize socket
        Socket socket = new Socket(InetAddress.getByName("localhost"), 5000);
        
        //Initialize the FileInputStream to the input file1's full path.
        File file1 = new File("/Users/heliutpalmodi/Desktop/InputClientFile1.txt");
        FileInputStream fis1 = new FileInputStream(file1);
        BufferedInputStream bis1 = new BufferedInputStream(fis1);
        
        //Get socket's output stream
        OutputStream os1 = socket.getOutputStream();
        
        //Read File Contents into contents array
        byte[] contents1;
        long fileLength1 = file1.length();
        long current1 = 0;
        int size1 = 10000;
        
        long start = System.currentTimeMillis();
        while(current1!=fileLength1){
            if(fileLength1 - current1 >= size1)
                current1 += size1;
            else{
                size1 = (int)(fileLength1 - current1);
                current1 = fileLength1;
            }
            contents1 = new byte[size1];
            bis1.read(contents1, 0, size1);
            os1.write(contents1);
            System.out.println("Sending file1 ... "+(current1*100)/fileLength1+"% complete!");
        }
        
        os1.flush();
        
        //Initialize the FileInputStream to the input file2's full path.
        File file2 = new File("/Users/heliutpalmodi/Desktop/InputClientFile2.txt");
        FileInputStream fis2 = new FileInputStream(file2);
        BufferedInputStream bis2 = new BufferedInputStream(fis2);
        
        //Get socket's output stream
        OutputStream os2 = socket.getOutputStream();
        
        //Read File Contents into contents array
        byte[] contents2;
        long fileLength2 = file2.length();
        long current2 = 0;
        int size2 = 10000;
        
        while(current2!=fileLength2){
            if(fileLength2 - current2 >= size2)
                current2 += size2;
            else{
                size2 = (int)(fileLength2 - current2);
                current2 = fileLength2;
            }
            contents2 = new byte[size2];
            bis2.read(contents2, 0, size2);
            os2.write(contents2);
            System.out.println("Sending file2 ... "+(current2*100)/fileLength2+"% complete!");
        }
        
        long time = System.currentTimeMillis() - start;
        int size = size1 + size2;
        double speed = size/time;
        
        System.out.println("Total bytes sent: "+ size +" \nTotal Time elapsed in sending: "+ time +" milliseconds \nRate of Sending: "+ speed +" Bytes/millisec");
        
        os2.flush();
        
        //File transfer done. Close the socket connection!
        socket.close();
        
        System.out.println("Files successfully saved on Server!");
    }
}