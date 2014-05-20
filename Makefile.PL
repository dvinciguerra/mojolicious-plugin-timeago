use 5.010;
use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'Mojolicious::Plugin::TimeAgo',
    AUTHOR           => q{Daniel Vinciguerra <daniel.vinciguerra@bivee.com.br>},
    VERSION_FROM     => 'lib/Mojolicious/Plugin/TimeAgo.pm',
    ABSTRACT_FROM    => 'lib/Mojolicious/Plugin/TimeAgo.pm',
    LICENSE          => 'Artistic_2_0',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.010,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => 0,
    },
    PREREQ_PM => {
        'Mojolicious'            => '4.60',
        'DateTime'               => '1.04',
        'DateTimeX::Format::Ago' => '0.002',
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Mojolicious-Plugin-TimeAgo-*' },
);
