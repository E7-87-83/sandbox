package Map::Tube::Hongkong;

use strict;
use warnings;

our $VERSION = '0.01';

# ABSTRACT: Map::Tube::Hongkong - interface to the Hongkong MTR map

use File::Share ':all';

use Moo;
use namespace::clean;

has xml => (is => 'ro', default => sub { return dist_file('Map-Tube-Hongkong', 'hongkong-map.xml') });
with 'Map::Tube';


1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Map::Tube::Hongkong - Map::Tube::Hongkong - interface to the Hongkong MTR map.

=head1 VERSION

version 0.01

=head1 DESCRIPTION

It currently provides functionality to find the shortest route between
the two given stations.

=head1 CONSTRUCTOR

    use Map::Tube::Hongkong;
    my $tube = Map::Tube::Hongkong->new;

=head1 METHODS

=head2 get_shortest_route(I<START>, I<END>)

This method expects two parameters I<START> and I<END> station name.
Station names are case insensitive. The station sequence from I<START>
to I<END> is returned.

    use Map::Tube::Hongkong;
    my $tube = Map::Tube::Hongkong->new;

    my $route = $tube->get_shortest_route('Yau Ma Tei', 'Mei Foo');

    print "Route: $route\n";

=head1 BUGS/TODOS

The script has not yet optimize to reduce the number of line transitions. For example, normally, the quickest route from Kowloon Tong to Yau Ma Tei is simply travelled through the Kwun Tong Line. However, the current script displays the following suggestion:

1. Kowloon Tong (East Rail Line, Kwun Tong Line), 

2, Mong Kok East (East Rail Line), 

3. Hung Hom (East Rail Line, Tuen Ma Line), 

4. Ho Man Tin (Kwun Tong Line, Tuen Ma Line), 

5. Yau Ma Tei (Kwun Tong Line, Tsuen Wan Line).

If you ask the reverse - its suggestion of how to get from Yau Ma Tei to Kowloon Tong, the script gives a reasonable suggestion:

1. Yau Ma Tei (Kwun Tong Line, Tsuen Wan Line)

2. Mong Kok (Kwun Tong Line, Tsuen Wan Line)

3. Prince Edward (Kwun Tong Line, Tsuen Wan Line)

4. Shek Kip Mei (Kwun Tong Line)

5. Kowloon Tong (East Rail Line, Kwun Tong Line)


=head1 SEE ALSO

L<Map::Tube>.

=head1 AUTHOR

FUNG Cheok Yin <fungcheokyin@gmail.com>

=head1 COPYRIGHT AND LICENSE

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)

=head1 AUTHOR

FUNG Cheok Yin <fungcheokyin@gmail.com>

=cut
