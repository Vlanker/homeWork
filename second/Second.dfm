object Form1: TForm1
  Left = 193
  Top = 137
  Caption = 'Form1'
  ClientHeight = 136
  ClientWidth = 223
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BtnCreateToyota: TButton
    Left = 8
    Top = 8
    Width = 89
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' Toyota'
    TabOrder = 0
    OnClick = BtnCreateToyotaClick
  end
  object BtnCreateBugatti: TButton
    Left = 128
    Top = 8
    Width = 89
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' Bugatti'
    TabOrder = 1
    OnClick = BtnCreateBugattiClick
  end
  object BtnStartEngine: TButton
    Left = 48
    Top = 39
    Width = 129
    Height = 25
    Caption = #1047#1072#1087#1091#1089#1090#1080#1090#1100' '#1044#1074#1080#1075#1072#1090#1077#1083#1100
    Enabled = False
    TabOrder = 2
    OnClick = BtnStartEngineClick
  end
  object BtnMoveStop: TButton
    Left = 48
    Top = 70
    Width = 129
    Height = 25
    Caption = #1055#1086#1077#1093#1072#1083#1080
    Enabled = False
    TabOrder = 3
  end
  object BtnOnOffHeadlight: TButton
    Left = 48
    Top = 101
    Width = 129
    Height = 25
    Caption = #1047#1072#1078#1077#1095#1100' '#1060#1072#1088#1099
    Enabled = False
    TabOrder = 4
  end
end
