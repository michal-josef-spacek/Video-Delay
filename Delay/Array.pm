package Video::Delay::Array;

# Pragmas.
use strict;
use warnings;

# Modules.
use Class::Utils qw(set_params);

# Version.
our $VERSION = 0.01;

# Constructor.
sub new {
	my ($class, @params) = @_;

	# Create object.
	my $self = bless {}, $class;

	# Array.
	$self->{'array'} = [1, 2, 3];

	# Loop.
	$self->{'loop'} = 1;

	# Process params.
	set_params($self, @params);

	# Index.
	$self->{'index'} = 0;

	# Object.
	return $self;
}

# Get delay.
sub delay {
	my $self = shift;

	# Return value.
	my $ret;
	if ($self->{'index'} <= @{$self->{'array'}} - 1) {
		$ret = $self->{'array'}->[$self->{'index'}];
	}

	# Increment.
	$self->{'index'}++;
	if ($self->{'loop'} && $self->{'index'} > @{$self->{'array'}} - 1) {
		$self->{'index'} = 0;
	}

	# Value.
	return $ret;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Video::Delay::Array - Video::Delay class for predefined list of delays.

=head1 SYNOPSIS

 use Vide::Delay::Array;
 my $delay = Video::Delay::Array->new(%parameters);
 my $sec = $delay->delay;

=head1 METHODS

=over 8

=item B<new(%parameters)>

 Constructor

=over 8

=item * B<array>

 Array of predefined delays.
 Default value is [1, 2, 3].

=item * B<loop>

 Loop flag.
 Default value is 1.

=back

=item B<delay()>

 Returns delay from array defined by 'array' parameter in seconds.
 Affected by 'loop' parameter.

=back

=head1 ERRORS

 From Class::Utils::set_params():
         Unknown parameter '%s'.

=head1 EXAMPLE

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Video::Delay::Array;

 # Object.
 my $obj = Video::Delay::Array->new(
         'array' => [1, 2],
         'loop' => 1,
 );

 # Print delay.
 print $obj->delay."\n";
 print $obj->delay."\n";
 print $obj->delay."\n";

 # Output
 # 1
 # 2
 # 1

=head1 DEPENDENCIES

L<Class::Utils>.

=head1 SEE ALSO

L<Video::Delay::Const>,
L<Video::Delay::Func>.

=head1 AUTHOR

Michal Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

BSD license.

=head1 VERSION

0.01

=cut
