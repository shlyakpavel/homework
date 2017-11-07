{$MODE DELPHI}
//For testing puposes use 'echo -ne 16 '\n' {-64..63}'\n' {64..-63}'\n' | tr -d ' ' | ./Program\ 2 '
//OR ' echo -ne 16 '\n' {-64..63}'\n' {64..-63}'\n' | tr -d ' ' | mono ./Program\ 2.exe 
//OR ' shuf -r -i 1-20 | ./Program\ 2 '
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

{Внимание! НЕ трогать VAR. Убирание его снижает производительность программы более, чем в 89 раз!!!!
* time eval "echo 200; shuf -n 40000 -r -i 1-25" | tr -d ' ' | ./Program\ 2}

Function Expr(i: Integer; j: Integer; var Z : Matrix): Integer;
Begin
	Expr:= Z[i,j]-Z[i+1,j]
End;

Function MinMax(n:Integer; Z : Matrix) : Integer;
Var i,j, curr, prev: Integer;
Begin
  result := MaxInt;
  For j:=1 To n Do
    Begin
      imax_num := 1;
      For i:=1 To n-1 Do
		begin
		curr:=expr(imax_num,j, Z);
		prev:=expr(i,j,Z);
          If (curr<prev) Then
            imax_num := i;
        end;
      Write(expr(imax_num,j, Z):5);
      If (result>expr(imax_num,j,Z) ) Then
        result := expr(imax_num,j,Z);
    End;
  writeln;
End;

Begin
  Repeat
    writeln('Введите количество столбцов от 1 до '
            ,nmax);
    n := ReadSafeInt();
  Until (n>1) And (n<=nmax);
  writeln('Введите элементы матрицы Z построчно');
  ReadSquareMatrix(n,Z);
  writeln('Введена квадратная матрица:');
  WriteSquareMatrix(n,Z);
  writeln('Максимумы разниц по столбцам:');
  jmin := MinMax(n,Z);
  writeln('Их минимум: ',jmin);
End.
