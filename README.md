oz
==

Programing paradigms




Introduction

By convention, the first steps in any programming language is to output the text "Hello World!". This tutorial obeys that convention. :)

After you select another subsection in the bottom-left corner, hit the [Run] button to execute the code. The first three subsections demonstrate alternate ways to output information:

Browse: opens a Browse window
Show: outputs text to standard out (i.e. the command-line)
Inspect: opens an Inspect window
(the Browse and Inspect windows might be hidden behind this window)

Oz supports line comments and block comments. Please select each subsection to see how these comments differ. (Executing these subsections does nothing, of course!)

Browse

This will open a Browse window.

WARNING: the Browse window may be hidden behind this tutorial window.

{Browse 'Hello World!'}
Show

Show something on standard out (the command-line where you started this tutorial).

{Show 'Hello World!'}
Inspect

The inspector shows sometimes more information than the Browser (depending on the inspected value).

WARNING: the Inspector window may be hidden behind this tutorial window.

{Inspect 'Hello World!'}
Line comment

This example will not produce any output.

% this is a line comment
Block comment

This example will not produce any output.

/*
this is a
block
comment
*/
Calculator

Introduction

This section executes simple numeric calculations and displays the result.

Try changing the calculation by using different numbers and freely combining the operators +, -, * , ~ (negation), div (integer division), mod (integer modulus) and / (float division). You may also use parenthesis to indicate precedence.

You can use integers (e.g. 3, 7) and floats (e.g. 1.0, 3.14). However, you cannot directly mix integers and floats in a calculation (in that case, an error will be printed at the command line).

Integers (simple)

Simple math

{Browse 3+4}
Integers (negative)

Oz uses `~' to denote a negative number.

{Browse ~7 * 5}
Integers (more)

Parentheses may be used to nest calculations.

{Browse (4 + 2) div 2}
Floats (simple)

Simple math

{Browse 3.0 / ~2.0}
Floats (converting to ints)

A float is converted into the closest integer with the function `FloatToInt'. If two integers are equally close (ie x.5) it rounds to the closest even integer. There is also a function `IntToFloat'.

{Browse {FloatToInt 3.5}}
{Browse {IntToFloat 5}}
Floats (more)

There are many other numeric functions available for floats, e.g., Exp, Log, Sin, Cos...

{Browse {Sqrt 9.0}}
Variables

Introduction

All variables in Oz must start with a capital letter. Local variables are declared with the keyword `local', and are valid for the relevant scope.

Global variables can be introduced with the keyword `declare'. However, global variables are intended for testing and are not supported in this tutorial application.

WARNING: Oz variables are single assignment variables. Variables are initially unbound (free) and they can be bound once. However, their value never changes! If you do not have experience with functional or logic programming languages, we highly recommend reading the background section!

Rewritable data storage is also supported by Oz; the simplest form is called Cells. Other types of stateful data include arrays, directories, and objects, but we shall not cover them in this tutorial.

Variable declaration

Local variables are declared with `local'.

local
   X = 1 + 1
   Y
in
   Y = 3
   {Browse X*Y}
end
Variable scope

`local' statements can be freely nested (like virtually everything in Oz). Oz supports static or lexical scope (i.e. a variable always refers to its nearest enclosing binding).

local
   X = 3
in
  local
    %% shadows the outer X
    X = 4
  in
    {Browse X}
  end
  %% later, browse original X
  {Browse X}
end
A variable can be unbound

Watch the Browser: X is first unbound (_ is displayed). After 3 seconds (3000 msec), X is bound to 42.

local
   X
in
   {Browse X}
   {Delay 3000}
   X = 42
end
Cells

Cells provide rewritable memory for values.

WARNING: The syntax for reading and writing to cells is different than the syntax for variables.

local
  C = {NewCell 0}  % create new cell with initial value 0
  V
in
  {Browse @C}      % browse cell value
  {Delay 2000}
  C := 5           % change cell value to 5 (stateful operation)
  {Browse @C}
  V = @C
  {Browse V}
end

BACKGROUND

Terms: single assignment variable, bound/determined variable, unbound/free variable, lexical scope.

In mainstream programming languages, variable values may be read and written at will. Actually, a better term for them may be "mutables". This often confuses new programmers, since variables in math do not operate this way — once the value of a variable is set, it stays set.

In Oz, variables operate more like math variables. Assigning a value to a variable is called "binding"; once a variable is "bound" (or "determined"), it cannot be changed. Variables are "free" (have no value) by default, and compound variables (such as lists) may be "partially bound" (ie. some elements may be bound, while others are unbound). The advantage of single assignment variables is that programs where variable values never change are more easy to understand and maintain.

Reading:

van Roy and Haridi, Chap. 1-2 (in particular Sec. 1.2, and 2.2)
Oz Tutorial, Chap. 3, introduction
If

Introduction

