include psoc5lp-regmap.4th
$2 base !

: bin. $2 base ! &34 u.r hex $5 spaces ;

( inside? makes bits that vary across a subset look the same as we're filtering)
: inside? ( offset mask reg -- f) over or -rot or = ;
: reg   1+ l@ ;
: reg.  reg dup hex. bin. ;
: reg$  1+ cell+ count ;
: reg$. reg$ type ;
: this?reg reg inside? ;
: reg/ reg$ + aligned ;
: offsets. ( offset mask addr u --) bounds ?do 2dup i this?reg if cr i reg. i reg$. then i reg/ i - +loop 2drop ;
: psoc5lp-offsets. psoc5lp offsets. ;
: subset: create 2, does> 2@ psoc5lp-offsets. ;

( not just filtering down, also filtering up from a result)

: any   0 ;
: all  -1 ;
: every any all ;

$40014D00 $FF   subset: DSI13
$400101E0 $FE00 subset: VS0
$400101E2 $FE00 subset: VS1
$400101E4 $FE00 subset: VS2
$400101E6 $FE00 subset: VS3
$400101E8 $FE00 subset: VS4
$400101EA $FE00 subset: VS5
$400101EC $FE00 subset: VS6
$400101EE $FE00 subset: VS7


