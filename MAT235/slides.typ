#import "@preview/colorful-boxes:1.4.3" as cb
#import "@preview/touying:0.6.1": *
#import themes.metropolis: *
#import themes.metropolis: slide as slide-orig
#import "@preview/lilaq:0.4.0" as lq

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
  Multi-variable functions are functions from multiple inputs to multiple outputs.

  When there is one input and one output we can visualize a function by graphing inputs on the
  $x$-axis and outputs on the $y$-axis.

  + What are some ways we might visualize a function with two inputs and one output?

    Come up with several ideas.
]


#slide(title: [Siefken 2])[
  #let F(x, y) = calc.round(20 + (-(x - 1) * (x - 1) - y * y) / 5)

  The following table describes the elevation of various locations in a campground (in meters) at
  various distances (in km) East and North of the campground entrance.

  #{
    set align(center)
    table(
      columns: 5,
      [N \\ E], [1], [2], [3], [4],
      [1], [#F(1, 1)], [#F(1, 2)], [#F(1, 3)], [#F(1, 4)],
      [2], [#F(2, 1)], [#F(2, 2)], [#F(2, 3)], [#F(2, 4)],
      [3], [#F(3, 1)], [#F(3, 2)], [#F(3, 3)], [#F(3, 4)],
      [4], [#F(4, 1)], [#F(4, 2)], [#F(4, 3)], [#F(4, 4)],
    )
  }

  + Make a sketch of elevation vs. position if you started hiking at $(1,1)$ and headed directly
    East.
  + Make a sketch of elevation vs. position if you started hiking at $(1,1)$ and headed directly
    North.
  + If you walked around the entire campground, where would you encounter the steepest slope?
    Justify your answer.

]

#slide(title: [Siefken 3])[
  #let F(x, y) = calc.round(20 + (-(x - 1) * (x - 1) - y * y) / 5)

  The following table describes the elevation of various locations in a campground (in meters) at
  various distances (in km) East and North of the campground entrance.

  #{
    set align(center)
    table(
      columns: 5,
      [N \\ E], [1], [2], [3], [4],
      [1], [#F(1, 1)], [#F(1, 2)], [#F(1, 3)], [#F(1, 4)],
      [2], [#F(2, 1)], [#F(2, 2)], [#F(2, 3)], [#F(2, 4)],
      [3], [#F(3, 1)], [#F(3, 2)], [#F(3, 3)], [#F(3, 4)],
      [4], [#F(4, 1)], [#F(4, 2)], [#F(4, 3)], [#F(4, 4)],
    )
  }

  A _topographic map_ shows geographic features by including lines of constant elevation.

  + Sketch a topographic map of the campground.

]



#slide(title: [Siefken 4])[
  #{
    let a = lq.diagram(
      title: [Map A],
      width: 4cm,
      height: 4cm,
      lq.contour(
        lq.linspace(-5, 5, num: 20),
        lq.linspace(-5, 5, num: 20),
        (x, y) => x * y,
        map: color.map.icefire,
      ),
    )
    let b = lq.diagram(
      title: [Map B],
      width: 4cm,
      height: 4cm,
      lq.contour(
        lq.linspace(-5, 5, num: 20),
        lq.linspace(-5, 5, num: 20),
        (x, y) => x - y,
        map: color.map.icefire,
      ),
    )
    let c = lq.diagram(
      title: [Map C],
      width: 4cm,
      height: 4cm,
      lq.contour(
        lq.linspace(-5, 5, num: 20),
        lq.linspace(-5, 5, num: 20),
        (x, y) => (x) * (x - 5),
        map: color.map.icefire,
      ),
    )
    set align(center)
    grid(
      columns: 3,
      gutter: 2em,
      a, b, c,
    )
  }

  + Which of the contour maps above could represent a plane? (i.e., a flat surface)

    Which ones could definitely _not_ represent a plane? Explain.
]

#slide(title: [Siefken 5])[
  Draw a contour plot for a cone where:
  + The tip is pointing straight up.
  + The tip is pointing straight down.
  + The tip is pointing directly along the $x$-axis.
  + The tip is pointing in the direction of the line $y=x$ (in the $x y$-plane).
]
