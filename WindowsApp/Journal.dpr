program Journal;

uses
  Vcl.Forms,
  DataConnUnit in 'DataConnUnit.pas' {FrmDataConnector};
//  notes in 'notes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmDataConnector, DataConnector);
  Application.Run;
end.
