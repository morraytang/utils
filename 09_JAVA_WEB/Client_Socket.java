import java.net.*;
import java.util.Scanner;
import java.io.*;

public class Client_Socket {
	public static void main(String[] args) throws IOException {
		//服务器的地址对象
		InetAddress addr = InetAddress.getByName(null);
		System.out.println("addr = " + addr);
		//通过创建通信套接字，连接服务器，
		Socket socket = new Socket(addr, Server_Socket.PORT);
		try {
			System.out.println("socket = " + socket.toString());
			//用到了装饰器模式，每封装一层，功能强大一点
			BufferedReader in = new BufferedReader(
					new InputStreamReader(
					socket.getInputStream()));//最小单位是字节
			//用到了装饰器模式，每封装一层，功能强大一点
			PrintWriter out = new PrintWriter(new BufferedWriter(
					new OutputStreamWriter(socket.getOutputStream())), true);
			//用到了装饰器模式，每封装一层，功能强大一点
			Scanner scan = new Scanner(System.in);
			for (int i = 0; i < 10; i++) {
				String userinput = scan.nextLine();
			
				out.println(userinput);
				//获取服务器传输过来的内容
				String str = in.readLine();//阻塞调用
				System.out.println(str);
			}
			out.println("END");
		} finally {
			System.out.println("closing...");
			socket.close();
		}
	}
}
