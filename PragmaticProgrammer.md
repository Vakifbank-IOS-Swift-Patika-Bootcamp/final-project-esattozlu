# PragmaticProgrammer

## Chapter 1: A Pragmatic Philosophy

Pragmatic programmers think beyond the problem, placing it in its larger context and seeking out the bigger picture.

### Topic 1. It’s Your Life
It's your life. If you are not satisfied, change it. Change is in your hands.

### Topic 2. The Cat Ate My Source Code

- Team Trust
In a healthy environment based in trust, you can safely speak your mind, present your ideas, and rely on your team members who can in turn rely on you.

- Take Responsibility
When you make a mistake (as we all do) or an error in judgment, admit it honestly and try to offer options.
Don’t blame someone or something else, or make up an excuse.
Mistakes happen. The important thing is to handle it professionally.

### Topic 3. Software Entropy
If there is a "broken window" in the project, later developers do not hesitate to break windows. Therefore, for the sustainability of the project, it is necessary to proceed without leaving any broken windows and by repairing the defects.

### Topic 4. Stone Soup and Boiled Frogs
Before asking for an improvement, it is necessary to show the team that it can be done by starting the process. Then, wait for the team to complete the next steps with statements such as "it would be nice if we add this too" on top of our own development. People find it easier to join an ongoing success.

### Topic 5. Good-Enough Software 
"Good enough" doesn't mean the code is sloppy or bad. Sometimes products with minor faults but working are preferred rather than perfect. The important thing is to meet the demands and needs of the users.

### Topic 6. Your Knowledge Portfolio 
- Building Your Portfolio
    - Invest regularly
    - Diversify
    - Manage risk
    - Buy low, sell high
    - Review and rebalance

- Goals
    - Learn at least one new language every year
    - Read a technical book each month
    - Read nontechnical books, too
    - Take classes
    - Participate in local user groups and meetups
    - Experiment with different environments
    - Stay current

- Critical Thinking
    - Ask the “Five Whys”
    - Who does this benefit?
    - What’s the context?
    - When or Where would this work?
    - Why is this a problem?
    
### Topic 7. Communicate!
- Know what you want to say. 
- Know your audience. 
- Choose your moment. 
- Choose a style.
- Make it look good.
- Involve your audience.
- Be a listener.
- Get back to people.
- Keep code and documentation together.

## Chapter 2: A Pragmatic Approach
### Topic 8. The Essence of Good Design 
Considering that the code you write may change in the future, write decoupled, cohesive and changeable code.

### Topic 9. DRY—The Evils of Duplication 
DRY – Don’t Repeat Yourself \
Repetition in coding is dangerous. If there are repetitive codes, when there is a change, it is necessary to apply the change wherever it is repeated. If it is forgotten that the code is repetitive, making changes only in one place will cause conflict in the code. \
Design your code modularly for reuse.


### Topic 10. Orthogonality
BENEFITS OF ORTHOGONALITY 
##### Gain Productivity 
It is easier to write relatively small, independent, orthogonal components than to write a single large block of code. Simple orthogonal components combine to increase productivity and efficiency.
##### Reduce Risk 
Orthogonal approach reduces risks in software. If a module is broken, it is unlikely to affect the other module. The system is less fragile. Errors made do not spread to the entire system. It has high testability.
##### TOOLKITS AND LIBRARIES 
When using third-party applications, be careful not to disturb the orthogonality of the application.
##### TESTING 
An orthogonally designed and implemented system is easier to test. Because interactions between system components are limited, most of the system testing can be performed at the module level. Module-level (or unit) testing is much easier to specify and perform than integration testing.

### Topic 11. Reversibility
Ensure both interchangeability and reversibility using a flexible architecture.

### Topic 12. Tracer Bullets
While writing the code, it is necessary to use tracer bullets to keep track of where the code goes, what results it provides, and the future of the code.

### Topic 13. Prototypes and Post-it Notes
It is important to use prototypes to analyze, uncover and reduce risk.
 
### Topic 14. Domain Languages 
Choose a language suitable for the problem domain.

