use Map::Tube::Hongkong;
 
die "no parameters\n" unless $ARGV[1];

my $map = Map::Tube::Hongkong->new;

print "ok!\n";

print $map->get_shortest_route($ARGV[0], $ARGV[1]);
print "\n\n";
print "\n=================================\n";
print join "\n", $map->_capture_common_lines($map->get_node_by_name($ARGV[0]), $map->get_node_by_name($ARGV[1]))->@*;

# functionality I would like to add: get_route_minimizing_interchanges

#print join "\n", $map->get_all_routes($ARGV[0], $ARGV[1])->@*;
print "\n";
