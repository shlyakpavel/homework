Program example1;

Var  n1, n2, i, j, j1: integer;
  T1, T2: array[1..10] Of string;
Begin
  writeln('Введите число строк n1');
  readln(n1);
  writeln('Введите строки');
  For i:=1 To n1 Do
    readln(T1[i]);
  n2 := 0; {число подстрок}
  For i:=1 To n1 Do
    Begin
      j := 1; {номер символа}
      j1 := 1; {начало подстроки}
      While j<=length(T1[i]) Do
        If (T1[i][j] = '.') or (T1[i][j] = ',') or (T1[i][j] = ';') or (T1[i][j] = ':') Then
          Begin
            If j<>1 Then
              Begin
                n2 := n2+1;
                T2[n2] := copy(T1[i],j1,j-j1);
              End;
            While (j<=length(T1[i]))
                  And ((T1[i][j] = '.') or (T1[i][j] = ',') or (T1[i][j] = ';') or (T1[i][j] = ':')) Do
              j := j+1;
            j1 := j;
          End
        Else
          j := j+1;
      If j<>j1 Then
        Begin
          n2 := n2+1;
          T2[n2] := copy(T1[i],j1,j-j1);
        End;
    End;
  If n2=0 Then
    writeln('Нет подстрок')
  Else
    Begin
      writeln('Подстроки');
      For i:=1 To n2 Do
        writeln(T2[i]);
    End;
End.