### Topic 15. Estimating
It is important to be able to predict the feasibility, duration, and challenges of a project. Thus, no surprise problems are encountered during the development process. \
For accurate estimation;
- Understand What’s Being Asked 
- Build a Model of the System 
- Break the Model into Components 
- Give Each Parameter a Value 
- Calculate the Answers 
- Keep Track of Your Estimating Prowess 

## Chapter 3: The Basic Tools
### Topic 16. The Power of Plain Text 
HTML, JSON, YAML,HTTP, SMTP, IMAP, and so on are all plain text. \
That’s for some good reasons:
- Insurance against obsolescence 
- Leverage existing tools
- Easier testing

### Topic 17. Shell Games
You can launch applications, debuggers, browsers, editors, and utilities from the shell. You can search for files, query the status of the system, and filter the output. And by programming the shell, you can create complex macro commands for activities you do frequently.

### Topic 18. Power Editing
- Achieve Editor Fluency
#### What does "Fluent" Mean?
- When editing text, move and make selections by character, word, line, and paragraph.
- When editing code, move by various syntactic units (matching delimiters, functions, modules, ...).
- Reindent code following changes.
- Comment and uncomment blocks of code with a single command.
- Undo and redo changes.
- Split the editor window into multiple panels, and navigate between them.
- Navigate to a particular line number. Sort selected lines.
- Search for both strings and regular expressions, and repeat previous searches.
- Display compilation errors in the current project. Run the current project’s tests.

### Topic 19. Version Control
Version control systems keep track of every change you make to your source code and documentation. With a properly configured source code control system, you can always revert to a previous version of your software. \
But a version control system does much more than roll back errors. \
A good VCS will allow you to answer questions such as:
- Who made the changes to this line of code?
- What is the difference between the current version and last week's version?
- How many lines of code have we changed in this version?
- Which files are changed most often?
Such information is invaluable for defect tracking, auditing, performance and quality purposes.

### Topic 20. Debugging
Fix the Problem, Not the Blame \
It doesn't matter if the bug is your fault or someone else's. It's is your problem.

#### WHERE TO START
- Before you start looking at the error, make sure you're working on cleanly generated code without warnings.
- When trying to solve any problem, you need to collect all relevant data.

#### DEBUGGING STRATEGIES
##### Reproducing Bugs
The best way to start fixing a bug is to make it reproducible. If you can't reproduce the error, you won't know if it has been fixed.

##### Logging and/or Tracing
You need to trace the state of a program or a data structure over time.

##### Rubber Ducking
A very simple but particularly useful technique for finding the cause of a problem is to simply explain it to someone else.


#### DEBUGGING CHECKLIST
- Is the problem being reported a direct result of the underlying bug, or merely a symptom?
- Is the bug really in the framework you’re using? Is it in the OS? Or is it in your code?
- If you explained this problem in detail to a coworker, what would you say?
- If the suspect code passes its unit tests, are the tests complete enough? What happens if you run the tests with this data?
- Do the conditions that caused this bug exist anywhere else in the system? Are there other bugs still in the larval stage, just waiting to hatch?

### Topic 21. Text Manipulation
Learn a Text Manipulation Language

### Topic 22. Engineering Daybooks
Use a daybooks to take notes in meetings, jot down what we're working on, note down variable values while debugging, leave reminders, save ideas.

## Chapter 4: Pragmatic Paranoia
You Can’t Write Perfect Software

### Topic 23. Design by Contract
Every function and method in a software system does something. Before starting something, the function may have an expectation and give a statement when it's done. These expectations are explained as follows:
- Preconditions: What must be true in order for the routine to be called; the routine’s requirements.
- Postconditions: What the routine is guaranteed to do; the state of the world when the routine is done.
- Class invariants: A class ensures that this condition is always true from the perspective of a caller. 

Here, the emphasis is on “lazy” code: be strict in what you will accept before you begin, and promise as little as possible in return.

### Topic 24. Dead Programs Tell No Lies
All errors inform you. You can convince yourself that there is no mistake and choose to ignore it. Instead, Pragmatic Programmers tell themselves that if there is a mistake, it is something very, very bad. Don't forget to read the error messages.

