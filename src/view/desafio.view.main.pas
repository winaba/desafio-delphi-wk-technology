unit desafio.view.main;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.Buttons, Datasnap.DBClient;
type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    DBGOrders: TDBGrid;
    lbGridOrders: TLabel;
    edSearchCustomers: TEdit;
    lbCustomerName: TLabel;
    pnOrderOptions: TPanel;
    Panel11: TPanel;
    edSearchOrders: TEdit;
    Label5: TLabel;
    Panel13: TPanel;
    btCancelOrder: TButton;
    btSearchOrder: TButton;
    pnNewOrder: TPanel;
    Panel12: TPanel;
    btnInsertNewOrder: TButton;
    pnNewItem: TPanel;
    Panel3: TPanel;
    Label8: TLabel;
    Panel10: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Panel14: TPanel;
    edSearchProducts: TEdit;
    edAmountProducts: TEdit;
    edProductUnitValue: TEdit;
    Panel15: TPanel;
    btnCancelNewOrder: TButton;
    btnRegisterNewOrder: TButton;
    btResgisterItem: TButton;
    lbProductDescription: TLabel;
    Panel2: TPanel;
    lbTotalOrder: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btSearchOrderClick(Sender: TObject);
    procedure edSearchCustomersChange(Sender: TObject);
    procedure btnInsertNewOrderClick(Sender: TObject);
    procedure btnRegisterNewOrderClick(Sender: TObject);
    procedure btnCancelNewOrderClick(Sender: TObject);
    procedure btResgisterItemClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edSearchCustomersExit(Sender: TObject);
    procedure edSearchProductsExit(Sender: TObject);
    procedure btResgisterItemExit(Sender: TObject);
    procedure edProductUnitValueExit(Sender: TObject);
    procedure edProductUnitValueKeyPress(Sender: TObject; var Key: Char);
    procedure btCancelOrderClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function userValidation(aEmail, aPassword: String): Boolean;
    procedure deleteColumns();
    procedure searchCustomers();
    procedure configGridToViewOrderItems(idOrder : integer);
    procedure configGridToViewOrdersById(idOrder : integer);
  end;
var
  frmMain: TfrmMain;
implementation
uses desafio.view.login, desafio.model.interfaces.user, desafio.model.implements.user,
     desafio.model.interfaces.orders, desafio.model.implements.orders,
     desafio.model.interfaces.products, desafio.model.implements.products,
     desafio.model.implements.customers, desafio.model.interfaces.customers;
var
  lUser : iUser;
  lOrders : iOrders;
  lProducts : iProducts;
  lCustomers : iCustomers;

{$R *.dfm}
procedure TfrmMain.FormCreate(Sender: TObject);
var
  lLogin: TfrmLogin;
  loginProcess : boolean;
begin
  lLogin := TfrmLogin.create(nil);
  try
    loginProcess := true;
    while loginProcess do
    begin
      lLogin.ShowModal;
      try
        if not (lLogin.ModalResult = mrOk) then
        begin
          loginProcess := false;
          Application.Terminate;
        end
        else if userValidation(lLogin.edEmail.Text, lLogin.edPassword.Text) then
        begin
          loginProcess := false;
        end
        else
          showmessage('Usuario não autenticado');
      except
        showmessage('Houve um erro, verifique os arquivos de configuração.');
        Application.Terminate;
      end;
    end;
    if Assigned(lUser) then
    begin
      if lUser.getId>0 then
      begin
        lOrders := TOrders.new;
        lProducts := TProducts.new;
        lCustomers := TCustomers.new;
        lProducts.listAllProducts;
        lOrders.listAllOrders;
      end;
    end;
  finally
    lLogin.Free;
  end;
end;
procedure TfrmMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key =#13 then
  begin
    key:=#0;
    if (sender is TDBGrid) then
      TDBGrid(Sender).Perform(WM_KeyDown,VK_Tab,0)
    else
      Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmMain.btSearchOrderClick(Sender: TObject);
  var
    idOrder : Integer;
begin

  try
    idOrder := strToint(edSearchOrders.Text);
  except
    idOrder := 0;
  end;

  if idOrder>0 then
  begin
    if lOrders.existOrderById(idOrder) then
    begin
      lOrders.fillObject;

      configGridToViewOrdersById(idOrder);
    end
    else
    begin
      showMessage('Pedido não encontrado!')
    end;
  end
  else
  begin
    showMessage('Informe um Código de Pedido válido!')
  end;

