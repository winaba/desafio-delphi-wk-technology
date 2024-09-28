unit desafio.model.implements.connection;
interface
uses
  desafio.model.interfaces.connection, desafio.model.dao.connection,
  FireDAC.Comp.Client, Data.DB, inifiles, Datasnap.DBClient;
type
  TConnection = class(TInterfacedObject, iConnection)
    private
      dm : TDMConnection;
      FQuery : TFDQuery;
      FDataSource : TDataSource;

      cdsTemporary: TClientDataSet;
      dsTemporary : TDataSource;

    public
      function sql(aValue : String) : iConnection;
      function result : TDataSet;
      function datasource : TDataSource;
      function tempDatasource : TDataSource;
      function query : TFDQuery;
      function tempCds: TClientDataSet;
      function open : iConnection;
      function close : iConnection;
      function exec : iConnection;
      function params(aParams : String; aValue : Integer) : iConnection; overload;
      function params(aParams : String; aValue : String) : iConnection; overload;
      function params(aParams : String; aValue : Currency) : iConnection; overload;
      function insert : iConnection;
      function cancel : iConnection;
      function post : iConnection;
      constructor Create;
      destructor Destroy; override;
      class function New : iConnection;
  end;
implementation
uses
  System.SysUtils, Vcl.Forms;
{ TConnection }
function TConnection.cancel: iConnection;
begin
  FQuery.Cancel;
  Result := Self;
end;
function TConnection.close: iConnection;
begin
  FQuery.Close;
  Result := Self;
end;
constructor TConnection.Create;
  var
    iniConf : TIniFile;
    vServer, vPath: String;
    vDatabase: string;
    vUserName: string;
    vPort: string;
    vPassword: string;
    vDll: string;
begin
  iniConf := TIniFile.Create(ExtractFilePath(Application.exeName)+'config.ini');
  try
    vDatabase := Trim(iniConf.ReadString('ACCESS','DATABASE',''));
    vUserName := Trim(iniConf.ReadString('ACCESS','USERNAME',''));
    vServer   := Trim(iniConf.ReadString('ACCESS','SERVER',''));
    vPort     := Trim(iniConf.ReadString('ACCESS','PORT',''));
    vPassword := Trim(iniConf.ReadString('ACCESS','PASSWORD',''));
    vDll      := Trim(iniConf.ReadString('ACCESS','PATH_DLL',''));

  finally
    iniConf.Free;
  end;
  dm := TDMConnection.Create(nil);

  with dm.FDConnection do begin
    Close;
    with Params do begin
      Clear;
      Add('DriverID=MySQL');
      Add('Server='+vServer);
      Add('Port='+vPort);
      Add('Database='+vDatabase);
      Add('Password='+vPassword);
      Add('User_Name='+vUserName);
    end;
  end;

  dm.FDPhysMySQLDriverLink1.VendorLib := vDll;

  dm.FDConnection.Open;

  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := dm.FDConnection;
  FDataSource := TDataSource.Create(nil);
  FDataSource.DataSet :=  FQuery;

  cdsTemporary:= TClientDataSet.Create(nil);
  dsTemporary := TDataSource.Create(nil);
  dsTemporary.DataSet := cdsTemporary;


end;

function TConnection.datasource: TDataSource;
begin
  Result := FDataSource;
end;

function TConnection.tempDatasource: TDataSource;
begin
  Result := dsTemporary;
end;

function TConnection.tempCds: TClientDataSet;
begin
 result := cdsTemporary;
end;

destructor TConnection.Destroy;
begin
  FDataSource.Free;
  FQuery.Free;

  cdsTemporary.Free;
  dsTemporary.Free;

  dm.Free;
  inherited;
end;
function TConnection.exec: iConnection;
begin
  FQuery.ExecSQL;
  Result := Self;
end;
function TConnection.insert: iConnection;
begin
  FQuery.Insert;
end;
class function TConnection.New: iConnection;
begin
  Result := self.Create;
end;
function TConnection.open: iConnection;
begin
  FQuery.Open;
  Result := Self;
end;
function TConnection.params(aParams: String; aValue: Integer): iConnection;
begin
  FQuery.ParamByName(aParams).AsInteger := aValue;
  Result := self;
end;
function TConnection.params(aParams: String; aValue: String): iConnection;
begin
  FQuery.ParamByName(aParams).AsString := aValue;
  Result := self;
end;

function TConnection.params(aParams: String; aValue: Currency): iConnection;
begin
  FQuery.ParamByName(aParams).AsCurrency := aValue;
  Result := self;
end;
function TConnection.post: iConnection;
begin
  FQuery.Post;
  Result := Self;
end;
function TConnection.query: TFDQuery;
begin
 result := FQuery;
end;
function TConnection.result: TDataSet;
begin
  Result := FQuery;
end;
function TConnection.sql(aValue: String): iConnection;
begin
  Fquery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Text := aValue;
  Result := Self;
end;

end.
