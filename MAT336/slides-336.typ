#import "@preview/colorful-boxes:1.4.3" as cb
#import "@preview/touying:0.6.1": *
#import "@preview/cetz:0.4.2"
#import "@preview/lilaq:0.5.0" as lq
#import "@preview/tiptoe:0.3.1"
#import themes.metropolis: *
#import themes.metropolis: slide as slide-orig
#import "@preview/itemize:0.2.0"

#set enum(
  full: true, // Required to get all level numbers in the function
  numbering: (..n) => {
    let level = n.pos().len() - 1
    // Define the pattern based on the nesting level
    let pattern = ("1.", "(a)", "(i)", "(A)").at(level, default: "1.")

    // Apply the numbering function with the chosen pattern and the current number
    numbering(pattern, n.pos().last())
  },
)
#show: itemize.default-enum-list

#let subset = math.subset.eq

#let slide(..args) = {
  let named = args.named()
  let title = named.at("title", default: none)
  let autoscale = named.at("autoscale", default: true)
  let positional = args.pos()
  slide-orig(title: text(size: 18pt, title), ..positional.map(p => {
    show: if autoscale {
      utils.fit-to-height.with(100%, grow: false)
    } else {
      it => it
    }
    p
  }))
}

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  footer: self => {
    show: pad.with(x: -.51em, bottom: -.51em)
    block(width: 100%, height: 100%, fill: self.colors.neutral-darkest)
  },
  config-info(
    title: [MAT336 Slides LEC0101/2001],
    subtitle: [Jason Siefken],
    // author: [Jason Siefken],
    // date: datetime.today(),
    // institution: [University of Toronto],
  ),
  footer-progress: false,
  footer-right: none,
  config-page(margin: (top: 1.3em, bottom: 8.5cm, x: .5em)),
)

#let definition(it, title: none) = block(
  breakable: false,
  cb.colorbox(
    title: title,
    color: (
      fill: rgb("#e3e3e3"),
      stroke: rgb("#49164e"),
      title: rgb("#002366"),
    ),
    radius: 4pt,
    width: auto,
    it,
  ),
)

// SLIDES CONTENT

#set text(font: "Fira Sans")


#title-slide()

#slide(title: [Setting the Stage])[
  Directions

  For each of the questions that follow, I will ask you to:

  + *Think* about a possible answer on your own.
  + *Discuss* your answers with the rest of your group.
  + *Share* a summary of each group’s discussion.

]

#slide(title: [Setting the Stage])[
  What are the goals of a university education?
]
#slide(title: [Setting the Stage])[
  How does a person learn something new?
]
#slide(title: [Setting the Stage])[
  What do you reasonably expect to remember from your courses in 20 years?
]

#slide(title: [Class Details])[
  This class is about *training your mind*.

  You will practice by:
  - Working in class
  - Presenting and critiquing in tutorial
  - Doing problem sets (get a study group!)

  *AI Warning:* AI can sometimes answer analysis questions, but *the journey is the point*. Do not
  ask AI to do (or "help" with) your homework.

]

#slide(title: [A Foundation Built on Sand])[
  *Richard's Paradox* (1905):

  + Every real number can be expressed as a decimal.
  + Every decimal expresses a real number.
  + Consider the following ...

]

#slide(title: [A Troubling Sum], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)
  Consider the infinite series:
  $
    G = 1 -1 +1 -1 +1 -1 + dots.c
  $

  + What is $G$ as a real number?
  + What are the partial sums of $G$?
  + The Cesàro sum of a sequence is the limit of the averages of the partial sums.

    What is the Cesàro sum of $G$?
  + $2G=G+G = G + (0+G)$. Symbolically compute $2G$ and use that to find $G$. What do you get if you
    use a Cesàro sum to compute $2G$?
  + The Taylor series for $1/(1-x)$ is $1+x+x^2+x^3+x^4+ dots.c$. Can this fact be used to find $G$?
    What value does it give?
]