Oz provides the usual `if' control structure. Note that unlike some mainstream programming languages, parenthesis () are not required around the condition, althought they may make the code easier to read.

Please note that the `if' control structure can also be used as an expression which returns a value from the `then' or `else' clause.

if ... else ... end

Try changing 2 to 6.

if (2 < 5) then
    {Browse less}
else
    {Browse more}
end
if ... end

The `else' clause is optional. This example does nothing, but try changing `==' to `\=.' The operations `==' and `\=' test equality and inequality of values.

if (this == that) then
    {Browse hi}
end
if as an expression

This `if' returns a value, which is browsed.

{Browse
 if (2 < 5) then less else more end}
Procedure and Functions

Introduction

Procedures and functions are the standard means for expressing a collection of computations in a single entity. Examples range from numeric computations to commands involving the operating system. For example, we have already seen a number of numeric operations expressed by the common infix notation.

WARNING: curly braces {...} must surround a function or a procedure call. This syntax for procedure/function application is rather unusual when compared with other programming languages, but it is also unambiguous.

In Oz, procedures are the fundamental concept. Functions are just a syntactic variant of procedures, added for convenience. The main difference between functions and procedures is that functions are procedures which always returns exactly one value. Procedures do not necessarily return anything.

More specifically, a function is a procedure whose last argument — the return value — is expressed implicitly. Every function may be called like a procedure by adding this return value explicitly. In addition, any procedure can also be called as a function which returns its omitted last argument.

Usage

The procedure `Browse' is called with the result of function `IsEven'. `IsEven' expects one integer as an argument, and returns true or false. `Browse' expects one argument (any value), and returns nothing.

{Browse
 {IsEven 3}}
Defining Max: procedure

The procedure `Max' gets two numbers as its first two arguments and binds its last argument to the greater number.

WARNING: the variable X in the Max definition and the variable X outside are different variables (cf. variable scope above).

local
  X
  %% procedure definition
  proc {Max X Y Z}
     if X >= Y then Z = X else Z = Y end
  end
in
  %% procedure application
  {Max 4 3 X}
  {Browse X}
end
Defining Max: function

As mentioned above, a function in Oz is a procedure which returns its last value. Functions are just "syntactic sugar", added for programming convenience.

This Max function is equivalent to the Max procedure of the previous section.

local
  X
  %% function definition
  fun {Max X Y}
     if X >= Y then X else Y end
  end
in
  %% function application
  X = {Max 4 3}
  {Browse X}
end
Functions are procedures

Since functions are procedures, we can treat them just like procedures.

local
  X
  %% function definition
  fun {Max X Y}
     if X >= Y then X else Y end
  end
in
  %% function application like a procedure
  {Max 4 3 X}
  {Browse X}
end
Procedures as functions

Remember, every procedure can also be called like a function for convenience.

local
  X
  %% procedure definition
  proc {Max X Y Z}
     if X >= Y then Z = X else Z = Y end
  end
in
  %% procedure application like a function
  X = {Max 4 3}
  {Browse X}
end
Recursion

To understand recursion, you must first understand recursion. :)

Procedures and functions can call themselves (recursion). The function Factorial implements the mathematical factorial concept.

local
   fun {Factorial N}
      if N==0
      then 1
      else N * {Factorial N-1}
      end
   end
in
   %% 10! = 3628800
   {Browse
    {Factorial 10}}
end
BACKGROUND

Terms: procedure, function.

Procedure and function definitions wrap up (abstract) some computation: a complex computation can then be executed simply by calling the procedure/function.

Functions are often convenient to define and use, because we are often interested in the result of a computation. The more general concept of procedures, on the other hand, is important when we need explicit access to all arguments (e.g., in constraint definitions), or when a computation does not return a value (as is the case for many graphical user interfaces, e.g., the browser). Also, procedures are more suitable for concurrent programming, where we cannot return values to a concurrent computation running in a different thread. Constraint programming and concurrent programming are discussed later.

Atoms and Names

Introduction

Oz provides a number of basic data types which have a specific textual representation in source code. We have already seen numbers (i.e. integers and floats). Here we shall discuss two other data types: Atoms and Names.

Atom: The safest way to create an atom is to surround it in single quotes: 'hi there'. Atoms may also be written as text (without spaces) as long as they do not start with a capital letter (those are variables) and the text is not an Oz keyword. For simplicity, we recommend using 'single quotes'. ;)

Name: There are a few things which look like atoms, but are a different variable type: Name. The Boolean values true and false are both names (specifically, the Bool subtype). Another often used value which looks like an atom is unit (also a name).

Atoms

Several atoms are inspected below.

WARNING: Remember that the inspector window might open behind the tutorial.

{Inspect 'I am an atom'}
{Inspect iAmAnAtom}
{Inspect 'iAmAnAtom'}
{Inspect test}
{Inspect nil}
%% if is an Oz keyword, but 'if' is an atom
{Inspect 'if'}
{Inspect '=='}
Equality

Atoms are the same, whether entered with 'quotes' or not.

{Inspect test == 'test'}
Names

The values `true', `false' and `unit' are values which are similar to atoms, but which play a special role (note that the quotes don't belong to the values here).

Obviously, `true' and `false' are the common Boolean values. Oz provides the value `unit' for the computer science concept of the unit type (a value which is intended to express no further information). `unit' is often used wherever a token is needed whose value is not important.

