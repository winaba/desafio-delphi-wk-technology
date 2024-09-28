unit desafio.model.implements.orders;
interface
uses
  desafio.model.interfaces.orders, desafio.model.interfaces.connection,
  Data.DB, desafio.model.implements.connection, Datasnap.DBClient, SysUtils;

type
  TOrders = class(TInterfacedObject, iOrders)
    private
       conn : iConnection;
       connView : iConnection;
       cdsTemporary: TClientDataSet;
       dsTemporary : TDataSource;
       FId : Integer;
       FCustomer : integer;
       FTotalValue : Currency;
       FIssueDate : TDateTime;
       function insert : iOrders;
       function cancel : iOrders;
       function post(order : iOrders) : iOrders;
       function dataSource : TDataSource;
       function result : TDataSet;
       function existOrderById(aValue: integer): boolean;
       function listAllOrders : iOrders;
       function listAllOrdersByCustomer(aValue: integer ) : iOrders;
       function listAllOrdersById(aValue: integer ) : iOrders;
       function viewOrdersbyCustomer(aValue : Integer): TDataSource;
       function viewOrdersbyId(aValue : Integer): TDataSource;
       function viewOrderItem(aValue : Integer): TDataSource;
       function persistOrderAndItems(): IOrders;
       function deleteOrderAndItems(aValue : Integer): IOrders;
       function fillObject : iOrders;
       function getId : Integer;
       function getTotalValue : Currency;
       function getIssueDate : TDateTime;
       function getCustomer : Integer;
       procedure setId(aValue : Integer);
       procedure setTotalValue(aValue : Currency);
       procedure setIssueDate(aValue : TDateTime);
       procedure setCustomer(aValue: Integer);
       function viewOrderItemAdd(idProduct : Integer; amount : Integer; unit_value : Double): TDataSource;
    public
      constructor create;
      destructor destroy; override;
      class function new : iOrders;
  end;
implementation
{ TOrders }
function TOrders.cancel: iOrders;
begin
  conn.result.Cancel;
end;
constructor TOrders.create;
begin
  conn := TConnection.New;
end;
function TOrders.dataSource: TDataSource;
begin
  Result := conn.datasource;
end;
destructor TOrders.destroy;
begin
  //pass
  inherited;
end;
function TOrders.fillObject : iOrders;
begin
  FId := conn.result.FieldByName('idOrders').AsInteger;
  FCustomer := conn.result.FieldByName('idCustomer').AsInteger;
  FTotalValue := conn.result.FieldByName('total_value').AsCurrency;
  FIssueDate := conn.result.FieldByName('issue_date').AsDateTime;
end;
function TOrders.getTotalValue: Currency;
begin
  Result := FTotalValue;
end;
function TOrders.getIssueDate: TDateTime;
begin
  Result := FIssueDate;
end;
function TOrders.getId: Integer;
begin
  Result := FId;
end;
function TOrders.getCustomer: Integer;
begin
  Result := FCustomer;
end;
function TOrders.insert: iOrders;
begin
  conn.result.Insert;
  Result := Self;
end;
function TOrders.listAllOrders: iOrders;
begin
  conn.sql('select idOrders, issue_date, idCustomer, total_value '+
            'from orders')
            .open;
  if conn.result.RecordCount > 0 then
  begin
    fillObject;
  end;
  Result := Self;
end;
function TOrders.listAllOrdersByCustomer(aValue: integer ) : iOrders;
begin
  conn.sql('select idOrders, idCustomer, issue_date, total_value '+
            'from orders where idCustomer=:id')
            .params('id', aValue)
            .open;
  if conn.result.RecordCount > 0 then
  begin
    fillObject;
  end;
  Result := Self;
end;
function TOrders.listAllOrdersById(aValue: integer): iOrders;
begin
  conn.sql('select idOrders, idCustomer, issue_date, total_value '+
            'from orders where idOrders=:id')
            .params('id', aValue)
            .open;
  if conn.result.RecordCount > 0 then
  begin
    fillObject;
  end;
  Result := Self;