### Topic 25. Assertive Programming
Use Assertions to Prevent the Impossible \
If you think a situation will never happen, add assertion code to check this.

### Topic 26. How to Balance Resources
Most of the time, resource usage follows a predictable pattern: you allocate the resource, use it, and then deallocate it. \
It doesn't matter what kind of resources we use (processes, network connections, memory, files, threads, windows). Whoever allocates a resource should be responsible for deallocating it.

### Topic 27. Don’t Outrun Your Headlights
We can't see very far into the future, and the farther you look, the darker it gets. Pragmatic Programmers have a strict rule: "Take Small Steps—Always" \
Always take small steps, check feedback before continuing.

## Chapter 5: Bend, or Break
### Topic 28. Decoupling
A software that we will change or update later should be flexible and low in dependency. \
The simple principle we should follow is "Decoupled Code Is Easier to Change".
####Symptoms of coupling:
- Wacky dependencies between unrelated modules or libraries.
- “Simple” changes to one module that propagate through unrelated modules in the system or break stuff elsewhere in the system.
- Developers who are afraid to change code because they aren’t sure what might be affected.
- Meetings where everyone has to attend because no one is sure who will be affected by a change.

We need to avoid global data as much as possible to minimize dependency. Keep your code as shy as possible. Dealing only directly with its own issues will help keep the application decou pled and be more amenable to change.

### Topic 29. Juggling the Real World
If we write apps that respond to real-world events and adjust what they do to those events, those apps work better in the real world. \
Let’s look at four strategies that help.
-  Finite State Machines
-  The Observer Pattern
-  Publish/Subscribe
-  Reactive Programming and Streams

### Topic 30. Transforming Programming 
All programs transform data, converting an input into an output. We always need to think of programs as something that transforms inputs into outputs. \
The easiest way to find transformation is to start with the requirement and identify their inputs and outputs.
#### WHAT ABOUT ERROR HANDLING?
- First, Choose a Representation
- Then Handle It Inside Each Transformation
- Or Handle It in the Pipeline
Thinking of code as a series of (nested) transformations can be a liberating approach to programming. This approach makes your code cleaner, shortens your functions, and flatters your designs.

### Topic 31. Inheritance Tax
Inheritance is coupling. Not only is the child class coupled to the parent, the parent’s parent, and so on, but the code that uses the child is also coupled to all the ancestors. \
Instead of inheritance, apply the following techniques;
- Interfaces and protocols 
- Delegation
- Mixins and traits

### Topic 32. Configuration
####Parameterize Your App Using External Configuration
Common things you will probably want to put in configuration data include:
- Credentials for external services (database, third party APIs, and so on)
- Logging levels and destinations
- Port, IP address, machine, and cluster names the app uses 
- Environment-specific validation parameters
- Externally set parameters, such as tax rates
- Site-specific formatting details
- License keys

## Chapter 6: Concurrency
Concurrency is when two or more pieces of code run as if they were running at the same time. \
Parallelism is when they do run at the same time. \
To ensure concurrency, you must run code in an environment that can switch execution between different parts of your code as you run. \
To have parallelism you need hardware that can do two things at the same time.

### Topic 33. Breaking Temporal Coupling
#### Analyze Workflow to Improve Concurrency
We can use an activity diagram to understand what happens at the same time and what needs to happen in a precise order. \
Activity diagrams show potential areas of concurrency.
#### PARALLELISM
Concurrency is a software mechanism. Parallelism is a hardware issue. If we have multiple processors, local or remote, we can reduce the overall duration of the jobs if we can split the work between them.
 
### Topic 34. Shared State Is Incorrect State 
Concurrency is difficult in a shared resource environment, and very difficult to manage yourself.

### Topic 35. Actors and Processes
Actors execute concurrently, asynchronously, and share nothing. If you had enough physical processors, you could run an actor on each. If you have a single processor, then some runtime can handle the switching of context between them. Either way, the code running in the actors is the same. \
In the actor model, there is no need to write any code to handle concurrency as there is no shared state. Since the actors work for themselves according to the messages they receive, there is no need to code with the logic of "do this, do that".

