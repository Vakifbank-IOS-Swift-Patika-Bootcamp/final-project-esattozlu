# CleanCode

## Chapter 1: Clean Code
### There Will Be Code
Code is really the language in which we ultimately express the requirements. We may create languages that are closer to the requirements. We may create tools that help us parse and assemble those requirements into formal structures. But we will never eliminate necessary precision—so there will always be code.

### Bad Code
Bad code slows things down and drags the project into a dead end.

### The Total Cost of Owning a Mess
Every addition or modification to the system requires that the tangles, twists, and knots be “understood” so that more tangles, twists, and knots can be added. Over time the mess becomes so big and so deep and so tall, they can not clean it up. As the mess builds, the productivity of the team continues to decrease, asymptotically approaching zero. 

### We Are Authors
Authors must be able to communicate and understand with their readers. As programmers, we are also authors.
The next time you write a line of code, remember you are an author, writing for readers who will judge your effort.

### The Boy Scout Rule
"Leave the campground cleaner than you found it." Like the rule of scout, we must keep our code clean.
If we all checked in our code a little cleaner than when we checked it out, the code simply could not rot.

## Chapter 2: Meaningful Names
### Use Intention-Revealing Names
Choosing good names takes time but saves more than it takes.
The name of a variable, function, or class, should answer all the big questions. It should tell you why it exists, what it does, and how it is used. If a name requires a comment, then the name does not reveal its intent.

### Avoid Disinformation
Programmers must avoid leaving false clues that obscure the meaning of code. We should avoid words whose entrenched meanings vary from our intended meaning. 

### Make Meaningful Distinctions 
When naming, make sure their functions are well defined, and be mindful of differences in the naming of things that do similar functions.

### Use Pronounceable Names
Programming is a social activity. That's why you should use pronounceable names not abbreviations.

### Use Searchable Names
Searching in code is part of coding. So make it searchable naming.

### Avoid Encodings
Encoded names are seldom pronounceable and are easy to mis-type. Don't use avoid encodings.

### Avoid Mental Mapping
Certainly a loop counter may be named i or j or k (though never l!) if its scope is very small and no other names can conflict with it. Readers shouldn’t have to mentally translate your names into other names they already know. 
 
### Class Names
Classes and objects should have noun or noun phrase names like Customer, WikiPage, Account, and AddressParser. Avoid words like Manager, Processor, Data, or Info in the name of a class. A class name should not be a verb.

### Method Names
Methods should have verb or verb phrase names like postPayment, deletePage, or save. Accessors, mutators, and predicates should be named for their value and prefixed with get, set, and is according to the javabean standard.

### Don’t Be Cute
Choose clarity over entertainment value.
Cuteness in code often appears in the form of colloquialisms or slang. For example, don’t use the name whack() to mean kill().

### Pick One Word per Concept
A consistent lexicon is a great boon to the programmers who must use your code.
Pick one word for one abstract concept and stick with it.

### Don’t Pun
Avoid using the same word for two purposes.

### Use Solution Domain Names
Remember that the people who read your code will be programmers. So go ahead and use computer science (CS) terms, algorithm names, pattern names, math terms, and so forth. 

### Use Problem Domain Names
Use the name from the problem domain. At least the programmer who maintains your code can ask a domain expert what it means.

### Don’t Add Gratuitous Context
Shorter names are generally better than longer ones, so long as they are clear. Add no more context to a name than is necessary.

## Chapter 3: Functions
### Small!
The first rule of functions is that they should be small. The second rule of functions is that they should be smaller than that.

### Do One Thing
Functions should do one thing. They should do it well. They should do it only.

### One Level of Abstraction per Function
In order to make sure our functions are doing “one thing,” we need to make sure that the statements within our function are all at the same level of abstraction. 

### Switch Statements
Unfortunately we can’t always avoid switch statements, but we can make sure that each switch statement is buried in a low-level class and is never repeated.

### Use Descriptive Names
Don’t be afraid to make a name long. A long descriptive name is better than a short enigmatic name. A long descriptive name is better than a long descriptive comment. Use a naming convention that allows multiple words to be easily read in the function names, and then make use of those multiple words to give the function a name that says what it does.

### Function Arguments
The ideal number of arguments for a function is zero. Next comes one, followed closely by two. Three arguments should be avoided where possible. More than three requires very special justification—and then shouldn’t be used anyway.

