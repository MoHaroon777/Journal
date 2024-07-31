object FrmDataConnector: TFrmDataConnector
  Left = 0
  Top = 0
  Caption = 'Journal'
  ClientHeight = 564
  ClientWidth = 1248
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 1248
    Height = 564
    Align = alClient
    DataSource = dsJournal
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object FDJournalConnection: TFDConnection
    Params.Strings = (
      'Database=C:\Journal\Journal_Project\TODO_List\db.sqlite3'
      'DriverID=SQLite')
    Connected = True
    Left = 296
    Top = 448
  end
  object FDJournal: TFDQuery
    Active = True
    Connection = FDJournalConnection
    SQL.Strings = (
      'SELECT * FROM TODO_APP_JOURNAL')
    Left = 64
    Top = 456
  end
  object dsJournal: TDataSource
    DataSet = FDJournal
    Left = 104
    Top = 456
  end
end
