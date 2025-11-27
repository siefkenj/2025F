#import "@preview/colorful-boxes:1.4.3" as cb
#import "@preview/touying:0.6.1": *
#import "@preview/cetz:0.4.2"
#import "@preview/lilaq:0.5.0" as lq
#import "@preview/tiptoe:0.3.1"
#import themes.metropolis: *
#import themes.metropolis: slide as slide-orig

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
    title: [MAT223 Slides LEC0101],
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

#slide(title: [Bellah 1.1 P1])[
  Model the following with a system of equations:

  Suppose you are planning a meal using three foods. Each unit of food contains a different
  combination of protein, carbohydrates, and fat, as shown below:

  #{
    set align(center)
    table(
      columns: 4,
      [Food], [Food A], [Food B], [Food C],
      [Protein (g)], [2], [1], [4],
      [Carbs (g)], [3], [1], [2],
      [Fat (g)], [1], [2], [3],
    )
  }
  If you want your meal to contain exactly 30 grams of protein, 25 grams of carbs, and 20 grams of
  fat, how many units of each food should you include in your meal?
]

#slide(title: [Bellah 1.1 P2])[
  Given a collection of data, it is often useful to find a mathematical model that fits the data
  exactly. This process, called interpolation, allows us to estimate missing values and understand
  the underlying pattern of our data.

  Find a cubic function $f (x) = a x^3 +b x^2 +c x+d$ that passes through all of the following
  points: $(0, −2)$, $(1, 1)$, $(2, 6)$, and $(3, 10)$.
]

#slide(title: [Bellah 1.1 P3])[
  Three connected buildings are involved: ROB (Robarts Library), SS (Sidney Smith Hall), and BA
  (Bahen Centre). Water is delivered between the buildings as follows:
  - The city sends 120 liters of water per minute to ROB,
  - ROB uses 35 liters of water per minute and sends the rest to SS,
  - SS uses 40 liters of water per minute and sends the rest to BA, and
  - BA uses 45 liters of water per minute and sends the rest to ROB.
  Describe the rate at which water needs to flow between each of the buildings in order for the
  system to be conserved (that is, no water is lost or stored)?
]

#slide(title: [Matrices and Equations])[
  + Rewrite the augmented matrices as systems of equations.
  + Which are easiest to solve? Why?
  #{
    set align(center)
    grid(
      gutter: 3em,
      columns: 4,
      $
        A = mat(1, 2, 4; 3, 4, 5; augment: #2)
      $,
      $
        B = mat(1, 1, 1, 1; 0, 1, -2, 1; 0, 0, 2, 2; augment: #3)
      $,
      $
        C = mat(1, 0, 4; 0, 0, 5; augment: #2)
      $,
      $
        D = mat(2, 2, 1, 2; 0, 0, 3, 6; augment: #3)
      $,
    )
  }
]

#slide(title: [Bellah 1.13, 1.15, 1.16])[

  #definition(title: [Pivot])[
    The *pivot* of a row in a matrix is the first nonzero entry in that row (if it exists).
  ]
  #show: block.with(breakable: false)
  #set text(size: .9em)

  #definition(title: [Row Echelon Form])[
    A matrix is in *row echelon form* if
    + All nonzero rows are above any rows of all zeros; and
    + The pivot of each nonzero row is to the right of the pivot of the previous row.
  ]
  #definition(title: [_Reduced_ Row Echelon Form])[
    A matrix is in *reduced row echelon form* if
    + It is in row echelon form; and
    + The pivot of each nonzero row is equal to $1$ and is the only nonzero entry in its column.
  ]
]

#slide(title: [Bellah 1.3])[
  Determine which of the following matrices are in row echelon form, reduced row echelon form, or
  neither.

  #{
    set align(center)
    grid(
      gutter: 3em,
      columns: 3,
      $
        A = mat(1, 0, 0; 2, 0, 1; 3, 4, -1/2)
      $,
      $
        B = mat(1, 0, 0; 0, 1, 0; 0, 0, 1)
      $,
      $
        C = mat(0, -1, 0, 0; 0, 0, 2, 1)
      $,

      $
        D = mat(0, 1, 0, 2; 0, 0, 1, 3; 0, 0, 0, 1)
      $,
      $
        E = mat(0, 0, 1, 0; 0, 0, 0, 0; 0, 0, 0, 1)
      $,
      $
        F = mat(0, 1, 2; 0, 0, 0)
      $,
    )
  }
]

#slide(title: [Bellah 1.5])[
  Find $"rref"(A)$ where
  $
    A = mat(1, 1, 1, 7, -1; 0, 1, 1, 4, -1; -1, 2, 2, 5, -2)
  $
]
#slide(title: [Bellah 1.6])[
  $
    A = mat(1, 1, 1, 7, -1; 0, 1, 1, 4, -1; -1, 2, 2, 5, -2)
    wide "rref"(A) = mat(1, 0, 0, 3, 0; 0, 1, 1, 4, -1; 0, 0, 0, 0, 0)
  $

  Suppose $A$ is the augmented matrix for a system in the variables $x$, $y$, $z$, $w$.
  + Which of these variables are free?
  + Which of these variables are basic?
  + How can you write down all solutions to the system?

]
#slide(title: [Bellah 1.28])[
  Below are row reduced augmented matrices for systems of equations (A), (B), and (C):
  #{
    set align(center)
    grid(
      gutter: 3em,
      columns: 3,
      $
        "rref"(A) = mat(1, 0, 1, 0; 0, 1, 1, 0; 0, 0, 0, 1; augment: #3)
      $,
      $
        "rref"(B) = mat(1, 0, 2; 0, 1, 3; 0, 0, 0; augment: #2)
      $,
      $
        "rref"(C) = mat(1, 2, -1, 0, 1; 0, 0, 0, 1, 0; augment: #4)
      $,
    )
  }

  + Identify what the solution set looks like for each of the original systems.
  + Can you produce a list of rules for determining, based off an augmented matrix whether what the
    solution set looks like?
]

#slide(title: [Bellah 1.27])[
  #{
    show: block.with(height: 10cm, breakable: false)
    definition(title: [Rouché-Capelli Theorem])[
      Let $A$ be the augmented matrix for a system of equations and let $C$ be its coefficient
      matrix. Then,
      - The system is _consistent_ if and only if $"rref"(A)$ does *not* have a pivot in the last
        column.
      - The system has a _unique solution_ if and only if *every column* and *every row* of
        $"rref"(C)$ has a pivot.
      - The system has _infinitely many solutions_ if and only if it is consistent and at least one
        column of $"rref"(C)$ does not have a pivot.

    ]
  }
]

#slide(title: [Bellah 1.7])[
  Suppose that we’re given a set of $n$ data points that lie exactly on the graph of some unknown
  cubic function.

  + What’s the minimum number of points needed to guarantee there’s exactly one cubic function
    passing through them?
  + Use the Rouché-Capelli Theorem to justify your answer.
]


#slide(title: [Bellah 2.2])[
  #set text(size: .9em)
  You are piloting an airplane equipped with two bi-directional fixed- direction thrusters.
  - Running *Thruster A* forward for 1 second moves the plane 17 m East and 7 m North.
  - Running *Thruster B* forward for 1 second moves the plane 5 m East and 18 m North.
  - Running either thruster backward for 1 reverses the movement caused by running it forward.

  There is a waypoint, $W$, located at 235 m East and 33 m North of your current position.

  #set enum(numbering: n => [P#n.])
  + By firing *exactly one* thruster, can you reach waypoint $W$? Justify.
  + By firing *both* thrusters, can you reach waypoint $W$? Justify.
  + Waypoint $C$ is located at an unknown location. The airport director asks: "are you confident
    you can reach waypoint $C$ using both your thrusters? If so, I will tell you the coordinates."

    What is your answer?
]


#slide(title: [Bellah 2.3])[
  #set text(size: .9em)

  For each vector equation, convert it into a system of equations and then find all solutions.

  #set enum(numbering: n => [P#n.])
  + $x mat(1; 2) + y mat(-1/2; 5)=mat(3; 4)$#v(1em)
  + $x mat(1; 1; 1) + y mat(3; 4; 1) = mat(2; 5; 1)$#v(1em)
  + $x mat(2; 1) + y mat(5; 3) + z mat(-1; 0) = mat(4; 2)$
]

#slide(title: [Siefken 6])[
  + Draw the following subsets of $RR^2$
  #grid(
    columns: 2,
    gutter: 1em,
    $V = {arrow(x) in RR^2 : arrow(x) = mat(0; t) " for some " t in RR}$,
    $H = {arrow(x) in RR^2 : arrow(x) = mat(t; 0) " for some " t in RR}$,

    $D = {arrow(x) in RR^2 : arrow(x) = t mat(1; 1) " for some " t in RR}$,
    $N = {arrow(x) in RR^2 : arrow(x) = t mat(1; 1) " for all " t in RR}$,

    $X = V union H$, $Y = V inter H$,
  )

  + Does $V union H = RR^2$?
]

