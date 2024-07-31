unit NotesJournal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, SynEdit, SynHighlighterGeneral,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;
//  MarkdownHighlighter

type
  TNotepadJournal = class(TForm)
    seNotePad: TSynEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
//    CustomHighlight: TSynMarkdownSyn;
    SyncGeneralHighlight: TSynGeneralSyn;
  public
    { Public declarations }
  end;

var
  NotepadJournal: TNotepadJournal;

implementation

{$R *.dfm}

procedure TNotepadJournal.FormCreate(Sender: TObject);
begin
//  CustomHighlight := TSynMarkdownSyn.Create(Self);
  SyncGeneralHighlight := TSynGeneralSyn.Create(Self);
end;

procedure TNotepadJournal.FormShow(Sender: TObject);
begin
  with seNotePad do begin
    Gutter.Width := 15;
    Align := alClient;
    ActiveLineColor := clCream;
    Color := cl3DLight;
    Ctl3D := false;
    Enabled := True;
    Font.Color := clWindowText;
    Visible := true;
    Lines.Text := 'Hello';
    InsertMode := true;
    Highlighter := SyncGeneralHighlight;
    with Gutter do begin
//      Width := 5;
      AutoSize := true;
      DigitCount := 4;
//      Color := clBackground;
      Font.Color := clWindowText;
      Font.Height := -11;
      Font.Name := 'Courier New';
      LineNumberStart := 1;
      ShowLineNumbers := true;
      Visible := true;

    end;
    TabStop := true;
    WantTabs := true;
    WantReturns := true;
    UseCodeFolding := true;
    TabWidth := 2;

    CodeFolding.CollapsedLineColor := clBackground;

  end;
end;

end.
