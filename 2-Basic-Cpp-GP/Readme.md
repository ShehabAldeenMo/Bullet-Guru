# 📝 User Record Management System

A simple **User Record Management System** implemented in C++ that allows you to:
- ➕ Add a new user record.
- 🔍 Fetch a user's record by ID.
- ❌ Quit the program.

This program manages a list of user records with a maximum capacity of 100 entries, providing an interactive menu for users to add, view, and quit. Each user record contains a **name** and **age**.

---

## 🚀 Features

1. **Add Record** ➕  
   - Enter a user’s name and age to save a new record.
   - Automatically increments the user count.

2. **Fetch Record** 🔍  
   - Retrieve and display a user’s information based on their unique ID.

3. **Quit Program** ❌  
   - Exit the application safely with a success message.

4. **Guard Conditions** 🛡️  
   - Prevents adding more users once the maximum capacity is reached.
   - Ensures that an invalid user ID or menu option is handled gracefully.

---

## 🛠️ Code Structure

- **Main Classes**:
  - **`users`**: Manages the user list, including adding and fetching records.
  - **`ShowOptions`**: Displays available options to the user.

- **Key Variables**:
  - `NumOfUsers`: Tracks the current number of users.
  - `UsersArr`: Stores user records in a fixed-size array.

- **Enums**:
  - `Option`: Provides a clear structure for available options.

---

## ⚙️ Usage Instructions

1. **Clone the repository**:
    ```bash
    git clone <repository_url>
    ```
2. **Navigate to the directory**:
    ```bash
    cd <repository_directory>
    ```
3. **Compile the code**:
    ```bash
    g++ -o UserManagement main.cpp
    ```
4. **Run the program**:
    ```bash
    ./UserManagement
    ```

---

## 🖥️ Program Interaction

Upon running the program, follow the prompts to add or fetch records, or exit the program.  
Below is a sample interaction:

```output
Please select an option:
1: Add Record
2: Fetch Record
3: Quit

Enter option: 1
Add user. Please enter user name and age:
Name: shehab
Age: 22

User record added successfully.
Please select an option:
1: Add Record
2: Fetch Record
3: Quit

Enter option: 1
Add user. Please enter user name and age:
Name: Amr
Age: 7

User record added successfully.
Please select an option:
1: Add Record
2: Fetch Record
3: Quit

Enter option: 1
Add user. Please enter user name and age:
Name: youssef
Age: 10

User record added successfully.
Please select an option:
1: Add Record
2: Fetch Record
3: Quit

Enter option: 2
Please enter user ID
User ID: 0
User Name: shehab
User Age: 22
Please select an option:
1: Add Record
2: Fetch Record
3: Quit

Enter option: 3
Exit code: 0 (Normal program termination)
```


