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

    function StartStopEngine() : Boolean; virtual;
    function MoveAutomobile() : Boolean; virtual;
    function OnOffHeadlight() : Boolean; virtual;
  end;

  TTruck = class(TAutomobile)
  public
    Trailer : String;
    IsLoaded : Boolean;
    function LoadUnloadTrailer() : Boolean;
    constructor Create(Engine, Coachbuilder : String;
                       Chassis : Integer;
                       Trailer : String); overload;

    function StartStopEngine() : Boolean; override;
    function MoveAutomobile() : Boolean; override;
    function OnOffHeadlight() : Boolean; override;
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
  SetEngine(Engine);
  SetCoachbuilder(Coachbuilder);
  SetChassis(Chassis);

  ShowMessage('Создан Автомобиль: Двигатель-' + Engine +
              '; Кузов-' + Coachbuilder +
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
  if Not(IsStarterEngine) and Not(IsMoved) then
  begin
  //start
    IsStarterEngine := true;
    ShowMessage('Двигатель Запущен!');
    Result :=  true;
  end
  else
  begin
    if IsStarterEngine and Not(IsMoved) then
    begin
     //stop
      IsStarterEngine := false;
      ShowMessage('Двигатель Остановлен!');
      Result := false;
    end;
  end;

  if IsMoved then
    begin
      ShowMessage('Остановите Автомобиль');
      Result := true;
    end

end;

function TAutomobile.MoveAutomobile(): Boolean;
begin
  if Not(IsStarterEngine) then
  begin
    ShowMessage('Не может двигаться! Запустить Двигатель');
    Result := false;
  end;

  if IsStarterEngine and Not(IsMoved) then
  begin
    ShowMessage('Автомобиль Движется!');
    IsMoved := true;
    Result := true;
  end
  else
  begin
    if IsStarterEngine and IsMoved then
    begin
      ShowMessage('Автомобиль Остановлен!');
      IsMoved := false;
      Result := false;
    end;
  end;

end;

procedure TForm1.BtnStartStopEngineClick(Sender: TObject);
begin
  if Not(Automobile = nil) then
  begin
  if Automobile.StartStopEngine then
    BtnStartStopEngine.Caption := 'Остановить ' + Automobile.GetEngine
  else
     BtnStartStopEngine.Caption := 'Запустить ' + Automobile.GetEngine;
  end;

  if Not(Truck = nil) then
  begin
  if Truck.StartStopEngine then
    BtnStartStopEngine.Caption := 'Остановить ' + Truck.GetEngine
  else
     BtnStartStopEngine.Caption := 'Запустить ' + Truck.GetEngine;
  end;
end;

procedure TForm1.BtnCreateTruckClick(Sender: TObject);
begin
     Truck := TTruck.Create('Дизельный мотор','Кабина', 6, 'Прицеп 10 000');

     (Truck as TAutomobile).IsStarterEngine := false;
     Truck.IsMoved := false;
     Truck.Headlight := false;
     Truck.IsLoaded := false;

     if Not(Automobile = nil) then
     begin
       Automobile := nil;
       BtnCreate.Caption := 'Создать Автомобиль';
       BtnCreate.Enabled := true;
     end;


     BtnCreateTruck.Caption := 'Грузовик Создан';
     BtnCreateTruck.Enabled := false;

     BtnLoadUnloadTrailer.Caption := 'Загрузить Прицеп';
     BtnLoadUnloadTrailer.Enabled := true;
     BtnStartStopEngine.Caption := 'Запустить ' + Truck.GetEngine;
     BtnStartStopEngine.Width := 153;
     BtnStartStopEngine.Enabled := true;
     BtnMove.Caption := 'Двигаться';
     BtnMove.Enabled := true;
     BtnHeadlight.Caption := 'Зажечь Фары';
     BtnHeadlight.Enabled := true;
end;

procedure TForm1.BtnCreateClick(Sender: TObject);
begin
    Automobile := TAutomobile.Create('Мотор', 'Кузов', 4);

    Automobile.IsStarterEngine := false;
    Automobile.IsMoved := false;
    Automobile.Headlight := false;

    if Not(Truck = nil) then
    begin
      Truck := nil;
      BtnCreateTruck.Caption := 'Создать Грузовик';
      BtnCreateTruck.Enabled := true;
    end;



    BtnCreate.Caption := 'Автомобиль Создан';
    BtnCreate.Enabled := false;

    BtnLoadUnloadTrailer.Caption := 'Загрузить Прицеп';
    BtnLoadUnloadTrailer.Enabled := false;
    BtnStartStopEngine.Caption := 'Запустить ' + Automobile.GetEngine;
    BtnStartStopEngine.Width := 129;
    BtnStartStopEngine.Enabled := true;
    BtnMove.Caption := 'Двигаться';
    BtnMove.Enabled := true;
     BtnHeadlight.Caption := 'Зажечь Фары';
    BtnHeadlight.Enabled := true;
end;

procedure TForm1.BtnMoveClick(Sender: TObject);
begin
  if Not(Automobile = nil) then
  begin
    if Automobile.MoveAutomobile() then
      BtnMove.Caption := 'Остановиться'
    else
       BtnMove.Caption := 'Двигаться';
  end;

   if Not(Truck = nil) then
  begin
    if Truck.MoveAutomobile() then
      BtnMove.Caption := 'Остановиться'
    else
       BtnMove.Caption := 'Двигаться';
  end;
end;

function TAutomobile.OnOffHeadlight: Boolean;
begin
  if Not(Headlight) then
  begin
    Headlight := true;
    ShowMessage('Фары включены');
    Result := true;
  end
  else
  begin
    Headlight := false;
    ShowMessage('Фары выключены');
    Result := false;
  end;
end;

procedure TForm1.BtnHeadlightClick(Sender: TObject);
begin
  if Not(Automobile = nil) then
  begin
    if Automobile.OnOffHeadlight then
        BtnHeadlight.Caption := 'Потушить Фары'
    else
        BtnHeadlight.Caption := 'Зажечь Фары';
   end;
   if Not(Truck = nil) then
  begin
    if Truck.OnOffHeadlight then
        BtnHeadlight.Caption := 'Потушить Фары'
    else
        BtnHeadlight.Caption := 'Зажечь Фары';
   end;
end;

{ TTruck }

constructor TTruck.Create(Engine, Coachbuilder: String; Chassis: Integer;
  Trailer: String);
begin
  inherited Create( Engine, Coachbuilder, Chassis);

  self.Trailer := Trailer;

  ShowMessage('Создан Грузовик: Двигатель-' + Engine +
              '; Кузов-' + Coachbuilder +
              '; Шасси-' + IntToStr(Chassis) +
              '; Прицеп-' + Trailer);
end;

function TTruck.LoadUnloadTrailer: Boolean;
begin
    if Not(IsLoaded) and Not(IsStarterEngine) and Not(IsMoved) then
    begin
      IsLoaded := true;
      ShowMessage ('Прицеп загружен');
      Result := true;
    end;

    if IsLoaded and Not(IsStarterEngine) and Not(IsMoved) then
    begin
      IsLoaded := false;
      ShowMessage ('Прицеп разгружен');
      Result := false;
    end;

    if IsStarterEngine then
    begin
      ShowMessage ('Заглушите Двигатель');
      Result := false;
    end;

    if IsStarterEngine and IsMoved then
    begin
      ShowMessage ('Остановите Транспорт и Заглушите Двигатель');
      Result := false;
    end
    else
     if IsStarterEngine and Not(IsMoved) then
     begin
      ShowMessage ('Заглушите Двигатель');
      Result := false;
     end;

end;


function TTruck.MoveAutomobile: Boolean;
begin
   inherited MoveAutomobile;
end;

function TTruck.OnOffHeadlight: Boolean;
begin
   inherited OnOffHeadlight;
end;

function TTruck.StartStopEngine: Boolean;
begin
  inherited StartStopEngine;
end;

end.
