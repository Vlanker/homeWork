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
  i, j, max,iter: Integer
  arr: array[1..4, 1..6] of Integer;
  sortArr: array[1..6] of Integer;
  iMax : array[1..6] of Integer;
  work: array[1..6] of Integer;
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

  // второе задание
  mOutput.Lines.Add('--------------------------------------------------'
                    + #13#10
                    + '-Произведения по столбцам:-'
                    + #13#10
                    + '_________________________');
  mOutput.Lines.Add('   -номера столбцов:-');
  mOutput.Lines.Add('   *   1   2   3   4   5   6 *');
  mOutput.Lines.Add('   *===============*');

  strOut := '   * ';
  max := -1;
  for j := 1 to 6 do
  begin
    work[j] := 1;
    for i := 1 to 4 do
    begin
      work[j] := sum[j] * arr[i, j];
    end;
    if work[j] >= max then
    begin
        max := work[j];    
    end;

    strOut := strOut + IntToStr(work[j]) + ' ';
  end;
  mOutput.Lines.Add(strOut+ '*');
  
  iter := 1;
  for i := 1 to 6 do
  begin
    if work[i] = max then
    begin
        iMax[iter] := i;
        iter := iter + 1;
    end;
  end;

  //третье занание
  strOut := '';
  for i := 1 to iter do
    strOut := strOut + IntToStr(iMax[i]) + '; ';
    
  mOutput.Lines.Add('------------------------------------------------');
  mOutput.Lines.Add('----------------------------------------------------------------'
                    + #13#10
                    + 'Номер столбца(-ов) с макс. значением: '
                    + strOut
                    + #13#10
                    + 'Его(их) значение: '
                    + IntToStr(max)
                    + #13#10
                    + '________________________________'
                    + #13#10
                    + '----------------------------------------------------------------');


   //четвёртое задание

   for i := 1 to 6 do
   begin
      sortArr[i] := arr[1, i];
   end;
    //sort
//   strOut := '';
//   for i := 1 to 6 do
//   begin
 //     iter := i;
//      max := sortArr[i];
//
//      for j := i + 1 to 6 do
//        if (sortArr[i] > sortArr[j]) and (max > sortArr[j]) then
//        begin
//          iter := j;
//          max := sortArr[j];
//
//        end;
//
//      if i = iter then Continue;
//
//      sortArr[iter] := sortArr[i];
//      sortArr[i] := max;
 //     strOut := strOut + ' ' + strArr[i];
 //  end;
  //    mOutput.Lines.Add(strOut);
     // strOut := '';


   //j:= Length(sortArr);
  // for i := 1 to 6 do
  // begin
  //    max := sortArr[j - i + 1];
 //     sortArr[j - i + 1] := sortArr[i];
 //     sortArr[i] := max;
//      strOut := strOut + ' ' + IntToStr(sortArr[i]) + ' ';
//   end;
//   mOutput.Lines.Add(strOut);


end;

end.
