---
published: false
---

Jekyll template for University of Cambridge Computer Laboratory web pages
=========================================================================

This is a [Jekyll](http://jekyllrb.com) template that is intended to mimic the
functionality an appearance of the ucampas system, with a few helpful
extensions.  It is not officially supported by the University or the Computer
Lab.

Dependencies
------------

This template requires [Jekyll Scholar](https://github.com/inukshuk/jekyll-scholar),
in addition to Jekyll.  This is used to format the publications lists.  As
Jekyll Scholar depends on Jekyll, you should be able to install all
dependencies (on a system with Ruby installed) with this command:

	$ [sudo] gem install jekyll-scholar

30-second introduction to Jekyll
--------------------------------

This template uses [Jekyll](http://jekyllrb.com), so using it requires a little bit of understanding of Jekyll.
Jekyll can run a local web server that will automatically update the generated pages based on changes to the source:

	$ jekyll serve

This mode is primarily intended for development, so that you can see a live preview while editing.
Once the site is ready for publication, run:

	$ jekyll build

Note that if you are deploying to [GitHub Pages](https://pages.github.com) and *not* using any of the Jekyll Scholar (BibTeX) functionality, then you can skip this step and just `git push`.

Beyond this simple usage, it's important to understand a few things about how Jekyll works:

 - Files (and directories) that start with an underscore are not pushed to the site, though they can be included in files that are.
 - Files that do *not* start with an underscore will be pushed to the site, after preprocessing (if applicable).
 - Files that are preprocessed should start with a frontmatter section.  This is a yaml dictionary inside a block delimited by `---`.  See the top of this file for a simple example.
 - Files in Jekyll that are preprocessed are typically constructed in two stages:
    1. [Liquid](https://github.com/Shopify/liquid/wiki/Liquid-for-Designers) templates are instantiated, to construct a single page from multiple sources.
    2. As files are included, markup (typically the [kramdown](http://kramdown.gettalong.org) dialect of [Markdown](http://daringfireball.net/projects/markdown/]) is translated into HTML.

To give a concrete example, if you are using this template to generate a personal web page, you will use something based on `index.markdown` file as your front page.
This has frontmatter saying `layout: userpage`, so Jekyll will start producing an `index.html` using the contents of `_layouts/userpage.html`, with the contents of `index.markdown` (now translated into HTML) as its `contents` property.
The `_layouts/userpage.html` file also provides a layout (`default`), so the structure of the final page will be `_layouts/default.html` at the top level, with `_layouts/userpage.html` embedded in the `{{ contents }}` liquid directive.
This, in turn, will have the HTML generated from `index.markdown` embedded in its `{{ contents }}` directive.

Each of these steps can also involve other inclusions.
For example, the `default` layout uses `head.html`, `header.html`, and `footer.html` as include sources, providing consistent layout across different page styles.
Items in the frontmatter can also determine how the page is rendered.
For example, if the frontmatter for a page using the `default` layout (directly or indirectly) contains a `github: foo` element, then the page will have a 'view on GitHub' button linking to that organisation or project on GitHub.

Usage
-----

To use this template, clone the git repository and modify a few files.  If you
intend to use this for a personal home page, then:

 * Add a `photo.jpg` to the root directory with your picture.
 * Modify `_config.yaml` with your name in the relevant fields and your CRSID
   in the base URL.
 * Edit `_data/author.yml` with your name, office, and phone number.
 * Replace `_bibliography/publications.bib` with a BibTeX file containing your
   own publications.
 * Edit `index.markdown` to describe your research and intersts.

If you are creating some other family of pages, then you will want to change
`index.markdown` to use the `default` layout, rather than `userpage`.  You may
also want to edit `_data/breadcrumbs.yml`, which contains an array of pages to
reference in the root set of breadcrumbs.

If you wish to hide pages, then you can either delete the corresponding file or
set `published: false` in the YAML frontmatter (the bit between `---` lines at
the start).

Once you have done this, simply run `jekyll build` to get a `public_html`
directory containing your site.  While testing, use `jekyll serve` to run a
temporary local web server for previewing your in-progress edits.

Publication list
----------------

The publication lists (both the complete publications page and the short
summary on the user page) are generated from `_bibliography/publications.bib`.
If you have set the `pubauthor` field in `_config.yml` then this name will be
italicised in all publications.  For group web sites, `pubauthor` can be an
array and all names will be italicised.

The title will become a link if there is a `url`, `pdf`, or `doi` field in the
BibTeX entry.  If there is an `abstract` field then the accompanying text will
be shown inline, in a hidden section, exposed by clicking on the `[abstract]`
link.  A pretty-printed version of the BibTeX will be exposed in a similar fashion.

Projects pages
--------------

The `_projects` directory should contain one file for each project.  These are
normal Jekyll files and their title should contain the following entries in
their frontmatter:

 * `title`, the title of the project.
 * `type`, the type of projects (2, 3, or phd, for Part II, Part III/ACS, or
   PhD project ideas, respectively).
 * `presequisites` Any prerequisites for the project.
 * `done` (optional), set to `true` for completed projects that you wish to
   show on the 'Selected past projects' page.
 * `outcome` (optional), a summary of the outcome for completed projects.

These will then be aggregated into the various pages in the Projects section.

Custom subdirectories
---------------------

Any subdirectory with an `index.markdown` (or `index.html` if you want to write
the HTML yourself) will be an entry in the site contents bar on the left.  Any
other files in the directory will be subtopics.

This template only supports a single layer of nesting.

Tables of contents
------------------

If you wish to insert a table of contents for a single page, then include the contents file:

	{% include contents.markdown %}

This will use the ucampas style, including the animations for selected titles.

A table of contents for the site will be generated automatically.  If you want
to customise it, then create a `_datacontents.yml` file.  This should contain
an array of objects with two required properties (`title` and `location`) and
one optional property (`subheadings`).  The `title` contains the display name
of the heading, which should match the title of a page.  The location is either
an absolute URL or the name of a directory at the top level.

The `subheadings` array can contain names of files (with or without their
suffixes) within the section directory, or objects containing a `title` and
`location`.

GitHub links
------------

If you have a page that describes a project on GitHub, the set the `github`
property in the YAML frontmatter.  This project would have something like this:

	---
	github: davidchisnall/camtemplate
	---

The page will then have small buttons for viewing the project page on GitHub
and downloading tarballs inserted.
You can also provide just the name of an organisation, for example:

	---
	github: davidchisnall
	---

In this case, the 'view on github' button will appear, linking to the organisation but the download links will not.

People pages
------------

If you are using this template for a project or group page, then you will
probably want to have a 'people' page.  There is a template people page in
`people.markdown`, which contains some examples.  Delete the `published: false`
line at the top of this file to see how it looks.

Each person in your project should have a separate file in `_people`.
As with other Jekyll files, this starts with YAML frontmatter, which should
contain the following keys:

`role`
: The person's role within the project.  This is used to define different
  categories of person for inclusion in different sections of the page.

`photo`
: The URL of the person's photo.

`name`
: The person's name, as they would like it to appear.

`homepage`
: The URL that this person's name should be linked to.

The remainder of the file contains descriptive text (only used in the verbose
format).  To define a list of people, include the `people.html` file.  You may
optionally including a `role` and `style` option.  For example:

	{% include people.html role='PI' style='verbose' %}

This will include all people whose role in the project is `PI` (a string
identifier - you may use any role names that you wish), with the verbose
layout.  If `role` is omitted, then everyone will be included.  There are three
different layouts currently available:

`verbose`
: One person per line, with the photo on the left and the descriptive text on
  the right.

`brief`
: A three-column list, containing only the names (no photo or long description).

`default`
: The view presented if no style is specified.  This lists photos with names
  underneath, for the width of the page.
