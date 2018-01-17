
Program lab5_2;

Var 
  f1, f2: text;
  i, j, k, slength, slength0, cur, code, lines: integer;
  s, name1, name2: string;
  c: char;
  av: real;

Begin
  lines:=0;
  Repeat
    writeln('Введите имя входного файла');
    readln(name1);
  Until FileExists(name1);
  assign(f1, name1);
  reset(f1);
  writeln('Введите имя выходного файла');
  readln(name2);
  assign(f2, name2);
  rewrite(f2);
  While (Not eof(f1)) Do
    Begin
      readln(f1, s);
      writeln('Исходная строка: ', s);
      k := 0;
      i := 1;
      slength0 := length(s);
      slength := length(s);
      While i <= slength Do
        Begin
          val(s[i],cur,code);
          writeln(cur);
          If code=0 Then
            Begin
			  Inc(lines);
              cur := sqr(cur);
              av := av + cur;
            End;
          If ((s[i] >= 'а') And (s[i] <= 'я')) Or (s[i] = 'ё') Then
            Begin
              For j := i To slength - 1 Do
                Begin
                  s[j] := s[j + 1];
                End;
              slength := slength - 1;
              setlength(s, slength);
            End
          Else
            i := i + 1;
        End;
      If slength = 0 Then writeln('Cтрока полностью удалена, тк она полностью состоит из строчных русских букв')
      Else
        Begin
          If slength = slength0 Then
            Begin
              writeln('В строке нет удаления, тк отсутствуют строчные русские буквы');
              writeln(f2, s);
            End
          Else
            Begin
              writeln('Преобразованная строка: ', s);
              writeln(f2, s);
            End;
        End;
    End;
  close(f1);
  close(f2);
  writeln('Результат записан в файл ', name2);
  if (lines <> 0) then
  begin
    av:=sqrt(av/lines);
    writeln(av);
  end
  else writeln('ДЕЛЕНИЕ НА НУЛЬ. ЗАПОЛНИТЕ ФАЙЛ!!!');
End.