### Have No Side Effects
Side effects are lies. Your function promises to do one thing, but it also does other hidden things. Sometimes it will make them to the parameters passed into the function or to system globals. In either case they are devious and damaging mistruths that often result in strange temporal couplings and order dependencies.

### Command Query Separation
Functions should either do something or answer something, but not both. Either your function should change the state of an object, or it should return some information about that object. Doing both often leads to confusion.

### Prefer Exceptions to Returning Error Codes
Returning error codes from command functions is a subtle violation of command query separation. It promotes commands being used as expressions in the predicates of if statements.

### Don’t Repeat Yourself 
Duplication may be the root of all evil in software. The duplication is a problem because it bloats the code and will require four-fold modification should the algorithm ever have to change.

### Structured Programming
Every function, and every block within a function, should have one entry and one exit. This rule means that there should only be one return statement in a function, no break or continue statements in a loop, and never, ever, any goto statements.

### How Do You Write Functions Like This?
Massage and refine that code, split out functions, change names, eliminate duplication. Shrink the methods and reorder them. Sometimes break out whole classes, all the while keeping the tests passing.

## Chapter 4: Comments
### Comments Do Not Make Up for Bad Code
Clear and expressive code with few comments is far superior to cluttered and complex code with lots of comments. Rather than spend your time writing the comments that explain the mess you’ve made, spend it cleaning that mess.

### Explain Yourself in Code
There are certainly times when code makes a poor vehicle for explanation. Unfortunately, many programmers have taken this to mean that code is seldom, if ever, a good means for explanation. This is patently false.

### Good Comments
#### Legal Comments
Sometimes our corporate coding standards force us to write certain comments for legal reasons.

#### Informative Comments
It is useful to provide basic information with a comment.

#### Explanation of Intent
Sometimes a comment goes beyond just useful information about the implementation and provides the intent behind a decision.

#### Clarification
Sometimes it is just helpful to translate the meaning of some obscure argument or return value into something that’s readable. Take care that there is no better way, and then take even more care that they are accurate.

#### Warning of Consequences
Sometimes it is useful to warn other programmers about certain consequences. It will prevent some overly eager programmer from using a static initializer in the name of efficiency.

#### TODO Comments
It is sometimes reasonable to leave “To do” notes in the form of //TODO comments.

### Bad Comments
#### Mumbling
Plopping in a comment just because you feel you should or because the process requires it, is a hack. If you decide to write a comment, then spend the time necessary to make sure it is the best comment you can write.

#### Redundant Comments
It’s not more informative than the code. It does not justify the code, or provide intent or rationale. It is not easier to read than the code. Indeed, it is less precise than the code and entices the reader to accept that lack of precision in lieu of true understanding.

#### Misleading Comments
Sometimes, with all the best intentions, a programmer makes a statement in his comments that isn’t precise enough to be accurate. Poor programmer that read misleading comments would find himself in a debugging session trying to figure out why his code executed so slowly.

#### Mandated Comments
It is just plain silly to have a rule that says that every function must have a javadoc, or every variable must have a comment. 


## Chapter 5: Formatting
### The Purpose of Formatting
Code formatting is about communication, and communication is the professional developer’s first order of business. The coding style and readability set precedents that continue to affect maintainability and extensibility long after the original code has been changed beyond recognition.

### Vertical Formatting
#### The Newspaper Metaphor
We would like a source file to be like a newspaper article. The name should be simple but explanatory. The name, by itself, should be sufficient to tell us whether we are in the right module or not. The topmost parts of the source file should provide the high-level concepts and algorithms.

#### Vertical Openness Between Concepts
Nearly all code is read left to right and top to bottom. Each line represents an expression or a clause, and each group of lines represents a complete thought. Those thoughts should be separated from each other with blank lines.

#### Vertical Density
Lines of code that are tightly related should appear vertically dense. 

#### Vertical Distance
Closely related concepts should not be separated into different files unless you have a very good reason. We want to avoid forcing our readers to hop around through our source files and classes.
- Variables should be declared as close to their usage as possible.
- Instance variables, on the other hand, should be declared at the top of the class.
- If one function calls another, they should be vertically close, and the caller should be above the callee, if at all possible.
- Certain bits of code want to be near other bits. They have a certain conceptual affinity. The stronger that affinity, the less vertical distance there should be between them.

#### Vertical Ordering
In general we want function call dependencies to point in the downward direction. That is, a function that is called should be below a function that does the calling. This creates a nice flow down the source code module from high level to low level.

