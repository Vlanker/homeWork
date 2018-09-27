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
    procedure BtnLoadUnloadTrailerClick(Sender: TObject);
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
  public
    IsStarterEngine, IsMoved, Headlight: Boolean;

    constructor Create(Engine, Coachbuilder : String;
                       Chassis : Integer); overload;
    
    function GetEngine: String;
    procedure SetEngine(const Value: String);
    function GetCoachbuilder: String;
    procedure SetCoachbuilder(const Value: String);
    function GetChassis: Integer;
    procedure SetChassis(const Value: Integer);

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
  Automobile : Car = nil;
  Truck : TTruck = nil;


implementation

{$R *.dfm}

{ TCar }

constructor TAutomobile.Create(Engine, Coachbuilder: String; Chassis: Integer);
begin
  SetEngine(Engine);
  SetCoachbuilder(Coachbuilder);
  SetChassis(Chassis);
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
    ShowMessage(GetEngine + ' Запущен!');
    Form1.BtnStartStopEngine.Caption := 'Остановить ' + GetEngine;
    Result :=  true;
  end
  else
  begin
    if IsStarterEngine and Not(IsMoved) then
    begin
     //stop
      IsStarterEngine := false;
      ShowMessage(GetEngine + ' Остановлен!');
      Form1.BtnStartStopEngine.Caption := 'Запустить ' + GetEngine;
      Result := false;
    end;
  end;

  if IsMoved then
    begin
      ShowMessage('Остановите Транспорт');
      Result := true;
    end

end;

function TAutomobile.MoveAutomobile(): Boolean;
begin
  if Not(IsStarterEngine) then
  begin
    ShowMessage('Не может двигаться! Запустить ' + GetEngine);

    Result := false;
  end;

  if IsStarterEngine and Not(IsMoved) then
  begin
    ShowMessage('Транспорт Движется!');
    Form1.BtnMove.Caption := 'Остановить';
    IsMoved := true;
    Result := true;
  end
  else
  begin
    if IsStarterEngine and IsMoved then
    begin
      ShowMessage('Транспорт Остановлен!');
      Form1.BtnMove.Caption := 'Двигаться';
      IsMoved := false;
      Result := false;
    end;
  end;

end;

procedure TForm1.BtnStartStopEngineClick(Sender: TObject);
begin
  if Not(Automobile = nil) then Automobile.StartStopEngine;

  if Not(Truck = nil) then Truck.StartStopEngine;
end;

procedure TForm1.BtnCreateTruckClick(Sender: TObject);
begin
  Truck := TTruck.Create('Дизельный мотор','Кабина', 6, 'Прицеп 10 000');

  ShowMessage('Создан Грузовик: Двигатель-' + Truck.GetEngine +
             '; Кузов-' + Truck.GetCoachbuilder +
             '; Шасси-' + IntToStr(Truck.GetChassis) +
             '; Прицеп-' + Truck.Trailer);

  Truck.IsStarterEngine := false;
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

  BtnLoadUnloadTrailer.Caption := 'Зацепить ' + Truck.Trailer;
  BtnLoadUnloadTrailer.Width :=  145;
  BtnLoadUnloadTrailer.Enabled := true;
  BtnStartStopEngine.Caption := 'Запустить ' + Truck.GetEngine;
  BtnStartStopEngine.Width := 165;
  BtnStartStopEngine.Enabled := true;
  BtnMove.Caption := 'Двигаться';
  BtnMove.Enabled := true;
  BtnHeadlight.Caption := 'Зажечь Фары';
  BtnHeadlight.Enabled := true;
end;

procedure TForm1.BtnCreateClick(Sender: TObject);
begin
    Automobile := TAutomobile.Create('Мотор', 'Кузов', 4);
    
    ShowMessage('Создан Автомобиль: Двигатель-' + Automobile.GetEngine +
              '; Кузов-' + Automobile.GetCoachbuilder +
              '; Шасси-' + IntToStr(Automobile.GetChassis));

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
    BtnLoadUnloadTrailer.Width :=  105;
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
  if Not(Automobile = nil) then Automobile.MoveAutomobile();

  if Not(Truck = nil) then Truck.MoveAutomobile();
end;

function TAutomobile.OnOffHeadlight: Boolean;
begin
  if Not(Headlight) then
  begin
    Headlight := true;
    ShowMessage('Фары включены');
    Form1.BtnHeadlight.Caption := 'Потушить Фары';
    Result := true;
  end
  else
  begin
    Headlight := false;
    ShowMessage('Фары выключены');
    Form1.BtnHeadlight.Caption := 'Зажечь Фары';
    Result := false;
  end;
end;

procedure TForm1.BtnHeadlightClick(Sender: TObject);
begin
  if Not(Automobile = nil) then Automobile.OnOffHeadlight;

  if Not(Truck = nil) then Truck.OnOffHeadlight;
  
end;

{ TTruck }

constructor TTruck.Create(Engine, Coachbuilder: String; Chassis: Integer;
  Trailer: String);
begin
  inherited Create( Engine, Coachbuilder, Chassis);
  self.Trailer := Trailer;
end;

function TTruck.LoadUnloadTrailer: Boolean;
begin
    if Not(IsLoaded) and Not(IsStarterEngine) and Not(IsMoved) then
    begin
      IsLoaded := true;

      ShowMessage (Trailer + ' зацеплен');
      Form1.BtnLoadUnloadTrailer.Caption := 'Разцепить ' + Truck.Trailer;
      Result := true;
    end
    else if IsLoaded and Not(IsStarterEngine) and Not(IsMoved) then
    begin
      IsLoaded := false;
      ShowMessage (Trailer + ' разцеплен');
      Form1.BtnLoadUnloadTrailer.Caption := 'Зацепить ' + Truck.Trailer;
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

procedure TForm1.BtnLoadUnloadTrailerClick(Sender: TObject);
begin
 Truck.LoadUnloadTrailer();
end;

end.
