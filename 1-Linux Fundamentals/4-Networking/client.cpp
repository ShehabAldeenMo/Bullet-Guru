/*============================================================================
 * @file name      : client.cpp
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

/*==================================  Main ====================================*/
int main(int argc, char *argv[])
{
    if (argc < 2){
        std::cerr << "Usage: " << argv[0] << " <server_address>" << std::endl;
        return 0;
    }
    
    // creating socket
    int clientSocket = socket(AF_INET, SOCK_STREAM, 0);
    if (clientSocket < 0) {
        cerr << "Error creating socket" << endl;
        return -1;
    }

    struct hostent *server = gethostbyname(argv[1]);
    if (server == nullptr){
        cerr << "server error" << std::endl;
        close(clientSocket);
        return -1;
    }

    // specifying the server address
    sockaddr_in serverAddress;
    serverAddress.sin_family = AF_INET;
    serverAddress.sin_port = htons(SERVER_PORT);
    memcpy(&serverAddress.sin_addr.s_addr, server->h_addr, server->h_length);

    // sending connection request
    if (connect(clientSocket, (struct sockaddr*)&serverAddress, sizeof(serverAddress)) < 0) {
        cerr << "Connection failed" << endl;
        close(clientSocket);
        return -1;
    }

    // buffer of input from user
    string userInput;

    while (true) {
        // buffer to recieve data into
        char RecieveingBuf[MAX_BUFFER];

        // get user input
        cout << "Enter message to send to the server (type 'exit' to quit): ";
        getline(cin, userInput);

        // check if the user wants to exit
        if (userInput == "exit") {
            cout << "Exiting client mode..." << endl;
            break;
        }

        // sending data to the server
        send(clientSocket, userInput.c_str(), userInput.length(), 0);

        cout << "Message from server to client: ";
        ssize_t bytes = recv(clientSocket, RecieveingBuf, sizeof(RecieveingBuf)-1, 0);
        if (bytes < 0 ){
            cerr << "Error in recieving from server" << endl;
            close(clientSocket);
            break;
        }
        cout << RecieveingBuf << endl;
    }

    // closing socket
    close(clientSocket);

    return 0;
}
