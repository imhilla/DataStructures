#chapter 1 Review Questions
#### 1. What would be the carrier set and some operations of the Character ADT?

**carrier set**: "All letters from A to Z, plus basic symbols". basically, the ASCII character set.

**some operations**: addition (to form words), deletion (to remove a character mistyped), upcasing, downcasing.

####2. How might the Bit String ADT carrier set be represented on a computer in some high level language?

Set of spaces (we'd need to identify up to which length), that can be set as 0 or 1.

####3. How might the concatenation operation of the Bit String ADT be realized using the carrier set representation you devised for question two above?

we'd need to define a new Bit String (longer) that woudl contain a potentially longer string.

1. Define the lenght of both strings, finding the last non 0 term on the right hand side. If needed, create a longer Bit String.
2. Find the last non zero term for the first string
3. Find the last non zero term for the second string
4. Add the two
5. shovel the result into a new Bit String and return.

####4. What do your answers to questions two and three above have to do with data structures and algorithms?

Response number 2 will influence the amount of memory that I need allocated for a Bit String. Response number 3 will require the same, and will also require some computational power in order to do the logic.
###Exercises
####1.
Describe the carrier sets and some operations for the following ADTs:**(a) The Real numbers***Carrier set*: all numbers that are integersm fractions, irrational numbers and trascendental numbers.*Math*: addition, subtraction, power, log, 
**(b) The Rational numbers***Carrier set*: any number that can be expressed as a fraction of two integers.*Math*: add, subtract, division, multiplication, power, inversion**(c) The Complex numbers**
*Carrier set*: any number expressed as a+ib, there i is the irrational sqrt(-1).
*Math*: as before, plus the whole set of invertin around the i axis.**(d) Ordered pairs of Integers***Carrier set*: any pair K,T where K is an interger and t is an integer.
*Math*: sum of elements, total sum, turn into matrix, vectorial product, scalar product**(e) Sets of Characters**
*carrier set* character ASCII in an array of finite length *math* addition, subtraction, concatnation, superimosion
**(f) Grades (the letters A, B, C, D, and F)**
*carrier set* characters A to F *math* average.

####2.
For each of the ADTs in exercise one, either indicate how the ADT is realized in some programming language, or describe how the values in the carrier set might be realized using the facilities of some programming language, and sketch how the operations of the ADT might be implemented.

*Real numbers implementation*4 byte character in the computer memory.The operations are pretty basics and hopefully can be done in basic code.
For irrational numbers you'd need to cap the rounding to a finite number.

#Chapter 2 - review questions
####What is the difference between a simple and a structured type?
The difference is in the components of the carrier set. IN the simple type the elements of the carrier set cannot be further broken down. IN the structured, they can be broken down.
####What is a pure object-oriented language?
Is a language where all data types are instances of class, and all data types are objects.

####Name two ways that Symbol instances differ from String instances in Ruby.
A symbol is not mutable, as it is written into the symbol table.
In order to do some operations, symbols need to be converted into a string.

####Is String a simple or structured type in Ruby? Explain.
A string is a simple data type as there is not character type.

####List the carrier set of Range of {1, 2, 3}. In this type, what values are 1.. 1, 2.. 1, and 1... 3? What is max(1... 3)?
carrier set is 1,2,3

#Chapter 3 - arrays
####If an array holds integers, each of which is four bytes long, how many bytes from the base location of the array is the location of the fifth element?
20 bytes


(a) a = Array.new(5, 0)
[0,0,0,0,0]
(b) a[1..2] = []
[0,0,0]
(c) a[10] = 10
[0,0,0,nil,nil,nil,nil,nil,nil,nil,10]
(d) a[3, 7] = [1, 2, 3, 4, 5, 6, 7]
[0,0,0,1,2,3,4,5,6,7,10]
(e) a[0, 2] = 5
[5,0, 1,2,3,4,5,6,7,10]
(f) a[0, 2] = 6, 7
[6,7,1,2,3,4,5,6,7,10]
(g) a[0..-2] = (1..3).to_a
[1,2,3,10]