#slide(title: [Siefken 15])[
  + Define the term *linear combination*.
  + Define the term *span*.

    Let $arrow(v)_1 = mat(1; 1)$, $arrow(v)_2 = mat(1; -1)$, and $arrow(v)_3 = mat(2; 2)$.

  + Draw $"span"{arrow(v)_1}$
  + Draw $"span"{arrow(v)_2}$
  + Draw $"span"{arrow(v)_1, arrow(v)_2}$
  + Draw $"span"{arrow(v)_1, arrow(v)_3}$
  + Draw $"span"{arrow(v)_1, arrow(v)_2, arrow(v)_3}$

]

#slide(autoscale: false)[
  #definition(title: [Linearly Dependent (Geometric)])[
    The vectors $arrow(v)_1, arrow(v)_2, ..., arrow(v)_n$ are *linearly dependent* if for at least
    one $i in {1, ..., n}$ we have
    $
      arrow(v)_i in "span"{arrow(v)_1, ..., arrow(v)_(i-1), arrow(v)_(i+1), ..., arrow(v)_n}
    $
    // if there exist a
    // non-trivial linear combination of $arrow(v)_1, arrow(v)_2, ..., arrow(v)_n$ that equals the zero
    // vector.
  ]
  + Restate the definition of Linearly Dependent in terms of an equation/systems of equations.
  // + Can you restate the definition of Linearly Dependent using the idea of *span*?
]

#slide(title: [Bellah 2.11], autoscale: false)[
  #set text(size: .8em)
  #show: block.with(breakable: false, height: 8cm)
  #definition(title: [Linearly Dependent (Algebraic)])[
    The vectors $arrow(v)_1, arrow(v)_2, ..., arrow(v)_n$ are *linearly dependent* if there exist a
    non-trivial linear combination of $arrow(v)_1, arrow(v)_2, ..., arrow(v)_n$ that equals the zero
    vector; i.e., there is a linear combination of $arrow(v)_1, arrow(v)_2, ..., arrow(v)_n$ where
    not all coefficients are zero that equals the zero vector.
  ]
  *Theorem 2.11* The algebraic and geometric definitions of _Linear Dependence_ are equivalent.

  #columns(2, [

    + Suppose that $arrow(v)_1, arrow(v)_2, arrow(v)_3$ are linearly dependent by the Geometric
      definition. Show that they are linearly dependent by the Algebraic definition.
      #v(2em)

    + Suppose that $arrow(v)_1, arrow(v)_2, arrow(v)_3$ are linearly dependent by the Algebraic
      definition. Show that they are linearly dependent by the Geometric definition.
  ])
]

#slide(title: [Bellah 2.6])[
  Use Theorem 2.11 to determine which sets of vectors are linearly independent/dependent.

  #set enum(numbering: n => [P#n.])

  + $S={mat(1; 2; -3), mat(-1; 4; 0), mat(-1; 0; 2)}$

  + $T={mat(1; 1; 0), mat(3; 1; 1), mat(-1; 2; 0)}$
  + $U={mat(1; 0; 0; 0), mat(1; 0; 1; 0), mat(0; 0; 1; 1), mat(1; -1; 0; 0)}$
]

#slide(title: [Bellah 2.12])[
  *Proposition 2.12* The vectors $arrow(v)_1, arrow(v)_2, ..., arrow(v)_n$ are linearly independent
  if and only if the matrix $mat(arrow(v)_1, arrow(v)_2, ..., arrow(v)_n)$ has a pivot in every
  column of its reduced row echelon form.

  + Prove Proposition 2.12.

    _Hint: use Rouché-Capelli._
]

#slide(title: [Bellah 3.1])[
  #definition(title: [Subspace])[
    #v(.1em)
    A subset $V subset.eq RR^n$ is a *subspace* if
    - $V$ is non-empty;
    - $V$ is closed under vector addition; and
    - $V$ is closed under scalar multiplication.
  ]

  + Give a precise statement of what it mean for a set to be *closed under vector addition*?
  + Give a precise statement of what it mean for a set to be *closed under scalar multiplication*?
]

#slide(title: [Siefken 34], autoscale: false)[
  For each set, draw it and explain whether or not it is a subspace of $RR^2$.

  #show: columns.with(2)
  #set text(size: .85em)

  + $A = {arrow(x) in RR^2 : arrow(x) = mat(a; 0) "for some " a in ZZ}$#v(.5em)
  + $B = {arrow(x) in RR^2 : arrow(x) != mat(0; 0)$#v(.5em)
  + $C = {arrow(x) in RR^2 : arrow(x) = mat(0; t) "for some " t in RR}$#v(.5em)
  + $D = {arrow(x) in RR^2 : arrow(x) = mat(0; t) + mat(1; 1) "for some " t in RR}$#v(.5em)
  + #text(
      size: .9em,
    )[$E = {arrow(x) in RR^2 : arrow(x) = mat(0; t) "or" arrow(x)=mat(t; 0) "for some " t in RR}$#v(
        .5em,
      )]
  + $F = {arrow(x) in RR^2 : arrow(x) = t mat(2; 3) "for some " t in RR}$#v(.5em)
  + $G = "span"{mat(1; 1)}$#v(.5em)
  + $H = "span"{arrow(u), arrow(v)}$ where $arrow(u)$ and $arrow(v)$ are unknown vectors in $RR^2$.
]

#slide(title: [Bellah 3.2], autoscale: false)[
  #definition(title: [Proposition 3.2])[
    Let $arrow(v)_1, ...arrow(v)_n in RR^k$. Then $V="span"{arrow(v)_1, ..., arrow(v)_n}$ is a
    subspace.
  ]
  + List the three things you need to show about $V$ for it to be a subspace.
  + Show $V$ is non-empty.
  + Show $V$ is a subspace.
  + Is $"span"{}$ (i.e., the span of the empty set) a subspace? Why or why not?
]

#slide(title: [Bellah 3.2], autoscale: false)[
  #set text(size: .9em)
  #definition(title: [Spanning Set])[
    $X={arrow(v)_1, ..., arrow(v)_n}$ is a *spanning set* (or *generating set*) for a subspace $V$
    if $V="span"(X)$.
  ]


  Find *two different* spanning sets for each of the following subspaces.

  #set enum(numbering: n => [P#n.])
  + $V = {mat(2x; 0) : x in RR}$#v(.7em)
  + $W = {mat(x-y; x+y+2z; y+z) : x,y,z in RR}$
]

#slide(autoscale: false)[
  #set text(size: .9em)
  Recall $V = {mat(2x; 0) : x in RR}$ and $W = {mat(x-y; x+y+2z; y+z) : x,y,z in RR}$.

  + Let $A$ be a spanning set for a subspace $X$. Define what it means for $A$ to be a *basis* for
    $X$.
  + Find a spanning set for $V$ that is a *basis* and another spanning set for $V$ that *is not* a
    basis.
  + Find a spanning set for $W$ that is a *basis* and another spanning set for $W$ that *is not* a
    basis.
]

#slide(title: [Bellah 3.5], autoscale: false)[
  #set text(size: .9em)
  Recall $V = {mat(2x; 0) : x in RR}$ and $W = {mat(x-y; x+y+2z; y+z) : x,y,z in RR}$.

  + Let $X$ be a subspace. Define the term "the *dimension* of $X$".
  + Find the dimension of $V$. Justify your answer.
  + Find the dimension of $W$. Justify your answer.
]

#slide(autoscale: false)[
  #set text(size: .8em)
  Consider the vectors $arrow(v)_1 = mat(-1; -2; 1)$, $arrow(v)_2 = mat(0; -1; 1)$,
  $arrow(v)_3 = mat(1; 1; 0)$, $arrow(v)_4 = mat(-1; -3; 2)$. You may use the fact that
  $
    "rref"mat(
      -1, 0, 1, -1;
      -2, -1, 1, -3;
      1, 1, 0, 2;
    )
    =
    mat(
      1, 0, -1, 1;
      0, 1, 1, 1;
      0, 0, 0, 0;
    )
  $

  + Is ${arrow(v)_1, arrow(v)_2, arrow(v)_3, arrow(v)_4}$ linearly independent or dependent?
    Justify.
  + Find a basis for $"span"{arrow(v)_1, arrow(v)_2, arrow(v)_3, arrow(v)_4}$.
  + Find a different basis for $"span"{arrow(v)_1, arrow(v)_2, arrow(v)_3, arrow(v)_4}$.
  + What is the dimension of $"span"{arrow(v)_1, arrow(v)_2, arrow(v)_3, arrow(v)_4}$?
]

#slide(title: [Bellah 3.10], autoscale: false)[
  #set text(size: .9em)
  #definition(title: [Lemma 3.10])[
    Let $A$ be an $m times n$ matrix of the form $A=mat(arrow(v)_1, arrow(v)_2, ..., arrow(v)_n)$.
    If the $n$th column of $"rref"(A)$ does not have a pivot, then
    $arrow(v)_n in "span"{arrow(v)_1, arrow(v)_2, ..., arrow(v)_(n-1)}$.
  ]

  + Prove Lemma 3.10.
]

