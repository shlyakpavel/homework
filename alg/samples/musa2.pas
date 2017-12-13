Program max_file;

Type fofreal = file Of real;

Var f : fofreal;

Procedure prn (Var f : fofreal); {вывод файла на экран}
Var c : real;
Begin
  reset(f);
  If eof(f) Then writeln ('Файл пуст')
  Else
    Begin
      writeln('Файл содержит числа:');
      While Not eof(f) Do
        Begin
          read(f , c);
          write (c : 8:3);
        End;
      writeln;
    End;
  close(f);
End;

Procedure make_file (Var f : fofreal); {формирование файла }
Var s: string;
  c : real;
  code: integer;
Begin
  writeln ('Вводите числа в столбец');
  writeln ('Признак окончания ввода - буква');
  assign (f , 'f.txt');
  rewrite (f);
  Repeat
    readln (s);
    val (s,c,code);
    If code=0 Then  write (f,c);
  Until code<>0;
  close(f);
  writeln('Файл сформирован.');
End;

Procedure count (Var f : fofreal); {подсчет }
Var c: real;
  max: integer;
Begin
  max := 0;
  reset (f);
  While Not eof(f) Do
    Begin
      read (f,c);
      If (c > 0) Then Inc(max);
    End;
  close(f);
  If max=0 Then
    writeln ('Положительных чисел нет ')
  Else
    writeln ('Количество положительных чисел;', max);
End;
Begin   {основная программа}
  make_file (f);
  prn (f);
  count (f);
End.
