Program example1;
Const
string_num=10;

Type
StrList = array[1..string_num] Of string;

Var
n1, n2, i, j: integer;
T1, T2: StrList;
  
Function matches(var symbol: char) : Boolean;
begin
matches:= (symbol = '.') or (symbol = ',') or (symbol = ';') or (symbol = ':')
end;

Function hasnumsandbrackets(var str: String) : Boolean;
var
i: Integer;
hasnum, hasbrackets: Boolean;
begin
hasbrackets:=false;
hasnum:=false;
for i:=1 to length(str) do
begin
if (hasnum=false) then hasnum:= (str[i] >='0') and (T1[i][j]<='9');
if (hasbrackets=false) then hasbrackets:= (str[i]='(') or (str[i]=')')
end;
hasnumsandbrackets:=hasnum and hasbrackets;
end;

Procedure substr(var T1, T2: StrList; n1 : Integer; var n2: Integer);
var j1: Integer;
begin
For i:=1 To n1 Do
    Begin
      j := 1; {номер символа}
      j1 := 1; {начало подстроки}
      While j<=length(T1[i]) Do
        If (matches(T1[i][j])) Then
          Begin
            If j<>1 Then
              Begin
                Inc(n2);
                T2[n2] := copy(T1[i],j1,j-j1);
              End;
            While (j<=length(T1[i])) And (matches(T1[i][j])) Do
              Inc(j);
            j1 := j;
          End
        Else
          Inc(j);
      If j<>j1 Then
        Begin
          Inc(n2);
          T2[n2] := copy(T1[i],j1,j-j1);
        End;
    End;
end;

Begin
  writeln('Введите число строк n1');
  readln(n1);
  writeln('Введите строки');
  For i:=1 To n1 Do
    readln(T1[i]);
  n2 := 0; {число подстрок}
  substr(T1, T2, n1, n2);
  If n2=0 Then {анализ сущестоввания результата для 1 задания}
    writeln('Нет подстрок')
  Else
    Begin {вывод результата 1 задания}
      writeln('1. Подстроки');
      For i:=1 To n2 Do
        writeln(T2[i]);
      writeln('2. Первая подстрока, содержащая цифры и круглые скобки:');
      j:=0;
      while (i>0) do
		begin;
		if hasnumsandbrackets(T2[i]) then
		  j:=i;
		Dec(i);
		end;
	   if j<>0 then
	     writeln(T2[j])
	   else writeln('отсутствует');
    End;
End.
