unit HomeWork;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    mOutput: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure TForm1.FormCreate(Sender: TObject);
var
  i, j, iter, max : Integer;
  op : array[1..6] of Integer;
  iMax : array[1..6] of Integer;
  arr: array[1..4, 1..6] of Integer;
  sortArr: array[1..6] of Integer;
  strOut: string;
begin
  // первое задание
  for i := 1 to 4 do
  begin
  strOut := ' ';
    for j := 1 to 6 do
      begin
          Randomize;
          arr[i, j] := random(10);
          strOut := strOut + IntToStr(arr[i,j]) + '  ';
      end;
      mOutput.Lines.Add(strOut + #13#10);
  end;

  // второе и третье задание
  mOutput.Lines.Add('------------------------------------------------------------------------------'
                    + #13#10
                    + '-Произведения по столбцам:-'
                    + #13#10
                    + '_______________________________________');
  mOutput.Lines.Add('   -номера столбцов:-');
  mOutput.Lines.Add('   *   1    2    3    4    5    6*');
  mOutput.Lines.Add('   ======================');

  strOut := '   *';
  max := -1;
  for j := 1 to 6 do
  begin
      op[j] := arr[1, j];
      for i:= 2 to 4 do
         op[j] := op[j] * arr[i, j];

      if op[j] > max then
         max := op[j];

      strOut := strOut + IntToStr(op[j]) + ' ';
  end;

  mOutput.Lines.Add(strOut);
  strOut := '';
  iter := 1;
  for i := 1 to 6 do
     if op[i] = max then
     begin
        iMax[iter] := i;
        strOut := strOut + IntToStr(iMax[iter]) + '; ';
        iter := iter + 1;

     end;
  mOutput.Lines.Add('   *-------------------------------*'
                    + #13#10
                    + '   *Номер столбца(-ов) с макс. значением: '
                    + strOut
                    + #13#10
                    + '   *Максимальное значение: '
                    + IntToStr(max)
                    + #13#10
                    + '_______________________________________'
                    + #13#10
                    + '------------------------------------------------------------------------------');


   //четвёртое задание
  mOutput.Lines.Add('---------------------------------------------------------------------------------------------------'
                    + #13#10
                    + '-Отсортированная первая сторока массива по убыванию:-'
                    + #13#10
                    + '__________________________________________________');


  for i := 1 to 6 do
  begin
     sortArr[i] := arr[1, i];
  end;

  //sort and invert

  for i := 1 to 5 do
  begin
    max := sortArr[i];
    iter := i;
    for j := i + 1 to 6 do
    begin
      if max < sortArr[j] then
      begin
        max := sortArr[j];
        iter := j;
      end;
    end;

    if (max = sortArr[i]) and (iter = i) then
      Continue;
    //swich
    sortArr[iter] := sortArr[i];
    sortArr[i] := max;
  end;

  strOut := '';
  for i := 1 to 6 do
    strOut := strOut + IntToStr(sortArr[i]) + ' ';
  mOutput.Lines.Add(strOut);

end;

end.
