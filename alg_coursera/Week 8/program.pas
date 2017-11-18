Program Week7;

Const 
  nmax = 100;

Type 
  matrix = array[1..nmax,1..nmax] Of Integer;

Var 
  Z: matrix;
  n, line: integer;
  global_flag: boolean = false;

Procedure ReadSquareMatrix(n: integer; Var Z: matrix);

Var i,j: integer;
Begin
  For i:=1 To n Do
    For j:=1 To n Do
      read(Z[i,j]);
End;

Procedure WriteSquareMatrix(n: integer; Var Z: matrix);

Var i,j: integer;
Begin
  For i:=1 To n Do
    Begin
      For j:=1 To n Do
        write(Z[i,j]:5);
      writeln;
    End;
End;
Procedure sort(Var A: Matrix; n,l : Integer);

Var i, j, buff: Integer;
Begin
  For i:=1 To n-1 Do
    Begin
      For j:=i+1 To n Do
        Begin
          If A[line, i]>A[line,j] Then
            Begin
              buff := A[line,i];
              A[line, i] := A[line, j];
              A[line, j] := buff;
              global_flag := true;
            End;
        End;
    End;
End;

Begin
  Repeat
    writeln(
            'Введите количество столбцов');
    Readln(n)
  Until (n>0) And (n<=nmax);
  writeln('Введите элементы матрицы Z построчно');
  ReadSquareMatrix(n,Z);
  writeln('Введена квадратная матрица:');
  WriteSquareMatrix(n,Z);
  For line:=1 To n Do
    sort(Z, n, line);
  if global_flag then
    writeln('Результат:')
  else writeln('Матрица не претерпела преобразований:');
  WriteSquareMatrix(n,Z);
End.
