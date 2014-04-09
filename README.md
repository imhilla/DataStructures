###Personal notes, scruff trials and similar on Data structures

In my quest for knowledge and wisdom in the realm of web development ad Ruby on Rails, I stumbled across the "Concise Notes on Data Structures and Algorithms - Ruby Edition" by Christopher Fox of James Madison University [link][website0].

It seemed to me like a fine read to deepen my knowledge fo data structures. In some cases you can tell Christopher is more into some other languages (the use of calem case ILO snake case, the lack of real OOD as per [Sandi Metz bible][website1]), but this does not defeat the purpose of the notes. They are pretty awesomem and deserve some good time reading.

So I decided to dig into it and to actually go the extra step in implementing some of the data structures - obviously in TDD.

This repository is a bit of a work in progress - scrapbook of my trials, testng and - mostly- having fun doing it. All the data types are integrated as lists, even though in some cases maybe arrays could be better (depending on the big O notation - as smart people woudl say).



AC

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


[website0]: http://w3.cs.jmu.edu/spragunr/CS240/ConciseNotes.pdf
[website1]:http://andreahk5.github.io/blog/2014/03/26/poodr-notes-from-chapter-1/