#slide(title: [Bellah 4.1], autoscale: false)[
  #set text(size: .9em)
  Let
  $
    A=mat(1, 2; 0, 1; -1, 1)
    wide
    B=mat(3, -1, 1; 2, 0, 1)
    wide
    arrow(x)=mat(2; 1)
    wide
    arrow(y)=mat(1; 2; 3)
  $

  + Compute $A arrow(x)$, $A arrow(y)$, $B arrow(x)$, and $B arrow(y)$, if the product exists.
    Otherwise explain why it doesn't exist.
  + Suppose $arrow(q)$ is an unknown vector but that $A arrow(q)$ is defined. How many coordinates
    does $A arrow(q)$ have?
  + Suppose $arrow(r)$ is an unknown vector but that $B arrow(r)$ is defined. How many coordinates
    does $B arrow(r)$ have?
]


#slide(title: [IOLA: Italicizing N], autoscale: false)[
  #set text(size: .9em)
  #show: columns
  #{
    import cetz: *
    canvas({
      let gg = {
        for x in range(4) {
          draw.line((x, -.5), (x, 4.5), stroke: (dash: "dashed", paint: gray))
        }
        for y in range(5) {
          draw.line((-.5, y), (3.5, y), stroke: (dash: "dashed", paint: gray))
        }
      }

      draw.group({
        gg
        draw.line((0, 0), (0, 3), (2, 0), (2, 3), stroke: 2pt)
      })
      draw.translate(x: 4.5)
      draw.group({
        gg
        draw.line((0, 0), (1, 4), (2, 0), (3, 4), stroke: 2pt)
      })
    })
  }

  #colbreak()

  You are working at a font foundry and are working on figuring out a process to automatically
  _italicize_ letters. You start with N and some linear algebra knowledge!

  The N on the left is written in a regular 12 point font.

  + Find a matrix $A$ that can be used to obtain the italicized $N$ on the right.
]

#slide(title: [Bellah 4.4], autoscale: false)[
  #set text(size: .9em)
  + Let $T: RR^n -> RR^m$. Define what it means for $T$ to be a *linear transformation*.
  + What's the difference between a linear *transformation*, a linear *function*, and a linear
    *map*?
  + What's the difference between a linear *transformation* and a *matrix*?
]

#slide(title: [Bellah 4.3], autoscale: false)[
  #set text(size: .9em)
  Which of the following are linear transformations? Prove your answer.

  #set enum(numbering: n => [P#n.])

  + $F: RR^2 -> RR^2$ defined by $F mat(x; y) = mat(x^2; y^2)$#v(1em)
  + $G: RR^2 -> RR^2$ defined by $G mat(x; y) = mat(x+y; x)$#v(1em)
  + $T_A: RR^2 -> RR^2$ defined by $T_A mat(x; y) = A mat(x; y)$ where $A$ is an unknown $2 times 2$
    matrix#v(1em)
]

#slide(title: [Bellah 4.4], autoscale: false)[
  #set text(size: .9em)
  $F:RR^2 -> RR^2$ is a linear transformation and satisfies
  $
    F mat(1; 0) =mat(1; -1) wide "and" wide F mat(0; 1) = mat(1; 2)
  $

  #set enum(numbering: n => [P#n.])

  + Find $F mat(1; 1)$ and $F mat(2; 3)$.#v(1em)
  + Find a formula for $F mat(x; y)$.
  + Find a matrix $M$ such that $F arrow(x) = M arrow(x)$ for all $arrow(x) in RR^2$.
]

#slide(title: [Bellah 4.9], autoscale: false)[
  + Let $T$ be a linear transformation. Write a definition of the expression: *$M$ is the defining
      matrix for $T$*
  + If $T: RR^a -> RR^b$ is a linear transformation, what shape will its defining matrix be?
  + Does every matrix define a linear transformation?
  + Does every linear transformation have a defining matrix?
]

#slide(title: [Bellah 4.13 & 4.14], autoscale: false)[
  + Define what it means for a function $f$ to be *one-to-one* (i.e. *injective*).
  + Define what it means for a function $f$ to be *onto* (i.e. *surjective*).
  + give examples of a function from calculus that are (a) one-to-one but not onto, (b) onto but not
    one-to-one, and (c) both one-to-one and onto.
]

#slide(title: [Bellah 4.8], autoscale: false)[
  #set text(size: .9em)
  For each function, determine whether it is one-to-one, onto, both, or neither.
  #set enum(numbering: n => [P#n.])

  + $F: RR^2 -> RR^2$ defined by $F mat(x; y) = mat(x; y; 0)$#v(1em)
  + $G: RR^3 -> RR^3$ defined by $G mat(x; y; z) = mat(x-y; y+z; x+z)$#v(1em)
  + $H: RR^3 -> RR^3$ defined by $H mat(x; y; z) = mat(x-y; y+z; z)$#v(1em)
]

#slide(title: [Bellah 4.18 & 4.19], autoscale: false)[
  #set text(size: .85em)
  + #text(weight: "bold", "(4.18)") For a function $f:X -> Y$, define what it means for $f$ to be a
    *bijection*.
  + #text(weight: "bold", "(4.19)") Define what it means for two sets to be *isomorphic*.

  #[
    Let $X=RR^2$ and let $Y="span"{mat(1; 0; 0), mat(0; 1; 0)}$

    #columns(2)[
      + Does $X=Y$? Why or why not?
      + Compute $"dim"(X)$ and $"dim"(Y)$.
      + Are $X$ and $Y$ isomorphic?
      + Find a bijection between $X$ and $Y$.

      + If $U$ and $V$ are subspaces with $"dim"(U)=4$ and $"dim"(V)=5$, could $U$ and $V$ be
        isomorphic? Explain.

    ]
  ]

]


#slide(title: [Bellah 5.1], autoscale: false)[
  #set text(size: .8em)
  + Define the *kernel* (or *null space*) of a linear transformation $T$.
  + Define the *image* (or *range*) of a linear transformation $T$.

  #[
    Let $F: RR^2 -> RR^2$ be defined by $F(arrow(v)) = mat(1, 1; 1, 1)arrow(v)$.
    #set enum(numbering: n => [P#(n - 1).])

    #columns(2)[
      + Draw three random vectors $arrow(a)$, $arrow(b)$, and $arrow(c)$ in $RR^2$. On the same
        picture, draw $F arrow(a)$, $F arrow(b)$, and $F arrow(c)$.

        What does the image of $F$ look like? Can you tell what the kernel of $F$ looks like?

      + Find a vector in the kernel of $F$.
      + Find a vector in the image of $F$.
      + Find a basis for the kernel of $F$.
      + Find a basis for the image of $F$.
    ]
  ]

]

#slide(title: [Bellah 5.1+], autoscale: false)[
  #set text(size: 1em)
  #columns(2)[
    + Define the *rank* of a linear transformation $T$.
    + Define the *nullity* of a linear transformation $T$.

      Let $F: RR^2 -> RR^2$ be defined by
      $
        F(arrow(v)) = mat(1, 1; 1, 1)arrow(v)
      $

    #colbreak()

    + Find the rank of $F$ and the nullity of $F$.

    + Define the *rank* of a matrix $A$.
    + Define the *nullity* of a matrix $A$.

    + Find the rank and nullity of $mat(1, 1; 1, 1)$.
  ]
]

#slide(title: [], autoscale: false)[
  #set text(size: 1em)
  #columns(2)[
    + Define the *column space* of a matrix $A$.

      Let $arrow(u), arrow(v), arrow(w) in RR^3$ and suppose $2 arrow(u) + arrow(v) = arrow(w)$ and
      that ${arrow(u), arrow(v)}$ is a linearly independent set.

      Define $A=mat(arrow(u), arrow(v), arrow(w))$.

    + Find a basis for the column space of $A$.
    + Could ${arrow(u), arrow(w)}$ be a basis for $"col"(A)$? Explain.

    + What is $"rank"(A)$?
    + Find a vector in $"null"(A)$.
    + What is $"nullity"(A)$?
  ]
]

#slide(title: [Bellah 5.4], autoscale: false)[
  Let $A$ and $B$ be $m times 3$ matrices.

  #[
    #set enum(numbering: n => [P#(n).])

    #columns(2)[
      + Suppose $"rref"(A)$ has *exactly two* pivot columns at positions $1$ and $3$. Is this enough
        to conclude that $"rank"(A)=2$? What can you conclude about $"nullity"(A)$?

      + Suppose $"rref"(B)$ has *exactly one* pivot column at position $1$. Is this enough to
        conclude that $"rank"(B)=1$? What can you conclude about $"nullity"(B)$?
    ]
  ]
]


#slide(title: [], autoscale: true)[
  Let $M$ be a $3 times 5$ matrix.

  + List *all* possibilities for the number of pivot columns in $"rref"(M)$.
  + For each possibility, list the corresponding number of free variable columns.
  + What are *all* possible ranks for $M$?
  + For each possible rank, list the corresponding nullity.
  + Compute $"rank"(M) + "nullity"(M)$ for every possibility you came up with. What do you notice?
  + State the *Rank-Nullity Theorem*.

]

