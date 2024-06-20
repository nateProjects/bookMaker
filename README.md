# bookMaker
Create books from MarkDown Notes using Typst

What bookMaker can do -

It can transform MarkDown text documents into PDF books suitable for publishing.

It is suitable for -

Creating simple text books (fiction, biography, philosophy)

(or converting markdown to Typst format for further typesetting)

It is not (yet) suitable for -

Scholarly or Scientific works that require citations or diagrams

Using bookMaker

## Install

Clone or download the repository and move it to where you would like to run it from.

Requirements: MacOS or Linux / Windows WSL

To install - `./installUnix.sh`

Windows - Please use Linux install under WSL or a VM and run the Linux installer

## Setup

Create a book template if one doesn't already exist -

`./bookMaker -n=BOOK-NAME`

Configure your book details in BOOK-NAME/src/book.toml

## Usage

Run bookMaker from the command line -

`./bookMaker -book=BOOK-NAME -out=OUTPUT -y`

eg. `./bookMaker -book=BOOK-NAME -out=tp -y`

This will take all the take all the MarkDown files in book-name/src, compile them together and output them as a single PDF file in book-name/book

## Formats

It supports converting multiple markdown text files into PDF / Typst -

- headings
- emphasis (italics) & strong (bold) text
- underlines, strikethroughs, and highlights
- quotes
- footnotes
- page breaks
- comments
- embedded {{Typst markup}}
- page numbering
- different page sizes
- title page
- table of contents

Double curly quotes can be used {{ }} for embedded Typst code which are removed before compilation. So in theory anything that is possible in Typst can be created in your MarkDown documents.

TODO - Check and fix

* pdf - Portable Document Format - XXX
* epub - eBook - XXX
* odt - LibreOffice - XXX
* docx/word - Word - XXX
* tp/typst PDF - Use Typst book config & compiler
* md - Compile all MarkDown into a single file (default)

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

TODO: Obsidian basic note

In Obsidian enable XXX

## book.toml

TODO - Expand

```
page-size = A4, Letter, A5, A6, etc. # consider allowing multiple
outer-margin = 00mm
inner-margin = 00mm
header = "" # edit TEMPLATE.typ for more config
footer = ""
contents = TRUE # not yet implemented
```

## Background

Using the Obsidian note taking app I wanted to be able to write books completely in Markdown

However, I wanted some of the output options that come with Typst to produce PDF files suitable for print and publication.

## Versions

0.5.0 - This version: Basic Fiction Typst export

Planned changes: 

* 0.6.0 - Basic non-fiction
* 0.7.0 - eBook export
* 0.8.0 - GUI tool
* 0.9.0 - Obsidian plugin
* 1.0.0 - Installable packages

Possible LaTeX / Tables / Bibliography / Citations / Mermaid / CSS support
