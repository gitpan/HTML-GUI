use strict;
use warnings;

sub changeFic($){
  my ($ficName) = @_;

	
  open ( my $FH,"<:utf8", $ficName) 
				|| die ("Erreur d'ouverture de $ficName \n") ;
	print "=======================================================\n";
	print "FICHIER : $ficName\n";

	my @content = <$FH>;
	close $FH;

	binmode STDOUT,':utf8';
	foreach my $line (@content){
    $line =~ s/GUI::HTML/HTML::GUI/g;
    $line =~ s/gui::html/html::gui/g;
    $line =~ s/GUI-HTML/HTML-GUI/g;
    $line =~ s/gui-html/html-gui/g;
    $line =~ s/GUI\/HTML/HTML\/GUI/g;
    $line =~ s/gui\/html/html\/gui/g;
		print $line;
	}
  open ( $FH,">:utf8", $ficName) 
				|| die ("Erreur d'ouverture de $ficName \n") ;
  print $FH  join '',@content;
	close $FH;
}

sub traitRep{
  my ($rep) = @_;

	chdir($rep);

	opendir DIR,'.';
	my @files = readdir DIR;
  closedir DIR;

	for my $entry (@files){
		if ($entry !~ /^\./ && $entry !~ /rename/){	
			if (-f $entry){
				changeFic($entry);
			}elsif (-d $entry){
									print "on traite : ".$entry."\n";
					traitRep($entry);
			}		
		}

	}
	chdir('..');
  
}

#traitRep('.');
chdir '.';
changeFic('mail.txt');
