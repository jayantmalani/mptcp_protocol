import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;

public class FileTransferServer_5 { 
    
    public static void main(String[] args) throws Exception {
        //Initialize Sockets
        ServerSocket ssock = new ServerSocket(5004);
        Socket socket = ssock.accept();
        byte[] contents = new byte[10000];
        
        //The InetAddress specification
        // InetAddress IA = InetAddress.getByName("localhost");
        
        //Initialize the FileOutputStream to the output file's full path.
      //  FileOutputStream fos = new FileOutputStream("OutputServerFile_2.txt");
      //  BufferedOutputStream bos = new BufferedOutputStream(fos);
        InputStream is = socket.getInputStream();
        
        //No of bytes read in one read() call
        int bytesRead = 0;
        
        while((bytesRead=is.read(contents))!=-1);
        //    bos.write(contents, 0, bytesRead);
        
        //bos.flush();
        //File transfer done. Close the socket connection!
        socket.close();
        ssock.close();
        System.out.println("File received succesfully!");
    }
}
