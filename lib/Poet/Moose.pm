package Poet::Moose;    ## no critic (Moose::RequireMakeImmutable)

use Moose                      ();
use MooseX::HasDefaults::RO    ();
use MooseX::StrictConstructor  ();
#use Method::Signatures::Simple ();
use Function::Parameters;
use Moose::Exporter;
use strict;
use warnings;
Moose::Exporter->setup_import_methods( also => ['Moose'] );

sub init_meta {
    my $class     = shift;
    my %params    = @_;
    my $for_class = $params{for_class};
    #    Method::Signatures::Simple->import( into => $for_class );
    #Function::Parameters->
    Moose->init_meta(@_);
    MooseX::StrictConstructor->import( { into => $for_class } );
    MooseX::HasDefaults::RO->import( { into => $for_class } );
}

1;

__END__

=pod

=head1 NAME

Poet::Moose - Poet Moose policies

=head1 SYNOPSIS

    # instead of use Moose;
    use Poet::Moose;

=head1 DESCRIPTION

Sets certain Moose behaviors for Poet's internal classes. Using this module is
equivalent to

    use Moose;
    use MooseX::HasDefaults::RO;
    use MooseX::StrictConstructor;
    use Method::Signatures::Simple;
