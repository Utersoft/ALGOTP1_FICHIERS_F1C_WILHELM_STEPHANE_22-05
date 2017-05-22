//STEPHANE WILHELM

program verbe_et_fichiers;

uses crt;

type 
	vTab = array [1..13] of string;

var
	tFile1 : file of string;
	tFile2 : textfile;
	long, i : integer;
	inf, rad, exp, ter, voy : string;
	verbe_inf : vTab;

procedure initialisation;

begin
	assign(tFile2, 'Verbe.txt');
	rewrite(tFile2);

end;

function verbe(verbe_inf : vTab ; i : integer) : string;

//BUT : récupérer le verbe
//ENTREE : la liste de verbe
//SORTIE : le verbe

begin
	verbe_inf[1] := 'rire'; 
	verbe_inf[2] := 'recevoir';
	verbe_inf[3] := 'aller';
	verbe_inf[4] := 'bouillir';
	verbe_inf[5] := 'envoyer';
	verbe_inf[6] := 'peindre';
	verbe_inf[7] := 'habiter';
	verbe_inf[8] := 'payer';
	verbe_inf[9] := 'mourrir';
	verbe_inf[10] := 'hair';
	verbe_inf[11] := 'vouloir';
	verbe_inf[12] := 'finir';
	verbe_inf[13] := 's''amuser';
	verbe := verbe_inf[i];
end;

procedure utiliser(verbe_inf : vTab ; i : integer);

//BUT : séparer les verbes du premier groupe, les conjuguer en faisant attention aux verbes de type manger, lancer
//ENTREE : les verbes
//SORTIE : les verbes du 1er groupe conjuguer

var
	rad2, recup, pron, rad3, rad4 : string;

begin
	recup := verbe(verbe_inf, i);
	long := length(recup);
	//writeln(long);
	inf := copy(recup, long-1, long);
	//writeln(inf);
	exp := copy(recup, long-2, long);
	exp := copy(exp, 1, 1);
	//writeln(exp);
	rad := copy(recup, 1, long-2);
	//writeln(rad);
	rad2 := copy(recup, 1, long-3);
	//writeln(rad2);
	voy := copy(recup, 1, 1);
	//writeln(voy);
	pron := copy(recup, 1, 2);
	//writeln(pron);
	rad3 := copy(recup, long-(long-3), long);
	rad4 := copy(rad3, 1, long-2);
	writeln(rad4);
	writeln(recup);

	if (inf = 'er') and (recup <> 'aller') and (pron <> 's''') then
	begin
		writeln(tFile2, 'Groupe 1 : ');

		IF (voy = 'a') OR (voy = 'e') OR (voy = 'i') OR (voy = 'o') OR (voy = 'u') OR (voy = 'y') OR (voy = 'h') THEN
 			writeln(tFile2, 'j''', rad, 'e')
 		else
 			writeln(tFile2, 'je ', rad, 'e');
		writeln(tFile2, 'tu ', rad, 'es');
		writeln(tFile2, 'il, elle, on ', rad, 'e');
		if (exp = 'g') then
			writeln(tFile2, 'nous ', rad, 'eons')
		else
		begin
			if exp = 'c' then
				writeln(tFile2, 'nous ', rad2, 'çons')
			else
				writeln(tFile2, 'nous ', rad, 'ons');
		end;
		writeln(tfile2, 'vous ', rad, 'ez');
		writeln(tFile2, 'ils, elles ', rad, 'ent');
	end
	else
		if (pron = 's''') then
		begin
			writeln(tFile2, 'je m''', rad3, 'e');
			writeln(tFile2, 'tu t''', rad3, 'es');
			writeln(tFile2, 'il, elle, on ', rad, 'e');
			writeln(tFile2, 'nous nous ', rad3, 'ons');
			writeln(tFile2, 'vous vous ', rad3, 'ez');
			writeln(tFile2, 'ils, elles ', rad, 'ent');
		end;
end;
		

begin
	clrscr;
	initialisation;
	for i := 1 to 13 do
	begin
		utiliser(verbe_inf, i);
		writeln(tFile2);
	end;
	close(tFile2);
	readln;
end.