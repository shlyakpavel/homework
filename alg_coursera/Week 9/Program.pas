{$MODE DELPHI}

Program Week9;

Type 
  Text = array Of String;

Var 
  T1: Text;

Function isPalindrome(w: String) : boolean;
Var i: Integer;
Begin
  result := true;
  For i := 1 To length(w) Div 2 Do
    If w[i] <> w[length(w)-i+1] Then
      result := false;
End;

Procedure input(Var T1: Text);
Var 
  n, err: Integer;
  str_length : String;
Begin
  Repeat
    writeln('How many strings do you need to process?');
    readln(str_length);
    Val (str_length, n, err);
  Until (n>0) And (err=0);
  SetLength(T1,n);
  writeln('Enter ',length(T1),' words one by one');
  For n:=1 To length(T1) Do
    readln(T1[n]);
End;

Procedure process(Var T1: Text);
Var c: Integer;
Begin
  For c:=1 To length(T1) Do
    If isPalindrome(T1[c]) Then
      writeln(T1[c],' is a Palindrome')
    Else writeln(T1[c],' is not a Palindrome');
End;

Begin
  input(T1);
  process(T1);
End.
