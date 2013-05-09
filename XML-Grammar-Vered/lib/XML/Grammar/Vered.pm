package XML::Grammar::Vered;

use strict;
use warnings;

use autodie;

use MooX qw/late/;

use XML::GrammarBase::Role::RelaxNG v0.2.2;
use XML::GrammarBase::Role::XSLT v0.2.2;

our $VERSION = '0.0.5';

with ('XML::GrammarBase::Role::RelaxNG');
with XSLT(output_format => 'docbook');

has '+module_base' => (default => 'XML-Grammar-Vered');
has '+rng_schema_basename' => (default => 'vered-xml.rng');


has '+to_docbook_xslt_transform_basename' =>
    (default => 'vered-xml-to-docbook.xslt');

has '_mode' => (is => 'rw', init_arg => 'mode');
has '_output_mode' => (is => 'rw', init_arg => 'output_mode',);

1;

=encoding utf8

=head1 NAME

XML::Grammar::Vered - a vered by any other name will translate as sweet.

=head1 SYNOPSIS

    my $xslt = XML::Grammar::Vered->new(
        data_dir => "/path/to/data-dir",
    );

    my $input_filename = '/path/to/my-file-in-vered-format.xml';
    # Throws an exception on failure.
    my $as_docbook = $xslt->perform_xslt_translation(
        {
            output_format => 'docbook'
            source => {file => $input_filename, },
            output => "string",
        }
    );

=head1 DESCRIPTION

Vered-XML is a custom (and incredibly ad-hoc) XML grammar, which was created
for the ability to more easily write and maintain the “Perl Elements to
Avoid” page over at L<http://perl-begin.org/tutorials/bad-elements/> . You
may find it suitable, but chances are you won't. If you find it lacking in
a certain respect, you can either send me a diff to the RNG and XSLT (and
hopefully automated tests as well), or file a bug report and I'll see what
I can do.

Vered gets translated to DocBook 5/XML, and from there to other formats.

“Vered” is the Hebrew word for “a rose”, and I came up with the name because
I did not know what to call this format, and thought of “a rose by any other
name will smell as sweet”.

=head1 EXAMPLE

    <?xml version="1.0" encoding="utf-8"?>
    <document xmlns="http://www.shlomifish.org/open-source/projects/XML-Grammar/Vered/" xmlns:xlink="http://www.w3.org/1999/xlink" version="0.2.0" xml:lang="en-GB" xml:id="index">
        <info>
            <title>Perl Elements to Avoid</title>
        </info>
        <body>
            <preface xml:id="intro">
                <info>
                    <title>Introduction</title>
                </info>

                    <p>
                    Often when people ask for help with Perl code, they show
                    Perl code that
                    suffers from many bad or outdated <b>elements</b>.
                    </p>

                    <p>
                    <strong>Note:</strong> Please don't think this advice is
                    meant as gospel. I tried to avoid
                    <a xlink:href="http://bikeshed.com/">colour of
                    the bike shed arguments</a>), but some of the advice here
                    may still be controversial.
                    </p>
            </preface>
            <section xml:id="bad-elements">
                <info>
                    <title>The List of Bad Elements</title>
                </info>
                <item xml:id="no-indentation">
                    <info>
                        <title>No Indentation</title>
                    </info>
                <p>
                <a
                xlink:href="http://en.wikipedia.org/wiki/Indent_style">Indentation</a>
                means that the contents of every block are promoted from their
                containing environment by using a shift of some space. This
                makes the code easier to read and follow.
                </p>

                <p>
                You can look into <cpan_self_dist d="Perl-Tidy" /> from
                CPAN for more information.
                </p>
            </section>
            <section xml:id="sources_of_advice">
                <info>
                    <title>Sources of This Advice</title>
                </info>

            <p>
            This is a short list of the sources from which this advice was
            taken which
            also contains material for further reading:
            </p>

            <ol>

            <li>
            <p>
            <a xlink:href="$(ROOT)/books/advanced/#pbp">The
            Book "Perl Best Practices"</a> by Damian Conway - contains a lot of good
            advice and food for thought, but sometimes should be deviated from.
            Also see the
            <a xlink:href="https://www.socialtext.net/perl5/index.cgi?pbp_module_recommendation_commentary">"PBP
            Module Recommendation Commentary"</a> on the Perl 5 Wiki.
            </p>
            </li>

            <li>
            <p>
            <a xlink:href="https://www.socialtext.net/perl5/index.cgi?ancient_perl">"Ancient
            Perl"</a> on the Perl 5 Wiki.
            </p>
            </li>

            <li>
            <p>
            <a xlink:href="http://modernperlbooks.com/">chromatic's "Modern Perl" Book and
            Blog</a>
            </p>
            </li>

            <li>
            <p>
            The book <a xlink:href="http://www.refactoring.com/"><i>Refactoring</i> by Martin
            Fowler</a> - not particularly about Perl, but still useful.
            </p>
            </li>

            <li>
            <p>
            The book
            <a xlink:href="http://pragprog.com/book/tpp/the-pragmatic-programmer"><i>The Pragmatic
            Programmer: From Journeyman to Master</i></a> - also not particularly about
            Perl, and I found it somewhat disappointing, but it is an informative book.
            </p>
            </li>

            <li>
            <p>
            Advice given by people on <a xlink:href="$(ROOT)/irc/#freenode">Freenode's #perl
            channel</a>, on the Perl Beginners mailing list, and on other Perl forums.
            </p>
            </li>

            </ol>

            </section>
        </body>
    </document>
