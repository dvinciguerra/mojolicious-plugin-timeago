package Mojolicious::Plugin::TimeAgo;
use Mojo::Base 'Mojolicious::Plugin';
our $VERSION = '0.01';

use DateTimeX::Format::Ago;

sub register {
    my ( $self, $app, $opt ) = @_;

    # Add "time_ago" helper
    $app->helper( time_ago => sub {
        my $self = shift;
        return DateTimeX::Format::Ago->format_datetime($_[0])
            if $_[0] && (ref $_[0] eq 'DateTime' || $_[0]->isa('DateTime'));
    });
}

1;
__END__
=pod

=encoding utf8

=head1 NAME

Mojolicious::Plugin::TimeAgo - TimeAgo Mojolicious Plugin

=head1 SYNOPSIS

  # Mojolicious
  $self->plugin('TimeAgo');

  # Mojolicious::Lite
  plugin 'TimeAgo';

=head1 DESCRIPTION

L<Mojolicious::Plugin::TimeAgo> is a L<Mojolicious> plugin that
provide a feature to convert DateTime objects to "just now" 
string, for example.

=head1 METHODS

L<Mojolicious::Plugin::TimeAgo> inherits all methods from
L<Mojolicious::Plugin> and implements the following new ones.

=head2 register

  $plugin->register(Mojolicious->new);

Register plugin in L<Mojolicious> application.


=head2 time_ago([DateTime obj]) 

    # Mojolicious::Controller
    my $date = $self->time_ago( DateTime->now );

or ...

    # view template
    %= time_ago DateTime->now
    <%= time_ago DateTime->now %>


=head1 TODO

    * Language support
    * Get and use language by stash
    * Integration with I18N mojolicious plugin


=head1 AUTHOR

Daniel Vinciguerra <daniel.vinciguerra@bivee.com.br>


=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Daniel Vinciguerra (dvinci@cpan.org).

This is free software; you can redistribute it and/or 
modify it under the same terms as the Perl 5 programming 
language system itself.


=head1 SEE ALSO

L<Mojolicious>, L<Mojolicious::Guides>, L<http://mojolicio.us>.

=cut
