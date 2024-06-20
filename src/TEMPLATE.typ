#set par(justify: true)
/* Set font */
#set text(
  font: "Times New Roman", /* default = "Linux Libertine" */
  size: 11pt
)
/* Centre Headings */
#show heading: it => [
  #set align(center)
  #set text(12pt, weight: "regular")
  #block(smallcaps(it.body))
]
/* Page settings */
#set page(
  paper:"{{$page-size}}", /* default a4, size set by book.toml */
  margin: (
    top: 0.5in, inside: 0.90in,
    bottom: 0.5in, outside:0.50in
  ),
  /* page numbering on outside */
  footer: locate(loc => {
  let n = counter(page).at(loc).first()
  set align(if calc.rem(n, 2) == 0 { left } else { right })
  counter(page).display("1")
  })
  /* If you want it centred - 
  numbering: "1",
  number-align: center */
)

#set page(
  footer: locate(
    loc => {
      let page-number = counter(page).at(loc).first()
      let match-list = query(selector(<turn-on-page-numbering>).before(loc), loc)
      if match-list == () { return none }
      align(center, str(page-number))
    },
  ),
) // Thanks to - https://github.com/typst/webapp-issues/issues/218

// Title Page
#page(align(center + horizon)[
  #text(4em)[{{$title}}]
  #v(2em, weak: true)
  #text(2em)[{{$sub-title}}]
  #v(2em, weak: true)        
  #text(1.6em)[{{$authors}}] 
])

#pagebreak()

// Publisher Details
#page(align(center + bottom)[ 
  #text(0.8em)[{{$published-by}}]
])

#pagebreak()

// Dedication
#page(align(center)[
  #text(0.8em)[{{$dedication}}]
])

#pagebreak()

#pagebreak(to: "odd")

// Contents Page
#outline(title: [Chapters])

// #set page(numbering: "1 / 1")
// #counter(page).update(1)
// <turn-on-page-numbering>

#set page(
      numbering: "1",
  // The header always contains the book title on odd pages
  header: locate(
    loc => {
    // Are we on an odd page?
    let i = counter(page).at(loc).first()
    if calc.odd(i) {
      return text(0.95em)[{{$title}}]
    }
  // The header always contains the author name on even pages
    if calc.even(i) {
      return text(0.95em)[{{$authors}}]
    }
  })
  )
