###Personal notes, scruff trials and similar on 
##Data structures and Algorithms

In my quest for knowledge and wisdom in the realm of web development and Ruby on Rails, I stumbled across the "Concise Notes on Data Structures and Algorithms - Ruby Edition" by Christopher Fox of James Madison University [link][website0].

It seemed to me like a fine read to deepen my knowledge fo data structures.  In some cases you can tell Christopher is more into some other languages (the use of calem case ILO snake case, the lack of real OOD as per [Sandi Metz bible][website1]), but this does not defeat the purpose of the notes. They are pretty awesomem and deserve some good time reading.

So I decided to dig into it and to actually go the extra step in implementing some of the data structures - obviously in TDD.

This repository is a bit of a work in progress - scrapbook of my trials, testng and - mostly- having fun doing it. All the data types are integrated as lists, even though in some cases maybe arrays could be better (depending on the big O notation - as smart people would say). All trials on algorithms are intead integrated using arrays.


###Dispensers
Containers that are not traversable (no access) are also called dispensers.

The basic public interfaces (to use a POODR definition) includes:
* empty?
* size
* clear

####First episode:the stack
Stack is a non traversable dispenser, which implement the basic container interface and, in addition, a few interesting methods.

* size
* push
* pop
* top
* empty?

As conditions:

* does not allow pop an empty stack


Just for the fun of it, I will toss in as well an accept initializing values (with a splat and implementing per POODR it took me literally 5 minutes to add).

####Queues
... or get in line for a free lunch. Another non traversable dispenser that allows insertion on one end only (back) and extraction on the other end only (front).

* size
* enter
* leaving
* front
* empty?

As conditions:

* does not allow leaving an emtpy queue

Note that the internal conditions are internal, therefore (per POODR convention) they are not reported in the testing - even though they are indirectly tested via the public functionality.


####Using stacks to solve recursion problems
An interesting truth hidden in the eye of the sun is the fact that recursion (= fuction that call themselves) can be implemented as stacks. I have made and attempt to this to solve an easy enough problen: the factorial.

Yes, I know that this can be easily solved via a normal recursion, but this is academic and didactic. Plus, it is fun.


###Collections
Containers that are traversable are also called collections.
On top of the standard messages that Dispensers can take,collection can take a few more basic interfaces:

* size?
* empty?
* iterator
* contains?()
* equal()

####Iteration

Iterations might be implemented in different ways. The first division is:

* **internal** when the collection controls the iteration over its own elements.
* **external** when the iteration is controller externally by the caller.

Also, the implementation of the iteration might be in different places in the code:

* In the **language** - in our case, in Ruby.
* In the **collection** - I guess this is the implementation that Sandy Metz would like the most - out of POODR.
* In a **iteration object**, that most likely is a mixing of iterating that can be added to the class. In Ruby, this is done with the <code>Enumerable</code> module

####Lists

An ordered collection.

It is a subset of Collection, which is a subset of Container. Therefore the messages that the ADT needs to implement are:

* size?
* insert_at
* delete_at
* value _at
* replace_value_at
* Index_of_element (the first occurrence)
* slice
* equality among lists.

Some tips on the implementation:

* it has a head method, that indicates if the list is empty.

####Binary Trees

A tree where each parent has two childs. These are usually used for heaps and heapsorts and to implement other collections - rather than as a collection in its own rights.

A binary tree can be traversed in different manners:

* Preorder traversing.
* In order traversing.
* Postorder traversing.

* size.
* height.
* empty?
* contains?
* root_value
* left_subtree
* right_subtree


###Sorting algorithms
**Bubble sorting**
Quick and dirty implementation of bubble sorting in TDD. Bubble makes multiple passes on the array and swaps elements if they are out of ourder. Being Big Oh of n2, is not that groovy though.

**Selection sorting**
Still O(n2), this time by saving in a variable on each pass the largest element. Small improvement.

**Insertion sorting**
Still in the O(n2), this is supposed to be the way people sort paper (interesting).

**shell sorting**
This seems like a very pretty but recoursive inseriton sorting, with starting value decreasing from size/9 by one third at the time.

**merge sort**
Divide and conquer style (*divide et impera*) Caesar style. Recursive implementation, splitting the array in half until it is a size 1. A size 1 is sorted by definition. Then combine in gradually bigger arrays, that you can traverse in one direction one time only. Proper stuff. O(nlog(n))

**quick sort**
We are talking real business now (apparenty professionals use this sort of sorting algorithm). 

*Choose a random point in the array, that will be the pivot. Does not need to be in the middle really, as it depends on the value that it has.
* From either ends you start scanning the array. As you find one value on the left that is greater than the pivot and one on the right that is smaller, you switch them. When one of the cursors reaches the pivot, you let it stay there. This is also called the partitioning function.
* Recursively call the partitioning function on either sides of the array.

It's a O(nlog(n)) grulli.

Found a snag on the impementation of this one, it comes up only every now and again - will need to tune it up. Stay tuned! (Now sorted, and also updated the TDD bench - YAY!!!).

**heap**
A heap is a binary tree where each parent is greater than its child. If the heap is modelled in an array, each parent can access its child by (2x+1) and (2x+2). Vide versa, each child can access its parent by (x+1)/2. 

Heapify an alrgorithm can be made with a linear algorithm by starting form the left (root) and swapping out with child if the child is greater.

**heapsort**
Heapsort takes a heap and, starting form the rightmost leaf,swaps it with the root - which is the biggest value so far in the heap. After the switch, the part on the left of the cursor needs to remain a heap. by recursively doing this, you obtain a sorted algorithm.

####Binary search structure
This is a similar technique to searching in the phone book. Take the middle element and see if that is what we are after. If it is not, repeat the operation with the sublist (array) that contains the reuqested value.

This could be implemented in an array, but a more convenient way to arrange this is in a binary tree. The desired structure would be to have the middle element as the root, and the first level as the middle of the subsections and so on and so forth.

If we traverse the tree inorder (one branch at the time), meaning that a serach in a binary tree organised in this way could take only O(ln n).

####Binary search tree
A binary tree where each element is greater than each element in the left subtree, but greater than the elements in the right subtree.

This is a data structure that allows fast search and fast insertion (usuallly, data types allow one or the other, but not both).

The add operation adds a node as a child in the appropriate place, without breaking the tree integrity.

####Set
An unordered collection in which an element may appear more than once.

A set inherits all operations from Containers and Collection. The issue is that it needs .contains?, .insert and .delete. Now, in an unordered structure the insert will be in constant time BUT the delete and check would be O(n), as we'd need to go through the full list.

On the other hand, in an ordered traversable structure, the membership checking can be done in constant time BUT insertion and deletions will be in linear time as the elements will need to be moved.

An ideal implementation for a Set is actually a Binary Search Tree, where all proposed operations will take O(log n). Best of all worlds. In this case this would be a *TreeSet*.


####Map (or Dictionary or Associative Array)
Is a set where elements are accessible via keys.

Again, implementing using linked lists or arrays would make some operations O(n), but a binary serach tree might be the best of both worlds (also as keys need to appear only once).

The trick is to create a class that stores key/value pairs (rather than only the value), defining the operations to interact with the keys to provide access.


[website0]: http://w3.cs.jmu.edu/spragunr/CS240/ConciseNotes.pdf
[website1]:http://andreahk5.github.io/blog/2014/03/26/poodr-notes-from-chapter-1/
