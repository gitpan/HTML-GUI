use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'HTML::GUI::widget',
    AUTHOR              => 'Jean-Christian Hassler <jhassler@free.fr>',
    VERSION_FROM        => 'lib/HTML/GUI/widget.pm',
    ABSTRACT_FROM       => 'lib/HTML/GUI/widget.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'HTML-GUI-widget-*' },
);
