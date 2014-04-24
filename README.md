###Personal notes, scruff trials and similar on Data structures

In my quest for knowledge and wisdom in the realm of web development ad Ruby on Rails, I stumbled across the "Concise Notes on Data Structures and Algorithms - Ruby Edition" by Christopher Fox of James Madison University [link][website0].

It seemed to me like a fine read to deepen my knowledge fo data structures. In some cases you can tell Christopher is more into some other languages (the use of calem case ILO snake case, the lack of real OOD as per [Sandi Metz bible][website1]), but this does not defeat the purpose of the notes. They are pretty awesomem and deserve some good time reading.

So I decided to dig into it and to actually go the extra step in implementing some of the data structures - obviously in TDD.

This repository is a bit of a work in progress - scrapbook of my trials, testng and - mostly- having fun doing it. All the data types are integrated as lists, even though in some cases maybe arrays could be better (depending on the big O notation - as smart people would say).



AC

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

####Sorting
**Bubble sorting**
Quick and dirty implementation of bubble sorting in TDD. Bubble makes multiple passes on the array and swaps elements if they are out of ourder. Being Big Oh of n2, is not that groovy though.

**Selection sorting**
Still O(n2), this time by saving in a variable on each pass the largest element. Small improvement.

**Insertion sorting**
Still in the O(n2), this is supposed to be the way people sort paper (interesting).

**shell sorting**
This seems like a very pretty but recoursive inseriton sorting, with starting value decreasing from size/9 by one third at the time.






[website0]: http://w3.cs.jmu.edu/spragunr/CS240/ConciseNotes.pdf
[website1]:http://andreahk5.github.io/blog/2014/03/26/poodr-notes-from-chapter-1/
