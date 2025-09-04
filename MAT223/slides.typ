#import "@preview/colorful-boxes:1.4.3" as cb
#import "@preview/touying:0.6.1": *
#import themes.metropolis: *
#import themes.metropolis: slide as slide-orig

#let slide(..args) = {
  let title = args.named().at("title", default: none)
  let positional = args.pos()
  slide-orig(..args.named(), title: text(size: 18pt, title), ..positional.map(p => {
    show: utils.fit-to-height.with(100%, grow: false)
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
      - The system has a _unique solution_ if and only if and only if *every column* and *every row*
        of $"rref"(C)$ has a pivot.
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
