{32%9+1=6}
program del;
//Uses sysutils;
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
  writeln('введите имя выходного файла'); 
  readln(name2);
  assign(f2, name2); 
  rewrite(f2);
  while(not eof(f1)) do 
  begin
    readln(f1, s);
    writeln('исходная строка ', s);
    k := 0;
    for i := 1 to length(s) do 
      if ((s[i] > 'я') or (s[i] < 'а')) and (s[i] <> 'ё' ) then 
      begin
        inc(k);
        s[k] := s[i];
      end;
    if k = 0 then writeln('строка полностью удалена')
  		else
    begin
      if k = length(s) then writeln('В строке нет удаления');
      setlength(s, k);
      writeln('преобразованная строка ', s); 
      writeln(f2, s);
    end;
  end;
  close(f1);
  close(f2);
  writeln('результат записан в файл ', name2);
end.
