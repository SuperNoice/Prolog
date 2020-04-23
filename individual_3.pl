st:-see('.\\in.txt'), tell('.\\out.txt'), in, seen, told.

in:-read(In),not(In=end_of_file),calc(In),in,fail.
in:-!.

calc(In):-Out is In, write(Out),nl.
