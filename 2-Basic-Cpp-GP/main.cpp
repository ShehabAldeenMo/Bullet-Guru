#include <iostream>
#include <array>
#include <string>

// Define constant values for array size and initial values
constexpr int NumberOfOptions = 3;
constexpr int Max_Iter = 100;
constexpr int InitialValue = 0;
constexpr int NOT_OK = 1; // NOT_OK set to 1 for clearer distinction
constexpr int OK = 0;     // OK as 0 represents successful termination

// Enum for options to make the menu more readable and manageable
enum class Option {
    Add_Record = 1,
    Fetch_Record = 2,
    Quit = 3
};
Option DEFAULT_OPTION = Option::Quit; // Default option set to Quit for program exit

// Class to manage user records
class users {
    public:
        int NumOfUsers = InitialValue; // Tracks the current number of users

        // Structure for storing user information
        struct info {
            std::string name;
            int age;
        };

        // Array to store user records up to Max_Iter limit
        std::array<info, Max_Iter> UsersArr;

        // Function to add a user record, ensuring we don’t exceed Max_Iter
        void Fun_Add_Record(std::string & username, int Age) {
            if (NumOfUsers < Max_Iter) {  // Guard: Check if user array has space
                UsersArr[NumOfUsers].name = username;
                UsersArr[NumOfUsers].age = Age;
                NumOfUsers++; // Increment number of users
                std::cout << "\nUser record added successfully.\n";
            } else {
                std::cout << "Error: User limit reached.\n"; // Error if Max_Iter is reached
            }
        }

        // Function to fetch and display a user's record by ID
        void Fun_Fetch_Record(int ID) {
            if (ID < NumOfUsers) {  // Guard: Check if ID is within current user count
                std::cout << "User Name: " << UsersArr[ID].name << "\n";
                std::cout << "User Age: " << UsersArr[ID].age << "\n";
            } else {
                std::cout << "Error: Invalid user ID.\n";  // Error for invalid ID
            }
        }

        // Function to signal the end of the program
        void Fun_Fetch_Quit(void) {
            std::cout << "Exit code: 0 (Normal program termination)\n";
        }
};

// Class to display options to the user
class ShowOptions {
    public:
        // Function to show menu options
        void Fun_Show_Option(void) {
            std::cout << "Please select an option:\n";
            std::cout << "1: Add Record\n";
            std::cout << "2: Fetch Record\n";
            std::cout << "3: Quit\n\n";
            std::cout << "Enter option: ";
        }
};

// Operator overload to allow input of Option enum directly
std::istream & operator>>(std::istream & input, Option & result) {
    int int_option;
    input >> int_option;
    result = static_cast<Option>(int_option); // Convert integer input to Option enum
    return input;
}

int main() {
    ShowOptions ShowImage; // Object to display options
    Option opt = DEFAULT_OPTION; // Initial option set to default (Quit)
    users user;  // Object to manage user records
    bool Exit = NOT_OK; // Flag to control program exit loop (default to NOT_OK)

    // Loop to continue until Exit is set to OK
    while (Exit == NOT_OK) {
        ShowImage.Fun_Show_Option();  // Display menu options
        std::cin >> opt; // Get user's option choice

        // Switch statement for option handling
        switch (opt) {
            case Option::Add_Record: 
            {
                std::string username;
                int Age = InitialValue;

                std::cout << "Add user. Please enter user name and age:\n";
                std::cout << "Name: ";
                std::cin >> username;
                std::cout << "Age: ";
                std::cin >> Age;

                // Attempt to add the record and handle Max_Iter limit
                user.Fun_Add_Record(username, Age);
                break;
            }
            case Option::Fetch_Record: 
            {
                int ID = InitialValue;

                std::cout << "Please enter user ID\n";
                std::cout << "User ID: ";
                std::cin >> ID;

                // Attempt to fetch the user record by ID
                user.Fun_Fetch_Record(ID);
                break;
            }
            case Option::Quit:
            {
                // Quit the program, setting Exit flag to OK
                user.Fun_Fetch_Quit();
                Exit = OK;
                break; 
            }
            default:
            {
                std::cout << "Invalid option selected.\n"; // Error for invalid option
                break;
            }
        }

        // Additional Guard: Ensure the program exits if user limit is exceeded
        if (user.NumOfUsers >= Max_Iter) {
            std::cout << "Reached maximum user capacity. Exiting program.\n";
            Exit = OK;
        }
    }

    return 0;
}