// Proof adapted from https://nseverkar.medium.com/two-proofs-that-the-sum-of-all-natural-numbers-is-1-12-a317217bb8b9
#slide(title: [A Troubling Sum 2], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)
  Consider
  $
    A = 1 - 2 + 3 - 4 + 5 - 6 + dots.c
  $
  and
  $
    S = 1 + 2 + 3 + 4 + 5 + 6 + dots.c
  $

  + $2A = A+A = A+ (0+A)$. Use what you've learned to find a value for $A$.
  + Symbolically manipulate $S-A$ to find an expression for $S-A$ in terms of $S$.
  + Use what you've learned to find the value of $S$ as a real number.
  + Does your result agree with what you were taught in Calculus class?

]

#slide(title: [A Troubling Sum 3])[
  Consider
  $
    E = 1 + 1 + 1 + 1 + dots.c
  $

  + $E - E = E - (0 + E)$. Use what you've learned to find a value for $E - E$.
  + According to the ordinary rules of arithmetic, what should $E - E$ be?
  + What went wrong?
]

// https://www.desmos.com/calculator/bzoda3dwhx
#slide(title: [Fourier's Series], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)


  #columns(2)[
    Fourier considered a long metal plate.
    #{
      let a = lq.diagram(
        width: 7.5cm,
        height: 6cm,
        xlim: (-2, 2),
        ylim: (-0, 4),
        xaxis: (ticks: lq.arange(-4, 5, step: 1)),
        yaxis: (ticks: lq.arange(-4, 5, step: 1)),
        xlabel: $x$,
        ylabel: $omega$,
        // lq.place(3.5, 3.5, $5$),
        // lq.place(2.8, 2.8, $4$),
        // lq.place(2.2, 2.2, $3$),
        // lq.place(1.5, 1.5, $2$),
        // lq.place(.9, .9, $1$),
        lq.path(
          (-1, 0),
          (-1, 5),
          (1, 5),
          (1, 0),
          stroke: (paint: blue, thickness: 2pt, dash: "dashed"),
          fill: blue.lighten(60%).transparentize(50%),
        ),
        lq.path(
          (-1, 0),
          (1, 0),
          stroke: (paint: orange.darken(10%), thickness: 6pt),
        ),
      )
      set align(center)
      a
    }

    The dashed line is kept at temperature $0$. The bottom is heated to have temperature $f(x)$,
    where $f:[-1,1] -> RR$ is a symmetric (even) function with $f(-1) = f(1)=0$.

    The resulting differential equation is solvable if:
    $
      f(x) = & a_1 cos((pi x) / 2) + a_2 cos((3 pi x) / 2) \
             & + space.thin a_3 cos((5 pi x) / 2) + dots.c + a_n cos(((2n-1) pi x) / 2)
    $
  ]
]

#slide(title: [Fourier's Series 2], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)


  #columns(2)[
    $
      f(x) = & a_1 cos((pi x) / 2) + a_2 cos((3 pi x) / 2) \
             & + space.thin a_3 cos((5 pi x) / 2) + dots.c + a_n cos(((2n-1) pi x) / 2)
    $
    Fourier showed that for a symmetric function $f$, $a_1$, $a_2$, $a_3$, ... can be computed via
    the formula:
    $
      a_n = integral_(-1)^1 f(x) cos(((2n-1) pi x) / 2) dif x
    $

    #colbreak()
    + Use the Desmos link:

      #text(size: .8em, link("https://www.desmos.com/calculator/pdbdor308p"))

      to experiment with different functions $f$ and different numbers of terms $n$.
    + What happens when $f(x)$ doesn't pass through $0$ and $x= plus.minus 1$?
    + What happens when you put in a non-symmetric function?
    + Find the coefficients for the function $f(x)=1$

  ]
]
#slide(title: [Fourier's Series 3], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)


  #columns(2)[
    Fourier claimed:
    $
      f(x) =1 = 4/pi ( & cos((pi x) / 2) -1/3 cos((3 pi x) / 2) \
                       & + 1/5 cos((5 pi x)/2)
                         - 1/7 cos((7 pi x)/2) \
                       & + 1/9 cos((9 pi x)/2) + dots.c )
    $

    #colbreak()
    Using the Taylor series for $arctan$, we can show that:
    $
      pi = 4(1 - 1/3 + 1/5 - 1/7 + 1/9 - dots.c)
    $

    + Show Fourier's formula holds when $x=0$.
    + Find the value of Fourier's formula for $x=0,1,2,...$.
    + Is it true that Fourier's formula equals $1$? Come up with arguments for *and* against.

  ]
]