### Horizontal Formatting
#### Horizontal Openness and Density
We use horizontal white space to associate things that are strongly related and disassociate things that are more weakly related.
Don't put spaces between the function names and the opening parenthesis. This is because the function and its arguments are closely related. Separating them makes them appear disjoined instead of conjoined. Separate arguments within the function call parenthesis to accentuate the comma and show that the arguments are separate.

#### Indentation
To make hierarchy of scopes visible, we indent the lines of source code in proportion to their position in the hiearchy. Programmers visually line up lines on the left to see what scope they appear in. This allows them to quickly hop over scopes, such as implementations of if or while statements, that are not relevant to their current situation. Your eye can rapidly discern the structure of the indented file.

### Team Rules
A team of developers should agree upon a single formatting style, and then every member of that team should use that style. We want the software to have a consistent style. We don’t want it to appear to have been written by a bunch of disagreeing individuals.

## Chapter 6: Objects and Data Structures
### Data Abstraction
Hiding implementation is not just a matter of putting a layer of functions between the variables. Hiding implementation is about abstractions! A class does not simply push its variables out through getters and setters. Rather it exposes abstract interfaces that allow its users to manipulate the essence of the data, without having to know its implementation.

### Data/Object Anti-Symmetry
In any complex system there are going to be times when we want to add new data types rather than new functions. For these cases objects and OO are most appropriate. On the other hand, there will also be times when we’ll want to add new functions as opposed to data types. In that case procedural code and data structures will be more appropriate.

### The Law of Demeter
The method should not invoke methods on objects that are returned by any of the allowed functions. In other words, talk to friends, not to strangers.
The Law of Demeter says that a method f of a class C should only call the methods of these:
- C
- An object created by f
- An object passed as an argument to f
- An object held in an instance variable of C

### Data Transfer Objects
The quintessential form of a data structure is a class with public variables and no functions. This is sometimes called a data transfer object, or DTO. DTOs are very useful structures, especially when communicating with databases or parsing messages from sockets, and so on. They often become the first in a series of translation stages that convert raw data in a database into objects in the application code.

## Chapter 7: Error Handling
### Use Exceptions Rather Than Return Codes
The caller must check for errors immediately after the call. Unfortunately, it’s easy to forget. For this reason it is better to throw an exception when you encounter an error.

### Write Your Try-Catch-Finally Statement First
In a way, try blocks are like transactions. Your catch has to leave your program in a consistent state, no matter what happens in the try. For this reason it is good practice to start with a try-catch-finally statement when you are writing code that could throw exceptions. This helps you define what the user of that code should expect, no matter what goes wrong with the code that is executed in the try.

### Use Unchecked Exceptions
Checked exceptions can sometimes be useful if you are writing a critical library: You must catch them. But in general application development the dependency costs outweigh the benefits.

### Provide Context with Exceptions
Create informative error messages and pass them along with your exceptions. Mention the operation that failed and the type of failure. If you are logging in your application, pass along enough information to be able to log the error in your catch.

### Define Exception Classes in Terms of a Caller’s Needs
Often a single exception class is fine for a particular area of code. The information sent with the exception can distinguish the errors. Use different classes only if there are times when you want to catch one exception and allow the other one to pass through.

### Define the Normal Flow
You wrap external APIs so that you can throw your own exceptions, and you define a handler above your code so that you can deal with any aborted computation. Most of the time this is a great approach, but there are some times when you may not want to abort.

### Don’t Return Null
If you are tempted to return null from a method, consider throwing an exception or returning a SPECIAL CASE object instead. If you are calling a null-returning method from a third-party API, consider wrapping that method with a method that either throws an exception or returns a special case object.

### Don’t Pass Null
Returning null from methods is bad, but passing null into methods is worse. Unless you are working with an API which expects you to pass null, you should avoid passing null in your code whenever possible.

## Chapter 8: Boundaries
### Using Third-Party Code
If you use a boundary interface like Map, keep it inside the class, or close family of classes, where it is used. Avoid returning it from, or accepting it as an argument to, public APIs.

### Exploring and Learning Boundaries
It’s not our job to test the third-party code, but it may be in our best interest to write tests for the third-party code we use.

### Learning Tests Are Better Than Free
Whether you need the learning provided by the learning tests or not, a clean boundary should be supported by a set of outbound tests that exercise the interface the same way the production code does. Without these boundary tests to ease the migration, we might be tempted to stay with the old version longer than we should.

