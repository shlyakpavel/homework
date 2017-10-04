{*** Program made by Pavel Shlyak. MIEM HSE 2017. All rights reserved. ***}

Program Laboratory_project1;

Const  lmax = 200;

Type  mas = array[1..lmax] Of real;

Var
  n, i, first_negative, curr_min, size_new: integer;
  x, h, a: real;
  r: mas;
Begin
  Writeln('Лабораторная работа 1');
  {Задание 1}
  Repeat
    Writeln('Введите количество элементов массива от 1 до ', lmax, ':');
    readln(n)
  Until (n > 0) And (n <= lmax);
  Writeln('Введите x, h, a:');
  Readln(x,h,a);
  For i := 1 To n Do
    r[i] := 6 * cos(a * x + i * h);
  Writeln('Массив R из ', n, ' элементов:');
  For i := 1 To n Do
    Write(r[i]:8:3, ' ');
  Writeln;
  {Задание 2}
  curr_min := 1;
  For i := 1 To n Do
    Begin
      If ( r[i] < r[curr_min] ) Then
        Begin
          curr_min := i
        End;
    End;
  Write('Минимум находится в ', curr_min,' позиции массива. ');
  size_new := curr_min;
  For i:=curr_min To n Do
    Begin
      If (r[i]<0) Then
        Begin
          r[size_new] := r[i];
          size_new := size_new+1;
        End;
    End;
  size_new := size_new-1;
  If (size_new <> n) Then
    Begin
      Writeln('Массив после удаления элементов:');
      For i:= 1 To size_new Do
        Begin
          Write(r[i]:8:3,' ');
        End;
    End
  Else
    Begin
      Writeln('Нет положительных значений после первого глобального минимума. Ничего не удалено.');
    End;
  writeln();
  {Задание 3}
  x := 0;
  {Попытка найти отрицательное значение}
  first_negative := 0;
  Repeat
    first_negative := first_negative+1;
  Until r[first_negative] < 0 ;
  If (curr_min-first_negative > 1) Then
    Begin
      For i:=(first_negative+1) To (curr_min-1) Do
        x := x+r[i];
      x := x/(curr_min-first_negative-1);
      Writeln('Average is ',x:8:5);
    End
  Else
    Writeln(
'Порядковый номер первого отрицательного элемента массива более или равен порядковому номеру первого минимума. В связи с этим решений нет.'
    );
End.
