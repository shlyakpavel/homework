Program Lab4;
Const 
  string_num = 10;

Type 
  StrList = array[1..string_num] Of string;

Var 
  n1, n2, i, j: integer;
  T1, T2: StrList;

{*Addition as an extra task*}
Procedure insertMINE(addition: String; var data: String; pos: Integer);
var i: Integer;
Begin
  setlength(data,length(data)+length(addition));
  for i:=length(data) downto pos do
    data[i]:=data[i-length(addition)];
  for i:=0 to length(addition)-1 do
  data[pos+i]:=addition[i+1];
End;
{*End of the addition*}

Function matches(Var symbol: char) : Boolean;
Begin
  matches := (symbol = '.') Or (symbol = ',') Or (symbol = ';') Or (symbol = ':')
End;

Function hasnumsandbrackets(Var str: String) : Boolean;
Var 
  i: Integer;
  hasnum, hasbrackets: Boolean;
Begin
  hasbrackets := false;
  hasnum := false;
  For i:=1 To length(str) Do
    Begin
      If (hasnum=false) Then hasnum := (str[i] >='0') And (T1[i][j]<='9');
      If (hasbrackets=false) Then hasbrackets := (str[i]='(') Or (str[i]=')')
    End;
  hasnumsandbrackets := hasnum And hasbrackets;
End;

Procedure substr(Var T1, T2: StrList; n1 : Integer; Var n2: Integer);
Var j1: Integer;
Begin
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
End;

Function process(str: String) : String;
Var i, num, err: Integer;
{Num не используется. Но он необходим для val. Поэтому игнорим предупреждение}
Begin
  i := length(str);
  err := 1;
  While (i>0) And (err<>0) Do
    Begin
      val(str[i],num,err);
      Dec(i);
    End;
  InsertMINE('***',str,i+1);
  process := str;
End;

Begin
  writeln('Введите число строк n1 (не более ',string_num,')');
  readln(n1);
  writeln('Введите строки');
  For i:=1 To n1 Do
    readln(T1[i]);
  n2 := 0; {число подстрок}
  substr(T1, T2, n1, n2);
  If n2=0 Then
    {анализ сущестоввания результата для 1 задания}
    writeln('Нет подстрок. Выполнение всех трёх заданий невозможно')
  Else
    Begin {вывод результата 1 задания}
      writeln('1. Подстроки');
      For i:=1 To n2 Do
        writeln(T2[i]);
      writeln('2. Первая подстрока, содержащая цифры и круглые скобки:'      );
      j := 0;
      While (i>0) Do
        Begin;
          If hasnumsandbrackets(T2[i]) Then
            j := i;
          Dec(i);
        End;
      If j<>0 Then
        begin
          writeln(T2[j]);
          writeln('3. Вставить три звездочки перед последней цифрой'      );
	      {Поиск нужной строки}
          While pos(T2[j], T1[i])=0 Do
            Inc(i);
          writeln(process(T1[i]));
        end
      Else writeln('отсутствует');
    End;
End.