#slide(title: [Bellah 5.5], autoscale: false)[
  Consider the system (A) $cases(x+2y+4z=0\ x+y - z=0\ y+5z=0)$ and let $cal(S)$ represent the
  solution set.

  #[
    #set enum(numbering: n => [P#(n - 1).])
    #columns(2)[
      + By hand, or with a computer, solve system (A)
      + Find a matrix $C$ so that $cal(S)="null"(C)$.
      + Calculate $"nullity"(C)$.
      + Each equation in system (A) represents a plane. Describe the intersection of the three
        planes represented in equation (A)
    ]
  ]
]

#slide(title: [Bellah 6.1], autoscale: false)[
  #[
    #set enum(numbering: n => [P#(n - 1).])
    #columns(2)[
      + Let $f(t)=sin(t)$ and $g(t)=t^2$. Define $h_1 = f+g$ and $h_2 = f compose g$. Write down
        formulas for $h_1(t)$ and $h_2(t)$.

        Let $F: RR^n -> RR^m$ and $G: RR^n -> RR^m$ be linear transformations.
      + Show that $H=F+G$ is a linear transformation.

      + Suppose $F$ has defining matrix $A=mat(1, 2; 3, 4)$ and $G$ has defining matrix
        $B=mat(-1, 3; 1, 2)$. Find the defining matrix for $H$.
    ]
  ]
]

#slide(title: [Bellah 6.3#sym.star ], autoscale: false)[
  Let $F$ and $G$ be linear transformations with defining matrices
  $
    A = mat(1, 2; 3, 4) wide "and" wide B = mat(-1, 3; 1, 2)
  $
  #columns[
    + Find $F mat(a; b)$ and $G mat(x; y)$.
    + Let $H=F compose G$. Find $H mat(x; y)$.
    + Find a defining matrix for $H$.
    + Compute the matrix product $A B$. What do you notice?
    + Is $B A$ a defining matrix for $H$? Why or why not?
  ]
]


#slide(title: [IOLA: Un-Italicizing N], autoscale: false)[
  #set text(size: .82em)
  #show: columns

  "We've made a terrible mistake!" your boss says. "We must unitalicize the N!"
  #{
    import cetz: *
    canvas({
      let gg = {
        for x in range(4) {
          draw.line((x, -.5), (x, 4.5), stroke: (dash: "dashed", paint: gray))
        }
        for y in range(5) {
          draw.line((-.5, y), (3.5, y), stroke: (dash: "dashed", paint: gray))
        }
      }

      draw.group({
        gg
        draw.line((0, 0), (0, 3), (2, 0), (2, 3), stroke: 2pt)
      })
      draw.translate(x: 4.5)
      draw.group({
        gg
        draw.line((0, 0), (1, 4), (2, 0), (3, 4), stroke: 2pt)
      })
    })
  }

  #colbreak()

  Pat and Jamie had the following approach to the Italicizing N task:
  #text(fill: blue)["In order to find the matrix $A$, we are going to find a matrix that makes the N
    taller, find a matrix that leans the taller N, and then combine those matrices to get $A$."]

  You are now tasked with finding a matrix $C$ that *unitalicizes* the N.

  + Use any method you like to find $C$.
  + Use a method similar to Pat and Jamie's to find $C$.
]

#slide(title: [Bellah 6.7], autoscale: false)[
  #set text(size: .82em)
  #show: columns

  Let $A=mat(1, 2, 3; 4, 5, 6; 7, 8, 9)$
  #set enum(numbering: n => [P#(n).])

  + Apply the row operation $"row"_1 <-> "row"_3$ to $I_3$ and call the result $E_1$. Find $E_1$ and
    $E_1 A$. What do you notice?
  + Apply the row operation $"row"_2 |-> 5 " row"_2$ to $I_3$ and call the result $E_2$. Find $E_2$
    and $E_2 A$. What do you notice?
  + Apply the row operation $"row"_1 |-> "row"_1 + 2 " row"_2$ to $I_3$ and call the result $E_3$.
    Find $E_3$ and $E_3 A$. What do you notice?

]

#slide(title: [Siefken 66], autoscale: false)[
  // #set text(size: .82em)
  #show: columns

  Let $B=mat(1, 4; 0, 2)$

  + Use *two* row operation so t reduce $B$ to $I_2$ and write an elementary matrix $E_1$
    corresponding to the first operation and $E_2$ corresponding to the second.
  + What is $E_2 E_1 B$?
  + Find $B^(-1)$.
  + Can you outline a procedure for finding the inverse of a matrix using elementary matrices?

]

#slide(title: [Siefken 67], autoscale: false)[
  // #set text(size: .82em)
  $
    A=mat(1, 2, -1; 2, 2, 4; 1, 3, -3) wide arrow(b)=mat(1; 2; 3) wide C=[A | arrow(b)] wide A^(-1) = mat(9, -3/2, -5; -5, 1, 3; -2, 1/2, 1)
  $
  #show: columns

  + What is $A^(-1)A$?
  + What is $"rref"(A)$?
  + What is $"rref"(C)$? (Hint: there is no need to actually do row reduction!)
  + Solve the system $A arrow(x) = arrow(b)$

]

#slide(title: [Bellah 7.1], autoscale: false)[
  // #set text(size: .82em)
  // #show: columns

  Let $F:RR^2 -> RR^2$ be a linear transformation defined by $F(arrow(e)_1)=3 arrow(e)_1$ and
  $F(arrow(e)_2)=2 arrow(e)_2$. Let $S$ be the (filled in) *unit square* in $RR^2$.

  #set enum(numbering: n => [P#(n).])

  + Sketch a picture of $S$.
  + Sketch the image of $S$ under $F$ (i.e. $F(S)={arrow(v): arrow(v) = F(arrow(x))
      "for some" arrow(x) in S}$).
  + Sketch the "standard coordinate grid" for $RR^2$ transformed by $F$.

]

#slide(title: [Bellah 7.2], autoscale: false)[
  // #set text(size: .82em)
  // #show: columns

  Let $G:RR^2 -> RR^2$ be a linear transformation defined by $G(arrow(e)_1)=arrow(e)_1 + arrow(e)_2$
  and $G(arrow(e)_2)=2 arrow(e)_2$. Let $S$ be the (filled in) *unit square* in $RR^2$.

  #set enum(numbering: n => [P#(n).])

  + Sketch a picture of $G(S)$.
  + Sketch the "standard coordinate grid" for $RR^2$ transformed by $G$.
]

#slide(title: [Bellah 7.3], autoscale: false)[
  #set text(size: .98em)
  // #show: columns


  #set enum(numbering: n => [P#(n - 1).])

  + What's the difference between an *ordered basis* for $RR^2$ and a *basis* for $RR^2$?

    Find the orientation of the following *ordered* bases
  + $cal(B)={arrow(b)_1, arrow(b)_2}$ where
    #v(-1em)
    $
      arrow(b)_1=mat(2; 0) wide
      "and" wide arrow(b)_2=mat(2; 1)
    $
  + $cal(C)={arrow(c)_1, arrow(c)_2}$ where
    #v(-1em)
    $
      arrow(c)_1= mat(1; 1) wide "and" wide arrow(c)_2=mat(1; -1)
    $
]

#slide(title: [], autoscale: false)[
  #set text(size: .9em)
  #show: columns


  // #set enum(numbering: n => [P#(n - 1).])
  + Define the *determinant* of a linear transformation $T$

  + Recall $F:RR^2 -> RR^2$ defined by $F(arrow(e)_1)=3 arrow(e)_1$ and
    $F(arrow(e)_2)=2 arrow(e)_2$.

    Compute $det(F)$ _directly from the definition_.


  + Recall $G:RR^2 -> RR^2$ be a linear transformation defined by
    $G(arrow(e)_1)=arrow(e)_1 + arrow(e)_2$ and $G(arrow(e)_2)=2 arrow(e)_2$.

    Compute $det(G)$ _directly from the definition_.

  + Let $F: RR^2 -> RR^2$ be defined by $F(arrow(e)_1) = arrow(e)_2$ and
    $F(arrow(e)_2) = arrow(e)_1$.

    Compute $det(F)$ _directly from the definition_.
]


#slide(title: [], autoscale: false)[
  #set text(size: .9em)
  #show: columns

  Let $T:RR^2 -> RR^2$ and $S: RR^2 -> RR^2$ be linear transformations.

  You know that:
  - $T$ increases the area of the unit square by a factor of $2$ and preserves its orientation.
  - $S$ increases the area of the unit square by a factor of $3$ and reverses its orientation.

  // #set enum(numbering: n => [P#(n - 1).])
  + Find $det(T)$ and $det(S)$.

  + Do you have enough information to find $det(S compose T)$? What about $det(T compose S)$? If so,
    find them.

  + The matrix $A$ has determinant $5$, the matrix $B$ has determinant $-3$, and the matrix $C$ has
    determinant $1/4$.

    Find $det(A B C)$.
]

