#import "@preview/colorful-boxes:1.4.3" as cb
#import "@preview/touying:0.6.1": *
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
        "rref"(C) = mat(1, 2, 0, 2; 0, 0, 1, 1; augment: #3)
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

    $X = V union H$, $Y = V sect H$,
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
  + Restate the definition of Linearly Dependent in terms of a systems of equations.
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
  column.

  + Prove Proposition 2.12.

    _Hint: use Rouché-Capelli._
]
