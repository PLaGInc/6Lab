object Form1: TForm1
  Left = 192
  Top = 107
  Caption = 'Form1'
  ClientHeight = 602
  ClientWidth = 854
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 680
    Top = 16
    Width = 177
    Height = 49
    Caption = #1047#1072#1074#1077#1088#1096#1080#1090#1100' '#1072#1085#1080#1084#1072#1094#1080#1102
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 680
    Top = 88
    Width = 177
    Height = 49
    Caption = #1053#1072#1095#1072#1090#1100' '#1072#1085#1080#1084#1072#1094#1080#1102
    TabOrder = 1
    OnClick = Button2Click
  end
  object AnimationTimer: TTimer
    Enabled = False
    Interval = 30
    OnTimer = AnimationTimerTimer
    Left = 384
    Top = 64
  end
end