### Clean Boundaries
Code at the boundaries needs clear separation and tests that define expectations. We should avoid letting too much of our code know about the third-party particulars. It’s better to depend on something you control than on something you don’t control, lest it end up controlling you.

## Chapter 9: Unit Tests
### The Three Laws of TDD
- First Law You may not write production code until you have written a failing unit test.
- Second Law You may not write more of a unit test than is sufficient to fail, and not compiling is failing.
- Third Law You may not write more production code than is sufficient to pass the currently failing test.

### Keeping Tests Clean
Having dirty tests is equivalent to, if not worse than, having no tests. The problem is that tests must change as the production code evolves. The dirtier the tests, the harder they are to change.
Test code is just as important as production code. It is not a second-class citizen. It requires thought, design, and care. It must be kept as clean as production code.

### Clean Tests
If your tests are dirty, then your ability to change your code is hampered, and you begin to lose the ability to improve the structure of that code. The dirtier your tests, the dirtier your code becomes. Eventually you lose the tests, and your code rots.
- Readability is perhaps even more important in unit tests than it is in production code.

### One Assert per Test
The number of asserts in a test ought to be minimized.

### F.I.R.S.T.
Clean tests follow five other rules that form the above acronym:
- Fast
- Independent
- Repeatable
- Self-Validating
- Timely

## Chapter 10: Classes
### Class Organization
If a test in the same package needs to call a function or access a variable, we’ll make it protected or package scope. However, we’ll first look for a way to maintain privacy. Loosening encapsulation is always a last resort.

### Classes Should Be Small!
- The first rule of classes is that they should be small. The second rule of classes is that they should be smaller than that.
- The Single Responsibility Principle states that a class or module should have one, and only one, reason to change. 
- Classes should have a small number of instance variables. Each of the methods of a class should manipulate one or more of those variables.
### Organizing for Change
We want to structure our systems so that we muck with as little as possible when we update them with new or changed features. In an ideal system, we incorporate new features by extending the system, not by making modifications to existing code.

## Chapter 11: Systems
### How Would You Build a City?
- Clean code helps us achieve this at the lower levels of abstraction.

### Separate Constructing a System from Using It
- If we are diligent about building well-formed and robust systems, we should never let little, convenient idioms lead to modularity breakdown.
- One way to separate construction from use is simply to move all aspects of construction to main, or modules called by main, and to design the rest of the system assuming that all objects have been constructed and wired up appropriately.
- A powerful mechanism for separating construction from use is Dependency Injection (DI), the application of Inversion of Control (IoC) to dependency management. Inversion of Control moves secondary responsibilities from an object to other objects that are dedicated to the purpose, thereby supporting the Single Responsibility Principle.

### Test Drive the System Architecture
An optimal system architecture consists of modularized domains of concern, each of which is implemented with Plain Old Java (or other) Objects. The different domains are integrated together with minimally invasive Aspects or Aspect-like tools. This architecture can be test-driven, just like the code.

### Optimize Decision Making
The agility provided by a POJO system with modularized concerns allows us to make optimal, just-in-time decisions, based on the most recent knowledge. The complexity of these decisions is also reduced.

### Use Standards Wisely, When They Add Demonstrable Value
Standards make it easier to reuse ideas and components, recruit people with relevant experience, encapsulate good ideas, and wire components together. However, the process of creating standards can sometimes take too long for industry to wait, and some standards lose touch with the real needs of the adopters they are intended to serve.

### Systems Need Domain-Specific Languages
Domain-Specific Languages allow all levels of abstraction and all domains in the application to be expressed as POJOs, from high-level policy to low-level details.

## Chapter 12: Emergence
### Getting Clean via Emergent Design
A design is “simple” if it follows these rules:
- Runs all the tests
- Contains no duplication
- Expresses the intent of the programmer
- Minimizes the number of classes and methods

### Simple Design Rule 1: Runs All the Tests
We need to have tests and run them continuously impacts our system’s adherence to the primary OO goals of low coupling and high cohesion. Writing tests leads to better designs.

### Simple Design Rules 2–4: Refactoring
- During refactoring step, we can apply anything from the entire body of knowledge about good software design. We can increase cohesion, decrease coupling, separate concerns, modularize system concerns, shrink our functions and classes, choose better names, and so on.
- Eliminate duplication, ensure expressiveness, and minimize the number of classes and methods.

