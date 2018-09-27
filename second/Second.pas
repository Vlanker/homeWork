unit Second;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  {TForm1}
  TForm1 = class(TForm)
    BtnCreateToyota: TButton;
    BtnCreateBugatti: TButton;
    BtnStartEngine: TButton;
    BtnMoveStop: TButton;
    BtnOnOffHeadlight: TButton;
    procedure BtnCreateToyotaClick(Sender: TObject);
    procedure BtnCreateBugattiClick(Sender: TObject);
    procedure BtnStartEngineClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  { ICar Interface}
  ICar = Interface(IInterface)
   //������ ������� � �����
    function GetFirm   : String;
    function GetModel  : String;
    function GetEngine : String;
    function GetBody   : String;
    //4 ����
    property firm   : String read GetFirm;
    property model  : String read GetFirm;
    property engine : String read GetEngine;
    property body   : String read GetBody;
    //3 ������
    function GetEngineRotation() : Boolean;
    function GetMove()           : Boolean;

    procedure SetPedalPressure(const Value: Boolean);
  end;

  { TToyota Class }
  TToyota = Class(TInterfacedObject, ICar)
  private
    cFirm   : String;
    cModel  : String;
    cEngine : String;
    cBody   : String;

    cEngineRotation : Boolean;

    function GetFirm   : String;
    function GetModel  : String;
    function GetBody   : String;
    function GetEngine : String;

  public
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

  TBygatti = Class(TInterfacedObject, ICar)
  private
    cFirm   : String;
    cModel  : String;
    cEngine : String;
    cBody   : String;

    cEngineRotation : Boolean;

    function GetFirm   : String;
    function GetModel  : String;
    function GetBody   : String;
    function GetEngine : String;

  public
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
  Toyota : TToyota = Nil;
  Bugatti : TBygatti = Nil;
  IsStarted : Boolean = false;
  IsMoved : Boolean = false;
  IsOn : Boolean = false;


implementation

{$R *.dfm}


{ TToyota }

constructor TToyota.Create();
begin
  inherited Create();
   cFirm   := 'Toyota';
   cModel  := 'Lanser';
   cEngine := 'Disel';
   cBody   := 'Geep';
   //Self.cEngineRotation := false;
end;

function TToyota.GetBody: String;
begin
  Result := cBody;
end;



function TToyota.GetEngine: String;
begin
  Result := cEngine;
end;

function TToyota.GetEngineRotation(): Boolean;
begin
   Result := cEngineRotation;
end;

function TToyota.GetFirm: String;
begin
  Result := cFirm;
end;

procedure TToyota.SetHeadlight(const Value: Boolean);
begin
   if Value then
   begin
     ShowMessage('���� �����');
   end;
   if Not(Value) then
   begin
     ShowMessage('���� �� �����');
   end;
end;

procedure TToyota.SetPedalPressure(const Value: Boolean);
begin
   cEngineRotation := Value;
end;

function TToyota.GetModel: String;
begin
  Result := cModel;
end;

function TToyota.GetMove(): Boolean;
begin
  Result := GetEngineRotation;
end;


{ TBygatti }

constructor TBygatti.Create();
begin
   cFirm   := 'Bygatti';
   cModel  := 'Veyron';
   cEngine := 'Hibrid';
   cBody   := 'Sport car';
   cEngineRotation := false;
end;

function TBygatti.GetBody: String;
begin
    Result := cBody;
end;

function TBygatti.GetEngine: String;
begin
  Result := cEngine;
end;

function TBygatti.GetEngineRotation: Boolean;
begin
  Result := cEngineRotation;
end;

function TBygatti.GetFirm: String;
begin
  Result := cFirm;
end;

function TBygatti.GetModel: String;
begin
   Result := cModel;
end;

function TBygatti.GetMove: Boolean;
begin
  Result := GetEngineRotation;
end;

procedure TBygatti.SetHeadlight(const Value: Boolean);
begin
   if Value then
   begin
     ShowMessage('���� �����');
   end;
   if Not(Value) then
   begin
     ShowMessage('���� �� �����');
   end;
end;

procedure TBygatti.SetPedalPressure(const Value: Boolean);
begin
  cEngineRotation := Value;
end;

procedure TForm1.BtnCreateBugattiClick(Sender: TObject);
begin
  Toyota := nil;
  Bugatti := TBygatti.Create();
  ShowMessageFmt('��� ���������� %s, ������ %s, ����� ������ %s, ��������� %s.',
  [Bugatti.GetFirm, Bugatti.GetModel, Bugatti.GetBody, Bugatti.GetEngine]);
  IsStarted := false;
  IsMoved := false;
  IsOn := false;

end;

procedure TForm1.BtnCreateToyotaClick(Sender: TObject);
begin
  Bugatti := nil;
  Toyota := TToyota.Create();
  ShowMessageFmt('��� ���������� %s, ������ %s, ����� ������ %s, ��������� %s.',
  [Toyota.GetFirm, Toyota.GetModel, Toyota.GetBody, Toyota.GetEngine]);
  IsStarted := false;
  IsMoved := false;
  IsOn := false;
  BtnStartEngine.Enabled := true;
  BtnMoveStop.Enabled := true;
  BtnOnOffHeadlight.Enabled := true;

end;

procedure TForm1.BtnStartEngineClick(Sender: TObject);

begin
  if Not(Toyota = nil) then
  begin
    if Not(IsStarted) and Not(IsMoved) then
    begin
     Toyota.SetPedalPressure(true);
     ShowMessage('��������� �������');
     Form1.BtnStartEngine.Caption := '���������� ���������';
     IsStarted := true;
    end
    else
    if IsStarted and Not(IsMoved) then
    begin
     Toyota.SetPedalPressure(false);
     ShowMessage('��������� ����������');
     Form1.BtnStartEngine.Caption := '��������� ��������';
     IsStarted := false;
    end
    else ShowMessage('���������� ���������');
  end;

  if Not(Bugatti = nil) then
  begin
    if Not(IsStarted) then
    begin
     Bugatti.SetPedalPressure(true);
     ShowMessage('��������� �������');
     Form1.BtnStartEngine.Caption := '���������� ���������';
     IsStarted := true;
    end
    else
    begin
     Bugatti.SetPedalPressure(false);
     ShowMessage('��������� ����������');
     Form1.BtnStartEngine.Caption := '��������� ��������';
     IsStarted := false;
    end;
  end;


end;

end.
