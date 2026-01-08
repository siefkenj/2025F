#import "@preview/colorful-boxes:1.4.3" as cb
#import "@preview/touying:0.6.1": *
#import themes.metropolis: *
#import themes.metropolis: slide as slide-orig
#import "@preview/lilaq:0.5.0" as lq

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
    title: [MAT235 Slides LEC0401 (Chapter 16)],
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
    Let $f:RR -> RR$ be a function.

    + Explain in words what "the integral from $a$ to $b$ of $f$" means.
    + Write down the *left-endpoint approximation* to "the integral from $a$ to $b$ of $f$".
    + In the expression $display(integral_a^b f(x) dif x)$, what does the "$dif x$" represent?
    + In multi-variable calculus, we often write "the integral from $a$ to $b$ of $f$" as
      $
        display(integral_R f(x) dif x)
      $
      where $R = space.thin ??$. What could $R$ be in this case?
  ]
]

#slide(title: [Siefken 2], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .8em)

  #columns(2)[
    #{
      let a = lq.diagram(
        title: [$z=f(x,y)$],
        width: 6cm,
        height: 6cm,
        lq.contour(
          lq.linspace(-5, 5, num: 20),
          lq.linspace(-5, 5, num: 20),
          (x, y) => 2 * x + y,
          map: color.map.icefire,
        ),
        xlim: (-0, 4),
        ylim: (-0, 4),
        xaxis: (ticks: lq.arange(-4, 5, step: 1)),
        yaxis: (ticks: lq.arange(-4, 5, step: 1)),
        lq.place(3.5, 3.5, $5$),
        lq.place(2.8, 2.8, $4$),
        lq.place(2.2, 2.2, $3$),
        lq.place(1.5, 1.5, $2$),
        lq.place(.9, .9, $1$),
      )
      set align(center)
      a
    }
    // #colbreak()

    We'd like to find *volume*, $V$, under the surface $z=f(x,y)$ on the region
    $R=[0,4] times [0,4]$.

    + What would a "left-endpoint approximation" to $V$ look like? How could you find it?
    + Using $2 times 2$ squares, find an over estimate and under estimate for $V$.
    + How could you use a limit to get an exact value for $V$?
    + In multi-variable calculus,
    $
      V = integral_R f dif A
    $
    Explain why this notation makes sense. What does the $dif A$ represent?
  ]
]

#slide(title: [Siefken 3], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    #[
      #set text(size: .9em)
      $P(x,y)$ represents the population *density* (people per square kilometer) on the $3 times 2$
      km town of Rectville.
      #image("images/density-1.png", width: 9cm)
    ]

    + Write down a set that defines the *region* that Rectville occupies.
    + At $(0,0)$, $P=1000$. What does that mean?
    + About how many people are in the $1/10 times 1/10$ km region near $(0,0)$?
    + Set up an integral to find the total population of Rectville.
    + Estimate the total population of Rectville.

    #text(size: .8em)[
      The figure for Rectville came from Calculus: Multivariable by Hughes-Hallett et al.
    ]
  ]
]

#slide(title: [Siefken 4], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    The town of Elville has a population density given by $P(x,y)$ and a boundary shown below.
    #{
      let a = lq.diagram(
        // title: [$z=f(x,y)$],
        width: 7.5cm,
        height: 6cm,
        // lq.contour(
        //   lq.linspace(-5, 5, num: 20),
        //   lq.linspace(-5, 5, num: 20),
        //   (x, y) => 2 * x + y,
        //   map: color.map.icefire,
        // ),
        xlim: (-0, 5),
        ylim: (-0, 4),
        xaxis: (ticks: lq.arange(-4, 5, step: 1)),
        yaxis: (ticks: lq.arange(-4, 5, step: 1)),
        // lq.place(3.5, 3.5, $5$),
        // lq.place(2.8, 2.8, $4$),
        // lq.place(2.2, 2.2, $3$),
        // lq.place(1.5, 1.5, $2$),
        // lq.place(.9, .9, $1$),
        lq.path(
          (1, 0),
          (1, 3),
          (4, 3),
          (4, 1),
          (3, 1),
          (3, 0),
          (1, 0),
          stroke: 2pt + blue,
          fill: blue.lighten(60%).transparentize(50%),
        ),
      )
      set align(center)
      a
    }

    + Describe the region that defines Elville as a set.
    + Write down an integral that would give the total population of Elville.
    + Can you express the total population of Elville in terms of integrals over rectangular
      regions? If so, do it.
  ]
]

