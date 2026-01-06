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
  + $2G=G+G = G + (0+G)$. Evaluate this formula using both your result from the Cesàro sum and the
    symbolic form of $G$.
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
  + Symbolically manipulate $S-B$ to find an expression for $S-B$ in terms of $S$.
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
