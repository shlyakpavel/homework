Program sort;

//Uses sysutils;
Var f1,f2: text;
  i,j: integer;
  s, name1, name2: string;
  c: char;
Begin
  Repeat
    writeln('введите имя входного файла');
    readln(name1);
  Until FileExists(name1);
  assign(f1,name1);
  reset(f1);
  writeln('введите имя выходного файла');
  readln(name2);
  assign(f2,name2);
  rewrite(f2);
  While (Not eof(f1)) Do
    Begin
      readln(f1,s);
      For i:=1 To length(s)-1 Do
        Begin
          If ((s[i] >= 'a') And (s[i] <= 'z')) or ((s[i] >= 'A') And (s[i] <= 'Z')) Then
            For j:=i+1 To length(s) Do
              If ((s[j] >= 'a') And (s[j] <= 'c')) or ((s[j] >= 'A') And (s[j] <= 'Z')) Then
                If s[i]>s[j] Then
                  Begin
                    c := s[i];
                    s[i] := s[j];
                    s[j] := c;
                  End;
        End;
      writeln(f2,s);
    End;
  close(f1);
  close(f2);
End.
