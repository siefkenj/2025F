#import "@preview/colorful-boxes:1.4.3" as cb
#import "@preview/touying:0.6.1": *
#import "@preview/cetz:0.4.2"
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
    title: [MAT235 Slides LEC0401 (Chapter 19)],
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
  #set text(size: .8em)

  #columns(2)[
    #{
      let width = 9cm
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
          lq.place(-1, 0, {
            cetz.canvas({
              import cetz.draw: *

              group(name: "figure", {
                let shift = 0.1

                line((0, 0), (0, 2), mark: (symbol: "o"), stroke: 2pt, name: "rod")

                // content("rod.mid", [$R$], anchor: "west", padding: .5em)
                content("rod.start", [$A$], anchor: "north", padding: .2em)
              })
            })
          }),
          lq.place(1, 0, {
            cetz.canvas({
              import cetz.draw: *

              group(name: "figure", {
                let shift = 0.1

                line((0, 0), (2, 2), mark: (symbol: "o"), stroke: 2pt, name: "rod")

                // content("rod.mid", [$R$], anchor: "west", padding: .5em)
                content("rod.start", [$B$], anchor: "north", padding: .2em)
              })
            })
          }),
        )
      }

      plot((x, y) => (1, 0))
    }
    #colbreak()
    Some ants are having a race! But, it is a very boring race. They are all travelling at the same
    speed (5 m/hour) due east and the density of ants is 1000 ants per square metre.

    You set up two ant counters, $A$ and $B$.

    + If $A$ is 2 metre long, how many ants cross counter $A$ in one hour?
    + How many ants cross counter $B$ in one hour *compared to* counter $A$?
    + How many ants/hour/unit length cross counter $A$?
    + $B$ is at a 45 degree angle relative to $A$. How many ants/hour/unit length cross counter $B$?
  ]
]

#slide(title: [Siefken 2], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .8em)

  #columns(2)[
    #{
      let width = 9cm
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
          // lq.place(-1, 0, {
          //   cetz.canvas({
          //     import cetz.draw: *

          //     group(name: "figure", {
          //       let shift = 0.1

          //       line((0, 0), (0, 2), mark: (symbol: "o"), stroke: 2pt, name: "rod")

          //       // content("rod.mid", [$R$], anchor: "west", padding: .5em)
          //       content("rod.start", [$A$], anchor: "north", padding: .2em)
          //     })
          //   })
          // }),
          lq.place(0, 0, {
            cetz.canvas({
              import cetz.draw: *

              group(name: "figure", {
                let shift = 0.1

                line((0, 0), (2, 2), mark: (symbol: "o"), stroke: 2pt, name: "rod")

                // content("rod.mid", [$R$], anchor: "west", padding: .5em)
                content("rod.start", [$C$], anchor: "north", padding: .2em)
              })
            })
          }),
        )
      }

      plot((x, y) => (1, 0))
    }
    #colbreak()
    Some ants are having a race! There are 1000 ants per square metre and they are all travelling
    5m/hour due east.

    Counter $C$ is 2 metres long and is oriented at angle $theta$ (measured counter clockwise from
    due east).

    + At what angle will counter $C$ count the *maximum* number of ants/hour?
    + At what angle will counter $C$ count the *minimum* number of ants/hour?
    + Find a formula for the number of ants/hour that cross counter $C$ in terms of $theta$.
  ]
]

#slide(title: [Siefken 3], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .8em)

  #columns(2)[
    #{
      let width = 9cm
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
          // lq.place(-1, 0, {
          //   cetz.canvas({
          //     import cetz.draw: *

          //     group(name: "figure", {
          //       let shift = 0.1

          //       line((0, 0), (0, 2), mark: (symbol: "o"), stroke: 2pt, name: "rod")

          //       // content("rod.mid", [$R$], anchor: "west", padding: .5em)
          //       content("rod.start", [$A$], anchor: "north", padding: .2em)
          //     })
          //   })
          // }),
          lq.place(0, 0, {
            cetz.canvas({
              import cetz.draw: *

              group(name: "figure", {
                let shift = 0.1

                line((0, 0), (2, 2), mark: (symbol: "o"), stroke: 2pt, name: "rod")

                // content("rod.mid", [$R$], anchor: "west", padding: .5em)
                content("rod.start", [$C$], anchor: "north", padding: .2em)
              })
            })
          }),
        )
      }

      plot((x, y) => (1, 0))
    }
    #colbreak()
    Some ants are having a race! There are 1000 ants per square metre and they are all travelling
    5m/hour due east.

    Counter $C$ is 2 metres long and is oriented at angle $theta$ (measured counter clockwise from
    due east).

    A *normal vector* to a point on a surface is a non-zero vector orthogonal to the surface.

    + Find a normal vector to counter $C$ (your answer will depend on theta).
    + Find a *unit normal* vector to counter $C$ (i.e., a normal vector of length 1).
    + Find a formula for the number of ants/hour that cross counter $C$ in terms of the unit normal
      vector.
  ]
]

#slide(title: [Siefken 4], autoscale: false)[
  #show: place.with(dy: 1.3cm)
  #show: block.with(height: 10cm, breakable: false)
  #set text(size: .8em)

  #columns(2)[
    The *flux* of a vector field through a surface is the amount of material per second that the
    vector field would "push through" the surface.

    + In the ant questions, the ant's velocities could be described by a vector field
      $arrow(F): RR^2 -> RR^2$ and the counter was described by a curve $C$.

      Rephrase the ant question(s) using the term "flux".

    + Suppose $arrow(G): RR^2 -> RR^2$ is a constant vector field. Let $Q$ be the line segment from $(0,0)$ to $(1,1)$.

      How can you find the flux of $arrow(G)$ through $Q$?

    + Suppose $arrow(H): RR^2 -> RR^2$ is non-constant vector field. Let $Q$ be the line segment from $(0,0)$ to $(1,1)$.

      How can you estimate the flux of $arrow(H)$ through $Q$?

      How could you find the _exact_ flux of $arrow(H)$ through $Q$?
  ]
]
