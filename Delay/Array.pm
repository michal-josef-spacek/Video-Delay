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
