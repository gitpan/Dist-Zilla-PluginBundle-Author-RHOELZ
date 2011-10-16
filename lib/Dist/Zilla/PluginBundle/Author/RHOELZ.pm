## no critic (RequireUseStrict)
package Dist::Zilla::PluginBundle::Author::RHOELZ;
{
  $Dist::Zilla::PluginBundle::Author::RHOELZ::VERSION = '0.01';
}

## use critic (RequireUseStrict)
use strict;
use warnings;

use Moose;

with 'Dist::Zilla::Role::PluginBundle::Easy';

sub configure {
    my ( $self ) = @_;

    $self->add_plugins([
        GithubMeta => {
            issues => 1,
        },
    ]);

    $self->add_plugins([
        'Git::Check' => {
            allow_dirty => ['dist.ini', 'README.pod'],
        },
    ]);

    $self->add_plugins([
        NextRelease => {
            format => '%v %{MMMM dd yyyy}d',
        },
    ]);

    $self->add_plugins([
        'Git::Commit' => {
            allow_dirty => [
                'dist.ini',
                'README.pod',
                'Changes',
            ],
        },
    ]);

    $self->add_plugins([
        'Git::Tag' => {
            tag_format  => '%v',
            tag_message => '%v',
            signed      => 1,
        },
    ]);

    $self->add_plugins([
        'Git::NextVersion' => {
            first_version  => '0.01',
            version_regexp => '^(\d+\.\d+)$',
        },
    ]);

    $self->add_plugins([
        ReadmeAnyFromPod => {
            type     => 'pod',
            filename => 'README.pod',
            location => 'root',
        },
    ]);

    $self->add_plugins(
        'GatherDir',
        'PruneCruft',
        'MetaYAML',
        'License',
        'Readme',
        'ModuleBuild',
        'Manifest',
        'PodCoverageTests',
        'PodSyntaxTests',
        'Test::DistManifest',
        'Test::Kwalitee',
        'Test::Compile',
        'Test::Perl::Critic',
        'TestRelease',
    );

    $self->add_plugins([
        PruneFiles => {
            filename => ['dist.ini', 'weaver.ini'],
        },
    ]);

    $self->add_plugins(
        'ConfirmRelease',
        'UploadToCPAN',
        'PkgVersion',
        'PodWeaver',
    );
}

__PACKAGE__->meta->make_immutable;

1;



=pod

=head1 NAME

Dist::Zilla::PluginBundle::Author::RHOELZ - BeLike::RHOELZ when you build your distributions.

=head1 VERSION

version 0.01

=head1 SYNOPSIS

  ; in your dist.ini
  [@Author::RHOELZ]

=head1 DESCRIPTION

This is the plugin bundle that RHOELZ uses to build distributions.  It is
equivalent to the following:

  [GithubMeta]
  issues = 1
  [Git::Check]
  allow_dirty = dist.ini
  allow_dirty = README.pod
  [NextRelease]
  format = %v %{MMMM dd yyyy}d
  [Git::Commit]
  allow_dirty = dist.ini
  allow_dirty = README.pod
  allow_dirty = Changes
  [Git::Tag]
  tag_format  = %v
  tag_message = %v
  [Git::NextVersion]
  first_version  = 0.01
  version_regexp = ^(\d+\.\d+)$
  [ReadmeAnyFromPod]
  type     = pod
  filename = README.pod
  location = root
  [GatherDir]
  [PruneCruft]
  [MetaYAML]
  [License]
  [Readme]
  [ModuleBuild]
  [Manifest]
  [PodCoverageTests]
  [PodSyntaxTests]
  [Test::DistManifest]
  [Test::Kwalitee]
  [Test::Compile]
  [Test::Perl::Critic]
  [TestRelease]
  [PruneFiles]
  filename = dist.ini
  filename = weaver.ini
  [ConfirmRelease]
  [UploadToCPAN]
  [PkgVersion]
  [PodWeaver]

=head1 SEE ALSO

L<Dist::Zilla>

=head1 AUTHOR

Rob Hoelz <rob@hoelz.ro>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Rob Hoelz.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website
https://github.com/hoelzro/dist-zilla-pluginbundle-author-rhoelz/issues

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=cut


__END__

# ABSTRACT:  BeLike::RHOELZ when you build your distributions.