end;

class function TOrders.new: iOrders;
begin
  Result := self.create;
end;
function TOrders.post(order : iOrders): iOrders;
begin
  conn.result.FieldByName('idOrders').AsInteger := order.getId;
  conn.result.FieldByName('total_value').AsCurrency := order.getTotalValue;
  conn.result.FieldByName('issue_date').AsDateTime := order.getIssueDate;
  conn.result.post;
  Result := Self;
end;
function TOrders.result: TDataSet;
begin
  result := conn.result;
end;
function TOrders.existOrderById(aValue: integer): boolean;
begin
  conn.sql('select idOrders, issue_date, idCustomer, total_value '+
           'from orders where idOrders=:id')
      .params('id', aValue)
      .open;

  result := (conn.result.RecordCount > 0) ;

end;
procedure TOrders.setTotalValue(aValue: Currency);
begin
  FTotalValue := aValue;
end;
procedure TOrders.setIssueDate(aValue: TDateTime);
begin
  FIssueDate := aValue;
end;
procedure TOrders.setId(aValue: Integer);
begin
  FId := aValue;
end;
procedure TOrders.setCustomer(aValue: Integer);
begin
  FCustomer := aValue;
end;
function TOrders.viewOrdersbyCustomer(aValue : Integer): TDataSource;
begin
  connView := TConnection.New;
  connView.sql('select idOrders, issue_date, total_value '+
               'from orders where idCustomer=:id')
          .params('id', aValue)
          .open;
  connView.tempCds.FieldDefs.Add('idOrders', ftInteger);
  connView.tempCds.FieldDefs.Add('issue_date', ftDateTime);
  connView.tempCds.FieldDefs.Add('total_value', ftFloat);
  connView.tempCds.CreateDataSet;
  connView.datasource.DataSet.First;
  while not connView.datasource.DataSet.Eof do
  begin
    with connView.datasource do
    begin
      connView.tempCds.Append;
      connView.tempCds.FieldByName('idOrders').AsInteger := DataSet.FieldByName('idOrders').AsInteger;
      connView.tempCds.FieldByName('issue_date').AsDateTime := DataSet.FieldByName('issue_date').AsDateTime;
      connView.tempCds.FieldByName('total_value').AsFloat := DataSet.FieldByName('total_value').AsFloat;
      connView.tempCds.Post;
      connView.datasource.DataSet.Next;
    end;
  end;
  result := connView.tempDatasource;
end;
function TOrders.viewOrdersbyId(aValue: Integer): TDataSource;
begin
  connView := TConnection.New;

  connView.sql('select idOrders, issue_date, total_value '+
               'from orders where idOrders=:id')
          .params('id', aValue)
          .open;
  connView.tempCds.FieldDefs.Add('idOrders', ftInteger);
  connView.tempCds.FieldDefs.Add('issue_date', ftDateTime);
  connView.tempCds.FieldDefs.Add('total_value', ftFloat);
  connView.tempCds.CreateDataSet;
  connView.datasource.DataSet.First;
  while not connView.datasource.DataSet.Eof do
  begin
    with connView.datasource do
    begin
      connView.tempCds.Append;
      connView.tempCds.FieldByName('idOrders').AsInteger := DataSet.FieldByName('idOrders').AsInteger;
      connView.tempCds.FieldByName('issue_date').AsDateTime := DataSet.FieldByName('issue_date').AsDateTime;
      connView.tempCds.FieldByName('total_value').AsFloat := DataSet.FieldByName('total_value').AsFloat;
      connView.tempCds.Post;
      connView.datasource.DataSet.Next;
    end;
  end;
  result := connView.tempDatasource;
end;

