Program Laboratory1;

{Сформировать новый массив, содержащий суммы цифр каждого элемента исходного массива.}

Const 
  kmax = 200;

Type 
  mas = array [1..kmax] Of Integer;

Var 
  X, Res: mas;
  k, c_num, sum: Integer;

Procedure ReadArray(k: integer; Var X: mas);

Var j: Integer;
Begin
  For j:=1 To k Do
    Read(X[j]);
End;

Procedure WriteArray(k: integer; Var Res: mas);

Var j: Integer;
Begin
  For j:=1 To k Do
    Write(Res[j], ' ');
End;

Begin
Writeln('Лабораторная работа 2. Программа 2');
{Для начала крайне разумно затребовать массив у пользователя. Что ж, начнём
* Для начала классика: размер массива нам необходим, если мы не хотим заметно усложнить программу}
  Writeln('Введите количество элементов массива от 1 до ', kmax
  );
  Readln(k);
  While (k<=0) Or (k>kmax) Do
    Begin
      Writeln(

'Юзер, ты тупой. Массив ну никак не может быть пустым, иметь отрицательное значение или, ещё хуже, превышать '
              ,kmax);
      Readln(k);
    End;
  {Теперь попробуем заполнить массив данными}
  Writeln('Введите теперь сам массив длинной ', k,
         '. Массив вводить по одному элементу через пробел.'
  );
  ReadArray(k, X);

{Если программа ещё не вылетела, то уже отлично.
  * Начнём с перебора элементов массива.}
  For c_num:=1 To k Do
    Begin
      Res[c_num] := X[c_num];
      sum := 0;
      While ( Res[c_num]<>0 ) Do
        Begin
          sum := sum + (Res[c_num] Mod 10);
          Res[c_num] := Res[c_num] Div 10;
        End;
      Res[c_num] := sum;
    End;
  WriteArray(k, Res);
End.
