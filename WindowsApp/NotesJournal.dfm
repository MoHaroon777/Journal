object NotepadJournal: TNotepadJournal
  Left = 0
  Top = 0
  Caption = 'NotepadJournal'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object seNotePad: TSynEdit
    Left = 0
    Top = 0
    Width = 635
    Height = 299
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    TabOrder = 0
    CodeFolding.CollapsedLineColor = clGrayText
    CodeFolding.FolderBarLinesColor = clGrayText
    CodeFolding.ShowCollapsedLine = True
    CodeFolding.IndentGuidesColor = clGray
    CodeFolding.IndentGuides = True
    UseCodeFolding = False
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Gutter.Width = 15
    Lines.Strings = (
      'seNotePad')
    WantReturns = False
    FontSmoothing = fsmNone
    ExplicitTop = -8
  end
  object MainMenu1: TMainMenu
    Left = 160
    Top = 56
    object NewNote1: TMenuItem
      Caption = 'New'
      ShortCut = 16462
      OnClick = NewNote1Click
    end
    object Open1: TMenuItem
      Caption = 'Open'
      OnClick = Open1Click
    end
    object Save1: TMenuItem
      Caption = 'Save'
      ShortCut = 16467
      OnClick = Save1Click
    end
    object Commit1: TMenuItem
      Caption = 'Commit'
      OnClick = Commit1Click
    end
    object erminal1: TMenuItem
      Caption = 'Terminal'
      ShortCut = 16468
      OnClick = erminal1Click
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 256
    Top = 136
  end
  object SaveDialog1: TSaveDialog
    Left = 264
    Top = 96
  end
end