### Topic 36. Blackboards
#### Use Blackboards to Coordinate Workflow
You can try to handle every possible combination and situation using a workflow system. Many such systems exist, but they can be complex. As regulations change, the workflow has to be reorganized: people may have to change their procedures and code may have to be rewritten.

## Chapter 7: While You Are Coding
### Topic 37. Listen to Your Lizard Brain
As we gain experience, we need to understand and listen to the instinctive effects that occur and find out why. \
When you have a problem and can't find a solution, step away from the keyboard for a while. Don't force yourself to think about it. After a while, you will spontaneously come up with new ideas and solve the problem. \
If you are reluctant to start a new project, find an area within the project that interests you. Try things you've been curious about but haven't implemented before in the project. This will break your reluctance. \
Do the following.
- Write“I’m prototyping ”on a sticky note, and stick it on the side of your screen.
- Remind yourself that prototypes are meant to fail. And remind yourself that prototypes get thrown away, even if they don’t fail. There is no downside to doing this.
- In your empty editor buffer,create a comment describing in one sentence what you want to learn or do.
- Start coding.

### Topic 38. Programming by Coincidence 
If you don't know why and how the code works, you won't be able to understand why it fails when it fails. That's why you should know why you wrote the code you wrote and what effects it will have. \
If you are working on a completed project, you need to understand the application, even if the application runs without errors. In fact, the application appears to be working, but only in a limited area. It is necessary to deal with a running application due to the following situations.

- It may not really be working—it might just look like it is.
- The boundary condition you rely on may be just an accident. In different circumstances (a different screen resolution, more CPU cores), it might behave differently.
- Undocumented behavior may change with the next release of the library.
- Additional and unnecessary calls make your code slower.
- Additional calls increase the risk of introducing new bugs of their own.

### Topic 39. Algorithm Speed
#### BIG-O NOTATION
When we write anything that includes loops or recursive calls, we check the runtime and memory requirements. This is quick confirmation that what we're doing makes sense under the circumstances. But sometimes we find ourselves doing a more detailed analysis. That's when Big-O notation comes in handy. \
Big-O is never going to give you actual numbers for time or memory or whatever: it simply tells you how these values will change as the input changes.

### Topic 40. Refactoring
As a program evolves, it will become necessary to rethink earlier decisions and rework portions of the code.
#### WHEN SHOULD YOU REFACTOR?
You refactor when you learn something better or realize you can do better. \
If you've come across a stumbling block because the code doesn't quite fit anymore, or anything else at all strikes you as being “wrong,” don't hesitate to change it. \
Refactor your code when you find out that:
- Duplication
- Nonorthogonal design
- Outdated knowledge
- Usage
- Performance
- The Tests Pass

### Topic 41. Test to Code
#### Testing Is Not About Finding Bugs
A Test Is the First User of Your Code

#### Test-Driven Development

- Decide on a small piece of functionality you want to add.
- Write a test that will pass once that functionality is implemented.
- Run all tests. Verify that the only failure is the one you just wrote.
- Write the smallest amount of code needed to get the test to pass, and verify that the tests now run cleanly.
- Refactor your code: see if there is a way to improve on what you just wrote (the test or the function). Make sure the tests still pass when you’re done.

### Topic 42. Property-Based Testing
Use Property-Based Tests to Validate Your Assumptions \
We recommend writing unit tests for your functions. You do this by thinking about typical things that might be a problem, based on your knowledge of what you're testing. \
That unit test does two things for you. First, it lets you focus in on the problem without all the additional calls being made into your code by the property-based testing framework. Second, that unit test acts as a regression test. Because property-based tests generate random values that get passed to your test, there’s no guarantee that the same values will be used the next time you run tests. Having a unit test that forces those values to be used ensures that this bug won’t slip through.

### Topic 43. Stay Safe Out There
Basic principles that you should always bear in mind:
- Minimize Attack Surface Area 
- Principle of Least Privilege
- Secure Defaults
- Encrypt Sensitive Data
- Maintain Security Updates

