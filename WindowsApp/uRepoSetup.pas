unit uRepoSetupForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TRepoSetupForm = class(TForm)
    edtRepoLink: TEdit;
    btnSave: TButton;
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class var fRepoLink: string;
  end;

var
  RepoSetupForm: TRepoSetupForm;

implementation

{$R *.dfm}

procedure TRepoSetupForm.btnSaveClick(Sender: TObject);
begin
  fRepoLink := edtRepoLink.Text;
  ModalResult := mrOk; // Set the modal result to mrOk
end;

procedure TRepoSetupForm.FormCreate(Sender: TObject);
begin
  edtRepoLink.Text := fRepoLink;
end;

end.
