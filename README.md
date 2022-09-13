# Checksum
### COMP122 Pre-assessment Program: Generating a checksum value.

```
check·sum | ˈCHekˌsəm |
noun
a digit representing the sum of the correct digits in a piece of stored or transmitted 
digital data, against which later comparisons can be made to detect errors in the data.
```


# Purpose:
This program is being assigned to start you programming right away in COMP 122. The program is also being used as an assessment instrument for the professor.  Via your solutions, the professor will be able to adjust the content the introductory material of the class a bit to review or to reinforce various topics covered in COMP110 (which is a prerequisite for this class). 

This assignment is also an exercise in the development process using ``git``.  You must following the defined development process to *tag* various points in time.  
   * ``git tag <label>``: used to tag the current commit point
   * ``git tag -d <label>``: used to delete a tag
   * ``git tag -f <label>``: used to move a tag to the current commit point

# Assignment:
Write a Java program that computes a simple checksum of 8-bit integers.  This program is *based* upon the calculation of the checksum value of a IPv4 header, defined by RFC791. 

You may use any editor or IDE (for example eclispe) to develop the program.  You must, however, test your program via the commandline.  To do this final testing step, you might have to install a current version of java onto your computer.  (https://www.java.com/en/download/)

This program should conform to the following specification:

  * Program name: checksum.java
  * Reads 10 non-negative integers from standard input (stdin), with each integer value in the range of 0..2^8-1 (I.e., 0..255). 
  * Stores the sum of the integers read from stdin into a variable called "sum".
  * Stores the 6th input integer into a variable called "checksum", and resets this input value to zero (0).
  * Performs integer division on this sum using 256 (2^8) as the divisor to yield both a quotient and a remainder. These values are then stored in the variables "quotient" and "remainder", respectively.
  * Adds the values of "quotient" and "remainder" together, and stores this value into the variable "sum".
  * Subtracts this new value of "sum" from 255 (2^8-1), and stores the result in a variable called "complement".
  * Outputs the value of "checksum" and "complement" to standard output (System.out).
  * If the value of "checksum" and "complement" are not the same, outputs the string "Error Detected!" to standard error (stderr).


### Minimum Validation Checks:
* Ensure that all input values are the correct range.  You may abort the program otherwise.


### Starter Code:

```
import java.util.Scanner;

class checksum  
{  

  public static void main(String args[]) {

    final int max_int = 255;  // The maximum size for the input
    int count = 10;           // The number of integers to read from stdin
    int value = 0;            // The value just read from stdin:  value = stdin.nextInt();
    int sum = 0;              // Note that the "sum" might exceed max_int
    int checksum = 0;         // The value of the 6th input integer
    int quotient;             // The result of evaluating the assignment: quotient   = sum / (max_int + 1);
    int remainder;            // The result of evaluating the assignment: remainder  = sum % (max_int + 1 );
    int complement;           // The result of evaluating the assignment: complement = max_int - sum;

    Scanner stdin = new Scanner(System.in);
    
    value = stdin.nextInt();
```

```
   System.out.printf("Stored Checksum: %d, Computed Checksum: %d\n", checksum, complement);
   if (checksum != complement ) {
     System.err.printf("Error Detected!\n");  
   }
   return; 
 }
 
}  // End of Class: Checksum
```

### Development Steps:
 1. Accept and clone the assignment
 2. Create an empty file called checksum.java, and then commit and tag
    - ``git add checksum.java``
    - ``git commit -m 'beginning the project'`` 
    - ``git tag begin``
 4. Incorporate the starter code, and then commit and tag.
    - ``git add checksum.java`` 
    - ``git commit -m 'added starter code'``
    - ``git tag initialized``
 5. Introduce a loop that calculates the sum of 10 integers, and then commit and tag.
    - ``git add checksum.java``
    - ``git commit -m 'added loop'``
    - ``git tag sum``
 6. Introduce a conditional to handle the sixth input value, and then commit and tag.
    - ``git add checksum.java``
    - ``git commit -m 'handled the 6th element'``
    - ``git tag sixth``
 7. Compute the values of quotient, remainder, and then commit and tag.
    - ``git add checksum.java``
    - ``git commit -m 'quotient & remainder done'``
    - ``git tag quotient``
 8. Recompute the value of sum, and then commit and tag.
    - ``git add checksum.java``
    - ``git commit -m 'recomputed sum'`` 
    - ``git tag sum``
 9. Compute the final value of complement, and then commit and tag.
    - ``git add checksum.java``
    - ``git commit -m 'calculated complement'``
    - ``git tag complement``
 10. Perform a final push with tags included
    - ``git push --tags``


    
### Testing:
Via the command line, test your program with the provided test cases.

```
$ java checksum < 156.txt
Stored Checksum: 156, Computed Checksum: 156
```

```
$ java checksum < 229_error.txt
Stored Checksum: 229, Computed Checksum: 132
Error Detected!
```

```
$ java checksum < 81.txt
Stored Checksum: 81, Computed Checksum: 81
```


#### Git Commands to remember
1. ``git clone``: to create a local repository (and working directory) of your remote repository
2. ``git pull``: a command to perform a *fetch* and *merge* in one step 
   - ``git fetch``: to copy all new information from the remote repository into the local repository
   - ``git merge``: to merge all new information from the local repository into the working directory
4. ``git add``: to add a file to the staging area 
5. ``git commit``: to place all stage files into the local repository
6. ``git push``: to copy all new information from the local repository into the remote repository
7. ``git status``: to obtain a recap of your current working directory, staging, and branch information
8. ``git tag``: to associate a name with your current "commit" location.



# Other Information and Resources:
This program is based upon the structure if a IPv4 packet.  Although you do not need to understand this structure to complete this assignment, you may want to review some of the material associated with IPv4.  More information will be provided in the lecture.
* https://en.wikipedia.org/wiki/IPv4
* https://en.wikipedia.org/wiki/IPv4_header_checksum

### Notes:
* The IPv4 header utilizes a checksum field that is 16-bit quantity. This program reduces the size in half to a 8-bit quantity.  Correspondingly, the following changes are made to keep things consistent: 
* The IPv4 header, without any options, has a total size of 20 bytes. This program reduces the size in half to a 10 byte size.
* This checksum value is stored in the 11th & 12th byte of the IPv4 header. This program assigns its location to the 6th byte.


