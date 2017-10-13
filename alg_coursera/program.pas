{*** Program made by Pavel Shlyak. MIEM HSE 2017. All rights reserved. ***}

Program Coursera;

Var 
  b, curr: integer;
  a, c, sum, ex: real;

Procedure odd(x: real; n: integer; Var z: real);
Begin
  z := (2*n+1);
  z := 1/(z*exp(z*ln(x)));
End;

Procedure exact(x: real; n: integer; Var z: real);
Begin
  z := 0.5*ln((x+1)/(x-1));
End;

Begin
  Write('Введите положительное x и количество сложений: ');
  Readln(a, b);
  While ( b<=0 ) or ( a<=0 ) Do
    Begin
      Writeln(
'Юзер, ты тупой. количество сложений - положительное число! Повтори весь ввод'
      );
      Readln(a,b);
    End;
  sum := 0;
  For curr:=0 To b Do
    Begin
      odd(a, curr, c);
      sum := sum + c;
    End;
  exact(a, b, ex);
  Writeln('Примерный: ', sum);
  Writeln('Эталонный:', ex);
  Writeln('Разность: ',ex-sum)
End.