end;

procedure TfrmMain.configGridToViewOrdersById(idOrder : integer);
  var
    vSumTotalValue : Double;

  function sumTotalValue() : double;
    var
      summation : double;
  begin
    summation := 0;
    DBGOrders.DataSource.DataSet.First;
    while not DBGOrders.DataSource.DataSet.Eof do
    begin
      with DBGOrders.DataSource.DataSet do
      begin
        summation := summation + FieldbyName('total_value').AsFloat;
        DBGOrders.DataSource.DataSet.Next;
      end;
    end;

    DBGOrders.DataSource.DataSet.First;

    result := summation;
  end;

begin
  lOrders.listAllOrdersById(idOrder);

  configGridToViewOrderItems(idOrder);

  vSumTotalValue := SumTotalValue();

  lbTotalOrder.Caption := 'Total do Pedido: R$ '+Formatfloat('#,###,##0.00', vSumTotalValue);

  lbGridOrders.Caption := 'Itens do pedido '+intToStr(idOrder);
end;


procedure TfrmMain.btCancelOrderClick(Sender: TObject);
  var
    idOrder : Integer;
begin

  try
    idOrder := strToInt(edSearchOrders.text)
  except
    idOrder := 0;
  end;

  if idOrder > 0 then
  begin
    if lOrders.existOrderById(idOrder) then
    begin
      if application.MessageBox('Deseja excluir esse registro ?','ATENÇÃO', MB_YESNO + MB_ICONWARNING)=MRYES  then
      begin
        lOrders.deleteOrderAndItems(idOrder);

        configGridToViewOrdersById(idOrder);
      end;
    end
    else
      showmessage('Pedido não encontrado');
  end
  else
    showmessage('Informe um número de pedido válido.');
end;

procedure TfrmMain.btnCancelNewOrderClick(Sender: TObject);
begin
  btnInsertNewOrder.Enabled := True;
  btnRegisterNewOrder.Enabled := False;
  btnCancelNewOrder.Enabled := False;
  edSearchCustomers.Enabled := true;

  btnInsertNewOrder.SetFocus;

  pnNewItem.Visible := False;

  searchCustomers();

end;

procedure TfrmMain.deleteColumns();
  var
    i : integer;
begin
  i := 0;
  if DBGOrders.Columns.Count > 0 then
    for i:=DBGOrders.Columns.Count-1 downto 0 do
      DBGOrders.Columns.Delete(i);
end;

procedure TfrmMain.btnInsertNewOrderClick(Sender: TObject);
begin
  btnInsertNewOrder.Enabled := False;
  btnRegisterNewOrder.Enabled := True;
  btnCancelNewOrder.Enabled := True;
  edSearchCustomers.Enabled := False;

  pnNewItem.Visible := true;
  edSearchProducts.SetFocus;

  configGridToViewOrderItems(0);

  lbTotalOrder.Caption := '';
end;

procedure TfrmMain.configGridToViewOrderItems(idOrder : integer);
begin
  deleteColumns();

  DBGOrders.Columns.Add.Title.Caption := 'Código';
  DBGOrders.Columns.Add.Title.Caption := 'Descrição';
  DBGOrders.Columns.Add.Title.Caption := 'Quantidade';
  DBGOrders.Columns.Add.Title.Caption := 'Valor Unitário';
  DBGOrders.Columns.Add.Title.Caption := 'Valor Total';

  DBGOrders.DataSource := lOrders.viewOrderItem(idOrder);
  DBGOrders.ReadOnly := True;

  DBGOrders.Options := DBGOrders.Options + [dgRowSelect];

  DBGOrders.Columns[0].Width := Round(DBGOrders.Width * (10/105)) ;
  DBGOrders.Columns[1].Width := Round(DBGOrders.Width * (40/105)) ;
  DBGOrders.Columns[2].Width := Round(DBGOrders.Width * (15/105)) ;
  DBGOrders.Columns[3].Width := Round(DBGOrders.Width * (15/105)) ;
  DBGOrders.Columns[4].Width := Round(DBGOrders.Width * (20/105)) ;


  if DBGOrders.DataSource.DataSet.RecordCount>0 then
  begin
    DBGOrders.Columns[0].FieldName := 'idProduct';
    DBGOrders.Columns[1].FieldName := 'description';
    DBGOrders.Columns[2].FieldName := 'amount';
    DBGOrders.Columns[3].FieldName := 'unit_value';
    DBGOrders.Columns[4].FieldName := 'total_value';
  end ;

  lbGridOrders.Caption := 'Itens do novo pedido';

