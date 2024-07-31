unit NotePad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SynEdit, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, SynEditHighlighter, MarkdownHighlighter,
  SynHighlighterGeneral;

type
  TFrmNotes = class(TForm)
    seNotePad: TSynEdit;
    SynGeneralSyn1: TSynGeneralSyn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    hLighter : TSynMarkdownSyn;
  public
    { Public declarations }
  end;

var
  FrmNotes: TFrmNotes;

implementation

{$R *.dfm}

procedure TFrmNotes.FormCreate(Sender: TObject);
begin
  hLighter := TSynMarkdownSyn.Create(Self);
  //seNotePad := TSynEdit.Create(Self);
  seNotePad.Highlighter := hLighter;
  seNotePad.Align := alClient;

   //Style
   with seNotePad do begin
    ActiveLineColor := clCream;
    Gutter.AutoSize := True;
    //Gutter.BorderStyle := None;
    Gutter.Color := clBackground;
    Gutter.Gradient := True;
    Gutter.GradientStartColor := clBtnFace;
    Gutter.GradientEndColor := clBackground;
    Gutter.ShowLineNumbers := True;
    WordWrap := True;
    WantTabs := True;
    WantReturns := True;
   end;
end;

procedure TFrmNotes.FormDestroy(Sender: TObject);
begin
  seNotePad.Free;
  hLighter.Free;
end;

end.

