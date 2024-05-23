# bookMaker
A MarkDown to Book exporter


Initially designed for producing simple (non-scientific) books from MarkDown text files

It uses Pandoc or Typst where available to output PDF files.

Note: It presumes you are storing your chapters in an MDBook structure.

## Install

clone or download the repository and move it to where you would like to run it from

./testSetup will create a MDBook filetree with some sample files

## Usage

`./bookMaker -book=DIR -out=OUTPUT -y`

eg. `./bookMaker -book=book-name -out=docx -y`

... will take all the take all the MarkDown files in book-name/src, compile them together and output them as a single Word (DocX) file in book-name/book

## Formats

* pdf - Portable Document Format
* epub - eBook
* odt - LibreOffice
* docx/word - Word
* tp/typst PDF - Use Typst book config & compiler
* md - Compile all MarkDown into a single file

* web/html - HyperText Web Document (not yet implemented)
* lt/latex PDF - u=Use LaTex book config & compiler (not yet implemented)

## MDBook Structure

```
book-name/
├── book # this contains output formats
└── src # this contains your actual book text
    ├── chapter_1.md
    └── SUMMARY.md # what you want in the table of contents
    └── TEMPLATE.typ # Typst template
```

Everything in book-name/src will be compiled in alphanumeric order

A simple fiction book might be organised like this -

```
chapter_0.md # prologue etc.
chapter_1.md
chapter_2.md
```

A more complex book order might be like this -

```
00_section/
    00.0_introduction.md
    00.1_chapter_1.md
01_section/
    01_chapter_5.md
etc.
```

## book.toml

```
page-size = A4, Letter, A5, A6, etc. # consider allowing multiple
outer-margin = 00mm
inner-margin = 00mm
header = "" # edit TEMPLATE.typ for more config
footer = ""
contents = TRUE # not yet implemented
```

## Caveats

I have added using double curly quotes {{ }} for embedded Typst code which are removed before compilation.

So in theory anything that is possible in Typst can be created in your MarkDown documents.

## Background

Using the Obsidian note taking app I wanted to be able to write books completely in Markdown

However, I wanted some of the output options that come with Typst or LaTex to produce PDF files suitable for print and publication (as well as simplifying eBook creation etc.)

## Versions

0.1.0 - This version: basic pandoc conversion & Typst compilation

0.2.0 - 1.0.0 Planned changes: 

* Contents support
* More advanced ePub support - covers & styles
* More advanced Web support - css
* Other Typst MarkDown conversions - tables, images. mermaid charts etc.
* LaTex PDF output
* Bibliography support
* Footnote / Endnote support
* Indexing & Cross Reference support
* Obsidian Script
