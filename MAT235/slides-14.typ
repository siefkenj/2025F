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

#slide(title: [Siefken 4], autoscale: false)[
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

#slide(title: [Siefken 5], autoscale: false)[
  #set text(size: .85em)

  #columns(2)[
    For this question, $Delta$ represents a small number.

    #h(1em)Let $f: RR -> RR$

    + If $f'(2)=K$ and $f(2)=J$ then $f(2+Delta) approx space.thin ??$ (fill in the $??$)
      #v(.5em)

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

#slide(title: [Siefken 6], autoscale: false)[
  #set text(size: .85em)

  #columns(2)[
    Suppose the graph of $z=f(x,y)$ is a plane with normal vector $mat(1; 2; 3)$.

    + Find $partial/(partial x) f(x,y)$.#v(1em)
    + Find $partial/(partial y) f(x,y)$.
      #v(1fr)

      #colbreak()
      Suppose the graph of $z=g(x,y)$ is a plane and $partial /(partial x) g (x,y)=4$ and
      $partial /(partial y) g (x,y)=2$.

    + Find an equation for the plane.
    + Find a normal vector for the plane.
  ]
]

#slide(title: [Hughes-Hallett et al. Ex. 4], autoscale: false)[
  #set text(size: .85em)

  #columns(2)[
    A guitar string is vibrating.
    #{
      set align(center)
      image("images/guitar-neck.jpg")
    }
    Let $L$ be the distance down the down the fret board and let $W$ be distance across the neck.

    The displacement of a guitar string at time t (seconds) is given by
    $
      W(t) = 0.003 sin(pi L) sin(2765 t)
    $

    + Find $f_L (0.3,1)$ and $f_t (0.3, 1)$ (you can use a calculator).
    + What does $f_L (0.3,1)$ and $f_t (0.3,1)$ mean in practical terms?
  ]
]


#slide(title: [Siefken 7], autoscale: false)[
  #set text(size: .9em)

  #columns(2)[
    Recall that the temperature inside the earth at position $(x,y,z)$ is (approximately) given by
    $
      T(x,y,z) = -2(sqrt(x^2 + y^2 + z^2) - 3)^(1/3)+2
    $
    In this model, $(0,0,6.3)$ represents the North Pole and $(0,0,-6.3)$ represents the South Pole.

    + What do the level surfaces of $T$ look like?
    + If you are at position $(0,0,6)$ inside the earth, what do you expect to be largest:
      $(partial T)/(partial x)$, $(partial T)/(partial y)$, or $(partial T)/(partial z)$? (Hint: you
      can do this without computing.)
    + The point $(a,b,c)$ inside the earth lies on a level curve of $T$. Is it true that at
      $(a,b,c)$, at least one of $(partial T)/(partial x)$, $(partial T)/(partial y)$, or
      $(partial T)/(partial z)$ is zero? Explain.

  ]
]

#slide(title: [Siefken 8], autoscale: false)[
  #set text(size: .75em)

  #columns(2)[
    #{
      let a = lq.diagram(
        title: [$z=f(x,y)$],
        width: 6cm,
        height: 6cm,
        lq.contour(
          levels: (4, 8, 12, 16, 20, 24, 28, 32),
          lq.linspace(-2, 5, num: 40),
          lq.linspace(-2, 5, num: 40),
          (x, y) => x * x + y * y,
          map: color.map.icefire,
        ),
        xlim: (-0, 4),
        ylim: (-0, 4),
        xaxis: (ticks: lq.arange(-4, 5, step: 1)),
        yaxis: (ticks: lq.arange(-4, 5, step: 1)),
        // lq.place(3.5, 3.5, $5$),
        lq.place(2.9, 2.9, $16$),
        lq.place(2.1, 2.1, $8$),
        lq.place(2., 2.9, $12$),
        // lq.place(1.5, 1.5, $2$),
        // lq.place(.9, .9, $1$),
      )
      set align(center)
      a
    }
    #colbreak()
    To the left is a contour plot of $f(x,y)=x^2+y^2$.

    + Add a contour line for height $14$ to the diagram. Should it lie exactly half way between the
      lines of height $12$ and $16$? Explain.
    + Draw a zoomed in version of the contour plot in the region $2 <= x <= 3$ and $2 <= y <= 3$.
      Include contours of height $8$, $9$, ..., $16$.
    + If you drew a contour plot zoomed into the region $2 <= x <= 2.1$ and $2 <= y <= 2.1$, what
      would it look like?
  ]
]

