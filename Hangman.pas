program hangman;

uses crt;

var words:array[1..10] of string =(' c r a z y ', ' q u i c k ', ' j u i c e ', ' s h a r k ', ' w o r l d ', ' s p a c e ', ' w a t e r ', ' d i r t y ', ' b r a n d ', ' w h i t e ');
	s1, s2, s3, s4, s5, s6, s7, s8, s9, empty, word, let, player, letters, efforts, guess:string;
	key, yesorno, l:char;
	i, p1, wins, defeats:integer;
	win, defeat:boolean;
 
 
procedure intro();
	begin
	writeln('      ___           ___           ___           ___');   
	writeln('     /\__\         /\  \         /\__\         /\  \');
	writeln('    /:/  /        /::\  \       /::|  |       /::\  \');  
	writeln('   /:/__/        /:/\:\  \     /:|:|  |      /:/\:\  \');  
	writeln('  /::\  \ ___   /::\~\:\  \   /:/|:|  |__   /:/  \:\  \');
	writeln(' /:/\:\  /\__\ /:/\:\ \:\__\ /:/ |:| /\__\ /:/__/_\:\__\'); 
	writeln(' \/__\:\/:/  / \/__\:\/:/  / \/__|:|/:/  / \:\  /\ \/__/');
	writeln('      \::/  /       \::/  /      |:/:/  /   \:\ \:\__\');
	writeln('      /:/  /        /:/  /       |::/  /     \:\/:/  /');
	writeln('     /:/  /        /:/  /        /:/  /       \::/  /');
	writeln('     \/__/         \/__/         \/__/         \/__/');
	writeln('                                ___           ___           ___');    
	writeln('                               /\__\         /\  \         /\__\');    
	writeln('                              /::|  |       /::\  \       /::|  |');   
	writeln('                             /:|:|  |      /:/\:\  \     /:|:|  |');   
	writeln('       .----------,         /:/|:|__|__   /::\~\:\  \   /:/|:|  |__'); 
	writeln('       |          |        /:/ |::::\__\ /:/\:\ \:\__\ /:/ |:| /\__\');
	writeln('       `----------`        \/__/~~/:/  / \/__\:\/:/  / \/__|:|/:/  /');
	writeln('                                 /:/  /       \::/  /      |:/:/  /');
	writeln('                                /:/  /        /:/  /       |::/  /');
	writeln('                               /:/  /        /:/  /        /:/  /');
	writeln('                               \/__/         \/__/         \/__/');
	writeln();
	end;
	
procedure intro2();
	begin
	writeln('   ___________.._______');
	writeln('  | .__________))______|');
	writeln('  | | / /      ||                  _____                          ');
	writeln('  | |/ /       ||                 |  |  |___ ___ ___ _____ ___ ___');
	writeln('  | | /        ||.-``.            |     | .`|   | . |     | .`|   |');
	writeln('  | |/         |/  _  \           |__|__|__,|_|_|_  |_|_|_|__,|_|_|');
	writeln('  | |          ||  `/,|                         |___|');
	writeln('  | |          (\\`_.`');
	writeln('  | |         .-`--`.');
	writeln('  | |        /Y . . Y\');
	writeln('  | |       // |   | \\');
	writeln('  | |      //  | . |  \\');
	writeln('  | |     `)   |   |   (`');
	writeln('  | |          ||`||');
	writeln('  | |          || ||');
	writeln('  | |          || ||');
	writeln('  | |          || ||');
	writeln('  | |         / | | \');
	writeln('  """"""""""|_`-` `-` |"""|');
	writeln('  |"|"""""""\ \       `"|"|');
	writeln('  | |        \ \        | |');
	writeln('  : :         \ \       : :');
	writeln('  . .          ``       . .');
	end;
	
procedure credits();
	begin
	writeln('   ___________.._______');
	writeln('  | .__________))______|');
	writeln('  | | / /      ||                  _____                          ');
	writeln('  | |/ /       ||                 |  |  |___ ___ ___ _____ ___ ___');
	writeln('  | | /        ||.-``.            |     | .`|   | . |     | .`|   |');
	writeln('  | |/         |/  _  \           |__|__|__,|_|_|_  |_|_|_|__,|_|_|');
	writeln('  | |          ||  `/,|                         |___|');
	writeln('  | |          (\\`_.`');
	writeln('  | |         .-`--`.');
	writeln('  | |        /Y . . Y\');
	writeln('  | |       // |   | \\');
	writeln('  | |      //  | . |  \\               ΤΡΕΛΗΣ ΧΑΡΑΛΑΜΠΟΣ');
	writeln('  | |     `)   |   |   (`');
	writeln('  | |          ||`||                        1ΙΤΕΠ01');
	writeln('  | |          || ||');
	writeln('  | |          || ||                         2016');
	writeln('  | |          || ||');
	writeln('  | |         / | | \');
	writeln('  """"""""""|_`-` `-` |"""|');
	writeln('  |"|"""""""\ \       `"|"|');
	writeln('  | |        \ \        | |');
	writeln('  : :         \ \       : :');
	writeln('  . .          ``       . .');
	end;

procedure wrongbutton();
	begin
	writeln('Wrong choice! Try Again!');
	delay(2000);
	clrscr;
	end;
	
procedure enter();
	begin
	writeln();
	writeln('Press <Enter> to continue.');
	readln();
	clrscr;
	end;
	
procedure escenter();
	begin
		repeat
			begin
			writeln ('Press <Enter> to start the game or <Esc> for exit.');
			key:=readkey;
			clrscr;	
				case key of
				#13, #0, #28:	begin
								writeln ('Hangman starts! ! !':50);
								delay(2000);
								clrscr;
								end;
				#27:	begin
							repeat
							writeln ('Are you sure? You want finish the game? (Y)es or (N)o.');
							yesorno:=readkey;	
							clrscr;
								case yesorno of
								#89, #121:	begin
												writeln ('Exit game...':45);
												delay(2000);
												credits();
												delay(2000);
												clrscr;
												halt;
												end;
								#78, #110:	begin
											writeln ('Hangman starts ! ! !':50);
											delay(2000);
											clrscr;
											end
								else wrongbutton();
								end;
						until (yesorno=#78) or (yesorno=#110) or (yesorno=#89) or (yesorno=#121);
					end;
				else wrongbutton();
				end;
			end;
		until (key=#13) or (key=#27) or (key=#0) or (key=#28);
	end;
	
procedure hangpicture();
	begin
	writeln(s1);
	writeln(s2);
	writeln(s3);
	writeln(s4); 
 	write(s5);
 	writeln(empty);
 	writeln(s6);
 	writeln(s7);
 	writeln(s8);
 	write(s9);
 	writeln('                           Wins: ', wins,'     Defeats: ', defeats);
 	writeln();
	end;
 
 
begin
 cursoroff;
 intro();
 enter();
 wins:=0;
 defeats:=0;
 	repeat
 	intro2();
 	escenter();
 	empty:=' _ _ _ _ _ ';
 	efforts:=' 1 2 3 4 5 ';
 	letters:='( a b c d e f g h i j k l m n o p q r s t u v w x y z )';
	p1:=0;
 	randomize();
 	word:=words[random(10)+1];
 	s1:='      ______';
 	s2:='     |/     |';
 	s3:='     |                     The word that you are looking for is:';
 	s4:='     |                                  '; 
 	s5:='     |                                  ';
 	s6:='     |                                  ';
 	s7:='     |                                  ';
 	s8:='     |                                  ';
 	s9:='    _|___';
 	win:=false;
 	defeat:=false;
 		repeat
 			repeat
 				repeat
 				clrscr;
 				hangpicture(); 				
 				write('Available Letters: ');
 				writeln(letters);
 				writeln();
 				write('Wrong Efforts: ');
 				writeln(efforts);
 				writeln();
 				write('Choose a letter: ');
 				readln(l);
 				writeln();
 					case l of
 					'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
 					'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z': 	
 						begin
 							if pos(l, letters)<=0 then 	begin
 														writeln('This letter is no longer available.');
 														enter();
 														end
 							else begin
 								 delete(letters, pos(l, letters), 2); 							 
 									if pos(l, word)<=0 then begin
 															p1:=p1+2;
 															delete(efforts, p1, 1);
 															insert(l, efforts, p1);
 															case p1 of
 															2: begin
 			 		 										delete(s3, 12, 1);
 			 		                                        insert('(_)', s3, 12);
 			 		  										end;
 															4: begin
 					  										delete(s4, 13, 1);
 					   										insert('|', s4, 13);
 					   										delete(s5, 13, 1);
 					   										insert('|', s5, 13);
 					   										delete(s6, 13, 1);
 					   										insert('|', s6, 13);
 					   										end;
 															6: begin
 					   										delete(s5, 12, 1);
 					   										insert('/', s5, 12);
 					   										delete(s6, 11, 1);
 					   										insert('/', s6, 11);
 					   										end;
 															8: begin
 					   										   delete(s5, 14, 1);
 					   										   insert('\', s5, 14);
 					   										   delete(s6, 15, 1);
 					   										   insert('\', s6, 15);
 					   											end;
 															end;
 															writeln('The word does not include this letter.');
 															enter();
 															end
 									else begin
 										 delete(empty, pos(l, word), 1);
 							 	 		 insert(copy(word, pos(l, word), 1), empty, pos(l, word));
 							 	 		 writeln('This is the letter number ', (pos(l, word)) div 2, ' of the word.');
 							 	 		 writeln();
 							 		 	 writeln(empty);
 							 			 enter();
 							 			 end;
 								end;
 						end
 					else wrongbutton();
 					end;
 				until (l='a') or (l='b') or (l='c') or (l='d') or (l='e') or (l='f') or (l='g') or (l='h') or (l='i') or (l='j') or (l='k') or (l='l') or (l='m')
 					or (l='n') or (l='o') or (l='p') or (l='q') or (l='r') or (l='s') or (l='t') or (l='u') or (l='v') or (l='w') or (l='x') or (l='y') or (l='z');
 		if empty=word then begin
 						   win:=true;
 						   wins:=wins+1;
 						   empty:=word;
 						   clrscr;
 						   hangpicture();
 						   writeln('Gongratulation! You win!!!');
 						   enter();
 						   end;
 		until (p1=10) or (win);
 	if win=false then
 		begin
 		delete(s7, 12, 1);
 		insert('/', s7, 12);
 		delete(s8, 11, 1);
 		insert('/', s8, 11);
 		hangpicture();
 		writeln('You have no more efforts! Try to guess the word to win.');
 		writeln();
 		write('Write your guess: '); 		
 		readln(guess);
 		insert(' ', guess, 1);
 		insert(' ', guess, 3);
 		insert(' ', guess, 5);
 		insert(' ', guess, 7);
 		insert(' ', guess, 9);
 		insert(' ', guess, 11);
 			if guess=word then begin
 						   	   win:=true;
 						   	   wins:=wins+1;
 						   	   empty:=word;
 						   	   clrscr;
 						   	   hangpicture();
 						       writeln('Gongratulation! You win!!!');
 						       enter();
 						       end
 			else begin
 				 defeat:=true;
 				 defeats:=defeats+1;
 				 delete(s7, 14, 1);
 				 insert('\', s7, 14);
 				 delete(s8, 15, 1);
 				 insert('\', s8, 15);
 				 clrscr;
 				 hangpicture(); 				 
 				 writeln('Wrong! You lost!!!');
 				 enter();
 				 end;
 		end;
 	until (win) or (defeat);
 until (yesorno=#89) or (yesorno=#121);
end.

