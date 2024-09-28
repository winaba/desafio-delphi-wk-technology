unit desafio.model.interfaces.products;

interface

uses
  Data.DB, System.Classes;

type
  iProducts = interface

    function dataSource : TDataSource;
    function result : TDataSet;

    function searchProducts(aValue : integer) : iProducts;
    function listAllProducts: iProducts;
    function fillObject : iProducts;

    function getId   : Integer;
    function getDescription : String;
    function getPriceSell : Currency;

    procedure setId(aValue : Integer) ;
    procedure setDescription(aValue : String) ;
    procedure setPriceSell(aValue : Currency) ;

    function existProductById(aValue: integer): boolean;
    function strlistAllProducts : string;


  end;


implementation

end.
