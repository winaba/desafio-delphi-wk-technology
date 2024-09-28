unit desafio.model.interfaces.user;

interface

type

  iUser = interface

    function getId : Integer;
    function getName : String;
    function getEmail : string;
    function getPassword : string;

    procedure setId(aValue : Integer);
    procedure setName(aValue : String);
    procedure setEmail(aValue : String);
    procedure setPassword(aValue : String);

    function loginUser(aEmail, aPassword : String) : iUser;
    function insert(user : iUser) : iUser;

  end;



implementation

end.