function TOrders.viewOrderItem(aValue : Integer): TDataSource;
begin
  connView := TConnection.New;
  if aValue < 0 then
    aValue := 0;
  connView.sql('select idProduct, description, amount, unit_value, total_value '+
               'from order_items oi inner join products pr on (oi.idProduct=pr.idProducts) '+
               'where idOrder=:id')
          .params('id', aValue)
          .open;
  connView.tempCds.FieldDefs.Add('idProduct', ftInteger);
  connView.tempCds.FieldDefs.Add('description', ftString, 100);
  connView.tempCds.FieldDefs.Add('amount', ftInteger);
  connView.tempCds.FieldDefs.Add('unit_value', ftFloat);
  connView.tempCds.FieldDefs.Add('total_value', ftFloat);
  connView.tempCds.CreateDataSet;
  connView.datasource.DataSet.First;
  while not connView.datasource.DataSet.Eof do
  begin
    with connView.datasource do
    begin
      connView.tempCds.Append;
      connView.tempCds.FieldByName('idProduct').AsInteger := DataSet.FieldByName('idProduct').AsInteger;
      connView.tempCds.FieldByName('description').AsString := DataSet.FieldByName('description').AsString;
      connView.tempCds.FieldByName('amount').AsInteger := DataSet.FieldByName('amount').AsInteger;
      connView.tempCds.FieldByName('unit_value').AsFloat := DataSet.FieldByName('unit_value').AsFloat;
      connView.tempCds.FieldByName('total_value').AsFloat := DataSet.FieldByName('total_value').AsFloat;
      connView.tempCds.Post;
      connView.datasource.DataSet.Next;
    end;
  end;
  result := connView.tempDatasource;
end;
function TOrders.viewOrderItemAdd(idProduct : Integer; amount : Integer; unit_value : Double): TDataSource;
begin
  connView.sql('select description '+
               'from products '+
               'where idProducts=:id')
          .params('id', idProduct)
          .open;
  connView.datasource.DataSet.First;
  with connView.datasource do
  begin
    connView.tempCds.Append;
    connView.tempCds.FieldByName('idProduct').AsInteger := idProduct;
    connView.tempCds.FieldByName('description').AsString := DataSet.FieldByName('description').AsString;
    connView.tempCds.FieldByName('amount').AsInteger := amount;
    connView.tempCds.FieldByName('unit_value').AsFloat := unit_value;
    connView.tempCds.FieldByName('total_value').AsFloat := unit_value * amount;
    connView.tempCds.Post;
  end;

  result := connView.tempDatasource;
end;
function TOrders.persistOrderAndItems(): IOrders;
  var
    idOrder : Integer;
begin
  connView.sql('INSERT INTO orders ' +
               '(issue_date, idcustomer, total_value) ' +
                'VALUES ' +
                '(:pissue_date, :pidcustomer, :ptotal_value)')
          .params('pissue_date', formatDateTime('yyyy-mm-dd hh:mm:ss',self.getIssueDate))
          .params('pidcustomer', self.getCustomer)
          .params('ptotal_value', self.getTotalValue)
          .exec;
  connView.sql('select max(idOrders) as idOrder from orders').open;
  idOrder := connView.datasource.DataSet.FieldByName('idOrder').AsInteger;
  connView.tempCds.First;

  while not connView.tempCds.Eof do
  begin
    connView.sql('INSERT INTO order_items '+
                 '(idorder, idproduct, amount, unit_value, total_value) '+
                 'VALUES '+
                 '(:pidorder, :pidproduct, :pamount, :punit_value, :ptotal_value)')

            .params('pidorder', idOrder)
            .params('pidproduct', connView.tempCds.FieldByName('idproduct').AsInteger)
            .params('pamount', connView.tempCds.FieldByName('amount').AsInteger)
            .params('punit_value', connView.tempCds.FieldByName('unit_value').AsFloat)
            .params('ptotal_value', connView.tempCds.FieldByName('total_value').AsFloat)
            .exec;
     connView.tempCds.Next;
  end;
end;
function TOrders.deleteOrderAndItems(aValue : Integer): IOrders;
begin
  connView.sql('DELETE FROM order_items '+
               'WHERE '+
               '(idorder = :pidorder) ')
               .params('pidorder', aValue)
               .exec;
  connView.sql('DELETE FROM orders WHERE (idorders = :pidorders)')
          .params('pidorders', aValue)
          .exec;
end;
end.
