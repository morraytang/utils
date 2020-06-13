// Server_Socket.java
import java.io.*;
import java.net.*;

public class Server_Socket {
	public static final int PORT = 8080;

	public static void main(String[] args) throws IOException {
		//服务器套接字，作用是监听客户的请求
		ServerSocket s = new ServerSocket(PORT);
		System.out.println("Started: " + s);
		try {
			//用来通信的套接字
			Socket socket = s.accept();//监听客户的请求，如果没有请求到来，会一直阻塞

			try {
				System.out.println("Connection accepted: " + socket);

				BufferedReader in = new BufferedReader(
						new InputStreamReader(
						socket.getInputStream()));

				PrintWriter out = new PrintWriter(new BufferedWriter(
						new OutputStreamWriter(socket.getOutputStream())), true);
				while (true) {
					String str = in.readLine();//阻塞调用
					if (str.equals("END"))
						break;
					System.out.println("Echoing: " + str);
					out.println(str + str + " haha");
				}
			} finally {
				System.out.println("closing...");
				socket.close();
			}
		} finally {
			s.close();
		}
	}
}
