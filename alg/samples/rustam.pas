program del;
var
  f1, f2: text; 
  i, j, k: integer;  
  s, name1, name2: string; 
  c: char;

begin
  repeat
    writeln('введите имя входного файла'); 
    readln(name1);
  until FileExists(name1); 
  assign(f1, name1); 
  reset(f1);
  writeln('Выходной файл:'); 
  readln(name2);
  assign(f2, name2); 
  rewrite(f2);
  Repeat
  begin
    readln(f1, s);
    k := 0;
    for i := 1 to length(s) do 
      if ((s[i] > 'я') or (s[i] < 'а')) and (s[i] <> 'ё' ) then 
      begin
        inc(k);
        s[k] := s[i];
      end;
    if k <> 0 then writeln(f2, s);
    end;
  Until eof(f1);
  close(f1);
  close(f2);
  writeln('результат в файле ', name2);
end.
