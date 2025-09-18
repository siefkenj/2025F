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
