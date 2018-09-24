unit Second;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TForm1 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  TColorType = {White, Black, Red, Green, Blue};
  TEngineType = {Diesel-Engine, Turbo-Diesel, Electric-motor, Hybrid};
  TCoachbuilderType = {Truck, Car, Waggon, Off-road, Bus};
  TChassisType = {4, 6, 8, 10}
  TAutomobile = class
  private
    Engine : TEngineType;
    Coachbuilder : TCoachbuilderType;
    Chassis : Integer;
    ColorBody : TColorType;

    f
  public
    property Enginen : String Read GetEngin Write SetEngine;
    property Body : String Read GetBody Write SetBody;

    property Enginen : String Read GetEngin Write SetEngine;
    constructor Create(Engine : TEngineType; Body : String; NumberWheels : Integer; ColorBody : TColorType);

  end;  

var
  Form1: TForm1;

implementation

{$R *.dfm}


{ TAutomobile }

constructor TAutomobile.Create(Engine, Body: String; NumberWheels: Integer; ColorBody : TColorType);
begin
  self.Engine := Engine;
  self.Body := Body;
  self.NumberWheels := NumberWheels;
  self.ColorBody := ColorBody;
end;




end.
