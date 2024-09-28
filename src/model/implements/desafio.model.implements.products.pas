unit desafio.model.implements.products;

interface

uses
  desafio.model.interfaces.products, desafio.model.interfaces.connection,
  desafio.model.implements.connection, Data.DB, System.Classes;

type
  TProducts = class(TInterfacedObject, iProducts)
    private
      conn : iConnection;

      FId : integer;
      FDescription : String;
      FPriceSell : Currency;

      function dataSource : TDataSource;
      function result : TDataSet;

      function searchProducts(aValue : integer) : iProducts;

      function getId : Integer;
      function getDescription : String;
      function getPriceSell : Currency;

      procedure setId(aValue : Integer);
      procedure setDescription(aValue : String);
      procedure setPriceSell(aValue : Currency);

      function listAllProducts: iProducts;

      function fillObject : iProducts;

      function existProductById(aValue: integer): boolean;

      function strlistAllProducts: string;

    public

      constructor Create;
      destructor Destroy; override;
      class function New : iProducts;

  end;

implementation

uses
  System.SysUtils;

{ TProducts }

constructor TProducts.Create;
begin
  conn := TConnection.New;
end;

function TProducts.dataSource: TDataSource;
begin
  Result := conn.datasource;
end;

destructor TProducts.Destroy;
begin
  //pass
  inherited;
end;

function TProducts.getDescription: String;
begin
  Result := FDescription;
end;

function TProducts.getId: Integer;
begin
  Result := FId;
end;

function TProducts.getPriceSell: Currency;
begin
  Result := FPriceSell;
end;

class function TProducts.New: iProducts;
begin
  result := self.Create;
end;

function TProducts.result: TDataSet;
begin
  result := conn.result;
end;

function TProducts.searchProducts(aValue: integer): iProducts;
begin
  conn.sql('select idProducts, description, selling_price from products where idProducts=:id')
      .params('id', aValue)
      .open;

  if conn.result.RecordCount > 0 then
  begin
    fillObject;
  end;
end;

function TProducts.existProductById(aValue: integer): boolean;
begin
  conn.sql('select idProducts, description, selling_price from products where idProducts=:id')
      .params('id', aValue)
      .open;

  result := (conn.result.RecordCount > 0) ;
end;

function TProducts.fillObject : iProducts;
begin
    FId          := conn.result.FieldByName('idProducts').AsInteger;
    FDescription := conn.result.FieldByName('description').AsString;
    FPriceSell   := conn.result.FieldByName('selling_price').AsCurrency;
end;

procedure TProducts.setDescription(aValue: String);
begin
  FDescription := aValue;
end;

procedure TProducts.setId(aValue: Integer);
begin
  FId := aValue;
end;

procedure TProducts.setPriceSell(aValue: Currency);
begin
  FPriceSell := aValue;
end;

function TProducts.strlistAllProducts: String;
  var
    lConn  : IConnection;
    sProducts : String;
begin
  lConn := TConnection.New;


  lConn.sql('select idProducts, description, selling_price ' +
           'from products')
      .open;


  if lConn.result.RecordCount>0 then
  begin
    sProducts := '';
    lConn.result.First;
    while not lConn.result.Eof do
    begin
      if trim(sProducts) <> '' then
        sProducts := sProducts + ';';

      sProducts := sProducts + formatFloat('00000',lConn.result.fieldByName('idProducts').AsInteger)+
                          '='+ lConn.result.fieldByName('description').AsString;
      lConn.result.Next;
    end;

    result :=  sProducts;
  end;
end;

function TProducts.listAllProducts: iProducts;
begin
  conn.sql('select idProducts, description, selling_price ' +
           'from products')
      .open;

  if conn.result.RecordCount>0 then
    fillObject;

  result := self;
end;

end.

