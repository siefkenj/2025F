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
    title: [MAT235 Slides LEC0401 (Chapter 15)],
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
    #{
      let s = 3cm
      let a = lq.diagram(
        title: [A],
        width: s,
        height: s,
        lq.contour(
          // levels: (4, 8, 12, 16, 20, 24, 28, 32),
          lq.linspace(-4, 5, num: 40),
          lq.linspace(-4, 5, num: 40),
          (x, y) => x * x + y * y,
          map: color.map.icefire,
        ),
        xlim: (-4, 4),
        ylim: (-4, 4),
        xaxis: (ticks: lq.arange(-4, 6, step: 2)),
        yaxis: (ticks: lq.arange(-4, 6, step: 2)),
        // lq.place(3.5, 3.5, $5$),
        // lq.place(1.5, 1.5, $2$),
        // lq.place(.9, .9, $1$),
      )
      let b = lq.diagram(
        title: [B],
        width: s,
        height: s,
        lq.contour(
          // levels: (4, 8, 12, 16, 20, 24, 28, 32),
          lq.linspace(-4, 5, num: 40),
          lq.linspace(-4, 5, num: 40),
          (x, y) => x * x - y * y,
          map: color.map.icefire,
        ),
        xlim: (-4, 4),
        ylim: (-4, 4),
        xaxis: (ticks: lq.arange(-4, 6, step: 2)),
        yaxis: (ticks: lq.arange(-4, 6, step: 2)),
        // lq.place(3.5, 3.5, $5$),
        // lq.place(1.5, 1.5, $2$),
        // lq.place(.9, .9, $1$),
      )
      let c = lq.diagram(
        title: [C],
        width: s,
        height: s,
        lq.contour(
          // levels: (4, 8, 12, 16, 20, 24, 28, 32),
          lq.linspace(-4, 5, num: 40),
          lq.linspace(-4, 5, num: 40),
          (x, y) => 2 * x * x - calc.cos(4 * y),
          map: color.map.icefire,
        ),
        xlim: (-4, 4),
        ylim: (-4, 4),
        xaxis: (ticks: lq.arange(-4, 6, step: 2)),
        yaxis: (ticks: lq.arange(-4, 6, step: 2)),
        // lq.place(3.5, 3.5, $5$),
        // lq.place(1.5, 1.5, $2$),
        // lq.place(.9, .9, $1$),
      )
      let d = lq.diagram(
        title: [D],
        width: s,
        height: s,
        lq.contour(
          // levels: (4, 8, 12, 16, 20, 24, 28, 32),
          lq.linspace(-4, 5, num: 40),
          lq.linspace(-4, 5, num: 40),
          (x, y) => 2 * x + y,
          map: color.map.icefire,
        ),
        xlim: (-4, 4),
        ylim: (-4, 4),
        xaxis: (ticks: lq.arange(-4, 6, step: 2)),
        yaxis: (ticks: lq.arange(-4, 6, step: 2)),
        // lq.place(3.5, 3.5, $5$),
        // lq.place(1.5, 1.5, $2$),
        // lq.place(.9, .9, $1$),
      )
      show: block.with(breakable: false)
      table(
        columns: 2,
        stroke: none,
        a, b,
        c, d,
      )
    }

    For each contour plot, determine if the contour heights can be labeled so that:
    + There is a *local maximum* at the origin.
    + There is a *unique* local maximum at the origin.
    + There is no local maximum at the origin.
    + There is no *local extreme* at the origin.
  ]
]
