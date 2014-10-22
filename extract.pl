#!/usr/bin/perl

use File::Basename;

$lefpre     = "FILLCELL\_X" ;
$lefsuf     = "\.lef" ;
$lefname    = $lefpre ;
$cmd        = "pwd\n" ;
$size       = 1 ;

$output     = "des\_FILLCELL.txt" ;
#write to file
open $writeFile , ">" , $output or die "$output is not available!\n" ; 
print $output . " has been successfully opened!\n" ;

for ( my $i = 1 ; $i <= 32 ; $i = $i * 2 ) {
    #cellname creation
    $size       = $i ; 
    $lefname    = $lefpre . $size . $lefsuf ; 

    #read file
    open $readFile , "<" , $lefname or die "$lefname is not available!\n" ;
    print $lefname . " has been successfully opened!\n" ;

    #write the name of the cell
    print $writeFile , $lefname ;

    #write info the cell
    while ( $lefname ) {
        print $writeFile , "$1" if ( /SIZE*\n/ ) ;
        print $writeFile , "$2" if ( /POLYGON*\n/ ) ;
    }
    close ( $readFile ) ;
}

close ( $writeFile ) ;

