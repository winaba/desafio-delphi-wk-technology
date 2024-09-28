unit desafio.model.interfaces.orders;

interface

uses
  Data.DB;

type
  iOrders = interface

    function insert : iOrders;
    function cancel : iOrders;
    function post(order : iOrders) : iOrders;

    function dataSource : TDataSource;

    function result : TDataSet;

    function existOrderById(aValue: integer): boolean;

    function listAllOrders : iOrders;

    function listAllOrdersByCustomer(aValue: integer ) : iOrders;

    function viewOrdersbyCustomer(aValue : Integer): TDataSource;

    function viewOrdersbyId(aValue : Integer): TDataSource;

    function listAllOrdersById(aValue: integer): iOrders;

    function viewOrderItem(aValue : Integer): TDataSource;

    function viewOrderItemAdd(idProduct : Integer; amount : Integer; unit_value : Double): TDataSource;

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

//    function viewShowData: TDataSource;

  end;

implementation

end.
