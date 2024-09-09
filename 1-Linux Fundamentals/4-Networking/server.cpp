/*============================================================================
 * @file name      : server.cpp
 * @Author         : Shehab Aldeen Mohammed
 * @Github         : https://github.com/ShehabAldeenMo
 * @LinkedIn       : https://www.linkedin.com/in/shehab-aldeen-mohammed/
 *
 =============================================================================
 * @Description:
 *
=============================================================================
 * @Notes:
 *
 ******************************************************************************
 ==============================================================================
*/

/*===================================  Includes ===============================*/
#include <cstring>
#include <iostream>
#include <netinet/in.h>
#include <sys/socket.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <netdb.h>

using namespace std;

/*==================================  Definitions =============================*/
#define SERVER_PORT 8080
#define MAX_BUFFER  1000
#define MAX_CLIENTS  5

/*==================================  Main ====================================*/
int main()
{
    int serverSocket = socket(AF_INET, SOCK_STREAM, 0);
    if (serverSocket < 0) {
        cerr << "Error creating socket" << endl;
        return -1;
    }

    sockaddr_in serverAddress;
    serverAddress.sin_family = AF_INET;
    serverAddress.sin_port = htons(SERVER_PORT);
    serverAddress.sin_addr.s_addr = INADDR_ANY;

    // Binding the socket to the server address
    if (bind(serverSocket, (struct sockaddr*)&serverAddress, sizeof(serverAddress)) < 0) {
        cerr << "Error binding socket" << endl;
        close(serverSocket);
        return -1;
    }

    // Listening for incoming connections
    if (listen(serverSocket, MAX_CLIENTS) < 0) {
        cerr << "Error in listen" << endl;
        close(serverSocket);
        return -1;
    }


    // Accepting a connection request from a client
    int clientSocket = accept(serverSocket, nullptr, nullptr);
    if (clientSocket < 0) {
        cerr << "Error in accepting connection." << endl;
        return 0;
    }

    while (true) {
        // Receiving data from the client
        char buffer[MAX_BUFFER] = {0};
        int bytesReceived = recv(clientSocket, buffer, sizeof(buffer)-1, 0);
        if (bytesReceived < 0) {
            cerr << "Error in receiving data." << endl;
        } else {
            cout << "Message from client: " << buffer << endl;
        }

        // Sending a response to the client
        cout << "Enter message to send to client (or 'exit' to stop communication): ";
        string serverMessage ;
        getline(cin, serverMessage);

        if (serverMessage == "exit") {
            cout << "Shutting down the server..." << endl;
            break;
        }
        else {
            send(clientSocket, serverMessage.c_str(), serverMessage.length(), 0);
        }
    }

    // Close the client socket after communication
    close(clientSocket);

    // Closing the server socket
    close(serverSocket);

    return 0;
}
