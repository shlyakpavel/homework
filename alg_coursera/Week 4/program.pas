Program Week4;

Const lmax = 20;

Type mass = array [1..lmax] Of real;

Var a, d, b: mass;
  k, j, i: integer;
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
  c := 0;
  // Число i у нас не менее 1, как следстве 3i > 0 для всех i
  For i:=1 To k Do
    Begin
      If (b[i]>=(3*i)) And (b[i] > c) Then
        c := b[i]
    End;
  If c>0 Then
    writeln('Максимум массива B при b[i]>=3i: ', c:10:5)
  Else
    writeln(
'Максимума нет, так как ни один элемент не удовлетворяет условиям'
    );
  writeln;
   {Задание 2}
  writeln('.......Задание 2.......');
    {формирование нового массива неизвестной длины}
  j := 0; {длина массива B}
  For i:=2 To k Do
    If b[i]<=b[i-1] Then
      Begin
        j := j+1;
        D[j] := -B[i]
      End;
  If j=0 Then
    writeln('нет массива B')
  Else
    Begin
   {вывод(B[1:n])}
      writeln('Получен массив B из ',j ,' элементов');
      For i:=1 To j Do
        write(b[i]:10:5);
      writeln;
    End;
  writeln;
   {Задание 3}
  writeln('.......Задание 3.......');
  writeln('Введите число x1');
  readln(c);
  writeln('Массив a');
  For i:=1 To j Do
    Begin
      If b[i]>c Then
        a[i] := sqrt(b[i])
      Else
        a[i] := power(b[i],2);
      write(a[i]:10:5,'  ');
    End;
End.
