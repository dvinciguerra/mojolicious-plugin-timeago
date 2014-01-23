use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
    INSTALLDIRS   => 'site',
    NAME          => 'Mojolicious::Plugin::TimeAgo',
    VERSION_FROM  => 'lib/Mojolicious/Plugin/TimeAgo.pm',
    AUTHOR        => 'Daniel Vinciguerra <daniel.vinciguerra@bivee.com.br>',
    PREREQ_PM     => {
        'Mojolicious'            => '4.60',
        'DateTime'               => '1.04',
        'DateTimeX::Format::Ago' => '0.002',
    },
    test => { TESTS => 't/*.t' }
);
