unit NotesJournal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, SynEdit, SynHighlighterGeneral,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtDlgs, Vcl.StdCtrls, ShellAPI;

type
  TNotepadJournal = class(TForm)
    seNotePad: TSynEdit;
    MainMenu1: TMainMenu;
    NewNote1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    Commit1: TMenuItem; // New menu item for commit
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    erminal1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NewNote1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Open1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Commit1Click(Sender: TObject); // Event handler for commit
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure erminal1Click(Sender: TObject);
  private
    { Private declarations }
    SyncGeneralHighlight: TSynGeneralSyn;
    procedure SaveFile;
    function GetFileDirectory: string;
  public
    { Public declarations }
  end;

var
  NotepadJournal: TNotepadJournal;

implementation

{$R *.dfm}

procedure TNotepadJournal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if MessageDlg('Are you sure you want to close?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    CanClose := False
  else
    CanClose := True;
end;

procedure TNotepadJournal.FormCreate(Sender: TObject);
begin
  SyncGeneralHighlight := TSynGeneralSyn.Create(Self);
  seNotePad.Highlighter := SyncGeneralHighlight;
  Save1.ShortCut := TextToShortCut('Ctrl+S');
  Commit1.ShortCut := TextToShortCut('Ctrl+Shift+C'); // Optional shortcut for commit
end;

procedure TNotepadJournal.FormShow(Sender: TObject);
begin
  with seNotePad do
  begin
    Gutter.Width := 15;
    Align := alClient;
    ActiveLineColor := clCream;
    Color := cl3DLight;
    Ctl3D := false;
    Enabled := True;
    Font.Color := clWindowText;
    Font.Name := 'Courier New';
    Font.Size := 10;
    Visible := true;
    InsertMode := true;
    Highlighter := SyncGeneralHighlight;

    with Gutter do
    begin
      AutoSize := true;
      Font.Color := clWindowText;
      Font.Height := -11;
      LineNumberStart := 1;
      ShowLineNumbers := true;
      Visible := true;
    end;

    WantTabs := true;
    WantReturns := true;
    TabWidth := 4;
    Lines.Text := '';
  end;
end;

procedure TNotepadJournal.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = Ord('S')) then
  begin
    SaveFile;
  end;
end;

procedure TNotepadJournal.NewNote1Click(Sender: TObject);
var
  NewNotepad: TNotepadJournal;
begin
  NewNotepad := TNotepadJournal.Create(Application);
  NewNotepad.Show;
end;

procedure TNotepadJournal.Open1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    seNotePad.Lines.LoadFromFile(OpenDialog1.FileName);
  end;
end;

procedure TNotepadJournal.Save1Click(Sender: TObject);
begin
  SaveFile;
end;

procedure TNotepadJournal.SaveFile;
begin
  if SaveDialog1.Execute then
  begin
    seNotePad.Lines.SaveToFile(SaveDialog1.FileName);
  end;
end;

function TNotepadJournal.GetFileDirectory: string;
begin
  if SaveDialog1.FileName <> '' then
    Result := ExtractFilePath(SaveDialog1.FileName)
  else
    Result := '';
end;

procedure TNotepadJournal.Commit1Click(Sender: TObject);
var
  CommitMessage, FileName, FileDirectory: string;
  GitAddCmd, GitCommitCmd, GitPushCmd: string;
  GitCommit: string;
begin
  if SaveDialog1.FileName = '' then
  begin
    if not SaveDialog1.Execute then
      Exit;
    seNotePad.Lines.SaveToFile(SaveDialog1.FileName);
  end;

  FileName := ExtractFileName(SaveDialog1.FileName);
  FileDirectory := GetFileDirectory;
  CommitMessage := 'Added ' + FileName;

  if FileDirectory = '' then
  begin
    ShowMessage('File directory could not be determined.');
    Exit;
  end;

  GitAddCmd := 'git add -A';
  GitCommitCmd := 'git commit -m ' + CommitMessage;
  GitPushCmd := 'git push';
  GitCommit := GitAddCmd + #13#10 + GitCommitCmd + #13#10 + GitPushCmd;

//  ShellExecute(0, 'OPEN', 'cmd.exe', PChar(GitAddCmd), PChar(FileDirectory), SW_HIDE);
//  ShellExecute(0, 'OPEN', 'cmd.exe', PChar(GitCommitCmd), nil, SW_SHOWNORMAL);
//  ShellExecute(0, 'OPEN', 'cmd.exe', PChar(GitPushCmd), nil, SW_SHOWNORMAL);

  ShellExecute(0, 'OPEN', 'cmd.exe', PChar(GitCommit), PChar(FileDirectory), SW_SHOWNORMAL);
  ShowMessage('Changes committed with message: ' + CommitMessage);
end;

procedure TNotepadJournal.erminal1Click(Sender: TObject);
var
  Dir: string;
begin
  Dir := GetFileDirectory

  ShellExecute(0, 'OPEN', 'cmd.exe', nil, PChar(Dir), SW_SHOWNORMAL);
end;

procedure TNotepadJournal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if Screen.FormCount = 1 then
    Application.Terminate;
end;

end.

