# Blerg

Super simple cms meant for blog content.  It's equal parts a learning exercise and
a desire to have something more stripped down, only what I need and nothing I don't.
It currently a [Sinatra](https://github.com/sinatra/sinatra) application using [Redcarpet](https://github.com/vmg/redcarpet)
to render github-flavored markdown.

### How it does its thing

I much prefer to write posts in my usual text editor.  

* Write markdown like you normally would (including code blocks made available by github markdown)
* Copy the files into `views/posts`
* run `$ rake post:add filename="my\_cool\_blog\_post"`

### TODO

- Larger formatted code blocks in markdown are currently indented weirdly on the index page
- Syntax highlighting for code blocks
- Yaml frontmatter parsing

