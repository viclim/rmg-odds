package OddsConverter;

use autodie;
use Moose;

has 'probability', is => 'rw', isa => 'Num';
has 'stake', is => 'ro', isa => 'Int', default => 1;

# method

__PACKAGE__->meta->make_immutable;

sub BUILD
{
    super();

    my $self = shift;
    if ($self->probability < 0 || $self->probability > 1) {
	$self->probability = 0;
    }
    
}

sub decimal_odds
{
    my $self = shift;
    return ($self->probability eq 0) ? 
	"Inf." : sprintf("%.2f", $self->stake / $self->probability);
}

sub roi
{
    my $self = shift;
    return ($self->decimal_odds eq "Inf.") ? 
	"Inf." : sprintf("%.0f%%", ($self->decimal_odds - $self->stake) * 100);
}

1;
