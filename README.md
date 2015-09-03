---
published: false
---

Jekyll template for University of Cambridge Computer Laboratory web pages
=========================================================================

This is a (Jekyll)[http://jekyllrb.com] template that is intended to mimic the
functionality an appearance of the ucampus system, with a few helpful
extensions.  It is not officially supported by the University or the Computer
Lab.

Dependencies
------------

This template requires (Jekyll Scholar)[https://github.com/inukshuk/jekyll-scholar],
in addition to Jekyll.  This is used to format the publications lists.  As
Jekyll Scholar depends on Jekyll, you should be able to install all
dependencies (on a system with Ruby installed) with this command:

	$ [sudo] gem install jekyll-scholar

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
italicised in all publications.

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

This will use the ucampus style, including the animations for selected titles.

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
