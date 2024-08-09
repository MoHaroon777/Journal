unit uMessageForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TMessageForm = class(TForm)
    edtMessage: TEdit;
    btnSave: TButton;
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class var fMessage: string;
  end;

var
  MessageForm: TMessageForm;

implementation

{$R *.dfm}

procedure TMessageForm.btnSaveClick(Sender: TObject);
begin
  fMessage := edtMessage.Text;
  ModalResult := mrOk;
  Close;
end;

procedure TMessageForm.FormCreate(Sender: TObject);
begin
  edtMessage.Text := fMessage;
end;

end.