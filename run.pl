use strict;
use warnings;

use HTTP::Server::Simple::CGI;

my $server = HTTP::Server::Simple->new(8000);
$server->run();



