Macro '%if' not that useful in open code

Having a '%if' in open code is not very useful unless
we have one additional fundamental instruction '%GOTO'.

Actually I don't see a great advantage over %sysfunc(ifc(.
Although it will lead to more readable code.

I believe I asked SAS for an open code logical capabilities over
30 years ago.

What we really need is a '%goto', '%if', '%array' and '%do_over'.

Even with '%if' is avalible in open code the folowing will not work.

  %let cnt=0;
  %loop:
     %if &cnt=2 %then %goto exit;
     %let cnt=%eval(&cnt+1);
  %goto loop;
  %exit: %put &=cnt;

This does work

%macro doit(dummy);
  %local cnt;

  %let cnt=0;
  %loop:
     %if &cnt=2 %then %goto exit;
     %let cnt=%eval(&cnt+1);
  %goto loop;
  %exit: %put &=cnt;

%mend doit;

%doit;

CNT=2

Useful Turing Instructions.

We need these instructions in open code. SAS has all of them
except the branch?

Possible 7 instructions for Turing computer?

Note fewer instructions are possible but woulr lead
to much longer code

Note an address can be a file, printer, disk ...

LOAD (also load immediate - define a constant)
STORE
BRANCH on COMPARE (AND/OR/XOR/NOT)
ADD (subtract/divide/mutiply)
HALT
CALL   (simplify programming)
RETURN
