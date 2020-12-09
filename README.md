# Checksum
COMP122 Pre-assessment Program: Generating a checksum value.

```
check·sum | ˈCHekˌsəm |
noun
a digit representing the sum of the correct digits in a piece of stored or transmitted 
digital data, against which later comparisons can be made to detect errors in the data.
```


# Purpose
This program is being assigned to start you programming right away in COMP 122.  The program is also being used as an assessment instrument for the professor.  Via your solutions, the professor will be able to adjust the content the introductory material of the class a bit to review or to reinforce various topics covered in COMP110 (which is a prerequiste for this class). 


# Assignment
Write a Java program that computes a simple checksum.  This program is *based* upon the calculation of the checksum value of a IPv4 header, defined by RFC791. This program should conform to the following specification:

* Program name: checksum.java
* Reads 10 non-negative integers from standard input (stdin), with each integer value in the range of 0..2^8-1 (I.e., 0..255).
* Stores the sum of the integers read from stdin into a variable called "sum".
* Stores the 6th input integer into a variable called "checksum".
* Perform integer division on this sum using 2^8 as the divisor to yield both a quotient and a remainder with these values stored in the variables "quotient" and "remainder", respectively.
* Add the values of "quotient" and "remainder" together and store this value into the variable "sum".
* Subtract this new value of "sum" from 2^8-1 and store the result in a variable called "complement".
* Output the value of "checksum" and "complement" to standard output (System.out).
* If the value of "checksum" and "complement" are not the same, output the string "Error Detected!\n" to standard error (System.err).

# Starter code

```
class checksum  
{  

  final integer max_int = 255;  // The maximum size for the input
  integer count = 10;           // The number of integers to read from stdin
  integer sum = 0;              // Note that the "sum" might exceed max_int
  integer checksum;             // The value of the 6th input integer
  integer quotient;             // The result of evaluating the assignment:  quotient   = sum / (max_int + 1);
  integer remainder;            // The result of evaluating the assignment:  remainder  = sum % (max_int + 1 );
  integer complement;           // The result of evaluationg the assignment: complement = max_int - sum;

public static void main(String args[]) {

  ....
  
  System.out.printf("%d %d\n", checksum, complement);  
  if (checksum != complement ) {
     System.err.printf("Error Detected!");  
  }
  
}
```

# Testing:
Use the following to test your program.

```
$ cat 2345.txt | java checksum
2345
Error Detected!
```
```
$ cat 2345.txt | java checksum
2345
```

I presume that you have already compiled your program via the following command:
```
$ javac checksum.java
```


# Submission
1. The source code of your program


## Minimum validation checks
* Ensure that all input values are the correct range.  You may abort the program otherwise.

## Notes:
* The IPv4 header, without any options, has a total of 20 bytes. This program reduces the size in half to a 10 byte size.
* The IPv4 header utilizes a checksum field that is 16-bit quanity. This program reduces the size in half to a 1 byte size.
* This checksum value is stored in the 11th & 12th byte of the IPv4 header. This program assigns it location to the 6th byte.

# Enhancements
1. During the summation process, replace the 6th input integer with zero. You still need to place this 6th input integer into the variable "checksum".
1. Modify the program and your test cases to use 32-bit integers (i.e., input numbers can now be (I.e., 0..64k, or 0..65535)
1. Use the first input number to determine the number of integers to be read and store this value in the variable "count".  
  * The value of "count" is determined by the following java assignment `count = ((number >> 8) & 0x0F)*2;` where number is the first input number read.


