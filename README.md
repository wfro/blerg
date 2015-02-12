# Blerg

Sinatra app for blog stuffs, originally made for my own website.
Also uses [Redcarpet](https://github.com/vmg/redcarpet) and [yaml/store](http://ruby-doc.org/stdlib-2.2.0.preview1/libdoc/yaml/rdoc/YAML/Store.html).

[Here](http://blergdemo.herokuapp.com) is how it looks at the moment.

### How it works

* Put markdown files in `views/posts`
* `$ rake post:add filename="my_cool_blog_post" title="My Cool Blog Post"`

This isn't a great solution for capturing metadata, the much less tedious way being frontmatter parsing so that's likely the next big thing to explore.
