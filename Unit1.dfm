object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 300
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object JvStatusBar1: TJvStatusBar
    Left = 0
    Top = 281
    Width = 635
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object JvPanel1: TJvPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 281
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
    Align = alLeft
    Caption = 'JvPanel1'
    TabOrder = 1
    object mChars: TJvMemo
      Left = 1
      Top = 1
      Width = 183
      Height = 279
      Align = alClient
      Lines.Strings = (
        'servername: char char char'
        'servername: char'
        'servername: char char char char'
        '<edit this>')
      TabOrder = 0
      WordWrap = False
      ExplicitLeft = -3
      ExplicitTop = -4
    end
  end
  object JvPanel2: TJvPanel
    Left = 185
    Top = 0
    Width = 450
    Height = 281
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
    Align = alClient
    Caption = 'JvPanel2'
    TabOrder = 2
    ExplicitLeft = 360
    ExplicitTop = 120
    ExplicitWidth = 185
    ExplicitHeight = 41
    object JvSplitter1: TJvSplitter
      Left = 1
      Top = 113
      Width = 448
      Height = 3
      Cursor = crVSplit
      Align = alTop
      ExplicitTop = 160
      ExplicitWidth = 120
    end
    object JvTreeView1: TJvTreeView
      Left = 1
      Top = 1
      Width = 448
      Height = 112
      Align = alTop
      Indent = 19
      TabOrder = 0
      LineColor = clScrollBar
    end
    object JvMemo1: TJvMemo
      Left = 1
      Top = 116
      Width = 448
      Height = 164
      Align = alClient
      TabOrder = 1
      WordWrap = False
    end
  end
  object xml: TJvSimpleXML
    IndentString = '  '
    Left = 456
    Top = 64
  end
  object MainMenu1: TMainMenu
    Left = 72
    Top = 32
    object miGetIt: TMenuItem
      Caption = 'GetIt'
      OnClick = miGetItClick
    end
    object miCalcIt: TMenuItem
      Caption = 'CalcIt'
      OnClick = miCalcItClick
    end
    object miAbout: TMenuItem
      Caption = 'About'
      OnClick = miAboutClick
    end
  end
  object IdHTTP1: TIdHTTP
    OnWorkEnd = IdHTTP1WorkEnd
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 264
    Top = 24
  end
end
