Program Week4;

Const lmax = 20;

Type mass = array [1..lmax] Of real;

Var a, d, b: mass;
  k, j, i, max: integer;
  c: real;
Begin
  {ввод длины массива}
  Repeat
    writeln('введите длину массива B от 1 до ',lmax);
    read(k);
  Until (k>0) And(k<=lmax);
   {ввод элементов массива}
  writeln('Введите ',k ,' элементов массива');
  For i:=1 To k Do
    read(b[i]);
    {вывод элементов массива}
  writeln;
  writeln('Введено ',k ,' элементов массива');
  For i:=1 To k 
    Do
    write(b[i]:10:5);
  writeln;
  writeln;
   {Задание 1}
  writeln('.......Задание 1.......');
  j := 0;
  max := 0;
  For i:=1 To k Do
    Begin
      If (b[i]>=(3*i)) And (b[i] > b[max]) Then
        max := i;
    End;
  If max>0 Then
    writeln('Максимум массива B при b[i]>=3i: ', b[max]:10:5,
            '  Он достигается на ',max,' элементе.')
  Else
    writeln('Максимума нет, так как ни один элемент не удовлетворяет условиям');
  writeln;
   {Задание 2}
  writeln('.......Задание 2.......');
    {формирование нового массива неизвестной длины}
  j := 0; {длина массива B}
  For i:=2 To k Do
    If b[i]<=b[i-1] Then
      Begin
        j := j+1;
        d[j] := -B[i]
      End;
  If j=0 Then
    writeln('Нет массива D. Нет смысла искать массив A')
  Else
    Begin
   {вывод(B[1:n])}
      writeln('Получен массив D из ',j ,' элементов');
      For i:=1 To j Do
        write(d[i]:10:5);
      writeln;
      writeln('.......Задание 3.......');
      writeln('Введите число x1');
      readln(c);
      writeln('Массив a');
    End;
  writeln;
   {Задание 3}
  For i:=1 To j Do
    Begin
      If d[i]>c Then
        If d[i] < 0 Then
          writeln('Корня нет')
      Else
        Begin
          a[i] := sqrt(d[i]);
          writeln(a[i]:10:5,'  ');
        End
      Else
        Begin
          a[i] := power(d[i],2);
          writeln(a[i]:10:5,'  ');
        End;
    End;
End.
