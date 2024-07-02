# bookMaker
Create books from MarkDown Notes using Typst

What bookMaker can do -

It can transform MarkDown text documents into PDF books suitable for publishing.

It is suitable for -

Creating simple text books (fiction, biography, philosophy)

(or converting markdown to Typst format for further typesetting)

It is not (yet) suitable for -

Scholarly or Scientific works that require citations or diagrams

## Install

Clone or download the repository and move it to where you would like to run it from.

Requirements: MacOS or Linux / Windows WSL

To install - 

```
sh ./installUnix.sh
```

Windows - Please use Linux install under WSL or a VM and run the Linux installer

## Setup

Create a book template if one doesn't already exist -

`./bookMaker -n=BOOK-NAME`

Configure your book details in BOOK-NAME/src/book.toml

## Usage

Run bookMaker from the command line -

`./bookMaker -book=BOOK-NAME -out=OUTPUT-TYPE`

eg. `./bookMaker -book=BOOK-NAME`

(the -out is optional)

This will take all the take all the MarkDown files in book-name/src, compile them together and output them as a single PDF file in BOOK-NAME/book

## Formatting

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

Note: Obsidian Front Matter is not detected properly yet. You can change the md2typst/process_typst_file function to alter this.

Note: Additional Output Formats are turned off for the time being.

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

### Obsidian

To run within Obsidian you must either use the book-name/src structure

or change the srcName string in bookMaker & src_path in md2typst to the appropriate directory name

Using the Commander and Shell Commands community plugins you can create a button on the ribbon bar to automate compiling your book

## book.toml

Change these values as appropriate -

```
[book]
title = "Book Test"
sub-title = "Sub Title"
authors = "John Doe"
description = "The example book covers examples."
copyright-year = "2024"
this-edition = "1st"
published-by = "Publisher"
printed-by = "ACME printing"
contact-address = "1 Address"
website-address = "http://address" # not yet implemented
dedication = "dedication"

[output]
page-size = a5 # or a4, letter etc.
outer-margin = 0.50in
inner-margin = 0.90in
header = "" # not yet implemented, edit TEMPLATE.typ to change defaults
footer = "" # not yet implemented, edit TEMPLATE.typ to change defaults
contents = "TRUE" # not yet implemented
fiction = "TRUE" # not yet implemented
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

This readme - v0.5.0
