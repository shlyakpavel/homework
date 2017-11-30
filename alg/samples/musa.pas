Program musa;

Var str: String;

Var prevopen: Boolean;

Var i, start: Integer;
Begin
  readln(str);
  i:=1;
  while i <= length(str) Do
    Begin
      If str[i]='(' Then
      begin
        prevopen := true;
        start:=i;
      end;
      If str[i]=')' Then
        Begin
          If prevopen=true Then writeln('Substring found start at ', start, ' end at ', i);
          prevopen:=false;
        End;
      Inc(i);
    End;
End.
