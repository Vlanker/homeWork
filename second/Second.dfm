object Form1: TForm1
  Left = 193
  Top = 137
  Width = 347
  Height = 156
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BtnCreate: TButton
    Left = 8
    Top = 8
    Width = 113
    Height = 25
    Caption = #1057#1086#1076#1072#1090#1100' '#1040#1074#1090#1086#1084#1086#1073#1080#1083#1100
    TabOrder = 0
    OnClick = BtnCreateClick
  end
  object BtnStartStopEngine: TButton
    Left = 8
    Top = 39
    Width = 129
    Height = 25
    Caption = #1047#1072#1087#1091#1089#1090#1080#1090#1100' '#1044#1074#1080#1075#1072#1090#1077#1083#1100
    Enabled = False
    TabOrder = 1
    OnClick = BtnStartStopEngineClick
  end
  object BtnMove: TButton
    Left = 8
    Top = 64
    Width = 129
    Height = 25
    Caption = #1044#1074#1080#1075#1072#1090#1100#1089#1103
    Enabled = False
    TabOrder = 2
    OnClick = BtnMoveClick
  end
  object BtnHeadlight: TButton
    Left = 8
    Top = 88
    Width = 129
    Height = 25
    Caption = #1047#1072#1078#1077#1095#1100' '#1060#1072#1088#1099
    Enabled = False
    TabOrder = 3
    OnClick = BtnHeadlightClick
  end
  object BtnCreateTruck: TButton
    Left = 176
    Top = 8
    Width = 105
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1043#1088#1091#1079#1086#1074#1080#1082
    TabOrder = 4
    OnClick = BtnCreateTruckClick
  end
  object BtnLoadUnloadTrailer: TButton
    Left = 176
    Top = 39
    Width = 105
    Height = 25
    Caption = #1047#1072#1094#1077#1087#1080#1090#1100' '#1055#1088#1080#1094#1077#1087
    Enabled = False
    TabOrder = 5
    OnClick = BtnLoadUnloadTrailerClick
  end
end