#slide(title: [Functions and Series], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)


  #columns(2)[
    In the 1800s:
    - Taylor series were known.
      - Could be differentiated term-by-term.
      - Could be integrated term-by-term.
      - Represented continuous functions.
    - Graphs of functions were continuous *except* at a few points.

    #colbreak()
    - Trigonometric series
      - Could not be differentiated term-by-term.
      - Could be integrated term by term?
      - Could result in _discontinuous_ functions.
  ]
]

// Week 2
#slide(title: [Language of Proofs], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)


  #columns(2)[
    Proofs should:
    - Convince the (appropriately trained) reader through _logical_ argument.
    - Be unambiguous.

    #colbreak()
    We use formal language to remove ambiguity. Consider the sentence: "Can anyone in this room open
    this jar of pickles?"
    + What are two meanings this sentence could take on?
    + Rephrase the sentence to be unambiguous.
  ]
]

#slide(title: [Quantifiers], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)


  #show: columns
  Modern proofs heavily employ:
  - Sets
  - Quantifiers
    - There exists/for some ($exists$)
    - For all/for any ($forall$)

  #colbreak()

  For each of the following, define a set $X$ such that the statement is true.

  + "For all $p in X$, $p$ lives in Toronto."
  + "There exists a $p in X$ such that $p$ lives in Toronto."
  + "There exists a $p in X$ such that $p$ lives in Toronto, but it is not the case that for all
    $p in X$, $p$ lives in Toronto."
  + "For all $p in X$, $p$ is an armadillo."
]

#slide(title: [Notes on Quantifiers], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)


  #show: columns.with(3)
  In *Symbolic Logic*
  - Quantifiers are written as $exists$ and $forall$.
  - Always come at the start of a statement.
  - Are followed by a comma (e.g. $forall x in P, exists y in P, x > y$)

  #colbreak()

  In *This Class*
  - Quantifiers are written as symbols or words; words in a paragraph, symbols in a set.
  - Appear at the start of a statement.
  - Are followed by the English connective (e.g. $forall x in P, exists y in P " such that "x>y$)


  #colbreak()

  In *Professional Mathematics*
  - Quantifiers are written as symbols or words; words in a paragraph, symbols in a set.
  - Appear where ever the author feels like (e.g. "There exists $x$ such that ??" $=$ "?? is true
    for some $x$")
  - Are followed by the English connective

]

#slide(title: [Set-builder Notation], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)


  #show: columns
  We will use *naive set theory* (in contrast to _formal_, or ZFC set theory).

  A set is a collection of objects. It is
  - Specified with curly braces ${...}$
  - Doesn't distinguish repeated elements
  - Has no sense of order for its elements.

  Standard sets are $RR$, $ZZ$, $NN$, $QQ$, $CC$.

  #colbreak()

  Set-builder notation creates a new set from an existing set.

  + Read aloud what is meant by ${x in RR: x > 0 " and " x < 2}$.
  + Let $A,B subset RR$ be subsets. Write $A inter B$, $A union B$, and $A backslash B$ using
    set-builder notation.

]

