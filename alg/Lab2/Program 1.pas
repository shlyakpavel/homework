Program Laboratory2;

Const
  nmax = 200;
  mmax = 200;
  kmax = 200;

Type
  matrix = array[1..nmax,1..mmax] Of Integer;
  mas = array [1..kmax] Of Integer;

Var
  hasResult: boolean;
  Z: matrix;
  X: mas;
  n, m, k, i, e, maxnum: Integer;

Procedure ReadArray(k: integer; Var X: mas);
Var j: Integer;
Begin
  For j:=1 To k Do
    Read(X[j]);
End;

Procedure ReadMatrix(n: integer; m: integer; Var Z: matrix);
Var i,j: integer;
Begin
  For i:=1 To n Do
    For j:=1 To m Do
      Read(Z[i,j]);
End;

Procedure WriteMatrix(n: integer; m: integer; Var Z: matrix);
Var i,j: integer;
Begin
  For i:=1 To n Do
    Begin
      For j:=1 To m Do
        Write(Z[i,j],' ');
      Writeln;
    End;
End;

Function hasElement(element: integer; X: mas; k: integer): boolean;
Var current_element: integer;
  process: boolean;
Begin
  hasElement := false;
  process := true;
  current_element := 0;
  While (current_element<=k) And process Do
    Begin
      If element=X[current_element] Then
        hasElement := true;
      current_element := current_element+1;
    End;
End;

Begin
  {Блок инициализации переменных}
  hasResult := false;
  Writeln('Лабораторная работа 2. Программа 1');
  Repeat
    Writeln('Введите n, m и k. Они не должны превосходить ',nmax,', '
            ,mmax,' и ',kmax,' соответственно');
    Readln(n, m, k)
  Until (n>0) And (m>0) And (k>0) And (n<nmax) And (m<mmax) And (k<kmax);
  Writeln('Введите элементы матрицы Z построчно');
  ReadMatrix(n,m,Z);
  Writeln('А теперь введите элементы массива X');
  ReadArray(k, X);
{Начало, собственно, самого вычислительного алгоритма}
 {Теперь переберём все строки матрицы}
  For i:=1 To m Do
    Begin
      maxnum := 0;
  {Поиск максимума}
      For e:=1 To n Do
        If abs(Z[i,e]) > abs(Z[i, maxnum]) Then
          maxnum := e;
  {Зануление максимума при соответствии}
      If Not hasElement(Z[i, maxnum], X, k) Then
        Begin
          Z[i, maxnum] := 0;
          hasResult := true;
        End;
    End;
 {Конец вычисления}
  If hasResult Then
    Writeln('Матрица Z после выполнения преобразований:')
  Else
    Writeln('Преобразований не выполнено. Исходная матрица:'
    );
  writeMatrix(n,m,Z);
End.
