package Video::Delay::Const;

# Pragmas.
use strict;
use warnings;

# Modules.
use Class::Utils qw(set_params);

# Version.
our $VERSION = 0.05;

# Constructor.
sub new {
	my ($class, @params) = @_;

	# Create object.
	my $self = bless {}, $class;

	# Constant.
	$self->{'const'} = 1000;

	# Process params.
	set_params($self, @params);

	# Object.
	return $self;
}

# Get delay.
sub delay {
	my $self = shift;
	return $self->{'const'};
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Video::Delay::Const - Video::Delay class for constant delay.

=head1 SYNOPSIS

 use Video::Delay::Const;
 my $obj = Video::Delay::Const->new(%parameters);
 my $delay = $obj->delay;

=head1 METHODS

=over 8

=item C<new(%parameters)>

 Constructor

=over 8

=item * C<const>

 Constant delay in miliseconds.
 Default value is 1000.

=back

=item C<delay()>

 Returns constant delay defined by 'const' parameter in miliseconds.

=back

=head1 ERRORS

 new():
         From Class::Utils::set_params():
                 Unknown parameter '%s'.

=head1 EXAMPLE

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Video::Delay::Const;

 # Object.
 my $obj = Video::Delay::Const->new(
         'const' => 1000,
 );

 # Print delay.
 print $obj->delay."\n";
 print $obj->delay."\n";
 print $obj->delay."\n";

 # Output:
 # 1000
 # 1000
 # 1000

=head1 DEPENDENCIES

L<Class::Utils>.

=head1 SEE ALSO

L<Video::Delay::Array>,
L<Video::Delay::Func>.

=head1 REPOSITORY

L<https://github.com/tupinek/Video-Delay>

=head1 AUTHOR

Michal Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

BSD 2-Clause License

=head1 VERSION

0.05

=cut
