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
    title: [MAT235 Slides LEC0401 (Chapter 14)],
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

#slide(title: [Siefken 1])[
  Consider the function $f(x,y) = x^2-x y+1+y^2$.

  + Visualize the graph of this function using a contour map and slices.
  + Let $z=s(y)$ be the slice of $z=f(x,y)$ that you get by setting $x=2$.

    Find an equation for $s(y)$.
  + Graph $z=s'(y)$, where $s'$ indicates the derivative of $s$.
]

#slide(title: [Siefken 2])[
  Consider the function $f(x,y) = x^2-x y+1+y^2$.

  + Does $f'(x,y)$ (i.e., the derivative of $f$) make sense? Why or why not?
  + Does $f'(2,y)$ make sense? If so, what rate of change does it represent?
  + Define $s(y) = f(k,y)$ for an unknown (but fixed) $k$.

    How do you write $s'(y)$ using Leibniz notation? (I.e. in $(d?) / (d?)$ form.)

    Compute $s'(y)$
]

#slide(title: [Siefken 3])[
  Consider the function $f(x,y) = x^2-x y+1+y^2$.

  The *partial derivative* of $f$ with respect to $y$ is notated by
  $display((partial)/(partial y)f(x,y))$ or by $f_y (x,y)$ and is the instantaneous rate of change
  of $f$ as $y$ changes while $x$ is held constant.

  + Find $partial/(partial y) f(2,y)$.#v(1em)
  + Find $partial/(partial x) f(x,2)$.#v(1em)
  + Find $f_x$ and $f_y$ at $(2,2)$.
]

#slide(title: [Siefken 4])[
  Consider the function $f(x,y) = x^2-x y+1+y^2$.

  The *partial derivative* of $f$ with respect to $y$ is notated by
  $display((partial)/(partial y)f(x,y))$ or by $f_y (x,y)$ and is the instantaneous rate of change
  of $f$ as $y$ changes while $x$ is held constant.

  + Find $partial/(partial y) f(2,y)$.#v(1em)
  + Find $partial/(partial x) f(x,2)$.#v(1em)
  + Find $f_x$ and $f_y$ at $(2,2)$.
]

#slide(title: [Siefken 5], autoscale: false)[
  #set text(size: .85em)

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
    #colbreak()
    To the left is a contour plot of $f$.

    + Estimate $partial/(partial x) f(2,2)$.#v(1em)
    + Estimate $partial/(partial y) f(2,2)$.#v(1em)
    + Find formulas for $partial/(partial x) f(x,y)$ and $partial/(partial y) f(x,y)$.#v(.7em)
    + Starting at $(2,2)$, if you moved $10$ units in the $arrow(i)$ direction and $3$ units in the
      $arrow(j)$ direction, what would your elevation be?
  ]
]

#slide(title: [Siefken 6], autoscale: false)[
  #set text(size: .85em)

  #columns(2)[
    For this question, $Delta$ represents a small number.

    #h(1em)Let $f: RR -> RR$

    + If $f'(2)=K$ and $f(2)=J$ then $f(2+Delta) approx space.thin ??$ (fill in the $??$)

      Let $g:RR^2 -> RR$.
    + If $g_x (2,2)=K$ and $g(2,2)=J$ then
      $
        g(2+Delta, 2) approx space.thin ??
      $
      (fill in the $??$)
    + Do you have enough information to approximate $g(2, 2+ Delta)$? If not, what additional
      information do you need?
    + Suppose $g_y (2,2)=L$.

    Approximate $g(2-Delta, 2+Delta)$
  ]
]

#slide(title: [Siefken 7], autoscale: false)[
  #set text(size: .85em)

  #columns(2)[
    Suppose the graph of $z=f(x,y)$ is a plane with normal vector $mat(1; 2; 3)$.

    + Find $partial/(partial x) f(x,y)$.#v(1em)
    + Find $partial/(partial y) f(x,y)$.

      #colbreak()
      Suppose the graph of $z=g(x,y)$ is a plane and $partial /(partial x) g (x,y)=4$ and
      $partial /(partial y) g (x,y)=2$.

    + Find an equation for the plane.
    + Find a normal vector for the plane.
  ]
]
