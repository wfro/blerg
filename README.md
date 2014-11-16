# Blerg

Super simple cms meant for blog content.  It's equal parts a learning exercise and
a desire to have something more stripped down, only what I need and nothing I don't.
It's currently a [Sinatra](https://github.com/sinatra/sinatra) application using [Redcarpet](https://github.com/vmg/redcarpet)
to render github-flavored markdown.  It uses `yaml/store` for persistent metadata storage.

### How it does its thing

The workflow of adding posts came from my preference of writing posts in my usual text editor.  

* Write markdown like you normally would (including both inline code and fenced code blocks made available in github markdown)
* Copy markdown files into `views/posts`
* `$ rake post:add filename="my_cool_blog_post" title="My Cool Blog Post"`


### Things to make it better

- Syntax highlighting for code blocks
- Yaml frontmatter parsing

