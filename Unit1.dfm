object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 320
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
    Top = 301
    Width = 635
    Height = 19
    Panels = <>
    SimplePanel = True
    ExplicitTop = 281
  end
  object JvPanel1: TJvPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 301
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
    Align = alLeft
    Caption = 'JvPanel1'
    TabOrder = 1
    ExplicitHeight = 281
    object mChars: TJvMemo
      Left = 1
      Top = 1
      Width = 183
      Height = 299
      Align = alClient
      Lines.Strings = (
        'servername: char char char'
        'servername: char'
        'servername: char char char char'
        '<edit this>')
      TabOrder = 0
      WordWrap = False
      ExplicitHeight = 279
    end
  end
  object JvPanel2: TJvPanel
    Left = 185
    Top = 0
    Width = 450
    Height = 301
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
    Align = alClient
    Caption = 'JvPanel2'
    TabOrder = 2
    ExplicitHeight = 281
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
      Height = 184
      Align = alClient
      PopupMenu = JvPopupMenu1
      TabOrder = 1
      WordWrap = False
      ExplicitHeight = 164
    end
  end
  object xml: TJvSimpleXML
    IndentString = '  '
    Left = 568
    Top = 64
  end
  object MainMenu1: TMainMenu
    Left = 392
    Top = 8
    object miGetIt: TMenuItem
      Caption = 'GetIt'
      OnClick = miGetItClick
    end
    object miCalc: TMenuItem
      Caption = 'Calc'
      object miCalcIt: TMenuItem
        Caption = 'Calc It'
        OnClick = miCalcItClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object miInclude: TMenuItem
        Caption = 'include'
        object miIncAll: TMenuItem
          Caption = 'all'
          Checked = True
          OnClick = miIncAllClick
        end
        object N1: TMenuItem
          Caption = '-'
        end
        object miIncClassic: TMenuItem
          Caption = 'Classic'
          Checked = True
          OnClick = miIncAllClick
        end
        object miIncBC: TMenuItem
          Caption = 'The Burning Crusade'
          Checked = True
          OnClick = miIncAllClick
        end
        object miIncWotlk: TMenuItem
          Caption = 'Wrath of the Lich King'
          Checked = True
          OnClick = miIncAllClick
        end
      end
    end
    object miAbout: TMenuItem
      Caption = 'About'
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
    Left = 520
    Top = 64
  end
  object JvPopupMenu1: TJvPopupMenu
    ImageMargin.Left = 0
    ImageMargin.Top = 0
    ImageMargin.Right = 0
    ImageMargin.Bottom = 0
    ImageSize.Height = 0
    ImageSize.Width = 0
    Left = 448
    Top = 8
    object pmSort: TMenuItem
      Caption = 'sort'
      OnClick = pmSortClick
    end
    object pmUnsort: TMenuItem
      Caption = 'unsort'
      OnClick = pmUnsortClick
    end
  end
end
