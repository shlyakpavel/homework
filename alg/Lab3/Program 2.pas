{$MODE DELPHI}
//For testing puposes use 'echo -ne 16 '\n' {-64..63}'\n' {64..-63}'\n' | tr -d ' ' | ./Program\ 2 '
//OR ' echo -ne 16 '\n' {-64..63}'\n' {64..-63}'\n' | tr -d ' ' | mono ./Program\ 2.exe 

Program Lab32;
Const 
  nmax = 200;

Type 
  matrix = array[1..nmax,1..nmax] Of Integer;

Var 
  Z: Matrix;
  n, jmin, imax_num: Integer;

Function ReadSafeInt() : Integer;

Var 
  safety: String = '0';
  success: Integer = 0;
Begin
  Repeat
    Readln(safety);
    val(safety, result, success);
  Until success = 0;
End;

Procedure ReadSquareMatrix(n: integer; Var Z: Matrix);
Var i,j: Integer;
Begin
  For i:=1 To n Do
    For j:=1 To n Do
      Z[i,j] := ReadSafeInt();
End;

Procedure WriteSquareMatrix(n: integer; Z: Matrix);
Var i,j: Integer;
Begin
  For i:=1 To n Do
    Begin
      For j:=1 To n Do
        write(Z[i,j]:5);
      writeln;
    End;
End;

Function MinMax(n:Integer; Z : Matrix) : Integer;
Var i,j: Integer;
Begin
  result := MaxInt;
  For j:=1 To n Do
    Begin
      imax_num := 1;
      For i:=1 To n Do
        If (Z[imax_num,j]<Z[i,j]) Then
          imax_num := i;
      Write(Z[imax_num,j]:5);
      If (result>Z[imax_num,j] ) Then
        result := Z[imax_num,j];
    End;
  writeln;
End;

Begin
  Repeat
    writeln('Введите количество столбцов. Оно не должны превосходить '
            ,nmax);
    n := ReadSafeInt();
  Until (n>0) And (n<=nmax);
  writeln('Введите элементы матрицы Z построчно');
  ReadSquareMatrix(n,Z);
  writeln('Введена квадратная матрица:');
  WriteSquareMatrix(n,Z);
  writeln('Максимумы:');
  jmin := MinMax(n,Z);
  writeln('Их минимум: ',jmin);
End.
