# Basics of Socket Programming

## 📚 Table of Contents
- [🌐 Server Port](#server-port)
- [🔌 Socket](#socket)
- [💻 Client Connection](#client-connection)
- [🔄 Send And Receive](#send-and-receive)
- [🏗 Create Server](#create-server)
- [🛠 Tips and Tricks](#tips-and-tricks-functions)

### 🌐 Server Port
+ Can You Set the Server Port Randomly? <br />
   Yes, you can technically set the server port randomly, but there are important considerations:
   1. Port Range:
      +  Ports range from **0** to **65535**, but ports **0-1023** are reserved for well-known services (e.g., HTTP uses 80, HTTPS uses 443).

      +  Ports from **1024** to **49151** are registered and should be used with caution as they may be reserved for other services.

      +  Ports from **49152** to **65535** are dynamic or private ports and are typically safe to use.

   2. Port Conflicts:
      +  If you pick a port at random, there's a risk it could already be in use by another service or application on the system, leading to a "port already in use" error.

   3. Consistency:
      + The `client` needs to know the server's port to **connect**. If the port is chosen randomly, the client must somehow be informed of the correct port number, which can complicate the connection process.

> **_NOTE:_** you can use `ss | grep DiseredPortNum` or `netstat | grep DiseredPortNum`to check that is not exist.


###  🔌 Socket
+ What is the socket? <br />
   A socket is an endpoint for communication between two machines. In C/C++, you can create sockets for both TCP (Transmission Control Protocol) and UDP (User Datagram Protocol). Below are the steps to create sockets for each protocol.

   1. create socket `int socket(int domain, int type, int protocol)` for your side.
      +  The `domain` argument specifies the communication domain or protocol family that the socket will use. Common values include:

         +  AF_INET: IPv4 Internet protocols.
         +  AF_INET6: IPv6 Internet protocols.
         +  AF_UNIX (or AF_LOCAL): Local communication (i.e., communication on the same host).
         +  AF_PACKET: Low-level packet interface.
         +  AF_NETLINK: Communication between kernel and user-space processes.
         +  AF_BLUETOOTH: Bluetooth protocol.
         +  AF_CAN: Controller Area Network protocols.
         +  AF_APPLETALK: AppleTalk protocol.
         +  AF_ROUTE: Routing table (used with AF_INET and AF_INET6).
   
      +  The type argument specifies the communication semantics. Common values include:
         +  SOCK_STREAM: Provides sequenced, reliable, two-way, connection-based byte streams. This is typically used with the TCP protocol.
         +  SOCK_DGRAM: Supports datagrams (connectionless, unreliable messages of a fixed maximum length). This is typically used with the UDP protocol.

      +  The protocol argument specifies a particular protocol to be used with the socket. The value depends on the selected domain and type. Common values include:
         +  0: Use the default protocol for the specified domain and type.
         +  IPPROTO_TCP: TCP protocol (typically used with SOCK_STREAM).
         +  IPPROTO_UDP: UDP protocol (typically used with SOCK_DGRAM).


### 💻 Client Connection
+ How to connect to server socket from client ? <br />
   1. There's two options for client to connection (on the same machine or someone another). Client can get ip of server socket from `struct hostent *gethostbyname(const char *name)`. This function returns a pointer to a struct hostent that contains information about the host, including its IP addresses. If the function fails, it returns NULL. Used with IPV4 only.

```
struct hostent {
    char    *h_name;        // Official name of the host.
    char    **h_aliases;    // Null-terminated array of alternate names for the host.
    int     h_addrtype;     // Address type (e.g., AF_INET for IPv4).
    int     h_length;       // Length of the address in bytes.
    char    **h_addr_list;  // Null-terminated array of network addresses for the host.
};
```
   + Parameters :
      + `localhost` to connect on server on the same machine which `localhost` is a standard hostname that refers to the local machine (i.e., the same machine on which the client program is running). In most systems, localhost is mapped to the loopback IP address, which is 127.0.0.1 for IPv4.

      + `Hostname` If the remote machine has a hostname that is resolvable (e.g., through DNS or a hosts file), you can pass that hostname as the argument.

      + `IP` You can also directly provide the IP address of the remote machine as a string.

   2. Set Server Address Structure in client side:

```
struct sockaddr_in {
    short            sin_family;   // Address family (e.g., AF_INET for IPv4)
    unsigned short   sin_port;     // Port number (in network byte order)
    struct in_addr   sin_addr;     // IP address (in network byte order)
    char             sin_zero[8];  // Padding to make structure the same size as `struct sockaddr`
};
```
   + Parameters :
      + `sin_family`: Specifies the address family. For `IPv4`, this is always `AF_INET`.
      
      + `sin_port`: Specifies the port number. Port numbers must be specified in network byte order, which is achieved using the `htons()` function `(host-to-network short)`. Port of server.

      + `sin_addr`:Contains the IP address. The struct in_addr has a single field, s_addr, which is the IP address in network byte order. Address of server.

      + `sin_zero`: This is padding used to make the size of struct sockaddr_in the same as struct sockaddr. It is not used and should be zeroed out.

   3. Real action od connection by `int connect(int sockfd, const struct sockaddr *addr, socklen_t addrlen)`

      + Parameters:-
         - `sockfd`: This is the file descriptor for the socket that you want to use to connect. It was obtained by calling the socket() function earlier. client socket.

         - `addr`: This is a pointer to a sockaddr structure that contains the address information of the remote server to which you want to connect. The sockaddr structure is a generic container, so it is cast to the specific type sockaddr_in for IPv4 addresses. Address of server.

         - `addrlen`: This specifies the length of the address structure pointed to by addr. It tells the connect function how many bytes to read from the addr structure. size of Address of server.

### 🔄 Send And Recieve
+ How to send or recieve from socket? <br />
   `ssize_t send(int sockfd, const void *buf, size_t len, int flags)`
   + `sockfd`: The file descriptor.
   + `buf`: Pointer to the buffer containing the data you want to send.
   + `len`: The length of the data in bytes.
   + `flags`: Typically set to 0 for default behavior.
   + Return Value:
      `On Success`: The number of bytes sent.
      `On Error`: -1, and errno is set to indicate the error.

   `ssize_t recv(int sockfd, void *buf, size_t len, int flags)`
   + `sockfd`: The file descriptor.
   + `buf`: Pointer to the buffer where the received data will be stored.
   + `len`: The maximum number of bytes to read from the socket.
   + `flags`: Typically set to 0 for default behavior.
   + Return Value:
      `On Success`: The number of bytes received.
      `On Error`: -1, and errno is set to indicate the error.

> **_NOTE:_**  If I send and recieve in client or server side and there are two of sockfd named clientSocket, ServerSocket what will be passed to send and recv parameter in both sides ? <br />
clientSocket is always used in two cases.

   `ssize_t recvfrom(int sockfd, void *buf, size_t len, int flags, struct sockaddr *src_addr, socklen_t *addrlen)`

   `ssize_t sendto(int sockfd, const void *buf, size_t len, int flags,const struct sockaddr *dest_addr, socklen_t addrlen)`

   + From Client side
      + ssize_t sentLen = sendto(clientSocket, message, strlen(message), 0, (struct sockaddr*)&serverAddr, sizeof(serverAddr))
      
      + ssize_t recvLen = recvfrom(clientSocket, buffer, sizeof(buffer) - 1, 0, (struct sockaddr*)&serverAddr, &addrLen)

   + From Server side
      + ssize_t sentLen = sendto(serverSocket, responseMessage, strlen(responseMessage), 0, (struct sockaddr*)&clientAddr, sizeof(clientAddr))
      
      + ssize_t recvLen = recvfrom(serverSocket, buffer, sizeof(buffer) - 1, 0, (struct sockaddr*)&clientAddr, &addrLen)

> **_NOTE:_** The recvfrom and sendto functions are typically used in the context of UDP (User Datagram Protocol) communication, where there is no established connection between the client and server, and each message (datagram) is sent and received independently.



### 🏗  Create Server

+ How to create Server ? <br />
   1. creat socket by [Socket](#socket)
   2. Bind the socket
   + This is crucial for a server because it specifies where the server will listen for incoming connections. The `bind()` function associates a socket with a specific local address and port number. This is necessary for a server to specify where it will receive incoming network traffic.
   `int bind(int sockfd, const struct sockaddr *addr, socklen_t addrlen)`

      + we need first set struct of server to assign port and address of this socket. by create pointer from sockaddr_in and assign its elements. and use [🛠 Tips and Tracks Functions](#tips-and-tracks-functions)
```
struct sockaddr_in {
    short int sin_family;         // Address family (e.g., AF_INET for IPv4)
    unsigned short int sin_port;  // Port number (in network byte order)
    struct in_addr sin_addr;      // IP address
};
```
<br />


   3. listen to clients
   `int listen(int sockfd, int backlog)`
      + `sockfd`: This is the file descriptor of the socket you want to listen on.
      + `backlog`: This specifies the maximum number of pending connections that can be queued up while the server is handling other connections. If the queue is full, new incoming connection requests may be refused until space is available.

   4. accept connection
   `int accept(int sockfd, struct sockaddr *addr, socklen_t *addrlen)`
      + `sockfd`: This is the file descriptor of the listening socket that is set up with the listen() function. This socket is in a passive state, waiting for incoming connection requests.
      + `addr`: This is a pointer to a sockaddr structure where the address information of the connecting client will be stored. This parameter can be used to obtain details about the client’s address, such as IP address and port number.
      + `addrlen`: This is a pointer to a variable of type socklen_t that initially contains the size of the addr structure. On return, it contains the actual size of the client’s address. This parameter helps in determining the length of the client’s address information.
      + Return Value
         `On Success`: Returns a new socket file descriptor that is used to communicate with the connected client.
         `On Error`: Returns -1 and sets the errno variable to indicate the error.

   5. send and recieve by [🔄 Send And Recieve](#send-and-recieve)
   6. disconnect by `close`.

###  🛠 Tips and Tracks Functions
   + We need to use two functions to assign port and ip address: 
      + `htons`: (Host-to-Network Short): Converts a port number from host byte order (little-endian on most machines) to network byte order (big-endian), which is required for correct transmission over the network. Network protocols expect data in big-endian format, so `htons` ensures compatibility.<br />

      + `inet_addr`: Converts an IPv4 address in the standard dotted-decimal notation (e.g., "192.168.1.1") to a 32-bit binary representation (network byte order) that can be used in socket operations. This function is necessary because IP addresses are typically represented as strings but need to be in a binary format for network communication. or set `INADDR_ANY` to connet to any ip address normally. <br />