#slide(title: [Siefken 5], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    The town of Circville has a population density given by $P(x,y)$ and a boundary shown below.
    #{
      let a = lq.diagram(
        // title: [$z=f(x,y)$],
        width: 6cm,
        height: 6cm,
        // lq.contour(
        //   lq.linspace(-5, 5, num: 20),
        //   lq.linspace(-5, 5, num: 20),
        //   (x, y) => 2 * x + y,
        //   map: color.map.icefire,
        // ),
        xlim: (-0, 4),
        ylim: (-0, 4),
        xaxis: (ticks: lq.arange(-4, 5, step: 1)),
        yaxis: (ticks: lq.arange(-4, 5, step: 1)),
        // lq.place(3.5, 3.5, $5$),
        // lq.place(2.8, 2.8, $4$),
        // lq.place(2.2, 2.2, $3$),
        // lq.place(1.5, 1.5, $2$),
        // lq.place(.9, .9, $1$),
        lq.ellipse(
          1,
          1,
          width: 2,
          height: 2,
          stroke: 2pt + blue,
          fill: blue.lighten(60%).transparentize(50%),
        ),
      )
      set align(center)
      a
    }
    #colbreak()

    + Describe the region that defines Circville as a set.
    + Write down an integral that would give the total population of Circville.
    + Can you express the total population of Circville in terms of integrals over rectangular
      regions? If so, do it.
  ]
]

#slide(title: [Siefken 6], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    #{
      let a = lq.diagram(
        title: [$z=f(x,y)$],
        width: 6cm,
        height: 4cm,
        lq.contour(
          lq.linspace(-5, 5, num: 20),
          lq.linspace(-5, 5, num: 20),
          (x, y) => 2 * x,
          map: color.map.icefire,
        ),
        xlim: (-0, 4),
        ylim: (-0, 3),
        xaxis: (ticks: lq.arange(-4, 5, step: 1)),
        yaxis: (ticks: lq.arange(-4, 5, step: 1)),
        lq.place(2.8, .9, $6$),
        lq.place(1.8, .9, $4$),
        lq.place(.8, .9, $2$),
      )
      set align(center)
      a
    }

    $z=f(x,y)$ defines a plane.

    #colbreak()

    + Find an equation for $f(x,y)$.
    + Use geometry to find the exact value of
      $
        V = display(integral_([0,4] times [0,3])f dif A)
      $
    + Let $c$ be a constant. What does
      $
        W = display(integral_([0,4]) f(x,c)) dif x
      $
      mean geometrically? Find its exact value.
    + How can $W$ be used to find $V$?
  ]
]
#slide(title: [Siefken 7], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .75em)

  #columns(2)[
    Recall
    #{
      let a = lq.diagram(
        title: [$z=f(x,y)=2x$],
        width: 6cm,
        height: 4cm,
        lq.contour(
          lq.linspace(-5, 5, num: 20),
          lq.linspace(-5, 5, num: 20),
          (x, y) => 2 * x,
          map: color.map.icefire,
        ),
        xlim: (-0, 4),
        ylim: (-0, 3),
        xaxis: (ticks: lq.arange(-4, 5, step: 1)),
        yaxis: (ticks: lq.arange(-4, 5, step: 1)),
        lq.place(2.8, .9, $6$),
        lq.place(1.8, .9, $4$),
        lq.place(.8, .9, $2$),
      )
      set align(center)
      a
    }


    #colbreak()
    + Compute
      $
        integral_([0,3]) (integral_([0,4]) f(x,c) dif x) dif c
      $
    + Compute
      $
        integral_([0,4]) (integral_([0,3]) f(x,c) dif c) dif x
      $
    + Integrals like the above are called *iterated integrals*. How do the iterated integrals relate
      to $display(integral_([0,4] times [0,3]) f dif A)$?

      Do iterated integrals remind you of partial derivatives? If so, how?
  ]
]

