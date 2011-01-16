
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Author test that validates a package MANIFEST',
  'AUTHOR' => 'Jonathan Yu <jawnsy@cpan.org>',
  'BUILD_REQUIRES' => {
    'Test::Builder::Tester' => '0',
    'Test::More' => '0',
    'Test::NoWarnings' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Test-DistManifest',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Test::DistManifest',
  'PREREQ_PM' => {
    'Carp' => '0',
    'Cwd' => '0',
    'File::Find' => '0',
    'File::Spec' => '0',
    'File::Spec::Unix' => '0',
    'Module::Manifest' => '0',
    'Test::Builder' => '0'
  },
  'VERSION' => '1.010',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



