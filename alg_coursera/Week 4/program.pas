Program Week4;
Const lmax=20;
Type mass=array [1..lmax] of real;
Var a, d, b:mass;
k, j, i:integer;
c:real;
begin
  {ввод длины массива}
  repeat
    writeln('введите длину массива B от 1 до ',lmax);
    read(k);
   until(k>0) and(k<=lmax);
   {ввод элементов массива}
   writeln('Введите ',k ,' элементов массива');
   for i:=1 to k do
    read(b[i]);
    {вывод элементов массива}
   writeln;
   writeln('Введено ',k ,' элементов массива');
   for i:=1 to k
   do
    write(b[i]:10:5);
   writeln;
   writeln;
   {Задание 1}
   writeln('.......Задание 1.......');
   j:=0;
   c:=0; // Число i у нас не менее 1, как следстве 3i > 0 для всех i 
   for i:=1 to k do
   begin
    if (b[i]>=(3*i)) and (b[i] > c) then
     c:=b[i]
   end;
   if c>0 then
    writeln('Максимум массива B при b[i]>=3i: ', c:10:5)
   else
    writeln('Максимума нет, так как ни один элемент не удоволетворяет условям');
   writeln;
   {Задание 2}
   writeln('.......Задание 2.......');
    {формирование нового массива неизвестной длины}
   j:=0; {длина массива B}
	 for i:=2 to k do
	  if b[i]<=b[i-1] then
	  begin
			j:=j+1;
			D[j]:=-B[i]		
		end;
	if j=0 then
		writeln('нет массива B')
	else
	begin
	  {вывод(B[1:n])}
	 writeln('Получен массив B из ',j ,' элементов');
   for i:=1 to j do
    write(b[i]:10:5);
   writeln;
	end;
	writeln;
   {Задание 3}
   writeln('.......Задание 3.......');
   writeln('Введите число x1');
   readln(c);
   writeln('Массив a');
   for i:=1 to j do
   begin
	if b[i]>c then
		a[i]:=sqrt(b[i])
	else
		a[i]:=power(b[i],2);
	write(a[i]:10:5,'  ');
   end;
end.
