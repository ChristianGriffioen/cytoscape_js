use strict;
use warnings FATAL => 'all';

my $file_name = "20181101_CRC1";

my $file= ("data/${file_name}.txt");
open my $content, $file or die("Could not open $file: $!");

my @sources = ();

#Creating unique gene IDs
my %seen;
while (<$content>) {
    chomp;
    my $line = $_;
    my @elements = split (/\t/, $line);
    my $source = $elements[0];
    if ($source ne "gene1"){
        push @sources, $source . "\n" if !$seen{$source}++;
    }
}

#Adding the 'nodes' to the json file (json format)

my $filename = "data/${file_name}.json";
open(FH, '>', $filename) or die $!;

print FH '[';
my $first_line = 1;
for my $unique_source (<@sources>) {
    if ($first_line == 1) {
        print FH '{';
    } else {
        print FH ',{';
    }
    print FH '
"data": {
"id": "', $unique_source, '"
    },
"group": "nodes",
"selectable": true,
"grabbable": true
}';
    $first_line = 0;
    }

#Adding the 'edges' to the json file (json format)
open $content, $file or die("Could not open $file: $!");
my $target;
my $source;
my $binding_sites = 0;

for my $line (<$content>)  {
    chomp($line);
    my @split_line = split (/\t/,$line);
        if ($split_line[2] ne "bindingSites"){
            $source = $split_line[0];
            $target = $split_line[1];
            $binding_sites = $split_line[2];
            print FH ',{
"data": {
"id": "',$source,'_to_',$target,'",
"source": "',$target,'",
"target": "',$source,'",
"isdirected": true
    },
"position": {},
"group": "edges",
"selectable": true,
"grabbable": true,
"style": {
    "width": "',$binding_sites/50,'"
}
}';
        }}
    print FH ']';

close $content;
close FH;
