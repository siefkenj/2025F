#import "@preview/colorful-boxes:1.4.3" as cb
#import "@preview/touying:0.6.1": *
#import themes.metropolis: *
#import themes.metropolis: slide as slide-orig
#import "@preview/lilaq:0.4.0" as lq

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
    title: [MAT235 Slides LEC0401],
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
  Vectors represent *displacement*.

  You are on the prairies, where it is very flat. The vector $arrow(v)$ represents a displacement
  East by 2km. The vector $arrow(c)$ represents a displacement due North-East by 3km.

  + Draw a diagram for the following situation: You walk by following $arrow(v)$ twice and then
    $arrow(c)$ once.
  + Write an algebraic expression that describes "You walk by following $arrow(v)$ twice and then
    $arrow(c)$ once."
  + If you start at East-North coordinates of $(0,0)$, what are the coordinates of your final
    position?
  + What is your *distance* from $(0,0)$ after you walk?
]

#slide(title: [Siefken 2], autoscale: false)[
  #set text(size: .8em)
  The *standard basis vectors* (in MAT235) are called
  $
    arrow(i) wide arrow(j) wide arrow(k)
  $
  They are vectors of length 1 pointing in the directions of the (positive) $x$, $y$, and $z$-axes.

  + Describe the displacement between the points $(1,2,3)$ and $(-2, 4,3)$ using the standard basis
    vectors.
  + The vector $a arrow(i) + b arrow(j) + c arrow(k)$ is written in *column vector* form as
    $mat(a; b; c)$ or $mat(delim: "[", a; b; c)$. Express your answer to the previous question as a
    column vector.
  + Let $arrow(d) = arrow(i) + 3 arrow(j) - 3 arrow(k)$. Suppose you start at $(0,0,0)$ and displace
    by $arrow(d)$. What are your coordinates?
]

#slide(title: [Siefken 3], autoscale: false)[
  The context for this question is $RR^2$.
  + Consider the point $(a,b)$ and the vector $mat(a; b)$. What's the difference between the two?
    How can you convert from one to the other?
  + Find a vector pointing in the direction of the line $y=1/2x$ in $RR^2$.
  + Find a *unit* vector (i.e., a vector of length 1) in the direction of the line $y=1/2x$ in
    $RR^2$.
]

#slide(title: [Siefken 4], autoscale: false)[
  #set text(size: .79em)
  The context for this question is $RR^2$.

  You are moving counter-clockwise around a circle X, which has a radius of 2 and is centered at the
  origin. You make one revolution around the circle X every 360 seconds, and you start at the
  right-most point.

  + What is your location after 90 seconds?
  + What is your displacement from your starting point after 90 seconds? Give your answer as a
    column vector.
  + You are now traveling around circle Y. Circle Y has a radius of 2 and is centered at (4,1). You
    make one trip around circle Y every 360 seconds, and you start at the right-most point of circle
    Y.

    What is your location after 90 seconds?
  + What is your displacement from your starting point after 90 seconds? Give your answer as a
    column vector.
]

#slide(title: [Siefken 8 (Ch 12)])[
  Recall the plane $cal(P)$ given by the formula $z=2x-y$.
  + Sketch the contour map of $cal(P)$.
  + Starting from $(0,0,0)$, in what direction does $cal(P)$ have *a slope of zero*? Give your
    answer as a vector.
  + Starting from $(0,0,0)$, in what direction does $cal(P)$ have the *steepest* slope? Give your
    answer as a vector.
  + The vector $arrow(c)$ has the following property: if you start at $(0,0,0)$ and displace by
    $arrow(c)$ you are guaranteed to be on the plane $cal(P)$.

    Give _three_ different examples of possible vectors $arrow(c)$.
]

