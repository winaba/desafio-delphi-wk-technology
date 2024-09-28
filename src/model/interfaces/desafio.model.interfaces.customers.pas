unit desafio.model.interfaces.customers;

interface

uses
  Data.DB, System.Classes;

type
  iCustomers = interface

    function dataSource : TDataSource;
    function result : TDataSet;

    function fillObject : iCustomers;

    function getId   : Integer;
    function getName : String;
    function getCity : string;
    function getState : string;

    function existCustomerById(aValue: integer): boolean;


  end;


implementation

end.
