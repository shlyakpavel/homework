Program example1;
Const 
  n = 10;

Var 
  k, n2, i, j: integer;
  T1, T2: array[1..n] Of string;

Begin
  writeln('Введите число строк k');
  readln(k);
  writeln('Введите строки');
  For i := 1 To k Do
    readln(T1[i]);
  n2 := 0; {число подстрок}
  T2[1] := '';
  For i := 1 To k Do
    //k - количество строк
    Begin
      For j:=1 To length(T1[i]) Do
        Begin
          If (T1[i,j]='*') Then
            Begin
              If (T1[i,j+1]<>'*') Then
                  Inc(n2)
            End
          Else
            T2[n2] := concat(T2[n2],T1[i,j]);
        End;
    End;
  if (n2-1 > 0) then
	For i := 1 To n2-1 Do
		writeln(T2[i])
  else
	writeln('No substing found');
End.
