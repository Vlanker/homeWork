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
    BtnCreateTruck: TButton;
    BtnLoadUnloadTrailer: TButton;
    procedure BtnStartStopEngineClick(Sender: TObject);
    procedure BtnCreateClick(Sender: TObject);
    procedure BtnMoveClick(Sender: TObject);
    procedure BtnHeadlightClick(Sender: TObject);
    procedure BtnCreateTruckClick(Sender: TObject);
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
    constructor Create(Engine, Coachbuilder : String;
                       Chassis : Integer); overload;

    function StartStopEngine() : Boolean;
    function MoveAutomobile() : Boolean;
    function OnOffHeadlight() : Boolean;
  end;

  TTruck = class(TAutomobile)
  public
    Trailer : String;
    IsLoaded : Boolean;
    function LoadUnloadTrailer() : Boolean;
    constructor Create(Engine, Coachbuilder : String;
                       Chassis : Integer;
                       Trailer : String); overload;

  end;

var
  Form1: TForm1;

  Automobile : TAutomobile = nil;
  Truck : TTruck = nil;


implementation

{$R *.dfm}
{ TAutomobile }

{ TAutomobile }

constructor TAutomobile.Create(Engine, Coachbuilder: String; Chassis: Integer);
begin
  self.Engine := Engine;
  self.Coachbuilder := Coachbuilder;
  self.Chassis := Chassis;

  ShowMessage('������ ����������: ���������-' + Engine +
              '; �����-' + Coachbuilder +
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
  if Not(IsStarterEngine) then
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
  if Not(IsStarterEngine) then
  begin
    ShowMessage('�� ����� ���������! ��������� ���������');
    Result := false;
  end;

  if IsStarterEngine and Not(IsMoved) then
  begin
    ShowMessage('���������� ��������!');
    IsMoved := true;
    Result := true;
  end
  else
    if IsStarterEngine and IsMoved then
    begin
      ShowMessage('���������� ����������!');
      IsMoved := false;
      Result := false;
    end;

end;

procedure TForm1.BtnStartStopEngineClick(Sender: TObject);
begin
  if Automobile.StartStopEngine() or Truck.StartStopEngine() then
    BtnStartStopEngine.Caption := '���������� ���������'
  else
     BtnStartStopEngine.Caption := '��������� ���������';
end;

procedure TForm1.BtnCreateTruckClick(Sender: TObject);
begin
     Truck := TTruck.Create('��������� �����','������', 6, '������ 10 000');

     Truck.IsStarterEngine := false;
     Truck.IsMoved := false;
     Truck.Headlight := false;
     Truck.IsLoaded := false;

     if Not(Automobile = nil) then
     begin
       Automobile.Destroy;
       BtnCreate.Caption := '������� ����������';
       BtnCreate.Enabled := true;
     end;


     BtnCreateTruck.Caption := '�������� ������';
     BtnCreateTruck.Enabled := false;

     BtnLoadUnloadTrailer.Caption := '��������� ������';
     BtnLoadUnloadTrailer.Enabled := true;
     BtnStartStopEngine.Caption := '��������� ���������';
     BtnStartStopEngine.Enabled := true;
     BtnMove.Caption := '���������';
     BtnMove.Enabled := true;
     BtnHeadlight.Caption := '������ ����';
     BtnHeadlight.Enabled := true;
end;

procedure TForm1.BtnCreateClick(Sender: TObject);
begin
    Automobile := TAutomobile.Create('�����', '�����', 4);

    Automobile.IsStarterEngine := false;
    Automobile.IsMoved := false;
    Automobile.Headlight := false;

    if Not(Truck = nil) then
    begin
      Truck.Destroy;
      BtnCreateTruck.Caption := '������� ��������';
      BtnCreateTruck.Enabled := true;
    end;



    BtnCreate.Caption := '���������� ������';
    BtnCreate.Enabled := false;

    BtnLoadUnloadTrailer.Caption := '��������� ������';
    BtnLoadUnloadTrailer.Enabled := false;
    BtnStartStopEngine.Caption := '��������� ���������';
    BtnStartStopEngine.Enabled := true;
    BtnMove.Caption := '���������';
    BtnMove.Enabled := true;
     BtnHeadlight.Caption := '������ ����';
    BtnHeadlight.Enabled := true;
end;

procedure TForm1.BtnMoveClick(Sender: TObject);
begin
  if Automobile.MoveAutomobile() or Truck.MoveAutomobile() then
    BtnMove.Caption := '������������'
  else
     BtnMove.Caption := '���������';
end;

function TAutomobile.OnOffHeadlight: Boolean;
begin
  if Not(Automobile.Headlight)  or Not(Truck.Headlight) then
  begin
    Headlight := true;
    ShowMessage('���� ��������');
    Result := true;
  end
  else
  begin
    Headlight := false;
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

{ TTruck }

constructor TTruck.Create(Engine, Coachbuilder: String; Chassis: Integer;
  Trailer: String);
begin
  inherited Create(Engine, Coachbuilder, Chassis);

  self.Trailer := Trailer;

  ShowMessage('������ ��������: ���������-' + Engine +
              '; �����-' + Coachbuilder +
              '; �����-' + IntToStr(Chassis) +
              '; ������-' + Trailer);
end;

function TTruck.LoadUnloadTrailer: Boolean;
begin
  if Not(IsLoaded) and Not(IsStarterEngine) and Not(IsMoved) then
  begin
    IsLoaded := true;
    ShowMessage('������ ��������');
    Result := true;
  end
  else
  if IsLoaded and Not(IsStarterEngine) and Not(IsMoved) then
  begin
    IsLoaded := false;
    ShowMessage('������ ���������');
    Result := false;
  end;
//  else if IsStarterEngine then
//  begin
//    ShowMessage('��������� ���������');
//    Result := false;
//  end
//  else if IsMoved then
//  begin
//    ShowMessage('���������� ���������');
//    Result := false;
//  end;


end;

end.