end;


procedure TfrmMain.btnRegisterNewOrderClick(Sender: TObject);
begin
  if DBGOrders.DataSource.DataSet.RecordCount>0 then
  begin
    btnInsertNewOrder.Enabled := True;
    btnRegisterNewOrder.Enabled := False;
    btnCancelNewOrder.Enabled := False;
    lOrders.persistOrderAndItems;
    edSearchCustomers.Enabled := true;
    edSearchCustomers.SetFocus;

    pnNewItem.Visible := False;
  end
  else
    showmessage('É necessario ter ao menos 1 item no pedido para concluir a gravação.');
end;

procedure TfrmMain.btResgisterItemClick(Sender: TObject);
  var
    vSumTotalValue : double;

  function sumTotalValue() : double;
    var
      summation : double;
  begin
    summation := 0;
    DBGOrders.DataSource.DataSet.First;
    while not DBGOrders.DataSource.DataSet.Eof do
    begin
      with DBGOrders.DataSource.DataSet do
      begin
        summation := summation + FieldbyName('total_value').AsFloat;
        DBGOrders.DataSource.DataSet.Next;
      end;
    end;

    DBGOrders.DataSource.DataSet.First;

    result := summation;
  end;
  procedure fillOrder(sumTotalValue : double);
  begin
    lOrders.setIssueDate(now);
    lOrders.setCustomer(strToInt(edSearchCustomers.Text));
    lOrders.setTotalValue(sumTotalValue);
  end;

  function validateFieldsItems():boolean;
    var
      idProduct, amount :integer ;
      unit_value : double;
  begin
    Result := true;

    try
      idProduct := StrToInt(edSearchProducts.Text)
    except
      idProduct := 0;
    end;

    try
      amount := StrToInt(edAmountProducts.Text)
    except
      amount := 0;
    end;

    try
      unit_value := strToFloat(edProductUnitValue.Text)
    except
      unit_value := 0;
    end;

    if (idProduct<=0) or (amount<=0) or (round(unit_value)<=0)  then
    begin
      showmessage('Preencha as informações do Item com valores válidos.');
      Result := false;
    end;
  end;
begin
  if validateFieldsItems then
  begin

    DBGOrders.DataSource := lOrders.viewOrderItemAdd(strToInt(edSearchProducts.Text),
                                                     strtoint(edAmountProducts.Text),
                                                     strtoFloat(edProductUnitValue.text));

    deleteColumns();

    DBGOrders.Columns.Add.Title.Caption := 'Código';
    DBGOrders.Columns.Add.Title.Caption := 'Descrição';
    DBGOrders.Columns.Add.Title.Caption := 'Quantidade';
    DBGOrders.Columns.Add.Title.Caption := 'Valor Unitário';
    DBGOrders.Columns.Add.Title.Caption := 'Valor Total';

    DBGOrders.ReadOnly := True;

    DBGOrders.Options := DBGOrders.Options + [dgRowSelect];

    DBGOrders.Columns[0].Width := Round(DBGOrders.Width * (10/105)) ;
    DBGOrders.Columns[1].Width := Round(DBGOrders.Width * (40/105)) ;
    DBGOrders.Columns[2].Width := Round(DBGOrders.Width * (15/105)) ;
    DBGOrders.Columns[3].Width := Round(DBGOrders.Width * (15/105)) ;
    DBGOrders.Columns[4].Width := Round(DBGOrders.Width * (20/105)) ;

    if DBGOrders.DataSource.DataSet.RecordCount>0 then
    begin
      DBGOrders.Columns[0].FieldName := 'idProduct';
      DBGOrders.Columns[1].FieldName := 'description';
      DBGOrders.Columns[2].FieldName := 'amount';
      DBGOrders.Columns[3].FieldName := 'unit_value';
      DBGOrders.Columns[4].FieldName := 'total_value';
    end ;

    vSumTotalValue := sumTotalValue();

    lbTotalOrder.Caption := 'Total do Pedido: R$ ' + FormatFloat('#,####,##0.00', vSumTotalValue) ;

    fillOrder(vSumTotalValue);
  end
end;