#slide(title: [Siefken 9], autoscale: false)[
  #set text(size: 1em)

  #columns(2)[
    #{
      let a = lq.diagram(
        title: [$z=f(x,y)$],
        width: 6cm,
        height: 6cm,
        lq.contour(
          levels: (4, 8, 12, 16, 20, 24, 28, 32),
          lq.linspace(-2, 5, num: 40),
          lq.linspace(-2, 5, num: 40),
          (x, y) => x * x + y * y,
          map: color.map.icefire,
        ),
        xlim: (-0, 4),
        ylim: (-0, 4),
        xaxis: (ticks: lq.arange(-4, 5, step: 1)),
        yaxis: (ticks: lq.arange(-4, 5, step: 1)),
        // lq.place(3.5, 3.5, $5$),
        lq.place(2.9, 2.9, $16$),
        lq.place(2.1, 2.1, $8$),
        lq.place(2., 2.9, $12$),
        // lq.place(1.5, 1.5, $2$),
        // lq.place(.9, .9, $1$),
      )
      set align(center)
      a
    }
    #colbreak()
    To the left is a contour plot of $f(x,y)=x^2+y^2$. Let $cal(P)$ be the *tangent plane* to
    $z=f(x,y)$ at the point $(2,2,8)$.

    + What is the slope of $cal(P)$ in the $arrow(i)$ direction?
    + What is the slope of $cal(P)$ in the $arrow(j)$ direction?
    + Add contour lines for $cal(P)$ to the diagram.
    + Find an equation for $cal(P)$.
  ]
]

#slide(title: [Siefken 10], autoscale: false)[
  #set text(size: 1em)

  #columns(2)[
    Consider the plane $cal(P)$ with formula
    $
      z=f(x,y)=2x+3y+4.
    $
    + Find the change in height ($Delta z$) if you start at $(0,0,4)$ and move $alpha$ units in the
      $arrow(i)$ direction.
    + Find $Delta z$ if you start at $(0,0,4)$ and move $beta$ units in the $arrow(j)$ direction.
    + Find $Delta z$ if you start at $(0,0,4)$ and move $gamma$ units in the $mat(1; 1)$ direction.
    + What is the _slope_ of $f$ in the $mat(1; 1)$ direction? Is it the same as your answer to the
      previous question?
  ]
]

#slide(title: [Siefken 11], autoscale: false)[
  #set text(size: 1em)

  #show: columns.with(2)
  The *directional derivative* of a function $f: RR^2 ->RR$ at the point $arrow(p)$ *in the
    direction* $arrow(v)$ is
  $
    f_(arrow(v))(arrow(p)) = lim_(h -> 0) (f(arrow(p) + h arrow(v)) - f(arrow(p))) / h .
  $

  Let $f(x,y) = 2x + 3y + 4$.

  + Find $f_(arrow(i))(1,2)$ and $f_(arrow(j))(1,2)$.
  + Let $arrow(v)=mat(-2; 5)$. Find $f_(arrow(v))(1,2)$.
  + Suppose $g(x,y) = a x + b y +c$ represents a plane.

    Let $arrow(p)=mat(p_1; p_2)$ be a point and let $arrow(v)=mat(v_1; v_2)$ be a vector.

    Find a formula for $g_(arrow(v))(arrow(p))$.
  // is a *linear
  //   function* $D:RR^2 -> RR$ such that
  // $
  //   f(arrow(p) + arrow(v)) approx f(arrow(p)) + D(arrow(v))
  // $
  // whenever $||arrow(v)||$ is small.
]

#slide(title: [Siefken 12], autoscale: false)[
  #set text(size: 1em)

  #show: columns.with(2)
  A function $f: RR^2 ->RR$ is *differentiable* at the point $arrow(p)$ if there exists a tangent
  plane $z=T(x,y)$ so that the directional derivatives of $f$ match the directional derivatives of
  $T$ (at $arrow(p)$).

  Let $f(x,y) = x^2 + y^2 + 3$. $f$ is differentiable.

  + Find the tangent plane to $f$ at $(1,2)$.

  + Find $f_(arrow(i))(1,2)$ and $f_(arrow(j))(1,2)$.
  + Let $arrow(v)=mat(-2; 5)$. Find $f_(arrow(v))(1,2)$.
  + Let $arrow(v)=mat(v_1; v_2)$ be a vector.

    Find a formula for $f_(arrow(v))(1,2)$.
]

#slide(title: [Siefken 13], autoscale: false)[
  #set text(size: 1em)

  For a function $f: RR^n -> RR$, the *gradient* of $f$ (written $nabla f$ or $"grad" f$) is the
  vector
  $
    nabla f =(partial/(partial x_1) f,space partial/(partial y) f,space ...).
  $
  #show: columns.with(2)
  Let $T(x,y) = 2x+3y+4$

  + Find $T_(arrow(v)) (1,2)$ where $arrow(v)=mat(v_1; v_2)$ is an arbitrary vector.

  + Find $nabla T$.
  + Compute $nabla T dot arrow(v)$ where $arrow(v)=mat(v_1; v_2)$ is an arbitrary vector. What do
    you notice?
]

#slide(title: [Siefken 14], autoscale: false)[
  #set text(size: 1em)

  #show: columns.with(2)
  Let $arrow(v)=mat(v_1; v_2)$. Recall, for $f(x,y) = x^2 + y^2 + 3$ that
  $
    f_(arrow(v))(1,2) = 2 v_1 + 4 v_2
  $


  + Compute $nabla f(1,2)$.
  + Rewrite $f_(arrow(v))(1,2)$ using $nabla f(1,2)$.

  + Let $arrow(p)=(p_1,p_2)$. Find an expression for $f_(arrow(v))(arrow(p))$.

  + If $g: RR -> RR$ is a differentiable function, from single variable calculus, we know
    $
      g(p+ Delta x) approx g(p) + g'(p) Delta x.
    $
    Find a similar expression for $f(arrow(p) + Delta arrow(v))$.
]