### No Duplication
- Duplication is the primary enemy of a well-designed system. It represents additional work, additional risk, and additional unnecessary complexity.

### Expressive
- Spend a little time with each of your functions and classes. Choose better names, split large functions into smaller functions, and generally just take care of what you’ve created.

### Minimal Classes and Methods
- Our goal is to keep our overall system small while we are also keeping our functions and classes small. Remember, however, that this rule is the lowest priority of the four rules of Simple Design. So, although it’s important to keep class and function count low, it’s more important to have tests, eliminate duplication, and express yourself.

## Chapter 13: Concurrency
### Why Concurrency?
- Consider a system that handles one user at a time and requires only one second of time per user. This system is fairly responsive for a few users, but as the number of users increases, the system’s response time increases. No user wants to get in line behind 150 others! We could improve the response time of this system by handling many users concurrently.

### Concurrency Defense Principles
#### Single Responsibility Principle
- The SRP states that a given method/class/component should have a single reason to change. Concurrency design is complex enough to be a reason to change in it’s own right and therefore deserves to be separated from the rest of the code.

#### Corollary: Limit the Scope of Data
- As we saw, two threads modifying the same field of a shared object can interfere with each other, causing unexpected behavior. One solution is to use the synchronized keyword to protect a critical section in the code that uses the shared object.
- Take data encapsulation to heart; severely limit the access of any data that may be shared.

#### Corollary: Use Copies of Data
- A good way to avoid shared data is to avoid sharing the data in the first place. In some situations it is possible to copy objects and treat them as read-only.
- If there is an easy way to avoid sharing objects, the resulting code will be far less likely to cause problems. 

#### Corollary: Threads Should Be as Independent as Possible
- Attempt to partition data into independent subsets than can be operated on by independent threads, possibly in different processors.

### Know Your Library
- Use the provided thread-safe collections.
- Use the executor framework for executing unrelated tasks.
- Use nonblocking solutions when possible.
- Several library classes are not thread safe

### Know Your Execution Models
#### Producer-Consumer
The producers write to the queue and signal that the queue is no longer empty. Consumers read from the queue and signal that the queue is no longer full. Both potentially wait to be notified when they can continue.

#### Readers-Writers
- Writers tend to block many readers for a long period of time, thus causing throughput issues.
- A simple strategy makes writers wait until there are no readers before allowing the writer to perform an update. If there are continuous readers, however, the writers will be starved. On the other hand, if there are frequent writers and they are given priority, throughput will suffer. Finding that balance and avoiding concurrent update issues is what the problem addresses.

### Beware Dependencies Between Synchronized Methods
- Avoid using more than one method on a shared object.
There will be times when you must use more than one method on a shared object.
When this is the case, there are three ways to make the code correct:
- Client-Based Locking—Have the client lock the server before calling the first method and make sure the lock’s extent includes code calling the last method.
- Server-Based Locking—Within the server create a method that locks the server, calls all the methods, and then unlocks. Have the client call the new method.
- Adapted Server—create an intermediary that performs the locking. This is an example of server-based locking, where the original server cannot be changed.

### Keep Synchronized Sections Small
- Keep your synchronized sections as small as possible.

### Writing Correct Shut-Down Code Is Hard
- Think about shut-down early and get it working early. It’s going to take longer than you expect. Review existing algorithms because this is probably harder than you think.

### Testing Threaded Code 
- Write tests that have the potential to expose problems and then run them frequently, with different programatic configurations and system configurations and load. If tests ever fail, track down the failure. Don’t ignore a failure just because the tests pass on a subsequent run.
Here are a few more fine-grained recommendations:
- Treat spurious failures as candidate threading issues.
- Get your nonthreaded code working first.
- Make your threaded code pluggable.
- Make your threaded code tunable.
- Run with more threads than processors.
- Run on different platforms.
- Instrument your code to try and force failures.

