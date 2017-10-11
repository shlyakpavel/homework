program extra;
Const lmax = 200;
Type  mas = array[1..lmax] Of real;
Var
  n, i, f_pos, l_pos, addr:integer;
  trigger:boolean;
  arr: mas;
Begin
  {Ввод размера массива}
  Repeat
    Writeln('Введите количество элементов массива от 1 до ',
            lmax, ':');
    readln(n)
  Until (n > 0) And (n <= lmax);
  Writeln('Размера массива: ',n,'. Введите его');
  {Ввод содержимого массива}
  for i:=1 to n do
  begin
    read(arr[i]);
  end;
  {поиск первого и последнего положительных элементов}
  trigger:=false;
  for i:=1 to n do
  begin
       if arr[i]>0 then
       begin
           l_pos:=i;
           if trigger=false then
           begin
               trigger:=true;
               f_pos:=i;
           end;
       end;
  end;
  Writeln('Первое положительное значение находится на ',f_pos,' месте массива. Последнее на ', l_pos);
  {Удаление элементов}
  addr:=1;
  for i:=1 to n do
  begin
    if (i <= f_pos) or (i >= l_pos) then
    begin
        arr[addr]:=arr[i]; {Элемент не входит в выборку, оставляем}
        addr:=addr+1;
    end
    else
    begin
      if (arr[i]>=0) or (i mod 2 = 0)  then
      begin
          arr[addr]:=arr[i];
          addr:=addr+1;
      end;
    end;
  end;
{Вывод массива на экран}
if (addr-1) <> n then
Writeln('Новый размер массива: ',(addr-1),' Массив после удаления элементов: ')
else Writeln('Ничего не удалено. Исходный массив:');
for i:=1 to (addr-1) do
begin
  Write(arr[i]:8:3);
end;
Writeln();
end.

