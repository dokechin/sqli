package SQLi::web::Controller::Example;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub welcome {
  my $self = shift;
  
  if ( $self->req->method eq "POST"){
    my $id = $self->req->param("id");
    my @rows = $self->db->search_by_sql("select id,food from user where id = '$id'");
    $self->stash(rows => \@rows);
  }
  else{
    $self->stash(rows => []);
  }

  $self->render();


}

1;
