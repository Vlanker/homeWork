unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    MOutput: TMemo;
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
  I         : Integer;
  Disklist  : DWORD;
  Letter    : Char;
  Outstring : String;
  AmtFree   : Int64;
  Total     : Int64;
begin
  Caption := '������ ������';

  Disklist := GetLogicaldrives;
  Letter := 'A';
  I := 1;

  while (Disklist > 0) do begin
    AmtFree := DiskFree(I);
    Total   := DiskSize(I);
    if Odd(Disklist) then begin
      case GetDriveType(Pchar(Letter + ':\')) of
        0: Outstring              :='[���������� ���������� ���] ';
        1: Outstring              :='[�� ���������� �������� �����] ';
        DRIVE_REMOVABLE:Outstring :='USB - ���������� ';
        DRIVE_FIXED:Outstring     :='��������� ���� ';
        DRIVE_REMOTE:Outstring    :='������� ���� ';
        DRIVE_CDROM:Outstring     :='�������� ';
        DRIVE_RAMDISK:Outstring   :='RAM ���� ';
      end;

      if AmtFree >= 0 then begin
      Outstring:= Outstring + '(' + Letter +':)' +
                  #13#10 +
                  FloatToStrF(AmtFree, ffNumber, 20, 0) +
                  ' �������� �� ' +
                  FloatToStrF(Total, ffNumber, 20, 0);
      end else begin
         Outstring:= Outstring + '(' + Letter +':)';
      end;

      MOutput.Lines.Add(Outstring);
    end;

  Disklist:= Disklist shr 1;
  Inc(Letter);
  Inc(I)
  end;
end;



end.