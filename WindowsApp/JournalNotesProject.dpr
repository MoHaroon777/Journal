program JournalNotesProject;

uses
  Vcl.Forms,
  NotesJournal in 'NotesJournal.pas' {NotepadJournal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TNotepadJournal, NotepadJournal);
  Application.Run;
end.
