program RotationSort;
Const
  nmax = 200;
  mmax = 200;
  kmax = 200;

Type
  matrix = array[1..nmax,1..mmax] Of Integer;
  mas = array [1..kmax] Of Integer;
Var
  Z:matrix;
  n, m, currarr, arrsize, i,imax,imin,j,jmax,jmin,k: Integer;
  arr: mas;
Procedure ReadMatrix(n: integer; m: integer; Var Z: matrix);
Var i,j: integer;
Begin
  For i:=1 To n Do
    For j:=1 To m Do
      Read(Z[i,j]);
End;

begin
  Writeln('Введите количество строк m и количество столбцов n');
  Readln(m, n);
  ReadMatrix(n, m, Z);
  arrsize:=n*m;
  currarr:=1;
  jmin:=1;
  jmax:=n;
  imin:=2;
  imax:=m;
  k:=0;
  {Ходим по спирали, аааааааааааа}
    repeat
    for j:=jmin to jmax do
    begin
      k:=k+1;
      Z[imin-1,j]:=k;
    end;
    for i:=imin to imax do
    begin
      k:=k+1;
      Z[i,jmax]:=k;
    end;
    jmax:=jmax-1;
    for j:=jmax downto jmin do
    begin
      k:=k+1;
      Z[imax,j]:=k;
    end;
    imax:=imax-1;
    for i:=imax downto imin do
    begin
      k:=k+1;
      Z[i,jmin]:=k;
    end;
    imin:=imin+1;
    jmin:=jmin+1;
  until k>=arrsize;
  for i:=1 to m do
  begin
    writeln;
    for j:=1 to n do
      Write(Z[i,j]:5);
  end;
  Writeln();
end.