#slide(title: [Siefken 78], autoscale: false)[
  #show: columns
  - $E_f$ is $I_(3×3)$ with the first two rows swapped.
  - $E_m$ is $I_(3×3)$ with the third row multiplied by 6.
  - $E_a$ is $I_(3×3)$ with $R_1 |-> R_1 + 2R_2$ applied.

  + What is $det(E_f)$?
  + What is $det(E_m)$?
  + What is $det(E_a)$?
  + What is $det(E_f E_m)$?
  + What is $det(4 I_(3×3))$?
  + What is $det(W)$ where $W = E_f E_a E_f E_m E_m$?
  + Explain how to use elementary matrices to find the determinant of a matrix.

]

#slide(title: [], autoscale: false)[
  #show: columns

  The following row operations can be used to reduce a matrix $A$ to $I_(3×3)$:
  - $R_1 <-> R_3$
  - $R_2 |-> 6 R_2$
  - $R_1 |-> R_1 + 2 R_2$

  + Find $A$.
  + Find $det(A)$.

]

#slide(title: [Siefken 79], autoscale: false)[
  #show: columns

  Let $U=mat(1, 2, 1, 2; 0, 3, -2, 4; 0, 0, -1, 0; 0, 0, 0, 4)$ and let $V$ be an unknown square
  matrix.

  + Find $det(U)$.
  + Suppose $"rref"(V)$ has a row of zeros. What is $det(V)$?
]

#slide(title: [], autoscale: false)[
  #show: columns

  $X: RR^2 -> RR^2$ is a linear transformation.

  + If $det(X)=0$, could $X$ be one-to-one? Explain.
  + If $det(X)=0$, could $X$ be onto? Explain.
  + If $det(X)!=0$, could $X$ be one-to-one? Explain.
  + If $det(X)!=0$, could $X$ be onto? Explain.
  + What does the determinant of $X$ tell you about the invertibility of $X$?
  + If $det(X)=4$, what is $det(X^(-1))$?
]

#slide(title: [Bellah 7.11], autoscale: false)[
  Let $A=mat(1, 0, 3, 0; 1, 0, 2, 0; 4, 0, 0, 1; 1, 2, 3, 0)$. Find $det(A)$.
]


#slide(title: [Siefken 83], autoscale: false)[
  #set text(size: .9em)
  #show: columns

  $T: RR^2 -> RR^2$ is the linear map shown below.

  #{
    let a = lq.diagram(
      width: 2in,
      height: 2in,
      xlim: (-.1, 2),
      ylim: (-.1, 2),
      xaxis: (tick-distance: .5),
      yaxis: (tick-distance: .5),
      lq.path((0, 0), (1, 0), (1, 1), (0, 1), fill: blue.lighten(80%), stroke: black),
      lq.line((0, 0), (1, 0), tip: tiptoe.stealth, stroke: (
        paint: purple,
        dash: "dashed",
        thickness: 2pt,
      )),
      lq.line((0, 0), (0, 1), tip: tiptoe.stealth, stroke: 2pt + blue),
    )
    let b = lq.diagram(
      width: 2in,
      height: 2in,
      xlim: (-.1, 2),
      ylim: (-.1, 2),
      xaxis: (tick-distance: .5),
      yaxis: (tick-distance: .5),
      lq.path(
        (0, 0),
        (1, 1 / 2),
        (3 / 2, 3 / 2),
        (1 / 2, 1),
        fill: blue.lighten(80%),
        stroke: black,
      ),
      lq.line((0, 0), (1, 1 / 2), tip: tiptoe.stealth, stroke: (
        paint: purple,
        dash: "dashed",
        thickness: 2pt,
      )),
      lq.line((0, 0), (1 / 2, 1), tip: tiptoe.stealth, stroke: 2pt + blue),
    )

    stack(dir: ltr, spacing: 1em, a, b)
  }

  #colbreak()

  + Write down the definition of what it means for a vector $arrow(v)$ to be an *eigenvector* of
    $T$.

  + Give an eigenvector for $T$. What is its eigenvalue?
  + Can you find another?

]

#slide(title: [Bellah 8.1], autoscale: false)[
  #show: columns

  For each matrix/vector pair determine whether the vector is an eigenvector for the matrix. If so,
  find its eigenvalue.

  #set enum(numbering: n => [P#(n - 0).])

  + $A=mat(3, 2; 3, 8)$ and $arrow(v)=mat(-2; 1)$#v(1em)
  + $A=mat(3, 2; 3, 8)$ and $arrow(v)=mat(1; 1)$#v(1em)
  + $A=mat(1, 2; 2, 4)$ and $arrow(v)=mat(-2; 1)$#v(1em)

]

#slide(title: [Siefken 84], autoscale: false)[
  #show: columns
  For an unknown matrix $A$, you know that $A mat(3; 3; 1)=mat(2; 2; 2/3)$. Define $B=A-2/3 I$.

  + What is the size of $A$?
  + Give an eigenvector and eigenvalue for $A$.
  + What is $B mat(3; 3; 1)$?
  + What can you say about $dim("null"(B))$?
  + What is $det(B)$?
]

#slide(title: [Siefken 85], autoscale: false)[
  #show: columns

  Let $C=mat(-1, 2; 1, 0)$ and define $E_lambda = C - lambda I$.

  + For what values of $lambda$ does $E_lambda$ have a nontrivial null space?
  + What are the eigenvalues of $C$?
  + Find the eigenvectors of $C$.
  + Prove _Proposition 8.2_.
]

#slide(title: [Bellah 8.6 & 8.3], autoscale: false)[
  + Define the *characteristic polynomial* of a square matrix $A$.

  + Let $A=mat(1, 1; 1, 1)$, $B=mat(1, 0, 1; 0, 1, 1; 0, 0, 2)$, and $C=mat(1, -1; 1, 1)$.

    Find the characteristic polynomial and the eigenvalues of each matrix.
]

#slide(title: [Siefken 41], autoscale: false)[
  #set text(size: .82em)

  #show: place.with(dy: 1em)
  #let p = {
    let a = lq.diagram(
      width: 3.5in,
      height: 3.5in,
      xlim: (-3.5, 3.5),
      ylim: (-3.5, 3.5),
      grid: none,
      xaxis: none,
      yaxis: none,
      ..range(-5, 6).map(x => lq.line((x, -4.5), (x, 4.5), stroke: (dash: "dashed", paint: gray))),
      ..range(-5, 6).map(y => lq.line((-4.5, y), (4.5, y), stroke: (dash: "dashed", paint: gray))),
      ..range(-5, 6).map(i => lq.line(
        (-8 - 4 / 5 * i, -6 + 3 / 5 * i),
        (8 - 4 / 5 * i, 6 + 3 / 5 * i),
        stroke: (dash: "solid", paint: blue, thickness: 1pt),
      )),
      ..range(0, 1).map(i => lq.line(
        (-8 - 4 / 5 * i, -6 + 3 / 5 * i),
        (8 - 4 / 5 * i, 6 + 3 / 5 * i),
        stroke: (dash: "solid", paint: blue, thickness: 3pt),
      )),
      ..range(-5, 6).map(i => lq.line(
        (6 + 3 / 5 * i, -8 + 4 / 5 * i),
        (-6 + 3 / 5 * i, 8 + 4 / 5 * i),
        stroke: (dash: "solid", paint: green.darken(20%), thickness: 1pt),
      )),
      ..range(0, 1).map(i => lq.line(
        (6 + 3 / 5 * i, -8 + 4 / 5 * i),
        (-6 + 3 / 5 * i, 8 + 4 / 5 * i),
        stroke: (dash: "solid", paint: green.darken(20%), thickness: 3pt),
      )),
      lq.place(0, 0, circle(radius: 5pt, fill: black)),
      lq.place(.3, -.1, align: left + top)[City Hall],
      // lq.plot((0,1), (0,1), mark: 5pt + red),
      // lq.path((0, 0), (1, 0), (1, 1), (0, 1), fill: blue.lighten(80%), stroke: black),
      // lq.line((0, 0), (1, 0), tip: tiptoe.stealth, stroke: (
      //   paint: purple,
      //   dash: "dashed",
      //   thickness: 2pt,
      // )),
      // lq.line((0, 0), (0, 1), tip: tiptoe.stealth, stroke: 2pt + blue),
    )
    a
  }

  #stack(
    dir: ltr,
    spacing: 1em,
    p,

    {
      let a = lq.diagram(
        width: 1.3in,
        height: 1.3in,
        xlim: (-.5, 2),
        ylim: (-.5, 2),
        xaxis: none,
        yaxis: none,
        grid: none,
        lq.place(1, 0, align: left, [East]),
        lq.place(0, 1, align: left + bottom, [North]),
        lq.line((0, 0), (1, 0), tip: tiptoe.stealth, stroke: (
          paint: black,
          thickness: 2pt,
        )),
        lq.line((0, 0), (0, 1), tip: tiptoe.stealth, stroke: 2pt + black),
      )
      a
    },
    block(width: 55%, height: 160%)[
      #show: place.with(dy: 3em)
      #set text(size: .9em)
      The town of Oronto has its streets aligned to the vectors
      $arrow(d)_1=1/5mat(4 "east"; 3 "north")$ and $arrow(d)_2=1/5mat(-3 "east"; 4 "north")$ and its
      city hall at $arrow(0) = mat(0 "east"; 0 "north")$.

      Locations in Oronto are typically given in *street coordinates*. That is, a pair $(a,b)$ where
      $a$ is how far you walk along the $arrow(d)_1$ street and $b$ is how far you walk along the
      $arrow(d)_2$ street.

      + The points $A=(2,1)$ and $B=(3,-1)$ are given in street coordinates. Find their east-north
        coordinates.
      + The points $X=(4,3)$ and $Y=(1,7)$ are given in east-north coordinates. Find their street
        coordinates.
      + Define $arrow(e)_1=mat(1 "east"; 0 "north")$ and $arrow(e)_2=mat(0 "east"; 1 "north")$. Does
        $"span"{arrow(e)_1, arrow(e)_2} = "span"{arrow(d)_1, arrow(d)_2}$?
      + Notice $Y=5 arrow(d)_1 + 5 arrow(d)_2 = arrow(e)_1 + 7 arrow(e)_2$. Is the point $Y$ better
        represented by the pair $(1,7)$ or $(5,5)$? Explain.
    ],
  )
]

