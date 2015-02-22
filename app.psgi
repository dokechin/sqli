use Mojo::Server::PSGI;
use File::Spec;
use File::Basename;
use lib File::Spec->catdir(dirname(__FILE__), 'lib');
use SQLi::web;
use Plack::Builder;

my $web = SQLi::web->new();
my $server = Mojo::Server::PSGI->new(app => $web);

my $app = sub {
    $server->run(@_);
};


builder {
      $app;
};
