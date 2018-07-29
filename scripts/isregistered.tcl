
bind join - * who_onjoin
bind nick - * who_nickchange
bind raw - 352 rpl_whoreply

# wait this long after a rename or a join to check status
set whodelay 65

proc who_onjoin {nick uhost hand chan} {
	global whodelay
	putlog "join: $chan $nick"
	utimer $whodelay "putserv \"WHO $nick\""
}

proc who_nickchange {nick uhost hand chan newnick} {
	global whodelay
	putlog "nick change: $chan $nick $newnick"
	utimer $whodelay "putserv \"WHO $newnick\""
}

proc rpl_whoreply {from cmd text} {
	putlog "whoreply called; from: $from cmd: $cmd text: $text"
	set repl [split $text " "]
	#putlog [concat "reply 0: " [lindex $repl 0]]
	#putlog [concat "reply 1: " [lindex $repl 1]]
	#putlog [concat "reply 2: " [lindex $repl 2]]
	#putlog [concat "reply 3: " [lindex $repl 3]]
	#putlog [concat "reply 4: " [lindex $repl 4]]
	putlog [concat "reply 5: " [lindex $repl 5]]
	putlog [concat "reply 6: " [lindex $repl 6]]
	#putlog [concat "reply 7: " [lindex $repl 7]]
	#putlog [concat "reply 8: " [lindex $repl 8]]
	set isregistered [string match {*r*} [lindex $repl 6]]
	set nick [lindex $repl 5]
	putlog "whoreply: $nick is registered? $isregistered"
}
