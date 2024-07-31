unit DataConnUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmDataConnector = class(TForm)
    FDJournalConnection: TFDConnection;
    FDJournalQuery: TFDQuery;
    DBGridJournal: TDBGrid;
    dsJournal: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TDataMap = class(TObject)
    private
      fForm: TFrmDataConnector;
      fFDJournalCon: TFDConnection;
      fFDQJournal: TFDQuery;
      fDataSetJournal: TDataSource;
    procedure SetQuery(const AValue: TFDQuery);
    procedure SetDataSource(const AValue: TDataSource);
    procedure SetConnection(const AValue: TFDConnection);
    public
      function GetConnection: TFDConnection;
      function GetQuery: TFDQuery;
      function GetDataSet: TDataSource;
      property connection: TFDConnection read GetConnection write SetConnection;
      property Datasource: TDataSource read GetDataSet write SetDataSource;
      property Query: TFDQuery read GetQuery write SetQuery;
  end;

var
  DataConnector: TFrmDataConnector;

implementation

{$R *.dfm}

{ TDataMap }

function TDataMap.GetConnection: TFDConnection;
begin
  Result := fFDJournalCon;
end;

function TDataMap.GetDataSet: TDataSource;
begin
  Result := fDataSetJournal;
end;

function TDataMap.GetQuery: TFDQuery;
begin
  result := fFDQJournal;
end;

procedure TDataMap.SetConnection(const AValue: TFDConnection);
begin
  fFDJournalCon := AValue;
end;

procedure TDataMap.SetDataSource(const AValue: TDataSource);
begin
  fDataSetJournal := AValue;
end;

procedure TDataMap.SetQuery(const AValue: TFDQuery);
begin
  fFDQJournal := AValue;
end;

end.
