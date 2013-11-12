use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'PGObject',
    AUTHOR              => q{Chris Travers <chris.travers@gmail.com>},
    VERSION_FROM        => 'lib/PGObject.pm',
    ABSTRACT_FROM       => 'lib/PGObject.pm',
    PL_FILES            => {},
    PREREQ_PM           => { 
                           'DBD::Pg'    => 2.0,
                           'Test::More' => 0,
                           'Test::Exception' => 0,
                           },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'PGObject-*' },
);
