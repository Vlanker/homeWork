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

  ShowMessage('Создан Автомобиль: Двигатель-' + Engine+
              '; Кузов-'+Coachbuilder +
              '; Шасси-' + IntToStr(Chassis));
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
    ShowMessage('Двигатель Запущен!');
    Result :=  true;
  end
  else
  begin
    if IsMoved then
    begin
      ShowMessage('Остановите Автомобиль');
      Result := true;
    end
    else
    begin
    //stop
      IsStarterEngine := false;
      ShowMessage('Двигатель Остановлен!');
      Result := false;
    end;
  end;

end;

function TAutomobile.MoveAutomobile(): Boolean;
begin
  if Not(Automobile.IsStarterEngine) then
  begin
    ShowMessage('Не может двигаться! Запустить Двигатель');
    Result := false;
  end;

  if Automobile.IsStarterEngine and Not(Automobile.IsMoved) then
  begin
    ShowMessage('Автомобиль Движется!');
    IsMoved := true;
    Result := true;
  end
  else
    if Automobile.IsStarterEngine and Automobile.IsMoved then
    begin
      ShowMessage('Автомобиль Остановлен!');
      IsMoved := false;
      Result := false;
    end;

end;

procedure TForm1.BtnStartStopEngineClick(Sender: TObject);
begin
  if Automobile.StartStopEngine() then
    BtnStartStopEngine.Caption := 'Остановить Двигатель'
  else
     BtnStartStopEngine.Caption := 'Запустить Двигатель';
end;

procedure TForm1.BtnCreateClick(Sender: TObject);
begin
    Automobile := TAutomobile.Create('Мотор', 'Кузов', 4);
    Automobile.IsStarterEngine := false;
    Automobile.IsMoved := false;
    Automobile.Headlight := false;
    BtnCreate.Caption := 'Автомобиль Создан';
    
    BtnCreate.Enabled := false;
    BtnStartStopEngine.Enabled := true;
    BtnMove.Enabled := true;
    BtnHeadlight.Enabled := true;
end;

procedure TForm1.BtnMoveClick(Sender: TObject);
begin
  if Automobile.MoveAutomobile() then
    BtnMove.Caption := 'Остановиться'
  else
     BtnMove.Caption := 'Двигаться';
end;

function TAutomobile.OnOffHeadlight: Boolean;
begin
  if Not(Automobile.Headlight) then
  begin
    Automobile.Headlight := true;
    ShowMessage('Фары включены');
    Result := true;
  end
  else
  begin
    Automobile.Headlight := false;
    ShowMessage('Фары выключены');
    Result := false;
  end;
end;

procedure TForm1.BtnHeadlightClick(Sender: TObject);
begin
   if Automobile.OnOffHeadlight then
      BtnHeadlight.Caption := 'Потушить Фары'
   else
      BtnHeadlight.Caption := 'Зажечь Фары';
end;

end.
