unit desafio.model.implements.customers;

interface

uses
  desafio.model.interfaces.customers, desafio.model.interfaces.connection,
  desafio.model.implements.connection, Data.DB, System.Classes;

type
  TCustomers = class(TInterfacedObject, iCustomers)
    private
      conn : iConnection;
      FId : integer;
      FName : String;
      FCity : String;
      FState : String;
      function dataSource : TDataSource;
      function result : TDataSet;
      function searchCustomers(aValue : integer) : iCustomers;
      function getId : Integer;
      function getName : String;
      function getCity : String;
      function getState : String;
      function fillObject : iCustomers;
      function existCustomerById(aValue: integer): boolean;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iCustomers;
  end;



implementation

constructor TCustomers.Create;
begin
  conn := TConnection.New;
end;
function TCustomers.dataSource: TDataSource;
begin
  Result := conn.datasource;
end;
destructor TCustomers.Destroy;
begin
  //pass
  inherited;
end;
function TCustomers.getId: Integer;
begin
  Result := FId;
end;
function TCustomers.getName: String;
begin
  Result := FName;
end;
function TCustomers.getCity: String;
begin
  Result := FCity;
end;
function TCustomers.getState: String;
begin
  Result := FState;
end;
class function TCustomers.New: iCustomers;
begin
  result := self.Create;
end;
function TCustomers.result: TDataSet;
begin
  result := conn.result;
end;

function TCustomers.searchCustomers(aValue: integer): iCustomers;
begin
  conn.sql('select idCustomers, name, city, state from customers where idCustomers=:id')
      .params('id', aValue)
      .open;
  if conn.result.RecordCount > 0 then
  begin
    fillObject;
  end;
end;
function TCustomers.fillObject : iCustomers;
begin
    FId          := conn.result.FieldByName('idCustomers').AsInteger;
    FName        := conn.result.FieldByName('name').AsString;
    FCity        := conn.result.FieldByName('city').AsString;
    FState       := conn.result.FieldByName('state').AsString;
end;
function TCustomers.existCustomerById(aValue: integer): boolean;
begin
  conn.sql('select idCustomers, name, city, state from customers where idcustomers=:id')
      .params('id', aValue)
      .open;
  result := (conn.result.RecordCount > 0) ;
end;

end.