## Chapter 14: Successive Refinement
- The process is that we should write a rough draft, then a second draft, then several subsequent drafts until we had our final version. Writing clean compositions, they tried to tell us, is a matter of successive refinement.To write clean code, you must first write dirty code and then clean it.
- One of the best ways to ruin a program is to make massive changes to its structure in the name of improvement. Some programs never recover from such “improvements.” The problem is that it’s very hard to get the program working the same way it worked before the “improvement.”
- It is not enough for code to work. Code that works is often badly broken. Programmers who satisfy themselves with merely working code are behaving unprofessionally.
- Nothing has a more profound and long-term degrading effect upon a development project than bad code.
- Of course bad code can be cleaned up. But it’s very expensive. As code rots, the modules insinuate themselves into each other, creating lots of hidden and tangled dependencies. Finding and breaking old dependencies is a long and arduous task. On the other hand, keeping code clean is relatively easy.
- So the solution is to continuously keep your code as clean and simple as it can be. Never let the rot get started.

## Chapter 15: JUnit Internals
- Often one refactoring leads to another that leads to the undoing of the first. Refactoring is an iterative process full of trial and error, inevitably converging on something that we feel is worthy of a professional.
- No module is immune from improvement, and each of us has the responsibility to leave the code a little better than we found it.

## Chapter 16: Refactoring SerialDate
### First, Make It Work
First, we need to make the code capable of passing all unit tests.

### Then Make It Right
We should check the code in a bit cleaner than when we checked it out. It might take a little time, but it was worth it. Test coverage will be increased, some bugs will be fixed, the code will be clarified. The next person to look at this code will hopefully find it easier to deal with than we did. That person will also probably be able to clean it up a bit more than we did.

## Chapter 17: Smells and Heuristics
### Comments
- Comments should be reserved for technical notes about the code and design.
- It is best not to write a comment that will become obsolete. If you find an obsolete comment, it is best to update it or get rid of it as quickly as possible
- A comment is redundant if it describes something that adequately describes itself.
- If you are going to write a comment, take the time to make sure it is the best comment you can write.

### Environment
- You should be able to check out the system with one simple command and then issue one other simple command to build it.
- You should be able to run all the unit tests with just one command.

### Functions
- Functions should have a small number of arguments. 
- Output arguments are counterintuitive. Readers expect arguments to be inputs, not outputs.
- Boolean arguments loudly declare that the function does more than one thing.
- Methods that are never called should be discarded.

### General 
- The ideal is for a source file to contain one, and only one, language.
- When an obvious behavior is not implemented, readers and users of the code can no longer depend on their intuition about function names.
- Don’t rely on your intuition. Look for every boundary condition and write a test for it.
- It is risky to override safeties.
- Every time you see duplication in the code, it represents a missed opportunity for abstraction.
- The point is that you cannot lie or fake your way out of a misplaced abstraction. Isolating abstractions is one of the hardest things that software developers do, and there is no quick fix when you get it wrong.
- Well-defined modules have very small interfaces that allow you to do a lot with a little. Poorly defined modules have wide and deep interfaces that force you to use many different gestures to get simple things done.
- Variables and function should be defined close to where they are used.
- Private functions should be defined just below their first usage.
- Keep your source files clean, well organized, and free of clutter.
- Take the time to figure out where functions, constants, and variables ought to be declared. Don’t just toss them in the most convenient place at hand and then leave them there.
- In general you should prefer nonstatic methods to static methods. When in doubt, make the function nonstatic.
- Understand the algorithm.
- Function names should say what they do.
- Use explanatory variables.
- Prefer polymorphism to if/else or switch/case.
- Ambiguities and imprecision in code are either a result of disagreements or laziness. In either case they should be eliminated.
- Functions should do one thing.
- Functions should descend only one level of abstraction.

### Names
- Choose descriptive names.
- Choose names at the appropriate level of abstraction
- Choose names that make the workings of a function or variable unambiguous.
- The length of a name should be related to the length of the scope. You can use very short variable names for tiny scopes, but for big scopes you should use longer names.
- Names should not be encoded with type or scope information.
- Names should describe everything that a function, variable, or class is or does.

### Tests
- A test suite should test everything that could possibly break.
- Coverage tools reports gaps in your testing strategy. They make it easy to find modules, classes, and functions that are insufficiently tested. 
- They are easy to write and their documentary value is higher than the cost to produce them.
- Take special care to test boundary conditions. We often get the middle of an algorithm right but misjudge the boundaries.
- Bugs tend to congregate. When you find a bug in a function, it is wise to do an exhaustive test of that function. You’ll probably find that the bug was not alone.
- Looking at the code that is or is not executed by the passing tests gives clues to why the failing tests fail.
- A slow test is a test that won’t get run. When things get tight, it’s the slow tests that will be dropped from the suite. So do what you must to keep your tests fast.

