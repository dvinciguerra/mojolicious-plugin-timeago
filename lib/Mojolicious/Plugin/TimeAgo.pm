package Mojolicious::Plugin::TimeAgo;
use Mojo::Base 'Mojolicious::Plugin';

our $VERSION = '0.01';

use DateTimeX::Format::Ago;

sub register {
    my ( $self, $app ) = @_;

    # Add "time_ago" helper
    $app->helper( time_ago => sub {
        my $self = shift;
        return DateTimeX::Format::Ago->format_datetime($_[0])
            if $_[0] && (ref $_[0] eq 'DateTime' || $_[0]->isa('DateTime'));
    });
}

1;
__END__

=encoding utf8

=head1 NAME

Mojolicious::Plugin::TimeAgo - Mojolicious Plugin

=head1 SYNOPSIS

  # Mojolicious
  $self->plugin('TimeAgo');

  # Mojolicious::Lite
  plugin 'TimeAgo';

=head1 DESCRIPTION

L<Mojolicious::Plugin::TimeAgo> is a L<Mojolicious> plugin.

=head1 METHODS

L<Mojolicious::Plugin::TimeAgo> inherits all methods from
L<Mojolicious::Plugin> and implements the following new ones.

=head2 register

  $plugin->register(Mojolicious->new);

Register plugin in L<Mojolicious> application.

=head1 SEE ALSO

L<Mojolicious>, L<Mojolicious::Guides>, L<http://mojolicio.us>.

=cut
