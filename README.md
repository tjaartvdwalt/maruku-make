Maruku Make
===========
A Makefile to render a maruku file in a variety of outputs

The problem
-----------
I love Markdown. I love that it can be rendered as a professional looking document, while still remaining human readable in its native form.

One shortcoming of Markdown is its inability to render mathematical formulas. You have a couple of options to solve this problem:

### Write [MathML](http://en.wikipedia.org/wiki/MathML) inside your Markdown document.

This is the most simple solution, since Markdown gets parsed as HTML, and MathML is HTML. Markdown won't parse any HTML blocks in the document, so you can mix Markdown and HTML. It would have been my preffered solution if it did not break the one thing I love about Markdown *human readability*. To write human readable mathematical formulas there is only one real solution: [Latex](http://en.wikibooks.org/wiki/LaTeX/Mathematics). That brings me to my second solution:

### Use a Javascript library inside your Markdown.

I experimented with [MathJax](http://www.mathjax.org/)
MathJax allows you to enter mathematical formulas in Latex format, and through Javascript converts it to MathML. 
Again, since Markdown gets parsed to HTML you can add the javascript library to your header section.
`<script type='text/javascript' src='http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML'></script>`

and enter your formulas using Latex formatting
`
\[\begin{aligned}
\y = \sigma(y-x)\\
\z = x^y
\end{aligned} \]`

Aside from having to escape a few characters this pretty readable.

### Use [Maruku](https://github.com/bhollis/maruku)

This is my preffered solution and the reason for this project. Maruku is a Ruby implementation of the Markdown parser with some extra features, including the ability to render mathemactical formulas written in Latex notation.

Dependencies
------------
Maruku is implemented in Ruby, and you will need a recent version Ruby and RubyGems installed

to install Maruku using RubyGems

`gem install maruku`

To render the Mathematical formulas you need a [math engine](http://rdoc.info/github/bhollis/maruku/master/file/docs/math.md). 
I used [Blahtex](http://gva.noekeon.org/blahtexml/)

Note: I installed blahtexml, a sequal to blahtex.  To make this work with maruku I had to create a symlink of the blahtexml command to blahtex

`ln -s /usr/bin/blahtexml /usr/bin/blahtex`

Usage
-----
Copy the Makefile into the directory with your Markdown file.
If the markdown file is myfile.md, you have the following targets available:

`make myfile.pdf`

`make myfile.tex`

`make myfile.html`

These targets will put the corresponding output files in the output directory.

`make clean_tmp`

Removes the  directory containing the temporary files used to create the output files.

`make clean_output`

Removes the directory containing the output files

`make clean`

Does both clean\_tmp ande clean\_output


Shortcomings
------------
Both the Javascript and Maruku solutions described above will only work for your personal documents. Online resources like Github will not render it. Theoretically the MathML option should work, although I have not tested this. A possible solution would be to output the Latex formulae as HTML using Maruku, and then copying the HTML sections into your Github Markdown.
