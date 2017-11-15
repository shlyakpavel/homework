{Additional task. It took me less than 17 mins to write it so I'm not responsible for the bugs. THe code is provided "as is"}
program dop;
Const 
  kmax = 200;

Type 
  mas = array [1..kmax] Of Integer;
Var
  n,c, cmin, cmax, j: Integer;
  X: mas;
  
Procedure ReadArray(k: integer; Var X: mas);
Var j: Integer;
Begin
  For j:=1 To k Do
    Read(X[j]);
End;

begin
Read(n);
ReadArray(n,X);
cmin:=1;
cmax:=1;
for c:=1 to n do
begin
  if (X[cmin]>X[c]) then
  begin
    cmin:=c;
  end;
end;
Writeln(X[cmin]);
for c:=1 to n do
begin
  if (cmax<X[c]) then
  begin
    cmax:=c;
  end;
end;
Writeln(cmax);
for c:=1 to n do
begin
  if (X[c]=cmax) then
    begin
      n:=n+1;
      for j:=n downto c+1 do
        begin
        X[j]:=X[j-1];
        end;
      X[c+1]:=cmin;
    end;
  end;
for c:=1 to n do
  write(X[c]:3);
end.
