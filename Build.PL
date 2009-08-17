use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'HTML::GUI',
    license             => 'perl',
    dist_author         => 'Jean-Christian Hassler <jhassler@free.fr>',
    dist_version_from   => 'lib/HTML/GUI/widget.pm',
		dat_files => {'lib/HTML/GUI/templates/main.html' => 'lib/HTML/GUI/templates/main.html',
							'lib/HTML/GUI/templates/css/base.css' => 'lib/HTML/GUI/templates/css/base.css'	},
    build_requires => {
        'Test::More' => 0,
    },
    add_to_cleanup      => [ 'HTML-GUI-widget-*' ],
);

$builder->add_build_element('dat');

$builder->create_build_script();
