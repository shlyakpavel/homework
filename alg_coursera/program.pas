{*** Program made by Pavel Shlyak. MIEM HSE 2017. All rights reserved. ***}

Program Coursera;

Var 
  curr: integer;
  a, b: real;
  sum, ex, c: double;

Procedure odd(x: real; n: integer; Var z: double);
Begin
  z := (2*n+1);
  z := 1/(z*exp(z*ln(x)));
End;

Procedure exact(x: real; n: integer; Var z: double);
Begin
  z := 0.5*ln((x+1)/(x-1));
End;

Begin
  Write('Введите x > 1 и точность вычислений: ');
  Readln(a, b);
  While ( a<=1 ) Or ( b<=0 ) Do
    Begin
      Writeln(

'Юзер, ты тупой. количество сложений - положительное число! Повтори весь ввод'
      );
      Readln(a,b);
    End;
  sum := 0;
  c := 0;
  curr := 0;
  Repeat
    odd(a, curr, c);
    sum := sum + c;
    curr := curr + 1;
  Until (c<=b);
  curr := curr-1;
  exact(a, curr, ex);
  Writeln('Частичная сумма ряда с заданной точностью: ', sum,
          '. Получена с ', curr, ' интерации.');
  Writeln('Полная сумма ряда:', ex);
  Writeln('Разность: ',ex-sum)
End.
