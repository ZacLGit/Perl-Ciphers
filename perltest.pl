use strict;
use diagnostics;
use warnings;
use feature 'say';

say "CAESAR CIPHER";
sub caesarCipher {
	my ($code, $increment) = @_;
	my $outputCode = "";

	#Split cipher input into individual characters and shift character value by the increment input
	foreach my $char (split //, $code) {
		$outputCode = $outputCode.chr(ord($char) + $increment);
	}

	return $outputCode;
}

sub bruteCaesarCipher {
	my ($code, $min, $max) = @_;

	#Check all combinations within a given range
	for(my $i = $min; $i < $max; $i++) {
		say caesarCipher($code, $i);
	}
}

say "Hello World ENCODED by 1= ", caesarCipher("Hello World", 1);
say "Khoor#Zruog DECODED by 3= ", caesarCipher("Khoor#Zruog", -3);
say "BRUTE FORCE DECODED ", bruteCaesarCipher("Ifmmp!Xpsme", -25, 25);

say "\nPIG LATIN";
sub isVowel {
	my ($char) = @_;

	return 1 if $char eq 'a' || $char eq 'e' || $char eq 'i' || $char eq 'o' || $char eq 'u';
	return 0;
}

sub encodePigLatin {
	my ($code) = @_;
	#Split cipher input into char array and cycle through until vowel is reached.
	my @chars = split(//,$code);
	for(my $i = 0; $i < length $code; $i++) {
		if(isVowel(@chars[$i])) {
			#Clear and store letters upto vowel then append to end of output, adding "ay" to the very end
			my $pigStr = substr($code,0,$i);
			chomp(substr($code,0,$i) = "");
			
			return $code.$pigStr."ay";
		}
	}
}
say "ENCODE WORD INPUT:";
my $userInput = <STDIN>;
say encodePigLatin($userInput);

sub decodePigLatin {
	my ($code) = @_;
	#Clear "ay" and rearrange string
	substr($code, -3) = "";

	return chop($code).$code;
}
say "DECODE WORD INPUT:";
my $userInput = <STDIN>;
say decodePigLatin($userInput);
