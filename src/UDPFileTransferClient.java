import java.net.*;
import java.io.*;

public class UDPFileTransferClient {
    
    public static void main(String[] args) throws Exception{
        
        //Initialize socket
        DatagramSocket socket = new DatagramSocket();
        
        //Initialize the FileInputStream to the input file1's full path.
        File file1 = new File("/home/jayantmalani/mptcp/../Downloads/1GB");
        FileInputStream fis1 = new FileInputStream(file1);
        DataInputStream in = new DataInputStream(fis1);
        BufferedReader bis1 = new BufferedReader(new InputStreamReader(in));
        
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
            //DatagramPacket sendPacket = new DatagramPacket(contents1, contents1.length, InetAddress.getByName("192.168.2.2"), 5000);
            DatagramPacket sendPacket = new DatagramPacket(contents1, contents1.length, InetAddress.getByName("localhost"), 5100);
            socket.send(sendPacket);
            System.out.println("Sending file ... "+(current1*100)/fileLength1+"% complete!");
        }
        
        long time = System.currentTimeMillis() - start;
        int size = size1;
        
        System.out.println("Total bytes sent: "+ size +" \nTotal Time elapsed in sending: "+ time +" milliseconds\n");
        
        //File transfer done. Close the socket connection!
        socket.close();
        
        System.out.println("Files successfully saved on Server!");
    }
}
