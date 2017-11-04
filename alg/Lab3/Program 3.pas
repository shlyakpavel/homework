{$MODE DELPHI}

Program Lab31;
Const 
  kmax = 200;

Type 
  mas = array [1..kmax] Of Integer;

Var 
  Arr, Res: mas;
  n: Integer;

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

Procedure ReadArray(k: integer; Var X: mas);
Var j: Integer;
Begin
  For j:=1 To k Do
    X[j] := ReadSafeInt();
End;

Procedure WriteArray(k: integer; Var Res: mas);
Var j: Integer;
Begin
  For j:=1 To k Do
    Write(Res[j]:5);
End;

Procedure Fdubl(na: Integer; Var A: mas; Var B:mas);
Var i,j: Integer;
Begin
  For i:=1 To na Do
    Begin
      B[i] := 0;
      For j:=1 To na Do
        If A[i]=A[j] Then
          B[i] := B[i]+1
    End;
End;

Function Cutdubl(na: Integer; Var A:mas; Var Dubl:mas) : Integer;
Var i: Integer;
Begin
  result:=0;
  For i:=1 to na do
    Begin
      if Dubl[i]>1 then
        begin
          Inc(result);
          A[result]:=A[i];
        end;
    End;
End;

Begin
  Repeat
    writeln('Введите количество столбцов от 1 '
            ,kmax);
    n := ReadSafeInt();
  Until (n>1) And (n<=kmax);
  writeln('Введите элементы матрицы Z построчно');
  ReadArray(n, Arr);
  writeln('Вы ввели матрицу');
  WriteArray(n, Arr);
  Writeln;
  Fdubl(n, Arr, Res);
  writeln('Результат работы первой функции:');
  Writearray(n, Res);
  Writeln;
  n:= Cutdubl(n, Arr, Res);
  writeln('Результат работы второй функции:');
  if n>1 then
    Writearray(n, Arr)
  else
    Writeln('Array has no dublicate entries');
  Writeln;
End.