#slide(title: [Bellah 9.1 & 9.3], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10.3cm, breakable: false)
  #set text(size: .9em)
  + Let $cal(B)={arrow(v)_1, arrow(v)_2, ..., arrow(v)_n}$ be an ordered basis and let $arrow(x)$ be
    a vector. Define what is meant by the *$cal(B)$-coordinates of $arrow(x)$*.
  + What does the notation $[arrow(x)]_(cal(B))$ mean?

  + Let $cal(B)={arrow(b)_1, arrow(b)_2, arrow(b)_3}$ where
    $
      arrow(b)_1=mat(1; 1; 0) wide
      "and" wide arrow(b)_2=mat(2; 1; -1) wide
      "and" wide arrow(b)_3=mat(0; 1; 3)
    $

    Find the $cal(B)$-coordinates of $arrow(x)=mat(3; 4; 5)$.

]

#slide(title: [Bellah 9.4], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10.3cm, breakable: false)
  #set text(size: .9em)
  + Let $cal(C)$ and $cal(B)$ be ordered bases. Define the *change of basis matrix*
    $M_(cal(B) <- cal(C))$.

  #set enum(numbering: n => [P#(n - 1).])
  Let $cal(B)={arrow(b)_1, arrow(b)_2}$ where
  $
    arrow(b)_1=mat(2; 1) wide "and" wide arrow(b)_2=mat(5; 3)
  $
  + Find $[arrow(b)_1]_(cal(E))$ and $[arrow(b)_2]_(cal(E))$ as well as $[arrow(b)_1]_(cal(B))$ and
    $[arrow(b)_2]_(cal(B))$.
  + Find $M_(cal(E) <- cal(B))$.
  + How do $M_(cal(E) <- cal(B))$ and $M_(cal(B) <- cal(E))$ relate?
  + Find $M_(cal(B) <- cal(E))$.

]

#slide(title: [Bellah 9.5], autoscale: false)[
  #show: place.with(dy: 1.6cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #set enum(numbering: n => [P#(n).])
  Let $V$ be the plane spanned by the basis $cal(C)={mat(1; 1; 1),mat(2; 0; 1)}$.

  + Show that $cal(B)={mat(3; 1; 2),mat(4; 2; 3)}$ is also a basis for $V$.

  #set enum(numbering: n => [P#(n + 1)\*])
  + What dimension is $V$?
  + Let $arrow(x) in V$. How many coordinates does $[arrow(x)]_(cal(B))$ have? What about
    $[arrow(x)]_(cal(C))$?


  #set enum(numbering: n => [P#(n + 1)])
  + What size should a change of basis matrix $M_(cal(B) <- cal(C))$ be?

    Find $M_(cal(B) <- cal(C))$ and $M_(cal(C) <- cal(B))$.
]

#slide(title: [], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  Let $arrow(a), arrow(b) in RR^n$ be vectors and let $cal(W)$ be a basis for $RR^n$.

  + What would it mean for the map $arrow(v) |-> [arrow(v)]_(cal(W))$ to be linear?
  + Is the operation of writing a vector in coordinates linear? Explain.
  + Let $T: RR^n -> RR^n$ be a linear transformation and let $M$ be an $n times n$ matrix.

    For a vector $arrow(v) in RR^n$, which of the following make sense?
    $
      [T(arrow(v))]_(cal(W)) wide M [arrow(v)]_(cal(W))\
      T([arrow(v)]_(cal(W))) wide [M arrow(v)]_(cal(W))\
    $

  + What does it mean for a matrix $M$ to be the *defining matrix for the transformation $T$ with
      respect to the basis $cal(C)$*?
]

#slide(title: [Bellah 10.1], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #show: columns
  Let $cal(B) = {arrow(b)_1, arrow(b)_2}$ where
  $
    arrow(b)_1=mat(1; 1) wide "and" wide arrow(b)_2=mat(-2; 1).
  $

  Let $f: RR^2 -> RR^2$ be the linear transformation that stretches vectors in the $arrow(b)_1$
  direction by a factor of $2$ and leaves vectors in the $arrow(b)_2$ direction unchanged.

  #set enum(numbering: n => [P#(n - 1).])

  + Find a formula for $F(x_1 arrow(b)_1 + x_2 arrow(b)_2)$

  + Find the defining matrix for $F$ with respect to the basis $cal(B)$.

  #set enum(numbering: n => [#(n + 1).])
  + Are $arrow(b)_1$ and $arrow(b)_2$ eigenvectors for $F$? Explain.
  + Suppose $F$ stretched in the $arrow(b)_1$ direction by a factor of $lambda_1$ and in the
    $arrow(b)_2$ direction by a factor of $lambda_2$.

    Find $M_(F, cal(B))$
]

#slide(title: [Bellah 10.16], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #show: columns
  + What does it mean for the matrices $A$ and $B$ to be *similar*? Give an answer both in terms of
    words *and* in terms of symbols.
]

#slide(title: [], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #show: columns

  The transformation $T$ reflects vectors across the line $y=x$.

  + Find $T(arrow(e)_1)$ and $T(arrow(e)_2)$.

  + Find the defining matrix for $T$ with respect to the standard basis $cal(E)$.

    Let $cal(B)={arrow(b)_1, arrow(b)_2} ={ arrow(e)_1 + arrow(e)_2, arrow(e)_1 - arrow(e)_2}$ be an
    ordered basis.

  + Find the defining matrix for $T$ with respect to the basis $cal(B)$.

  + Are the matrices $mat(0, 1; 1, 0)$ and $mat(1, 0; 0, -1)$ similar? Explain.
]

#slide(title: [Bellah 10.4], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #show: columns

  Theorem 10.4 states: "The matrices $A$ and $B$ are similar if and only if there is an invertible
  matrix $P$ so that $A=P^(-1) B P$."

  + What type of matrices are $P$ and $P^(-1)$?

  + Justify the theorem.

]

#slide(title: [], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  // #show: columns

  Which of the following claims are true/false? Justify each one.
  + If $A$ and $B$ are similar, then $det(A) = det(B)$
  + If $A$ and $B$ are similar, then they have the same eigenvalues.
  + If $A$ and $B$ are similar, then $A$ is invertible if and only if $B$ is invertible.
  + If $A$ and $B$ are similar, then $"rref"(A)="rref"(B)$
  + If $A$ and $B$ are similar, then $"null"(A) = "null"(B)$
  + If $A$ and $B$ are similar, then $"rank"(A) = "rank"(B)$
  + The identity matrix is similar to all other invertible matrices (of the same size).
  + The matrices $A=mat(1, 0; 0, 0)$ and $B=mat(0, 0; 0, 1)$ are similar.
]

#slide(title: [Bellah 10.6 & 10.7], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #show: columns

  + Define what it means for a matrix $A$ do be a *diagonal* matrix.
  + Define what it means for a matrix $A$ to be *diagonalizable*.

    Suppose $T:RR^3 -> RR^3$ has eigenvalues $1,2,-5$ and associated eigenvectors
    $arrow(v)_1,arrow(v)_2,arrow(v)_3$. Further, suppose ${arrow(v)_1, arrow(v)_2, arrow(v)_3}$ are
    linearly independent.

  + Do the eigenvectors of $T$ form a basis for $RR^3$?

  + Write down a matrix for $T$ with respect to a basis of your choice. What basis did you use and
    why?

  + Generalize the previous exercise to write down a matrix for $G:RR^n -> RR^n$ assuming
    eigenvalues of $lambda_1, lambda_2, ..., lambda_n$ and associated eigenvectors
    $arrow(v)_1, arrow(v)_2, ..., arrow(v)_n$. What assumptions are needed to be able to write down
    a matrix?
]