#slide(title: [Set Practice], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)


  #show: columns
  Definition: An _irrational_ number is a real number that is not rational.

  Let $W$ be the set of positive, rational numbers and negative, irrational numbers.

  + Express $W$ using set-builder notation.

    #colbreak()
    Describe the following sets:


  + $A={x in RR:forall y in [0,1], x<y}$
  + $B = {x in RR: exists y in [0,1] "s.t." x < y}$
  + $C={x in [0,1]: forall y in [0,1], x<y}$
  + $D={x in [0,1]: exists y in [0,1] "s.t." x<y}$
  + $E={x in RR: exists y in RR "s.t." x< y}$
  + $F={x in [0,1]: y in RR, x < y}$

]

#slide(title: ["Extended" Set-builder Notation], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)


  #show: columns

  Let $T subset NN$ be the set of positive multiples of $2$. Let $R subset NN$ be the set of
  positive multiples of $3$.

  Define
  $
    Q={ a/b : a in T "and" b in R}
  $

  + List at least three elements of $Q$.
  + Is $Q$ written in standard set-builder notation?
  + Express $Q$ using set-builder notation.
]

#slide(title: [Axioms], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .85em)


  #show: columns

  Mathematicians believe:

  All *mathematical* statements are either true or false.

  + It's 11pm. 12 hours go by. What time is it?
  + Is the statement "11 + 12 = 11" true or false?
  + How could you modify the statement "11 + 12 = 11" to make it true?

    How could you modify it to make it false?

    #colbreak()
    Axioms are *assumptions* that
    - Are as simplified as possible
    - Don't contradict other assumed axioms
    - Cannot be derived from other axioms

    Which of the following are axioms?

  + For all $a,b in RR$, $a+b in RR$.
  + There is no largest real number.
  + For all $a in RR$, $a+ 1 > a$
  + $sqrt(2)$ is irrational.
  + For all $a in RR$, $a^2 >= 0$
]

#slide(title: [A Proof about Even Numbers], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .85em)


  #show: columns

  Let $E$ be the set of even integers.

  + Which of these is a correct description of $E$?
    + $E= { n in ZZ : forall a in ZZ, n=2a}$
    + $E= { n in ZZ : exists a in ZZ, n=2a}$
  + Write a proof that $6 in E$.
  + Write a proof that $5 in.not E$.
  + Which of the following statements are true?
    + For all $a in ZZ$, the number $n=2a$ is even.
    + There exists $a in ZZ$ such that the number $n=2a$ is even.
  + Prove each true statement above.

]

#slide(title: [A One-to-One Proof], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .85em)


  #show: columns

  A function $f$ with domain $D$ is *one-to-one* if different inputs produce different outputs.

  + Write a formal definition of _one-to_one_ (using quantifiers, etc.).
  + Prove that $f(x)=3x+2$ with domain $RR$ is one-to-one.
  + Prove that $g(x)=x^2$ with domain $RR$ is not one-to-one.
  + Define $h(x)=x^2$ with domain $D subset RR$. Can you find a $D$ such that $h$ is one-to-one? If
    so, do it. Prove your answer.
]

#slide(title: [Criticizing Proofs 1], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .85em)


  #show: columns

  *Theorem:* The sum of two odd numbers is even.

  *Proof:*

  $3$ is odd.\
  $5$ is odd.\
  $3+5=8$ is even.

  #colbreak()
  + What is wrong with the proof?
  + Can it be salvaged?
]
#slide(title: [Criticizing Proofs 2], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .85em)


  #show: columns

  *Theorem:* The sum of two odd numbers is even.

  *Proof:*

  The sum of two numbers is always even.

  even + even = even\
  even + odd = odd\
  odd + even = odd\
  odd + odd = even

  #colbreak()
  + What is wrong with the proof?
  + Can it be salvaged?
]

#slide(title: [Criticizing Proofs 3], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .85em)


  #show: columns

  *Theorem:* The sum of two odd numbers is even.

  *Proof:*

  $x=2a+1$ odd\
  $y=2b+1$ odd\
  $x+y=2n$ even\
  $2a+1+2b+1=2n$\
  $2a+2b+2=2n$\
  $a+b+1=n$


  #colbreak()
  + What is wrong with the proof?
  + Can it be salvaged?
]
