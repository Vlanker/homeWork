unit Second;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;//, Vcl.StdCtrls, StdCtrls;

type

  TForm1 = class(TForm)
    BtnCreate: TButton;
    BtnStartStopEngine: TButton;
    BtnMove: TButton;
    BtnHeadlight: TButton;
    procedure BtnStartStopEngineClick(Sender: TObject);
    procedure BtnCreateClick(Sender: TObject);
    procedure BtnMoveClick(Sender: TObject);
    procedure BtnHeadlightClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TAutomobile = class
  private
    Engine : String;
    Coachbuilder : String;
    Chassis : Integer;

    function GetEngine: String;
    procedure SetEngine(const Value: String);
    function GetCoachbuilder: String;
    procedure SetCoachbuilder(const Value: String);
    function GetChassis: Integer;
    procedure SetChassis(const Value: Integer);
  public
    IsStarterEngine, IsMoved, Headlight: Boolean;
    property Engines: String read GetEngine
                             write SetEngine;
    property Coachbuilders: String read GetCoachbuilder
                                   write SetCoachbuilder;
    property Chassiss: Integer read GetChassis
                               write SetChassis;
    constructor Create(Engine: String;
                       Coachbuilder: String;
                       Chassis: Integer); overload;

    function StartStopEngine() : Boolean;
    function MoveAutomobile() : Boolean;
    function OnOffHeadlight() : Boolean;
  end;

var
  Form1: TForm1;

  Automobile : TAutomobile = nil;


implementation

{$R *.dfm}
{ TAutomobile }

{ TAutomobile }

constructor TAutomobile.Create(Engine: String; Coachbuilder: String; Chassis: Integer);
begin
  self.Engine := Engine;
  self.Coachbuilder := Coachbuilder;
  self.Chassis := Chassis;

  ShowMessage('������ ����������: ���������-' + Engine+
              '; �����-'+Coachbuilder +
              '; �����-' + IntToStr(Chassis));
end;

function TAutomobile.GetChassis: Integer;
begin
  Result := Chassis;
end;

procedure TAutomobile.SetChassis(const Value: Integer);
begin
  Chassis := Value;
end;

function TAutomobile.GetCoachbuilder: String;
begin
  Result := Coachbuilder;
end;

procedure TAutomobile.SetCoachbuilder(const Value: String);
begin
  Coachbuilder := Value;
end;

function TAutomobile.GetEngine: String;
begin
  Result := Engine;
end;

procedure TAutomobile.SetEngine(const Value: String);
begin
  Engine := Value;
end;

function TAutomobile.StartStopEngine(): Boolean;
begin
  if Not(Automobile.IsStarterEngine) then
  begin
  //start
    IsStarterEngine := true;
    ShowMessage('��������� �������!');
    Result :=  true;
  end
  else
  begin
    if IsMoved then
    begin
      ShowMessage('���������� ����������');
      Result := true;
    end
    else
    begin
    //stop
      IsStarterEngine := false;
      ShowMessage('��������� ����������!');
      Result := false;
    end;
  end;

end;

function TAutomobile.MoveAutomobile(): Boolean;
begin
  if Not(Automobile.IsStarterEngine) then
  begin
    ShowMessage('�� ����� ���������! ��������� ���������');
    Result := false;
  end;

  if Automobile.IsStarterEngine and Not(Automobile.IsMoved) then
  begin
    ShowMessage('���������� ��������!');
    IsMoved := true;
    Result := true;
  end
  else
    if Automobile.IsStarterEngine and Automobile.IsMoved then
    begin
      ShowMessage('���������� ����������!');
      IsMoved := false;
      Result := false;
    end;

end;

procedure TForm1.BtnStartStopEngineClick(Sender: TObject);
begin
  if Automobile.StartStopEngine() then
    BtnStartStopEngine.Caption := '���������� ���������'
  else
     BtnStartStopEngine.Caption := '��������� ���������';
end;

procedure TForm1.BtnCreateClick(Sender: TObject);
begin
    Automobile := TAutomobile.Create('�����', '�����', 4);
    Automobile.IsStarterEngine := false;
    Automobile.IsMoved := false;
    Automobile.Headlight := false;
    BtnCreate.Caption := '���������� ������';
    
    BtnCreate.Enabled := false;
    BtnStartStopEngine.Enabled := true;
    BtnMove.Enabled := true;
    BtnHeadlight.Enabled := true;
end;

procedure TForm1.BtnMoveClick(Sender: TObject);
begin
  if Automobile.MoveAutomobile() then
    BtnMove.Caption := '������������'
  else
     BtnMove.Caption := '���������';
end;

function TAutomobile.OnOffHeadlight: Boolean;
begin
  if Not(Automobile.Headlight) then
  begin
    Automobile.Headlight := true;
    ShowMessage('���� ��������');
    Result := true;
  end
  else
  begin
    Automobile.Headlight := false;
    ShowMessage('���� ���������');
    Result := false;
  end;
end;

procedure TForm1.BtnHeadlightClick(Sender: TObject);
begin
   if Automobile.OnOffHeadlight then
      BtnHeadlight.Caption := '�������� ����'
   else
      BtnHeadlight.Caption := '������ ����';
end;

end.