#slide(title: [Bellah 10.5], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  // #show: columns
  The *Diagonalization Theorem* states: "An $n times n$ matrix $A$ is diagonalizable if and only if
  $A$ has $n$ linearly independent eigenvectors."

  Let $A$ be an $n times n$ matrix.

  + If $A$ has $n$ linearly independent eigenvectors, explain why $A$ is diagonalizable.
  + Let $D=mat(d_1, 0, dots, 0; 0, d_2, dots, dots.v; 0, dots, , d_n)$ and suppose $A$ and $D$ are
    similar. I.e. $A=P^(-1)D P$. Does $A$ have $n$ linearly independent eigenvectors? Explain.
  + Do we need to do anything else to justify the theorem?
]

#slide(title: [Bellah 10.5], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  // #show: columns
  Diagonalize, if possible, the following matrices:

  + $A =mat(0, 1; 2, 1)$

  + $B = mat(2, 2; 0, 2)$

  + $C = mat(1, 0; 0, 0)$

  + $D = mat(1, 0, 1; 0, 1, 2)$

]

#slide(title: [Bellah 10.8], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #show: columns
  Let $A=mat(4, -3, 0; 2, -1, 0; 1, -1, 1)$, $P=mat(-1, 1, 1; -2, 3, 0; 1, -1, 0)$, and
  $P^(-1)=mat(0, 1, 3; 0, 1, 2; 1, 0, 1)$ and note that
  $A = P^(-1) mat(1, 0, 0; 0, 1, 0; 0, 0, 2) P$.

  + Compute $A^10$ by hand.

    _Hint: Use all the information you're given to make it easy._

  #colbreak()
  + If you were given a description of a transformation, but you got to pick which basis it was
    described in, what basis would you pick? Why?
]

#slide(title: [Siefken 24a], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  // #set text(size: .7em)
  If $arrow(a)=mat(a_1; a_2; dots.v; a_n)$ and $arrow(b)=mat(b_1; b_2; dots.v; b_n)$ are written *in
    the standard basis* then:
  - The *dot product* of $arrow(a)$ and $arrow(b)$ is written as $arrow(a) dot arrow(b)$ and given
    by
    - (Algebraic Definition) $arrow(a) dot arrow(b)=a_1b_1+a_2b_2+...+a_n b_n$
    - (Geometric Definition) $arrow(a) dot arrow(b)=||arrow(a)|| ||arrow(b)|| cos(theta)$ where
      $theta$ is the smaller of the angles between $arrow(a)$ and $arrow(b)$.
  - The *length* or *magnitude* of $arrow(a)$ is written as $||arrow(a)||$ and given by
    $||arrow(a)||=sqrt(arrow(a) dot arrow(a))$

  #set text(size: .98em)
  Let $arrow(a)=mat(1; 1)$ and $arrow(b)=mat(3; 1)$
  #columns(2)[

    + Draw a picture of $arrow(a)$ and $arrow(b)$.
    + Compute $arrow(a) dot arrow(b)$.
    + Find $||arrow(a)||$ and $||arrow(b)||$.
    + Use your knowledge of the dot product to find the angle between $arrow(a)$ and $arrow(b)$.
  ]
]
#slide(title: [Siefken 24b], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  Let $arrow(a)=mat(1; 1)$ and $arrow(b)=mat(3; 1)$

  Draw a picture of $arrow(a)$ and $arrow(b)$. On your picture, include
  #columns(2)[
    + a vector $arrow(c)$ so that $arrow(c) dot arrow(a)$ is negative.
    + a vector $arrow(d)$ so that $arrow(d) dot arrow(a)=0$ and $arrow(d) dot arrow(b)<0$.
    + a vector $arrow(e)$ so that $arrow(e) dot arrow(a)=0$ and $arrow(e) dot arrow(b)>0$.
    + Can you find a vector $arrow(f)$ so that $arrow(f) dot arrow(a)=0$ and
      $arrow(f) dot arrow(b)=0$? Explain why or why not.
  ]
]

#slide(title: [Siefken 26], autoscale: false)[
  #set text(size: .81em)
  Two vectors $arrow(a)$ and $arrow(b)$ are *orthogonal* if $arrow(a) dot arrow(b)=0$.

  #columns(2)[
    + If $arrow(a)$ and $arrow(b)$ are orthogonal, what is the angle between them?

      Let $arrow(n)=mat(1; 3)$

    + Draw $arrow(n)$ and *all* vectors orthogonal to $arrow(n)$ in the same plot. What is the
      resulting geometric figure?
    + Let $arrow(x)=mat(x; y)$. Express the following relationship as an equation: "$arrow(x)$ is
      orthogonal to $arrow(n)$."
  ]
]

#slide(title: [Bellah 11.4#sym.star], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .8em)

  #show: columns
  Recall that the algebraic definition of the dot product was for *standard coordinates*.

  Consider the bases
  $
    cal(B)={mat(1; 2), mat(1; 1)} wide cal(C)={mat(1; 1),mat(1; -1)}\
    cal(D)={mat(1/sqrt(2); 1/sqrt(2)), mat(1/sqrt(2); -1/sqrt(2))}
  $
  Let $arrow(r)=arrow(e)_1 + 2 arrow(e)_2$.
  // In this question you may use the fact that
  // $[arrow(r)]_(cal(B))=mat(1; 0)$, $[arrow(w)]_(cal(C))=mat(3/2; -1/2)$, and
  // $[arrow(r)]_(cal(D)) = mat(3/sqrt(2); -1/sqrt(2))$.

  + To compute $arrow(r) dot arrow(r)$ with the algebraic definition, what basis do you write
    $arrow(r)$ in? Compute $arrow(r) dot arrow(r)$.
  + Find $arrow(u) dot arrow(u)$ where $[arrow(u)]_cal(B)=mat(1; 0)$

    $arrow(v) dot arrow(v)$ where $[arrow(v)]_cal(C)=mat(3/2; -1/2)$


    $arrow(w) dot arrow(w)$ where $[arrow(w)]_cal(D) = mat(3/sqrt(2); -1/sqrt(2))$.

  + Naively apply "multiply corresponding coordinates" method to compute *fake* dot products
    $
      [arrow(u)]_cal(B) dot [arrow(u)]_cal(B)wide
      [arrow(v)]_cal(C) dot [arrow(v)]_cal(C)wide
      [arrow(w)]_cal(D) dot [arrow(w)]_cal(D)wide
    $
  + Compare the previous two computations. What do you notice?
]

#slide(title: [], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  // #set text(size: .8em)

  #show: columns
  The dot product can be used in matrix multiplication.

  Let $arrow(a)=mat(a_1; a_2)$, $arrow(b)=mat(b_1; b_2)$, $arrow(x)=mat(x_1; x_2)$, and
  $arrow(y)=mat(y_1; y_2)$.

  Define $M=mat(a_1, a_2; b_1, b_2)$ and $X=mat(x_1, y_1; x_2, y_2)$.

  + Compute $M arrow(x)$. Can you rewrite the result using dot products?
  + Compute $M X$. Can you rewrite the result using dot products?

]

#slide(title: [Bellah 11.5 & 11.8], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  // #set text(size: .8em)

  // #show: columns
  + Define what it means for a basis $cal(B)={arrow(b)_1, ..., arrow(b)_n}$ to be *orthogonal*.
  + Define what it means for a basis $cal(B)={arrow(b)_1, ..., arrow(b)_n}$ to be *orthonormal*.
  + Define what it means for a square matrix $Q$ to be *orthogonal*.
]

#slide(title: [Bellah 11.12#sym.star], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)
  //
  #show: columns
  + Describe in words some transformations from $RR^2$ to $RR^2$ that do not change the length of
    *any* vector. Find matrices for these transformations. Are they orthogonal?

    #v(1em)
    *Theorem*: Let $Q$ be an orthogonal matrix and let $T$ be the linear transformation defined by
    $Q$ (in standard coordinates). Then, $T$ does not change the length of vectors.
  + Restate the theorem formally, using mathematical symbols.

    Let $Q$ be an orthogonal matrix with columns $cal(Q)={arrow(q)_1, ..., arrow(q)_n}$.
  + What is $arrow(q)_1 dot arrow(q)_1$? What is $arrow(q)_1 dot arrow(q)_2$?
  + Let $arrow(w)= alpha_1 arrow(q)_1 + ... + alpha_n arrow(q)_n$. Compute $arrow(w) dot arrow(w)$
    in both standard and $cal(Q)$-coordinates
  + Let $arrow(a)$ have standard coordinates $(alpha_1, ..., alpha_n)$. Compute $||arrow(a)||$ and
    $||T(arrow(a))||$.
]

#slide(title: [Bellah 11.5#sym.star], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)
  //
  #show: columns
  + Let $A=mat(a, b; c, d)$. What is meant by $A^T$? Describe in words and in symbols.

    Suppose $Q$ is an orthogonal matrix with columns $arrow(q)_1, arrow(q)_2$.
  + Find $Q^T$ and compute $Q^T Q$.
  + Is $Q$ invertible? Why or why not?
  + Find $Q^(-1)$.
  + Compute $Q Q^T$.
]

