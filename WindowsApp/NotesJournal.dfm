object NotepadJournal: TNotepadJournal
  Left = 0
  Top = 0
  Caption = 'NotepadJournal'
  ClientHeight = 319
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
    Height = 319
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
  end
  object MainMenu1: TMainMenu
    Left = 176
    Top = 72
    object muNew: TMenuItem
      Caption = 'New'
      ShortCut = 16462
      OnClick = muNewClick
    end
    object muOpen: TMenuItem
      Caption = 'Open'
      ShortCut = 16463
      OnClick = muOpenClick
    end
    object muSave: TMenuItem
      Caption = 'Save'
      ShortCut = 16467
      OnClick = muSaveClick
    end
    object muCommit: TMenuItem
      Caption = 'Git'
      ShortCut = 16464
      OnClick = muCommitClick
      object AddMessage1: TMenuItem
        Caption = 'Add Message'
      end
      object Push1: TMenuItem
        Caption = 'Push'
        OnClick = Push1Click
      end
    end
    object muTerminal: TMenuItem
      Caption = 'Terminal'
      ShortCut = 16468
      OnClick = muTerminalClick
    end
    object muTools: TMenuItem
      Caption = 'Tools'
      object miCalculator: TMenuItem
        Caption = 'Calculator'
        ShortCut = 16465
        OnClick = miCalculatorClick
      end
      object VSCode1: TMenuItem
        Caption = 'VS Code'
        ShortCut = 16472
        OnClick = VSCode1Click
      end
      object Setup1: TMenuItem
        Caption = 'Add Repository Link'
        ShortCut = 49223
        OnClick = Setup1Click
      end
    end
    object Close1: TMenuItem
      Caption = 'Close'
      ShortCut = 8219
      OnClick = Close1Click
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