#slide(title: [Siefken 8], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .75em)

  #columns(2)[
    #{
      let a = lq.diagram(
        title: [$z=f(x,y)=2x+y$],
        width: 6cm,
        height: 4cm,
        lq.contour(
          lq.linspace(-5, 5, num: 20),
          lq.linspace(-5, 5, num: 20),
          (x, y) => 2 * x + y,
          map: color.map.icefire,
        ),
        xlim: (-0, 4),
        ylim: (-0, 3),
        xaxis: (ticks: lq.arange(-4, 5, step: 1)),
        yaxis: (ticks: lq.arange(-4, 5, step: 1)),
      )
      set align(center)
      a
    }

    Let $R=[0,4] times [0,3]$. Let
    $
      V = integral_R f dif A
    $

    + Set up _two different_ iterated integrals to compute $V$.
    + Evaluate both iterated integrals to find $V$.
    + It is sometimes said that "$dif x dif y = dif A$". Does this statement make sense?
    + Is it true that
      $
        integral_([0,4]) integral_([0,3]) f(x,y) #text(fill: red, $dif y dif x$) = integral_([0,4]) integral_([0,3]) f(x,y) #text(fill: red, $dif y dif x$) ?
      $
    + Why would someone write
      $
        display(integral_(x in [0,4]) integral_(y in [0,3]) f(x,y) dif y dif x) " or "
        display(integral_(x=0)^(x=4) integral_(y=0)^(y=3) f(x,y) dif y dif x)
      $
      instead of
      $
        display(integral_([0,4]) integral_([0,3]) f(x,y) dif y dif x) wide "or" wide
        display(integral_0^4 integral_0^3 f(x,y) dif y dif x)?
      $
  ]
]

#slide(title: [Siefken 9], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .8em)

  #columns(2)[
    The town of Veeville has a population density given by $P(x,y)$ and a boundary shown below.
    #{
      let a = lq.diagram(
        // title: [$z=f(x,y)$],
        width: 6cm,
        height: 6cm,
        xlim: (-0, 4),
        ylim: (-0, 4),
        xaxis: (ticks: lq.arange(-4, 5, step: 1)),
        yaxis: (ticks: lq.arange(-4, 5, step: 1)),
        lq.path(
          (2, 0),
          (1, 3),
          (3, 3),
          (2, 0),
          stroke: 2pt + blue,
          fill: blue.lighten(60%).transparentize(50%),
        ),
      )
      set align(center)
      a
    }
    #colbreak()

    Let $D$ be the region defining Veeville and let $Q$ be its total population.

    + Find a formulas for $L(y)$ and $R(y)$ that give the the *leftmost* and *rightmost* points in
      $D$ with $y$-coordinate equal to $y$.

      What is the domain of $L$ and $R$?

    + Fill in the ? in the population integral:
      $
        Q= integral_(?=?)^(?=?) integral_(?=L(y))^(?=R(y)) P(x,y) dif ? dif ?
      $

    + Find an iterated integral to compute $Q$ in terms of $dif y dif x$.

    // _Hint:_ You may need to split the integral into two parts.
  ]
]

#slide(title: [Siefken 10], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .9em)

  #columns(2)[
    The town of Wackville has a population density given by $P(x,y)$ and a boundary enclosed on the
    north by $y=-x^2+4$ and on the south by $y=-x$.

    Let $D$ be the region defining Wackville and let $Q$ be its total population.

    + Sketch $D$.

    + Set up an iterated integral to compute $Q$ in terms of $dif x dif y$.
    + Set up an iterated integral to compute $Q$ in terms of $dif y dif x$.
    + The population density is given by the function $P(x,y) = (x+y)/10+20$.

      Use the integral of your choice to compute the exact population of Wackville.
  ]
]
