
Program Laboratory2;

Const 
  nmax = 200;
  mmax = 200;
  kmax = 200;

Type 
  matrix = array[1..nmax,1..mmax] Of Integer;
  mas = array [1..kmax] Of Integer;

Var 
  Z: matrix;
  X: mas;
  n, m, k, i, e, maxnum: integer;

Procedure ReadArray(k: integer; Var X: mas);

Var j: Integer;
Begin
  For j:=1 To k Do
    Read(X[j]);
End;

Procedure ReadMatrix(n: integer; m: integer; Var Z: matrix);

{*Эта функция не меняет n и m. Но с пространставми имён надо работать ОСТОРОЖНО*}

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
Begin
  hasElement := false;
  For current_element:=0 To k Do
    If element=X[current_element] Then
      Begin
        hasElement := true;
        break;
      End;
End;

Begin {this shit}
  Writeln('Введите n, m и k');
  Readln(n,m, k);
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
        Begin
          If abs(Z[i,e]) > abs(Z[i, maxnum]) Then
            Begin
              maxnum := e;
            End;
        End;
  {Зануление максимума при соответствии}
      If Not hasElement(Z[i, maxnum], X, k) Then
        Z[i, maxnum] := 0;
    End;
 {Конец вычисления}
  Writeln('Матрица Z после выполнения преобразований');
  writeMatrix(n,m,Z);
End. {up with this shit}
