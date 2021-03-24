program IksOksKod;
type matrica= array [1..3, 1..3] of char;
var mat: matrica;
    brojac: integer;
    pobednik: boolean;
procedure PraznaMatrica (var mat: matrica);
          var i,j: integer;
          begin
          for i:= 1 to 3 do
              begin
              for j:= 1 to 3 do
                  begin
                  mat[i,j]:='_'
                  end;
              end;
          end;
procedure IspisMatrice (mat: matrica);
          var i,j: integer;
          begin
          for i:= 1 to 3 do
              begin
              for j:= 1 to 3 do
                  begin
                  write ('_'+mat[i,j]+'_');
                  end;
              writeln ();
              end;
          end;
procedure PrviIgra (var mat: matrica);
          var polje: integer;
          begin
          writeln ('Prvi igrac na potezu, izaberite polje');
          readln (polje);
                 case polje of
                      1,2,3 : if mat[3,polje]='_' then mat[3,polje]:='x' else
                       begin
                       writeln ('Nedozvoljeno polje');
                       PrviIgra(mat);
                       end;
                      4,5,6 : if mat[2,(polje-3)]='_' then mat[2,(polje-3)]:='x' else
                       begin
                       writeln ('Nedozvoljeno polje');
                       PrviIgra(mat);
                       end;
                      7,8,9 : if mat[1,(polje-6)]='_' then mat[1,(polje-6)]:='x' else
                       begin
                       writeln ('Nedozvoljeno polje');
                       PrviIgra(mat);
                       end;
                       else
                       begin
                       writeln ('Polje mora biti od 1 do 9');
                       PrviIgra(mat);
                       end;
                 end;
          end;
procedure DrugiIgra (var mat: matrica);
          var polje: integer;
          begin
          writeln ('Drugi igrac na potezu, izaberite polje');
          readln (polje);
                 case polje of
                      1,2,3 : if mat[3,polje]='_' then mat[3,polje]:='o' else
                       begin
                       writeln ('Nedozvoljeno polje');
                       DrugiIgra(mat);
                       end;
                      4,5,6 : if mat[2,(polje-3)]='_' then mat[2,(polje-3)]:='o' else
                       begin
                       writeln ('Nedozvoljeno polje');
                       DrugiIgra(mat);
                       end;
                      7,8,9 : if mat[1,(polje-6)]='_' then mat[1,(polje-6)]:='o' else
                       begin
                       writeln ('Nedozvoljeno polje');
                       DrugiIgra(mat);
                       end;
                       else
                       begin
                       writeln ('Polje mora biti od 1 do 9');
                       DrugiIgra (mat);
                       end;
                 end;
          end;
procedure ProveraPrvi (mat: matrica; var brojac: integer; var pobednik: boolean);
          var i: integer;
          begin
          for i:=1 to 3 do
              begin
              if ((mat[i,1]='x') and (mat[i,1]=mat[i,2]) and (mat[i,1]=mat[i,3])) then
              begin
              writeln ('Prvi igrac je pobedio!');
              brojac:=10;
              pobednik:=true;
              end;
              end;
          for i:=1 to 3 do
              begin
              if ((mat[1,i]='x') and (mat[1,i]=mat[2,i]) and (mat[1,i]=mat[3,i])) then
              begin
              writeln ('Prvi igrac je pobedio!');
              brojac:=10;
              pobednik:=true;
              end;
              end;
          if (mat[1,1]='x') and ((mat[1,1]=mat[2,2]) and (mat[1,1]=mat[3,3])) then
             begin
              writeln ('Prvi igrac je pobedio!');
              brojac:=10;
              pobednik:=true;
              end;
          if (mat[3,1]='x') and ((mat[3,1]=mat[2,2]) and (mat[1,1]=mat[1,3])) then
             begin
              writeln ('Prvi igrac je pobedio!');
              brojac:=10;
              pobednik:=true;
              end;
          end;
procedure ProveraDrugi (mat: matrica; var brojac: integer; var pobednik: boolean);
          var i: integer;
          begin
          for i:=1 to 3 do
              begin
              if ((mat[i,1]='o') and (mat[i,1]=mat[i,2]) and (mat[i,1]=mat[i,3])) then
                 begin
                 writeln ('Drugi igrac je pobedio!');
                 brojac:=10;
                 pobednik:=true;
              end;
              end;
          for i:=1 to 3 do
              begin
              if ((mat[1,i]='o') and (mat[1,i]=mat[2,i]) and (mat[1,i]=mat[3,i])) then
              begin
                 writeln ('Drugi igrac je pobedio!');
                 brojac:=10;
                 pobednik:=true;
              end;
              end;
          if (mat[1,1]='o') and ((mat[1,1]=mat[2,2]) and (mat[1,1]=mat[3,3])) then
             begin
                 writeln ('Drugi igrac je pobedio!');
                 brojac:=10;
                 pobednik:=true;
             end;
          if (mat[3,1]='o') and ((mat[3,1]=mat[2,2]) and (mat[1,1]=mat[1,3])) then
             begin
                 writeln ('Drugi igrac je pobedio!');
                 brojac:=10;
                 pobednik:=true;
                 end;
          end;
begin
PraznaMatrica(mat);
IspisMatrice(mat);
brojac:=1;
pobednik:=false;
while brojac<= 9 do
      begin
      if brojac mod 2 = 1 then
           begin
           PrviIgra(mat);
           ProveraPrvi(mat,brojac,pobednik);
           IspisMatrice(mat);
           end
           else
           begin
           DrugiIgra(mat);
           ProveraDrugi(mat,brojac,pobednik);
           IspisMatrice(mat);
           end;
      brojac:=brojac+1;
      end;
if not (pobednik) then writeln('Nereseno je!') ;
readln;
end.
