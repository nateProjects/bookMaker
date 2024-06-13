/* British quotes */
#set smartquote(quotes: (single: ("“", "”"),  double: ("‘", "’")))
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

= {{$title}}

== {{$authors}}

#pagebreak()

{{$description}}

{{$copyright-year}}

{{$this-edition}}

{{$printed-by}}

{{$contact-address}}

#pagebreak()

#outline()

{{$contents}}
