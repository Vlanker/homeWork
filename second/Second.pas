unit Second;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  {TForm1}
  TForm1 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  { ICar Interface}
  ICar = Interface(IInterface)
    //4 поля
    property model     : String read GetModel write SetModel;
    property engine    : String read GetEngine write SetEngine;
    property body      : String read GetBody write SetBody;
    property colorBody : String read GetColorBody write SetColorBody;
    //мотоды доступа к полям для записи/чтения
    function GetModel  : String;
    function GetEngine : String;
    function GetBody   : String;
    procedure SetModel(const Value: String);
    procedure SetEngine(const Value: String);
    procedure SetBody(const Value: String);
    procedure SetColorBody(const Value: String);
    //3 метода
    functin GetEngineRotation(const Value: Boolean) : Boolean;
    function GetMove(const Value: Boolean)          : Double;
    function GetHeadlight(const Value: Boolean)     : Boolean;
  end;

  { TCar Class }
  TCar = Class(TInterfacedObject, IVehicle)
  private
    Model, Engine, Body, ColorBody: String;
    function GetModel: String;
    procedure SetModel(const Value: String);
    function GetEngine: String;
    procedure SetEngine(const Value: String);
    function GetBody: String;
    procedure SetBody(const Value: String);
    function GetColorBody: String;
    procedure SetColorBody(const Value: String);

  public
    property model     : String read GetModel write SetModel;
    property engine    : String read GetEngine write SetEngine;
    property body      : String read GetBody write SetBody;
    property colorBody : String read GetColorBody write SetColorBody;

  published

  end;


var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TCar }



{ TCar }

function TCar.GetBody: String;
begin

end;

function TCar.GetColorBody: String;
begin

end;

function TCar.GetEngine: String;
begin

end;

function TCar.GetModel: String;
begin

end;

procedure TCar.SetBody(const Value: String);
begin

end;

procedure TCar.SetColorBody(const Value: String);
begin

end;

procedure TCar.SetEngine(const Value: String);
begin

end;

procedure TCar.SetModel(const Value: String);
begin

end;

end.
