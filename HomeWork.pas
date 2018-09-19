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
  i, j, sum, max : Integer;
  iter : Integer;
  iMax : array[1..6] of Integer;
  arr: array[1..4, 1..6] of Integer;
  sortArr: array[1..6] of Integer;
  strOut: string;
begin
  // ������ �������
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

  // ������ �������
  mOutput.Lines.Add('--------------------------------------------------'
                    + #13#10
                    + '-������������ �� ��������:-'
                    + #13#10
                    + '_________________________');
  mOutput.Lines.Add('   -������ ��������:-');
  mOutput.Lines.Add('   *   1   2   3   4   5   6 *');
  mOutput.Lines.Add('   *===============*');

  strOut := '   * ';
  max := -1;
  iter := 1;
  for j := 1 to 6 do
  begin
    sum := 0;
    for i := 1 to 4 do
    begin
      sum := sum + arr[i, j];
    end;
    if sum >= max then
    begin
        max := sum;
        iter
    end;

    strOut := strOut + IntToStr(sum) + ' ';
  end;
  mOutput.Lines.Add(strOut+ '*');

  //������ �������
  strOut := '';
  for i := 1 to iter do
    strOut := strOut + IntToStr(iMax[i]) + '; ';
  mOutput.Lines.Add('------------------------------------------------');
  mOutput.Lines.Add('----------------------------------------------------------------'
                    + #13#10
                    + '����� �������(-��) � ����. ���������: '
                    + strOut
                    + #13#10
                    + '���(��) ��������: '
                    + IntToStr(max)
                    + #13#10
                    + '________________________________'
                    + #13#10
                    + '----------------------------------------------------------------');


   //�������� �������

//   for i := 1 to 6 do
//   begin
//      sortArr[i] := arr[1, i];
//   end;
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
