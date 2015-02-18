package SQLi::web;
use Mojo::Base 'Mojolicious';
use SQLi::DB;

# This method will run once at server start
sub startup {
  my $self = shift;

  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer');

  my $config = $self->plugin( 'Config', { file => 'sqli.config' } );

  $self->helper( db => sub { SQLi::DB->new( $config->{db} ) } );

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('example#welcome');
  $r->post('/')->to('example#welcome');
}

1;
