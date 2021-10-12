package Era::Command::autoreview;
use Mojo::Base 'Mojolicious::Command', -signatures;
use Mojo::UserAgent;

use Data::Dumper;

has description => 'Github App to comment on PR given a set of rules';
has usage => 'Usage: APPLICATION PrAuto';

has client => sub { Mojo::UserAgent->new(max_redirects => 5) };

has diff => sub {};

=head1

Ideally we're getting a diff per file, if file is not being deleted, stuff should be happening

Every diff should come with a comment as to what's going to be written on a given line

if a comment is not able to be posted, script should fail

parse_diff should iterate over $self->diff and iterate over to separate versions

add comment should take 

=cut

@ARGV = () if ($ARGV[0] // '') =~ qr/^(-h|(--)?help)$/;

sub run ($self, @args){
	$self->parse_diff();

	$self->execute_request;
}

sub add_comment($self, $comment, $lines){
	...
}

sub parse_diff($self,@args){
	...
}

sub _execute_request($self) {
	my $tx = $self->client->get('https://foursixnine.io' => {Accept => 'text/plain'});
	my $res = $tx->result;

	if ($res->is_success)  { 
		say $res->headers; 
	} else {
		say Dumper($res->headers->location);
		say "Saying there's an error because ". $res->error;

	}

	# elsif ($res->is_error)    { say $res->message }
	# #elsif ($res->code == 301) { say $res->headers->location }
	# else                      { say 'Whatever...' }

}

1;