### Topic 44. Naming Things
We create names for applications, subsystems, modules, functions, variables—we’re constantly creating new things and bestowing names on them. And those names are very, very important, because they reveal a lot about your intent and belief. \
When naming things, you’re constantly looking for ways of clarifying what you mean, and that act of clarification will lead you to a better understanding of your code as you write it.

## Chapter 8: Before the Project
### Topic 45. The Requirements Pit
At the very beginning of a project, you and the team need to learn the requirements.
Our job is to help people understand what they want. Programmers help people understand what they want.
When given something that seems simple, we annoy people by looking for edge cases and asking about them.
Requirements are learned in a feedback loop. 
Work with a user to think like a user.
Create and maintain a project glossary—one place that defines all the specific terms and vocabulary used in a project. All participants in the project, from end users to support staff, should use the glossary to ensure consistency. 
Requirement documents describe what a small portion of the application should do from the perspective of a user of that functionality. When written this way, the requirements can be placed on a board and moved around to show both status and priority.

### Topic 46. Solving Impossible Puzzles 
The key to solving puzzles is both to recognize the constraints placed on you and to recognize the degrees of freedom you do have, for in those you’ll find your solution.
Sometimes you will find yourself working on a problem that seems much harder than you thought it should be. Your conscious brain is aware of the problem, but your conscious brain is really pretty dumb. In such cases, the answer is revealed when you return to work after doing different activities to distract your mind.

### Topic 47. Working Together
With Pair programming, it is very effective for problem solving while one person writes code, while others ask questions, interpret and discuss. You’re less inclined to take a potentially embarrassing shortcut when someone is actively watching, which also results in higher-quality software.

### Topic 48. The Essence of Agility
Values of agile manifesto:
- Individuals and interactions over processes and tools 
- Working software over comprehensive documentation 
- Customer collaboration over contract negotiation 
- Responding to change over following a plan
Agility is all about responding to change, responding to the unknowns you encounter after you set out.
Recipe for working in an agile way:
- Work out where you are.
- Make the smallest meaningful step towards where you want to be.
- Evaluate where you end up, and fix anything you broke.

## Chapter 9: Pragmatic Projects 
### Topic 49. Pragmatic Teams
- A team mostly stable entity of its own. A pragmatic team is small, under 10-12 or so members.
- The team should have a quality concern and all members should embrace this concern. At the same time, all team members should be aware of the changes made and control of the project should be maintained by everyone.
- A good team is one whose members communicate well.
- Automation is an essential component of every project team. Make sure the team has skills at tool building to construct and deploy the tools that automate the project development and production deployment.

### Topic 50. Coconuts Don’t Cut It 
- Do What Works, Not What’s Fashionable
- Don't use scrum just because everyone is using scrum. If it works for you, use it.
- Take the best pieces from any particular methodology and adapt them for use. No one size fits all, and current methods are far from complete, so you’ll need to look at more than just one popular method.
- The goal is to be in a position to deliver working software that gives the users some new capability at a moment’s notice.
- Deliver when the users need it, when it makes business sense to do so.

### Topic 51. Pragmatic Starter Kit 
Pragmatic Starter Kit:
- Version Control : Use Version Control to Drive Builds, Tests, and Releases
- Regression Testing : Test Early, Test Often, Test Automatically
- Full Automation : Don’t Use Manual Procedures
### Topic 52. Delight Your Users
Our goal as developers is to delight users. Your users are not particularly motivated by code. Instead, they have a business problem that needs solving within the context of their objectives and budget. Their expectations are not software related. If you want to delight your client, forge a relationship with them where you can actively help solve their problems.
### Topic 53. Pride and Prejudice
Pragmatic Programmers don’t shirk from responsibility. Instead, we rejoice in accepting challenges and in making our expertise well known.
We want to see pride of ownership. “I wrote this, and I stand behind my work.” Your signature should come to be recognized as an indicator of quality. People should see your name on a piece of code and expect it to be solid, well written, tested, and documented. A really professional job. Written by a professional.
