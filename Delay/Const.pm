package Video::Delay::Const;

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
