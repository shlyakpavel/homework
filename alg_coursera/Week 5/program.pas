Program Week5;
Const 
  nmax = 200;
  k = 3;

Type 
  matrix = array[1..nmax,1..nmax] Of Integer;

Var 
  Z: matrix;
  s_num, n, i, j, c: integer;

Procedure ReadSquareMatrix(n: integer; Var Z: matrix);
Var i,j: integer;
Begin
  For i:=1 To n Do
    For j:=1 To n Do
      Read(Z[i,j]);
End;

Procedure WriteSquareMatrix(n: integer; Var Z: matrix);
Var i,j: integer;
Begin
  For i:=1 To n Do
    Begin
      For j:=1 To n Do
        Write(Z[i,j]:5);
      Writeln;
    End;
End;

Begin
  Repeat
    writeln(
'Введите количество столбцов и номер строки. Они не должны превосходить '
            ,nmax,' и введённый n соответственно');
    Readln(n,  s_num)
  Until (n>0) And (n<nmax) And (s_num<=n);
  writeln('Введите элементы матрицы Z построчно');
  ReadSquareMatrix(n,Z);
  writeln('Введена квадратная матрица:');
  WriteSquareMatrix(n,Z);
  For i:=1 To k Do  {что сравниваем}
    For j:=i+1 To n Do {с чем сравниваем}
      If Z[s_num, i]<Z[s_num,j] Then
        Begin
          C := Z[s_num,i];
          Z[s_num,i] := Z[s_num, j];
          Z[s_num,j] := C; {перестановка}
        End;
  {вывод(Z[s_num,1:k])}
  writeln('Найдено ',k ,' максимальных элемента ', s_num, ' строки'
  );
  For i:= 1 To k  Do
    write(Z[s_num,i]:5);
  writeln;
  writeln('Матрица после преобразований:');
  WriteSquareMatrix(n,Z);
  writeln('Элементы под главной диагональю');
  C := 0;
  For i:=2 To n Do
    Begin
      For j:=1 To i-1 Do
        Begin
          write(Z[i,j]:5);
          If (Z[i,j] Mod 3) = 0 Then
            Inc(C);
        End;
      writeln; {переход на следующую строку экрана}
    End;
  writeln('Из них ', C,' элементов кратны трём')
End.