{Inspect true}
{Inspect false}
{Inspect unit}

%% The Inspector shows atoms and names in different colors
{Inspect 'I am an atom'}
Compound Types

Introduction

Besides the atomic types discussed before, Oz also provides compound data types: records, tuples, lists, and strings.

Internally, all of these data types are actually records, just like all functions are actually procedures. Tuples, lists, and strings just provide a different syntax for interacting with records.

Records (definition)

A record has a label and consists of feature-value pairs.

{Inspect label(feature1:value1 feature2:value2)}
Records (integer features)

Integer features need not be listed explicitly; these two examples are identical. Note that the `foo' label does not count towards these integer features, and that the integer features are placed before non-integer features.

{Inspect test(1:one 2:two foo:bar 3:three)}
{Inspect test(one two foo:bar three)}
Records (nesting)

Records can be freely nested.

{Inspect test(1:hi 2:there x:unit(foo:bar))}
Records (accessing fields)

Record fields are accessed with the dot operator. R.X returns the value stored at feature X in record R. Records support constant-time access (i.e. the time the access takes is independent of the feature position).

{Inspect test(x:hi y:there).x}
Atoms are 'empty' records

An atom is a record which only consists in its label, but which has no features.

{Inspect test() == test}
{Inspect {IsRecord test}}
Tuples (definition)

A tuple consists of a label and values.

{Inspect label(value1 value2 value3)}
Tuples (as a record)

Actually, a tuple is a record which has only integer features in ascending order. These features can be omitted. The two records below are equivalent.

{Inspect unit(1:a 2:b 3:c) == unit(a b c)}
Lists (definition)

A list is a sequence of values, ending with `nil'.

{Inspect [value1 value2 value3]}
Lists (consing)

A list can also be written using the cons operator (|). `nil' is the empty list, which terminates a list.

{Inspect [a b c] == a|b|c|nil}
Lists (as a record)

Actually, a list is a nested record with the labels '|'.

{Inspect [a b c] == '|'(a '|'(b '|'(c nil)))}
Lists (accessing head and tail)

Consequently, the first element of a list can be accessed under the feature 1, and the remaining list under the feature 2.

{Inspect [a b c].1}
{Inspect [a b c].2}
Pairs (definition)

A pair is a convenient way of concatenating values.

{Inspect value1 # value2 # value3}
Pairs (as a tuple)

Actually, a pair is a tuple with the label '#'.

{Inspect a#b#c  == '#'(a b c)}
Strings (definition)

A string is a list of integers denoting characters (i.e. all list procedures can be used for strings).

{Inspect "test" == [116 101 115 116]}
Strings (showing text)

Although a string is just a list of integers, you can show strings as text in the Browser and the Inspector. However, you need to configure them for showing strings first. In the Inspector Preference settings (Options menu), select the tab Appearance and tick "Show Strings". You need to do these settings before you inspect a string. Alternatively, you select your string with the mouse, and then in the menu Selection you click "Reinspect". The Inspector and Browser do not show strings by default, because a string is just a list of integers, and you may use integer lists which are not strings.

{Inspect "This is a string!"}
Virtual Strings

A virtual string (VS) is concatenation (pair) of strings, atoms, and numbers. Many procedures expecting strings as arguments can also handle virtual strings for convenience. In this example, the virtual string VS consists of an atom, a string and an integer. The Browser supports showing virtual strings as text, but it must be configured first (menu Options -> Representation...: tick Virtual Strings, then select the virtual string and rebrowse).

local
  VS = 'my test'#"_"#3
in
  {Browse VS}
end
Error messages

Introduction

When we program, we almost inevitably write bugs. Luckily, when confronted with specific problems in programs, compilers try to tell us about the problem (naturally, the real hard bugs are the ones no compiler complains about). All errors are actually raised exceptions (see the Tutorial of Oz, Sec. 5.10 for more details).

The compiler is your friend, so this section introduces you to some typical Oz error messages. During your programming sessions, carefully reading error messages can save you much time. In this tutorial, all these messages are shown at the shell (or in the DOS box) where you started the tutorial. The Oz Programming Interface (OPI) even supports moving to the code where the bug is likely to be located (see the Tutorial of Oz, Sec. 2.3.3).

WARNING: the error messages of this tutorial are slightly obscured unfortunately by some trick which keeps the tutorial application running even in the case of an error: there are always a few lines of other code before the actual error message. Also, the reported line number is not correct, because the tutorial application adds a few lines to each section (the resulting full section is shown just before the error message).

Parse error

The left curly brace does not match the right parenthesis.

{Browse hello)
Static analysis error

Browse expects only a single argument.

{Browse hi there}
Binding analysis error

Variable X is not declared .

X = 3
Type error

We cannot add an integer and a float.

{Browse 3 + 2.0}
Failure

Inconsistent constraint programs result in a failure. Failures play an important role internally in a constraint solver searching for solutions to a constraint satisfaction problem.

local
   X = 3
in
   3 + 4 =: X
end
