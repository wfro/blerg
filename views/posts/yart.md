One lesson learned early on is that application development is not just about
writing your own code, it's about knowing when using an existing solution is
the right solution.  For our purposes we'll define a library (a 'gem' in the wonderful world
of Ruby) as simply a collection of resources (including source code) written by
someone else that we can use in our own programming endeavours.

Today I thought I'd share with you a few gems that have made
their way into nearly all of my rails projects.  The first three gems I'll mention
help with debugging, and the last three are for testing.  In order of appearance they
are: [pry](https://github.com/pry/pry),
[rspec](https://www.relishapp.com/rspec),
[capybara](https://github.com/jnicklas/capybara), [better
errors](https://github.com/charliesome/better_errors).

## Pry

Short version: put `gem 'pry'` in your gemfile, sprinkle `binding.pry` around
your code as needed.  For a standard repl session run `pry` in place of `irb` 
from the command line.

From github, Pry is "An IRB alternative and runtime developer console".  To
elaborate, pry does two main things.  First, as an 'IRB alternative' it
provides a lot of added functionality, most exciting of which for me was syntax
highlighting.  It does other stuff too like easy documentation and source code
browsing (which is cool too I guess).  For example in pry you can type `$
Array#each` to browse the C source for that particular method (replacing the
`$` with `?` will bring you to the documentation).

Pry also has an incredibly useful feature that let's you jump into your code at
any point and poke around.  As a beginner, learn to love this.  It has helped
debug so, so many errors for me and it gives you a great idea of what your code
is really doing.  The short version: plop `binding.pry` into your code where
you want pry to hook in, run your code, poke around in the console pry makes
available to you.  Super easy, incredibly useful.

The console that opens will have access to all of the variables that were
available in that particular scope.  You can go in and see if your variables
contain the values you expect them to, or you can try out new code and get
immediate feedback about the result.  Since we're talking about rails, here's a
simple example of the result of dropping binding.pry in your code.  Say we have
an articles resource
([Blogger](http://tutorials.jumpstartlab.com/projects/blogger.html) shoutout)
and a show action we wanted to investigate. We'd do the following:

```ruby
def show
  @article = Article.find(params[:id])
  binding.pry # where the magic happens
end
```

When we trigger that action the pry console should drop us right into the code
with access to `@article` in that execution context (if for example you hit
that action through a feature test the pry console will open in whatever window
you ran the tests in, if you trigger it manually by going to '/articles/1' pry
will open in whatever server window you have open).  It looks like this:


## RSpec

I've been using and enjoying RSpec
recently so it has a place in all of my rails applications.  RSpec is a ruby
library for testing that encourages human readability (Check out
[this](http://rspec.info/) to get started).  I'll leave it to you to navigate
what test framework is right for you, there are legitimate arguments for
all of the choices available to you.

Wiring RSpec in rails isn't all that intuitive (I'm not prepared to admit
how often I forget --skip-test-unit).  From the beginning:

-Add the `--skip-test-unit` option when creating a new rails project.

`$ rails new my_app --skip-test-unit`

-Add `rspec-rails` to your Gemfile under both the development and test group
(for more on bundler groups see [here](http://yehudakatz.com/2010/05/09/the-how-and-why-of-bundler-groups/)

```ruby
group :development, :test do
  gem 'rspec-rails'
end
```

-From the command line run `$ bundle` to install new gems if necessary and update your project dependencies
-Run `$ rails generate rspec:install`

This last command does a lot and generators in general can be hard to wrap

## Capybara

Capybara is a tool for writing acceptance tests which integrates really nicely with
Rails and RSpec.  Acceptance tests are great because they allow you mock a real
user interaction.  These kinds of tests give you the confidence of clicking around a page
on your site without actually having to do so (yay for automation of repetetive tasks!).
Logging in and Logging out are great examples of things you
can and should test with capybara.  A very basic login spec might look something
like this:

```ruby
describe "login", type: :feature do

  describe "user with valid credentials" do
    it "can log in successfully" do
      visit "/"
      click_link "Log in"
      fill_in "Email", with: "jonsnow@whitewall.gov"
      fill_in "Password", with: "kn0wsn0th1ng"
      click_button "Submit"

      expect(page).to have_content "Logged in as Jon Snow"
    end
  end
end

```

Here we visited our applications root url, clicked 'Log in', filled in our information and clicked "Submit",
and finally asserted that some content appeared alerting us the login process was successful.
As you can see the explanation probably wasn't necessary given how supremely readable
capybara make's that particular spec.

Basic setup:

- As usual add `gem 'capybara' to your Gemfile
- Drop `require 'capybara/rails'` and `require 'capybara/rspec'` into your spec_helper.rb\

#### Launchy

[Launchy](https://github.com/copiousfreetime/launchy) deserves a special mention for it's
lovely interaction with capybara's `save_and_open_page`.  All you have to do is add 
`gem 'launchy'` to your gemfile and a browser tab will be opened when `save_and_open_page`
is called.

## Better Errors

The Rails error page is something you'll get used to seeing a lot, and it's a whole lot
more helpful with Better Errors.  Here is an example error screen:

I'd 100% recommend adding [binding_of_caller](https://github.com/banister/binding_of_caller)
in addition to Better Errors, as it grants you the 'advanced' features, such as access to
the REPL and local/instance variable inspection.  I really can't emphasize enough how
valuable of a tool it is to be able to poke around your code smack dab in the middle of a
particular execution context.

And that's it!  Hopefully you'll find some use out of these gems, and as always don't forget
to thank your local open source maintainers and contributors!

