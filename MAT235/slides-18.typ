#import "@preview/colorful-boxes:1.4.3" as cb
#import "@preview/touying:0.6.1": *
#import themes.metropolis: *
#import themes.metropolis: slide as slide-orig
#import "@preview/lilaq:0.5.0" as lq
#import "@preview/itemize:0.2.0"
#show: itemize.default-enum-list

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
    title: [MAT235 Slides LEC0401 (Chapter 18)],
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

#slide(title: [Siefken 1], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    Recall that work is $"force" dot "displacement"$.

    Let $arrow(F)(x,y)=(-2,0)$ denote the force of the wind.

    Let $A=(0,0)$, $B=(3,0)$, and $C=(3,3)$.

    + Draw $arrow(F)$.
    + To move from $A$ to $B$, how much work is required?
    + To move from $B$ to $A$, how much work is required?
    + To move from $B$ to $C$, how much work is required?
    + How much work is required to move from $A$ to $B$ to $C$? Does this differ from moving
      directly from $A$ to $C$ in a straight line?

  ]
]

#slide(title: [Siefken 2], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    Let $arrow(F)(x,y)=cases((-2,0) & "if" y < 2, (-4,0) & "if" y >= 2)$ denote the force of an
    uneven wind.

    Let $A=(0,0)$, $B=(3,0)$, and $C=(3,3)$.

    + Draw $arrow(F)$.
    + To move from $A$ to $B$, how much work is required?
    + To move from $B$ to $A$, how much work is required?
    + To move from $B$ to $C$, how much work is required?
    + How much work is required to move from $A$ to $B$ to $C$? Does this differ from moving
      directly from $A$ to $C$ in a straight line?

  ]
]

#slide(title: [Siefken 3], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    Let $arrow(F)(x,y)=(-y, 0)$ denote the force of an uneven wind.

    Let $A=(0,0)$ and $B=(3,3)$.

    + Draw $arrow(F)$.

      You are moving from $A$ to $B$ in a straight line. Let $W$ denote the work required to do so.
    + Does $arrow(F)(0,0) dot B$ overestimate or underestimate $W$? What about
      $arrow(F)(3,3) dot B$?
    + Is $arrow(F)(0,0) dot 1/2 B + arrow(F)(1.5,1.5) dot 1/2 B$ more or less accurate than the
      previous estimates?
    + Write down a limit that will give the exact value of $W$.
    + Can you express $W$ as an integral?
    + Does the speed at which you move from $A$ to $B$ affect the value of $W$?
  ]
]

#slide(title: [Siefken 4], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .85em)

  #columns(2)[
    Let $arrow(F)(x,y)=(-y, 0)$ denote the force of an uneven wind.

    Let $A=(0,0)$ and $B=(3,3)$.

    + Write down a function $arrow(r): RR -> RR^2$ that traces out a straight-line path from $A$ to
      $B$ with $arrow(r)(0)=A$ and $arrow(r)(1)=B$.

    + How should you interpret $arrow(F)(arrow(r)(t))$?
    + What does the quantity $arrow(F)(arrow(r)(t)) dot arrow(r)'(t)$ represent?
    + Write down an integral that gives the exact amount of work moving along path $arrow(r)$ from
      time $t=0$ to $t=1$.

      Evaluate the integral.
    + Let $arrow(q)(t)=(3t^2, 3t^2)$.
      #set enum(numbering: "(a)")
      + What is the graph of $arrow(q)$?
      + Compute much work is done moving along the path of $arrow(q)$ from time $t=0$ to $t=1$.
      + Is your answer the same or different compared to moving along the path of $arrow(r)$? Why?
  ]
]

#slide(title: [Siefken 5], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    Let $h(x,y)=-x^2-2y^2$ denote a height of a hill.

    + Starting at $arrow(p)=(2,3)$ you start walking in the direction of $arrow(v)=(-1,1)$.

      What does the quantity $nabla h(arrow(p)) dot arrow(v)$ represent?
    + You walk (staring at $arrow(p)$) with velocity $arrow(v)$ for $4$ seconds.
      #set enum(numbering: "(a)")
      + What is your ending location?
      + Find a function $arrow(r): RR -> RR^2$ that parameterizes your path (in the $x y$-plane).
      + Find the total change in height between your starting an ending locations.#v(1em)
      + Compute $display(integral_0^4 nabla h(arrow(r)(t)) dot arrow(r)'(t) dif t)$. Does this equal
        your change in height? Why?
  ]
]

#slide(title: [Siefken 6], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    A vector field $arrow(F): RR^n -> RR^m$ is called *conservative* or *path independent* if for
    any points $A$ and $B$, the work done by $arrow(F)$ moving between points $A$ and $B$ does not
    depend on the path taken from $A$ to $B$.


    #{
      let width = 4cm
      let height = width
      let plot(f, title: none) = {
        lq.diagram(
          title: title,
          width: width,
          height: height,
          lq.quiver(
            lq.arange(-2, 3, step: .5),
            lq.arange(-2, 3, step: .5),
            f,
          ),
          xaxis: none,
          yaxis: none,
        )
      }

      plot((x, y) => (x, y), title: [X])
      h(1fr)
      // plot((x, y) => (y, x), title: [B])
      // h(1fr)
      plot((x, y) => (-y, x), title: [Y])
      h(1fr)
      // plot((x, y) => (x, -y), title: [D])
      // h(1fr)
      // plot((x, y) => (x * x, 1), title: [E])
      // h(1fr)
      plot((x, y) => ((1.5 + calc.abs(y)), 0), title: [Z])
    }
    + Based on the pictures, which vector fields are _conservative_?
    + Suppose $arrow(F)= nabla f$ for some function $f: RR^2 -> RR$. Is $arrow(F)$ conservative? Why
      or why not?
  ]
]
