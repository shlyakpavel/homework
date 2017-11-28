{$MODE DELPHI}

Program Week10;
Uses sysutils;

Const 
  s_size = 30;

Type 
  element = Record
    book: Record
      name, author: string[s_size];
      price, pages: integer;
    End;
    printed: Record
      by, city: string[s_size];
      year: Integer;
    End;
  End;

  Database = file Of element;

Var 
  FileName: String;
  DB: Database;
  rewrite_flag: Boolean;

Procedure readbool(Var flag: Boolean);
{Возвращает TRUE, если пользователь вводит Y, y или оставляет строку пустой}
Var str: String;
Begin
  readln(str);
  flag := (str='Y') Or (str='y') Or (Length(str)=0);
End;

Procedure readSafeInt(Var int: Integer; param: String);
Var 
  err: Integer;
  str: String;
Begin
  readln(str);
  val(str, int, err);
  While (err<>0) Do
    Begin
      write('Дубина, введи '+ param +'. Это ЧИСЛО: ');
      readln(str);
      val(str, int, err)
    End;
End;

Procedure readelement(Var cur: element);
{Запрос информации об одной книге}
Var 
  str: String;
Begin
  With cur Do
    Begin
      Repeat
        write('Название:');
        readln(str);
      Until length(str) <= s_size;
      book.name := str;
{Ввод цены}
      write('Цена:');
      readSafeInt(book.price, 'ЦЕНУ');
{Ввод количества страниц}
      write('Число страниц:');
      readSafeInt(book.pages, 'КОЛИЧЕСТВО СТРАНИЦ');
{Ввод аатора}
      Repeat
        write('Автор:');
        readln(str);
      Until length(str) <= s_size;
      book.author := str;
{Информация об издании}
      writeln('Издание');
      Repeat
        write('Название:');
        readln(str);
      Until length(str) <= s_size;
      printed.by := str;
      Repeat
        write('Город:');
        readln(str);
      Until length(str) <= s_size;
      printed.city := str;
{Год издания}
      write('Год:');
      readSafeInt(printed.year, 'ГОД ИЗДАНИЯ');
    End;
End;

{Фцнкция ввода данных в базу}
Procedure input_data(Var DB: Database);
Var 
  continue : Boolean;
  cur_element : element;
Begin
  Repeat
    readelement(cur_element);
    write(DB, cur_element);
    writeln('Continue? Y/n');
    readbool(continue);
  Until continue=false;
End;

Procedure process(Var DB: Database);
Var 
  cur_element : element;
  index: Integer;
  MinPrice: Integer = MaxInt;
Begin
  For index:=1 To FileSize(DB) Do
    Begin
      read(DB, cur_element);
      If MinPrice > cur_element.book.price Then
        MinPrice := cur_element.book.price;
    End;
  Reset(DB);
  For index:=1 To FileSize(DB) Do
    Begin
      read(DB, cur_element);
      If MinPrice = cur_element.book.price Then
        Writeln(cur_element.book.name);
    End;
End;

{Главная функция}
Begin
  write('Введите имя файла ');{предложение ввести имя файла}
  readln(FileName);{ввод имени файла}
  assign (DB, FileName);{связь имени файла и переменной}
  If FileExists(FileName) Then
    Begin
      writeln('File exists. Do you want to rewrite it? Y/n');
      readbool(rewrite_flag);
    End
  Else rewrite_flag := true;
  If rewrite_flag Then
    Begin
      rewrite(DB);{открытие файла для записи}
      input_data(DB); {ввод данных в базу}
      close(DB); {закрытие файла}
    End;
  Reset(DB);
  process(DB);
  close(DB);
End.
