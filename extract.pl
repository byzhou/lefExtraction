
#!/usr/bin/perl
use File::Basename;

$lefpre     = "FILLCELL\_X" ;
$lefsuf     = "\.lef"
$lefname    = $lefpre ;
$cmd        = "pwd\n" ;
$size       = 1 ;

$output     = "FILLCELL\_Description.txt" ;
#write to file
open $writeFile , ">" , $output or die "$output is not available!\n" ; 
print $output . " has been successfully opened! \n" ;

for ( my $i = 1 ; $i <= 32 ; $i = $i * 2 ) {
    $size       = $i ; 
    $lefname    = $lefpre . $size . $lefsuf ; 
    #read file
    open $readFile , "<" , $lefname or die "$lefname is not available!\n" ;
    print $lefname . " has been successfully opened! \n" ;
}

close ( $writeFile ) ;


    