procedure TfrmMain.btResgisterItemExit(Sender: TObject);
begin
  btnRegisterNewOrder.SetFocus;
end;

procedure TfrmMain.edSearchProductsExit(Sender: TObject);
  var
    idProduct : integer;
begin

  try
    idProduct := strToint(edSearchProducts.Text);
  except
    idProduct := 0;
  end;

  if idProduct>0 then
  begin
    if lProducts.existProductById(idProduct) then
    begin
      lProducts.fillObject;

      lbProductDescription.Caption := ' Descrição: '+lProducts.getDescription;
      edProductUnitValue.Text := FormatFloat('#,###,##0.00', lProducts.getPriceSell);
    end
    else
    begin
      showMessage('Produto não encontrado!')
    end;
  end
  else
  begin
    showMessage('Informe um Código de Produto válido!')
  end;
end;

procedure TfrmMain.edProductUnitValueExit(Sender: TObject);
begin
  try
    if edProductUnitValue.Text <> '' then
      edProductUnitValue.Text:=FormatFloat('.00',strtofloat(edProductUnitValue.Text));
  except
    on econverterror do
       begin
         showmessage('Valor inválido');
         edProductUnitValue.SetFocus;
       end;
  end;
end;

procedure TfrmMain.edProductUnitValueKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['1','2','3','4','5','6','7','8','9','0',',']) then
    key :=#0;
end;

procedure TfrmMain.edSearchCustomersChange(Sender: TObject);
begin
  if length(edSearchCustomers.Text)=0 then
    pnOrderOptions.Visible := true
  else
    pnOrderOptions.Visible := False;
end;

procedure TfrmMain.searchCustomers;
  var
    idCustomer : Integer;
begin
  pnNewOrder.Visible := False;
  btnInsertNewOrder.Enabled := true;
  btnRegisterNewOrder.Enabled := false;
  btnCancelNewOrder.Enabled := false;

  lbCustomerName.Caption := '';

  try
    idCustomer := strToint(edSearchCustomers.Text);
  except
    idCustomer := 0;
  end;

  if idCustomer>0 then
  begin
    if lCustomers.existCustomerById(idCustomer) then
    begin
      lCustomers.fillObject;

      lbCustomerName.Caption := 'Nome: '+lCustomers.getName;
      lbGridOrders.Caption := 'Todos os pedidos do cliente '+lCustomers.getName;

      lOrders.listAllOrdersByCustomer(idCustomer);

      deleteColumns();

      DBGOrders.Columns.Add.Title.Caption := 'Número do pedido';
      DBGOrders.Columns.Add.Title.Caption := 'Data de emissão';
      DBGOrders.Columns.Add.Title.Caption := 'Valor total';

      DBGOrders.DataSource := lOrders.viewOrdersbyCustomer(idCustomer);
      DBGOrders.ReadOnly := True;

      DBGOrders.Options := DBGOrders.Options + [dgRowSelect];

      if DBGOrders.DataSource.DataSet.RecordCount>0 then
      begin
        DBGOrders.Columns[0].FieldName := 'idOrders';
        DBGOrders.Columns[1].FieldName := 'issue_date';
        DBGOrders.Columns[2].FieldName := 'total_value';
        DBGOrders.Columns[0].Width := Round(DBGOrders.Width * (20/105)) ;
        DBGOrders.Columns[1].Width := Round(DBGOrders.Width * (50/105)) ;
        DBGOrders.Columns[2].Width := Round(DBGOrders.Width * (30/105)) ;
      end ;

      pnNewOrder.Visible := true;
      pnNewItem.Visible  := false;
      btnInsertNewOrder.SetFocus;

    end
    else
    begin
      showMessage('Cliente não encontrado!');
      edSearchCustomers.SetFocus;
    end;
  end
  else
  begin
    showMessage('Para pesquisar Clientes é necessário informar um código válido!');

    if edSearchOrders.Visible then
      edSearchOrders.SetFocus;

    lOrders.viewOrdersbyCustomer(0);
  end;

end;

procedure TfrmMain.edSearchCustomersExit(Sender: TObject);
begin
  searchCustomers();
end;

function TfrmMain.userValidation(aEmail, aPassword: String): Boolean;
begin
  lUser := TUser.new;
  lUser := lUser.LoginUser(aEmail, aPassword);
  if not Assigned(lUser) then
    Result := False
  else
    Result := not lUser.getId.ToString.IsEmpty;
end;
end.
