object MessageForm: TMessageForm
  Left = 0
  Top = 0
  Caption = 'Add Message'
  ClientHeight = 89
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object edtMessage: TEdit
    Left = 8
    Top = 8
    Width = 284
    Height = 21
    TabOrder = 0
  end
  object btnSave: TButton
    Left = 99
    Top = 47
    Width = 100
    Height = 26
    Caption = 'Save'
    TabOrder = 1
    OnClick = btnSaveClick
  end
end
