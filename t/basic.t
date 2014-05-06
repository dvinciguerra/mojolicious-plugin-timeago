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
plugin 'TimeAgo' => { default => 'en' };


get '/' => sub {
    my $self = shift;
    $self->render( text => $self->time_ago(DateTime->now) );
};

get '/not-datetime' => sub {
    my $self = shift;
    $self->render( text => $self->time_ago(""));
};

get '/undef-datetime' => sub {
    my $self = shift;
    $self->render( text => $self->time_ago(undef) || '');
};

get '/invalid-datetime' => sub {
    my $self = shift;
    $self->render( text => $self->time_ago(localtime(time)));
};

get '/with-template' => sub{
    my $self = shift;
    $self->render( date => DateTime->now );
} => 'index';


##############################
## test plugin
##############################
my $t = Test::Mojo->new;

# use test
use_ok 'Mojolicious::Plugin::TimeAgo'; 

$t->get_ok('/')
    ->status_is(200)
    ->content_is('just now');

$t->get_ok('/not-datetime')
    ->status_is(200)
    ->content_is('');

$t->get_ok('/undef-datetime')
    ->status_is(200)
    ->content_is('');

$t->get_ok('/invalid-datetime')
    ->status_is(200)
    ->content_is('');

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
