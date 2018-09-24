unit Second;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Vcl.StdCtrls;

type

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TEngine = (DIESEL, TURBO_DIESEL, ELECTRIC_MOTOR, HIBRID);
  TColorCoachbuilder = (WHITE, BLACK, RED, GREEN, BLUE);
  TCoachbuilder = (TRUCK, CAR, WAGGON, OFF_ROAD, BUS);
  TChassis = (FOUR, SIX, EIGHT, TEN);

  TAutomobile = class
  private
    function GetEngine: TEngine;
    function GetCoachbuilder: String;
    function GetChassis: Integer;
    function GetColorCoachbuilder: String;
    procedure SetEngine(const Value: TEngine);
    procedure SetCoachbuilder(const Value: String);
    procedure SetChassis(const Value: Integer);
    procedure SetColorCoachbuilder(const Value: String);

  public
    IsStarterEngine : Boolean;
    property Engine: TEngine read GetEngine write SetEngine;
    property Coachbuilder: String read GetCoachbuilder
                                            write SetCoachbuilder;
    property Chassis: Integer read GetChassis write SetChassis;
    property ColorCoachbuilder: String read GetColorCoachbuilder
                                                 write SetColorCoachbuilder;

    constructor Create(Engine: TEngine; Coachbuilder: String; Chassis: Integer; ColorCoachbuilder: String); overload;

    function SetStartStopEngine(const Value: Boolean) : Boolean; 
    function MoveAutomobile() : Boolean;  
  end;


var
  Form1: TForm1;

implementation

{$R *.dfm}
{ TAutomobile }

{ TAutomobile }

constructor TAutomobile.Create(Engine: TEngine; Coachbuilder: String;
  Chassis: Integer; ColorCoachbuilder: String);
begin
  inherited Create;
  self.Engine := Engine;
  self.Coachbuilder := Coachbuilder;
  self.Chassis := Chassis;
  self.ColorCoachbuilder := ColorCoachbuilder;
  IsStarterEngine := false;

  ShowMessage('Aotomobile Create: Engine-' +   GetEngine(Engine)+
              '; Coachbuilder-'+Coachbuilder +
              'Chassis-' + IntToStr(Chassis) +
              '; Color Coachbuilder-' + ColorCoachbuilder);
end;

function TAutomobile.GetChassis: Integer;
begin
  Result := Chassis;
end;

function TAutomobile.GetCoachbuilder: String;
begin
  Result := ColorCoachbuilder;
end;

function TAutomobile.GetColorCoachbuilder: String;
begin
  Result := ColorCoachbuilder;
end;

function TAutomobile.GetEngine: TEngine;
begin
  Result := Engine;
end;



procedure TAutomobile.SetChassis(const Value: Integer);
begin
  Chassis := Value;
end;

procedure TAutomobile.SetCoachbuilder(const Value: String);
begin
  Coachbuilder := Value;
end;

procedure TAutomobile.SetColorCoachbuilder(const Value: String);
begin
  ColorCoachbuilder := Value;
end;

procedure TAutomobile.SetEngine(const Value: TEngine);
begin
  Engine := Value;
end;


function TAutomobile.SetStartStopEngine(const Value: Boolean): Boolean;
begin
  if Value then
  begin
    IsStarterEngine := true;
    ShowMessage('Engine Started!');
    Result :=  true;
  end;
  
  IsStarterEngine := false;
  ShowMessage('Engine Stoped!');
  Result := false;
end;

function TAutomobile.MoveAutomobile(): Boolean;
begin
   if IsStarterEngine then
   begin
     ShowMessage('Automobile move!');
     Result := true;
   end;
   ShowMessage('Can#39t move! Start Engine');

end;

end.
