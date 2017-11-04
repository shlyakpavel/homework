Program Lab31;
Const
  fmax = 170;

Var
  n, k: Integer;
  res, fact_n, fact_k, fact_nk: Real;

Procedure ReadSafeInt(Var result: Integer);
Var
  safety: String;
  success: Integer;
Begin
  Repeat
    Readln(safety);
    val(safety, result, success);
  Until success = 0;
End;

{ Recursive factorial function.
* Orignal c++ code can be found on https://habrahabr.ru/post/255761/ }

Function ProdTree(l, r: Integer) : Real;
Var m: Integer;
Begin
  If l > r Then
    ProdTree := 1
  Else If l = r Then
         ProdTree := l
  Else If r - l = 1 Then
         ProdTree := l*r
  Else
    Begin
      m := Round((l + r) / 2);
      ProdTree := ProdTree(l, m) * ProdTree(m + 1, r);
    End;
End;

Function FactTree(n: Integer) : Real;
Begin
  If n < 0 Then
    FactTree := 0
  Else If n = 0 Then
         FactTree := 1
  Else If (n = 1) or (n = 2) Then
         FactTree := n
  Else
    FactTree := ProdTree(2, n);
End;

Begin
{ Enter n and k }
{ Factorial of a negative value is always a bad idea }
  Repeat
    writeln('Введите n');
    ReadSafeInt(n);
  Until (n>0) and (n <= fmax);
{ k shouldn't be greater than n as we will need factorial of k-n later }
  Repeat
    writeln('Введите k меньше ', n);
    ReadSafeInt(k);
  Until (k>=0) and (k<n);
{ All the arithmetics is here }
  fact_n := FactTree(n);
  fact_k := FactTree(k);
  fact_nk := FactTree(n-k);
  res := fact_n/(fact_k*fact_nk);
{ Output result }
  writeln(res);
End.
