# Sleeping-TA-Problem
This project deals with solving the Sleeping Teaching Assistant problem using thread synchronization. The implementation involves defining approaches to be taken for different scenarios as to how a Teaching Assistant (TA) and students interact with each other. The solution will be implemented using POSIX threads, mutex-locks, and semaphores for the different scenarios.

The previously mentioned problems are solved by the team using POSIX threads, semaphores and a FIFO queue in order to describe the behaviors of the TA and the students. Both the TA and students will have their own semaphores and separate pthreads.
By using a mutex-lock the situation of a deadlock can be avoided as either the TA or the student will have exclusive rights to change their state and this can be accomplished by only one person at a given instance. By using a First-In First-Out queue, starvation can be avoided as we know every student will be served according to the time they arrive at the TA’s office. Therefore, no student will be able to skip the line.
The team approaches the Teaching Assistant Problem by solving 4 different scenarios. The initial conditions are given below.
The team uses 3 semaphores out of which one is a mutex-lock along with a variable.
1. sem_t sem_stu - Student
2. sem_t sem_ta - TA
3. pthread_mutex_t mutex – Access Seats
4. int count – Variable for number of waiting students
Initially, the semaphores and the variable are given the following initial values.
1. Student = 0
2. TA = 0
3. Access Seats = 1
4. Waiting students = 0

We take a look at four possible scenarios:
 Scenario One:
There will be zero students coming to visit the TA and the TA will check the hallway outside his office to see if there are any students seated and waiting for him. If there are none, the TA will sleep in his office.
 Scenario Two:
When a student arrives at the TA’s office and finds the TA sleeping. Then the student will awaken the TA and ask for help. When the TA assists the student, the student's semaphore changes from 0 to 1 and waits for the TA's semaphore. When the TA finishes helping one student, he will check if there is any other student waiting in the hallway. If yes, he will help the next student and if not, TA goes back to sleeping and TA's semaphore becomes 1 and awaits student's semaphore.
 Scenario Three:
When a student arrives while the TA is busy with another student. Then the student who arrived will have to check if the TA is busy. If the TA is busy, the student will have to wait seated outside in the hallway until the TA is done with his session. When the TA completes his session, the student seated outside will be called in by the TA for a review session. Once all students have finished their sessions and left the TA’s office, the TA will go back to sleep after making sure no students are waiting.
 Scenario Four:
When a student arrives while the TA is busy in a review session, and all the seats in the hallway are occupied. Then, student will have to leave the hallway and come back later. When the student comes back, eventually, and there is a seat available, he will take a seat and wait for his turn with the TA.

