program RepoSetUpPrj;

uses
  Vcl.Forms,
  uRepoSetupForm in 'uRepoSetupForm.pas' {RepoSetupForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TRepoSetupForm, RepoSetupForm);
  Application.Run;
end.
