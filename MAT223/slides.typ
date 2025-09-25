#import "@preview/colorful-boxes:1.4.3" as cb
#import "@preview/touying:0.6.1": *
#import "@preview/cetz:0.4.2"
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
  + If $T: RR^a -> RR^b$ is a linear transformation, what shape will its defining be?
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
