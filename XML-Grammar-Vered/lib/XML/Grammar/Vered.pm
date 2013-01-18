package XML::Grammar::Vered;

use strict;
use warnings;

use autodie;

use MooX qw/late/;

use XML::GrammarBase::Role::RelaxNG;
use XML::GrammarBase::Role::XSLT;

our $VERSION = '0.0.1';

with ('XML::GrammarBase::Role::RelaxNG');
with XSLT(output_format => 'docbook');

has '+module_base' => (default => 'XML-Grammar-Vered');
has '+rng_schema_basename' => (default => 'vered-xml.rng');


has '+to_docbook_xslt_transform_basename' =>
    (docbook => 'vered-xml-to-docbook.xslt');

has '_mode' => (is => 'rw', init_arg => 'mode');
has '_output_mode' => (is => 'rw', init_arg => 'output_mode',);

1;

=head1 NAME

XML::Grammar::Vered - a vered by any other name will translate as sweet.
