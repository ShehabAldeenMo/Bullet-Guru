# TASKS
## Task1 (use case)
### Description 
    It's an use case on using core dump file and showing it. Before we begin in this task, We will define what is it?
    We will dicuss some questions and answers on them. <br />
### Questions
    + What is the signal ?
    It uses to kill some process or send notification to another process _Not Preferred to use in interacting between processes_ .<br />
    
    + What are the types of signals ?
    Two types are: Core - Term - Stop - Continue ... etc. You can know the most of this signals types from url "https://man7.org/linux/man-pages/man7/signal.7.html".
    The most common types are core and term and they are used to kill some process but with different scenario.
    Core:- make two steps 
    1) Out core dump file which is a snapshot of process's state before termination.
    2) Terminate this process.
    Term:- Terminate this process only. <br />
    
    + What are the types of termination ?
    1) Direct Termination.   2) Handler Excutation then terminate.<br />

    + What are the core-dump file ?
    They help developers understand why a program crashed by providing a snapshot of the process's state at the time of the crash. contains the memory contents of the process (stack, heap, and data segments), register states, and other information that reflects the state of the process at the time of the crash. <br />

### Codes and Commands
    generate **process.o** from **main.cpp** . This progam used to make " Hello from process " in while(1) loop.<br />

    $ sudo sysctl -w kernel.core_pattern=core.%e.%p.%t
    $ ulimit -c unlimited   
    $ process
<br />

    **Terminal 1 **                                             
    $ process                                                    
![Screenshot from 2024-07-16 15-38-02](https://github.com/user-attachments/assets/0bd868ac-2024-4632-8368-4334127adbe7)

    **Terminal 2**
    $ top
    ![Screenshot from 2024-07-16 15-38-58](https://github.com/user-attachments/assets/85b4a68f-e82a-4379-8af6-5932633ced0c)

    > [!NOTE]
    > We can monitor the process named "Process" from top command and check our CPU load.

    **Terminal 2**
    $ q
    $ kill -ABRT **6082**
    ![Screenshot from 2024-07-16 15-43-34](https://github.com/user-attachments/assets/23bf1327-f7b2-45f2-93b9-98f7cb6f1594)

    **Terminal 1 ** 
    ![Screenshot from 2024-07-16 15-44-12](https://github.com/user-attachments/assets/d1638dc7-5f19-46fd-ab08-5bc0dd088e03)

    $ ls
    $ gdb ./process core.process.8337.1721137316
![Screenshot from 2024-07-16 16-49-37](https://github.com/user-attachments/assets/6f0b73cb-f87c-4668-bd63-423367b1b352)




    
