package SQLi::DB::Schema;
use Teng::Schema::Declare;

    table {
        name 'User';
        pk id;
        columns qw( id food password);
    };


1;
