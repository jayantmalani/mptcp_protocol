import java.io.*;
import java.net.*;

public class UDPFileTransferServer {
    
    public static void main(String[] args) throws Exception {
        
        
        DatagramSocket serverSocket = new DatagramSocket(5100);
        byte[] receiveData = new byte[10000];
        int bytes_received = 0;
        
        while(true)
        {
            DatagramPacket receivePacket = new DatagramPacket(receiveData, receiveData.length);
            serverSocket.receive(receivePacket);
            bytes_received = bytes_received + receivePacket.getLength();
            if (bytes_received == 1000000000){
                
                System.out.println("File received succesfully!");
                serverSocket.close();
            }
            
        }
    }
}