#slide(title: [Bellah 11.6#sym.star], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)
  //
  #show: columns
  The *Graham Schmidt* process can be used to turn a basis into an orthogonal basis.

  Let $arrow(x)$ and $arrow(y)$ be non-zero vectors and define $arrow(w)_a = arrow(x) - a arrow(y)$.

  + How does $"span"{arrow(x), arrow(y)}$ and $"span"{arrow(y), arrow(w)_a}$ relate? Does it matter
    what $a$ is?
  + Can you find an $a$ so that $arrow(w)_a$ is orthogonal to $arrow(y)$? If so, find such an $a$.
  + Use what you've learned to find an orthogonal basis for $X="span"{mat(1; 1; 0), mat(0; 1; 0)}$.
  + Find an ortho-normal basis for $X$.
  + Suppose $arrow(x), arrow(y), arrow(z)$ are non-zero vectors and that $arrow(x)$ and $arrow(y)$
    are orthogonal. Define $arrow(w)_(a,b)= arrow(z) - a arrow(x) - b arrow(y)$.

    Can you find $a$ and $b$ so that $arrow(w)_(a,b)$ is orthogonal to both $arrow(x)$ and
    $arrow(y)$? If so, how?
  + If $arrow(x)$ and $arrow(y)$ were *not* orthogonal, could you still find $a$ and $b$? Would it
    be easier or harder?
]

#slide(title: [], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)
  //
  #show: columns
  The matrix $A=mat(2, -2.5, 0; 0, 1, 0; 0, -3.5, 2)$ has eigenvectors
  $
    mat(1; 0; 6) wide mat(1; 0; 4) wide mat(5; 2; 7)
  $
  + Find the eigenvalues of $A$.
  + Diagonalize $A$.
  + What is the _eigen space_ associated to the eigenvalue $2$? What about the eigenvalue $1$?
  + Find an orthonormal basis for each eigen space.
  + Can you find an orthonormal basis for $RR^3$ made up of eigenvectors of $A$? Explain why or why
    not.
]

#slide(title: [Bellah 11.15 & 11.7], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)
  //
  #show: columns
  + What does it mean for a matrix to be *orthogonally diagonalizable*?

  #set enum(numbering: n => [P#(n).])

  Orthogonally diagonalize the following matrices, if possible.
  + $A=mat(3, 2; 2, 6)$ FYI: $"char"(A)=(lambda -2)(lambda -7)$#v(1em)
  + $A=mat(1, 1; 2, 0)$ FYI: $"char"(A)=(lambda +1)(lambda -2)$
]

#slide(title: [Bellah 11.17], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)
  //
  #show: columns
  + What does it mean for a matrix to be *symmetric*?

  + If $A$ and $B$ are matrices, which of the follow formulas are correct $(A B)^T= A^T B^T$ *or*
    $(A B)^T= B^T A^T$?

  + Show that for any matrix $A$, the matrix $A^T A$ is symmetric.
  + Show that for any matrix $A$, the matrix $A^T + A$ is symmetric.

  + State the *Spectral Theorem*.
]

#slide(title: [], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)
  //
  #show: columns
  Symmetric matrices and the transpose have many amazing properties.

  + Let $arrow(u), arrow(v) in RR^n$ be column vectors. Rewrite $arrow(u)^T arrow(v)$ using dot
    products.
  + A *left eigenvector* of a matrix $A$ is a non-zero vector $arrow(w)$ so that
    $
      arrow(w)^T A = lambda arrow(w)^T
    $
    for some $lambda$.

    Let $arrow(w)$ be an eigenvector of a _symmetric_ matrix $A$. Show that $arrow(w)^T$ is a _left
      eigenvector_ of $A$.
  + Is it always the case that eigenvectors of a matrix is also a left eigenvector (of the same
    matrix)?

  + Suppose $arrow(v)$ is an eigenvector for the _symmetric_ matrix $A$ with eigenvalue $lambda$ and
    suppose $||arrow(w)||=5$. Compute $arrow(w)^T A arrow(w)$.
]

#slide(title: [], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)
  //
  #show: columns
  Suppose $A$ is a symmetric matrix and suppose $arrow(v)_1, lambda_1$ and $arrow(v)_2, lambda_2$
  are eigenvector-eigenvalue pairs.

  + Compute $arrow(v)_1^T A arrow(v)_2$ in two different ways: $(arrow(v)_1^T A)arrow(v)_2$ and
    $arrow(v)_1^T (A arrow(v)_2)$.

    What can you conclude about $arrow(v)_1$, $arrow(v)_2$, $lambda_1$ and $lambda_2$?

  + *Theorem:* Every square matrix has at least one eigenvalue in the complex numbers.

    A symmetric matrix always has at least one *real* eigenvalue.

    Fill in the missing steps of the following proof:

    Let $arrow(v)$ be an eigenvector for the square matrix $A$ with (possibly complex) eigenvalue
    $lambda$. Then
    $
      ||A arrow(v)||^2 & = (A arrow(v)) dot (A arrow(v)) \
                       & = ... \
                       & = lambda^2 ||arrow(v)||^2
    $
    Therefore $lambda^2 >= 0$ and so $lambda$ is real.
]

#slide(title: [], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .87em)
  //
  #show: columns
  To prove the spectral theorem, we need to show that every symmetric matrix has a basis of
  eigenvectors.

  Let $A$ be a symmetric matrix. Suppose $arrow(v)$ is an eigenvector for $A$ with eigenvalue
  $lambda$.

  Let $B= A- lambda/(||arrow(v)||^2) arrow(v) arrow(v)^T$.
  + Is the matrix $B$ valid? I.e., are the matrix multiplcations/substractions that make $B$
    defined?
  + Is $B$ symmetric?
  + Is $arrow(v)$ in the null space of $B$?
  + Suppose $arrow(w)$ is another eigenvector for $A$ with eigenvalue $lambda$ that is orthogonal to
    $arrow(v)$. Construct a matrix $C$ (like $B$) so that $arrow(v)$ and $arrow(w)$ are in the null
    space of $C$.

    What happens if $arrow(w)$ and $arrow(v)$ are not orthogonal?
  + Let $E$ be the matrix obtained from $A$ by subtracting off
    $lambda/(||arrow(v_i)||^2) arrow(v_i) arrow(v_i)^T$ for a maximal set of orthogonal eigenvectors
    $arrow(v)_1, ..., arrow(v)_k$ (all with eigenvalue $lambda$).

    We want to show the algebraic multiplicity of 0 for $E$ equals $"nullity"(E)$. Ideas?
]

// https://www.desmos.com/calculator/xpyoxd7dec

#slide(title: [], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .87em)
  //
  #show: columns
  The *singular values* of a matrix $A$ are the lengths of the major/minor axes of the image of the
  unit sphere.

  In $RR^2$, the unit sphere is a circle.

  Use

  https://www.desmos.com/calculator/xpyoxd7dec

  to estimate the singular values of the following matrices:

  + $A=mat(2, 0; 5, 1)$#v(1em)
  + $B=mat(-3, 1; 2, 1)$#v(1em)
  + $C=mat(-3, 2; 2, 1)$
  + Calculate the eigenvalues of $C$. How do they relate to the singular values you found?
]


#slide(title: [11.23 & 11.24], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .87em)
  //
  #show: columns
  All matrices (even non-square ones) have singular values.

  Let $A$ be a matrix (maybe _not_ square).

  + What is the size of $A^T A$?
  + Can $A^T A$ be diagonalized? Orthogonally diagonalized?
  + Let $arrow(v)$ be an eigenvector for $A^T A$ with eigenvalue $lambda$.

    How do $(A arrow(v)) dot (A arrow(v))$ and $arrow(v)^T A^T A arrow(v)$ relate? What can you
    conclude about $lambda$?

  + *Theorem*: The *singular values* of $A$ are equal to as the square roots of the eigenvalues of
    $A^T A$.

    Why does it make sense to take a square root here?

  + What would change if we considered $A A^T$ instead of $A^T A$?
]


#slide(title: [], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .80em)
  //
  #show: columns
  *Theorem: (Singular Value Decomposition)* Every matrix $A$ (square or not) can be factored as
  $
    A=U Sigma V
  $
  where $U$ and $V$ are orthogonal matrices and $Sigma$ is a (maybe non-square) diagonal matrix with
  the singular values of $A$ on the diagonal.

  + Suppose $A$ is an $m times n$ matrix. What sizes are $U$, $Sigma$, and $V$?

  + Sometimes the SVD formula is written as "there exists orthogonal $U$ and $V$ and a diagonal
    $Sigma$ such that $A=U Sigma V^T$". Why is this equivalent to the theorem stated at the top of
    the slide?

  + Let $A$ be an unknown matrix. Suppose $U$ corresponds to the identity transformation, $V$
    rotation counter-clockwise by $90 degree$, and the singular values are $1/2$ and $3$.

    Find $A$. Is there any ambiguity in your answer?

  + Transform the picture #emoji.face.smile.slight by the matrix $A$ from the previous part.

  + An unknown matrix $B$ has singular values $2$ and $3$. In what ways could $B$ transform
    #emoji.face.smile.slight? In what ways could $B$ *not* transform #emoji.face.smile.slight?
]
