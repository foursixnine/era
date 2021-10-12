package Era::Command;
use Mojo::Base 'Mojolicious::Command', -signatures;

use Mojo::UserAgent;

has description => 'Github App to comment on PR given a set of rules';
has usage => "Usage: APPLICATION PrAuto";

sub run ($self, @args){
	...
}

1;