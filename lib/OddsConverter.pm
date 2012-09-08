package OddsConverter;

=head1 NAME

OddsConverter

=head1 SYNOPSIS

    my $oc = OddsConverter->new(probability => 0.5);
    print $oc->decimal_odds;    # '2.00' (always to 2 decimal places)
    print $oc->roi;             # '100%' (always whole numbers or 'Inf.')

=cut

1;
