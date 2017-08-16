( gforth configbin.4th config.bin <# of addresses> )
include filter-regmap.4th

hex
: #addresses next-arg s>number drop 4 * ;
: addresses  next-arg slurp-file drop ;
addresses #addresses  2constant addresses
           addresses + constant data
( TODO display address even if string not found)

( dump a bitstream so we can view it)
: config. cr data addresses bounds ?do dup i c@ 2* bounds ?do i 1+ c@ 2 u.r space j l@ $FF invert and i c@ + 0 psoc5lp-offsets. 2 +loop i c@ 2* + 4 +loop drop ;

( compile a bitstream so we can search it)
: config,    data addresses bounds ?do dup i c@ 2* bounds ?do i 1+ c@ c, ( byte) j l@ $FF invert and i c@ + , ( register) 2 +loop i c@ 2* + 4 +loop drop ;

create config here here config, here swap - 2constant config$

config.

