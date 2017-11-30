Program musa;

Var str: String;

Var prevopen: Boolean;

Var i: Integer;
Begin
  readln(str);
  For i:=1 To length(str) Do
    Begin
      If str[i]='(' Then prevopen := true;
      If str[i]=')' Then
        Begin
          If prevopen=true Then writeln('Substring found');
        End;
    End;
End.
