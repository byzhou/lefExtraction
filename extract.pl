#!/usr/bin/perl

use File::Basename ;
use warnings ;

$lefpre     = "FILLCELL\_X" ;
$lefsuf     = "\.lef" ;
$lefname    = $lefpre ;
#$cmd        = "pwd\n" ;
$size       = 1 ;

$output     = "des\_FILLCELL.txt" ;
#write to file
open $writeFile , "+>" , $output or die "$output is not available!\n" ; 
print $output . " has been successfully opened!\n" ;

for ( my $i = 1 ; $i <= 32 ; $i = $i * 2 ) {
    #cellname creation
    $size       = $i ; 
    $lefname    = $lefpre . $size . $lefsuf ; 

    #read file
    open $readFile , "<" , $lefname or die "$lefname is not available!\n" ;
    print $lefname . " has been successfully opened!\n" ;

    #write the name of the cell
    print $writeFile $lefname . "\n" ;

    #write info the cell
    while ( <$readFile> ) {
        if ( /SIZE*/ ) {
            print $writeFile "$&$'" ;
        }
        if ( /POLYGON*/ ) {
            print $writeFile "$&$'" ;
        }
    }

    #end of the one readFile
    print $writeFile "\n" ;
    close ( $readFile ) ;
}

close ( $writeFile ) ;

