object RepoSetupForm: TRepoSetupForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Repo Setup'
  ClientHeight = 99
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object edtRepoLink: TEdit
    Left = 7
    Top = 8
    Width = 284
    Height = 21
    TabOrder = 0
    OnKeyPress = edtRepoLinkKeyPress
  end
  object btnSave: TButton
    Left = 100
    Top = 50
    Width = 100
    Height = 25
    Caption = 'Save'
    TabOrder = 1
    OnClick = btnSaveClick
  end
end
