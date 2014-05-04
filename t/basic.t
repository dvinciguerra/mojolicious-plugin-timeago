use Mojo::Base -strict;

use Test::More;
use Mojolicious::Lite;
use Test::Mojo;
use DateTime;

use FindBin;
use lib "$FindBin::Bin/../lib";


##############################
## web app
##############################
plugin 'TimeAgo';

get '/' => sub {
    my $self = shift;
    $self->render( text => $self->time_ago(DateTime->now) );
};

get '/not-datetime' => sub {
    my $self = shift;
    $self->render( text => $self->time_ago(""));
};

get 'with-template' => sub{
    my $self = shift;
    $self->render( date => DateTime->now );
} => 'index';


##############################
## test plugin
##############################
my $t = Test::Mojo->new;

# use test
use_ok 'Mojolicious::Plugin::TimeAgo'; 

# datetime param test
$t->get_ok('/')
    ->status_is(200)
    ->content_is('just now');

# not datetime param test
$t->get_ok('/not-datetime')
    ->status_is(200)
    ->content_is('');

# template helper test
$t->get_ok('/with-template')
    ->status_is(200)
    ->content_like(qr/just now/);

done_testing();


##############################
## template
##############################
__DATA__
@@ index.html.ep
<h3>Post title</h3>
<p>Lorem ipsum dolor sit amet</p>
%= time_ago $date
