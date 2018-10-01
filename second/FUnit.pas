unit FUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    BtnCreateToyota: TButton;
    BtnCreateHonda: TButton;
    BtnRotateEngine: TButton;
    BtnMove: TButton;
    BtnHeadlight: TButton;
    procedure BtnCreateToyotaClick(Sender: TObject);
    procedure BtnCreateHondaClick(Sender: TObject);
    procedure BtnRotateEngineClick(Sender: TObject);
    procedure BtnHeadlightClick(Sender: TObject);
    procedure BtnMoveClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;


  ICar = interface(IInterface)
    function GetFirm   : String;
    function GetModel  : String;
    function GetEngine : String;
    function GetBody   : String;

    property firm   : String read GetFirm;
    property model  : String read GetFirm;
    property engine : String read GetEngine;
    property body   : String read GetBody;

    function GetEngineRotation() : Boolean;
    function GetMove()           : Boolean;

    procedure SetPedalPressure(const Value: Boolean);
  end;

  TToyota = class(TInterfacedObject, ICar)
  private
    fFirm   : String;
    fModel  : String;
    fEngine : String;
    fBody   : String;



    function GetFirm   : String;
    function GetModel  : String;
    function GetBody   : String;
    function GetEngine : String;
  public
    fEngineRotation : Boolean;
    property firm   : String read GetFirm;
    property model  : String read GetModel;
    property engine : String read GetEngine;
    property body   : String read GetBody;

    function GetEngineRotation() : Boolean;
    function GetMove()           : Boolean;
    procedure SetPedalPressure(const Value: Boolean);

    procedure SetHeadlight(const Value: Boolean);

    constructor Create(); overload;
  end;

  THonda = Class(TInterfacedObject, ICar)
  private
    fFirm   : String;
    fModel  : String;
    fEngine : String;
    fBody   : String;



    function GetFirm   : String;
    function GetModel  : String;
    function GetBody   : String;
    function GetEngine : String;

  public
    fEngineRotation : Boolean;
    property firm   : String read GetFirm;
    property model  : String read GetModel;
    property engine : String read GetEngine;
    property body   : String read GetBody;

    function GetEngineRotation() : Boolean;
    function GetMove()           : Boolean;
    procedure SetPedalPressure(const Value: Boolean);

    procedure SetHeadlight(const Value: Boolean);

    constructor Create(); overload;
  end;


var
  Form1: TForm1;
  Toyota: TToyota = nil;
  Honda: THonda = nil;

implementation

{$R *.dfm}

procedure TForm1.BtnCreateHondaClick(Sender: TObject);
begin
  Toyota := nil;
  Honda := THonda.Create();
  ShowMessageFmt('�� ������� %s: ������ - %s, ��� ��������� - %s, ����� - %s.' +
  ' ��������� ��������� � ����� ������� ������ ��������. ��� ��, ����� �������� ����.',
  [Honda.fFirm, Honda.fModel, Honda.fEngine, Honda.fBody]);

end;

procedure TForm1.BtnCreateToyotaClick(Sender: TObject);
begin
  Honda := nil;
  Toyota := TToyota.Create();
  ShowMessageFmt('�� ������� %s: ������ - %s, ��� ��������� - %s, ����� - %s.' +
  ' ��������� ��������� � ����� ������� ������ ��������. ��� ��, ����� �������� ����.',
  [Toyota.fFirm, Toyota.fModel, Toyota.fEngine, Toyota.fBody]);



end;



procedure TForm1.BtnHeadlightClick(Sender: TObject);
begin
   if Not(Toyota = nil) then Toyota.SetHeadlight(true);
   if Not(Honda = nil) then Honda.SetHeadlight(true);
end;

procedure TForm1.BtnMoveClick(Sender: TObject);
begin
  if Not(Toyota = nil) then Toyota.GetMove;
  if Not(Honda = nil) then Honda.GetMove;
end;

procedure TForm1.BtnRotateEngineClick(Sender: TObject);
begin
 if Not(Toyota = nil) then Toyota.SetPedalPressure(true);
 if Not(Honda = nil) then Honda.SetPedalPressure(true);
end;

{ TToyota }

constructor TToyota.Create();
begin
   fFirm   := 'Toyota';
   fModel  := 'Lanser';
   fEngine := 'Disel';
   fBody   := 'Geep';
   fEngineRotation := false;
end;

function TToyota.GetBody: String;
begin
   Result := fBody;
end;

function TToyota.GetEngine: String;
begin
  Result := fEngine;
end;

function TToyota.GetEngineRotation: Boolean;
begin
  Result := fEngineRotation;
end;

function TToyota.GetFirm: String;
begin
  Result := fFirm;
end;

function TToyota.GetModel: String;
begin
  Result := fModel;
end;

function TToyota.GetMove: Boolean;
begin

  if Not(GetEngineRotation) then
    begin
      ShowMessage('��������� ���������, ����� ������ ��������.');
    end
    else
    begin
      ShowMessage('�� ������ ��������.');
    end;

  Result := GetEngineRotation;
end;



procedure TToyota.SetHeadlight(const Value: Boolean);
begin
  if Value then
    ShowMessage('���� ��������');
  if Not(Value) then
    ShowMessage('���� ���������');
end;

procedure TToyota.SetPedalPressure(const Value: Boolean);
begin
  if Value then
  begin
    ShowMessage('��������� �������');
    fEngineRotation := Value;
  end;
  if Not(Value) then
  begin
    ShowMessage('��������� ����������');
    fEngineRotation := Value;
  end;
end;

{ THonda }

constructor THonda.Create;
begin
   fFirm   := 'Honda';
   fModel  := 'Stream';
   fEngine := 'Hibrid';
   fBody   := 'Sedan';
   fEngineRotation := false;
end;

function THonda.GetBody: String;
begin
  Result := fBody;
end;

function THonda.GetEngine: String;
begin
  Result := fEngine;
end;

function THonda.GetEngineRotation: Boolean;
begin
  Result := fEngineRotation;
end;

function THonda.GetFirm: String;
begin
  Result := fFirm;
end;

function THonda.GetModel: String;
begin
  Result := fModel
end;

function THonda.GetMove: Boolean;
begin
  if Not(GetEngineRotation) then
    begin
      ShowMessage('��������� ���������, ����� ������ ��������.');
    end
    else
    begin
      ShowMessage('�� ������ ��������.');
    end;

  Result := GetEngineRotation;
end;

procedure THonda.SetHeadlight(const Value: Boolean);
begin
  if Value then
    ShowMessage('���� ��������');
  if Not(Value) then
    ShowMessage('���� ���������');
end;

procedure THonda.SetPedalPressure(const Value: Boolean);
begin
  if Value then
  begin
    ShowMessage('��������� �������');
    fEngineRotation := Value;
  end;
  if Not(Value) then
  begin
    ShowMessage('��������� ����������');
    fEngineRotation := Value;
  end;
end;

end.
