program MessageForm;

uses
  Vcl.Forms,
  uMessageForm in 'uMessageForm.pas' {TMessageForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := false;
  Application.CreateForm(TMessageForm, MessageForm);
  Application.Run;
end.
