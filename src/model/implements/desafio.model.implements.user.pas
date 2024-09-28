unit desafio.model.implements.user;

interface

uses desafio.model.interfaces.user, desafio.model.interfaces.connection, desafio.model.implements.connection;

type
  TUser = class(TInterfacedObject, iUser)
  private
    conn: iConnection;

    FId: integer;
    FName: string;
    FEmail: string;
    FPassword: string;

    function getId : Integer;
    function getName : String;
    function getEmail : string;
    function getPassword : string;

    procedure setId(aValue : Integer);
    procedure setName(aValue : String);
    procedure setEmail(aValue : String);
    procedure setPassword(aValue : String);

  public

    constructor Create;
    destructor Destroy; override;
    class function New : iUser;

    function searchUser(aValue: integer): iUser;
    function searchUserByEmail(aValue: string) : iUser;
    function existUserByEmail(aValue: string): boolean;
    function loginUser(aEmail, aPassword : String) : iUser;
    function fillObject : iUser;
    function insert(user : iUser) : iUser;

  end;

implementation

{ TUser }

constructor TUser.Create;
begin
  conn := TConnection.New;
end;

destructor TUser.Destroy;
begin
  //pass
  inherited;
end;


function TUser.getEmail: string;
begin
  Result := FEmail;
end;

function TUser.getId: Integer;
begin
  Result := FId;
end;

function TUser.getName: String;
begin
  Result := FName;
end;

function TUser.getPassword: string;
begin
  Result := FPassword;
end;

function TUser.insert(user: iUser): iUser;
begin

  if not existUserByEmail(user.getEmail) then
  begin
    conn.sql('insert into users (name, email, password) '+
             'values (:name, :email, :password)')
        .params('name', user.getName)
        .params('email', user.getEmail)
        .params('password', user.getPassword)
        .exec;

    searchUserByEmail(user.getEmail);
  end;

  result := self;
end;

class function TUser.New: iUser;
begin
  result := self.Create;
end;

procedure TUser.setEmail(aValue: String);
begin
  FEmail := aValue;
end;

procedure TUser.setId(aValue: Integer);
begin
  FId := aValue;
end;

procedure TUser.setName(aValue: String);
begin
  FName := aValue;

end;

procedure TUser.setPassword(aValue: String);
begin
  FPassword := aValue;
end;

function TUser.searchUser(aValue: integer): iUser;
begin
  conn.sql('select id, name, email, password from users where id=:id')
      .params('id', aValue)
      .open;

  if conn.result.RecordCount > 0 then
  begin
    FId   := conn.result.FieldByName('idusers').AsInteger;
    FName := conn.result.FieldByName('name').AsString;
    FEmail := conn.result.FieldByName('email').AsString;
    FPassword   := conn.result.FieldByName('password').AsString;
  end;
end;

function TUser.searchUserByEmail(aValue: string): iUser;
begin

  FId   := 0;
  FName := '';
  FEmail := '';
  FPassword := '';

  conn.sql('select idusers, name, email, password from users where email=:email')
      .params('email', aValue)
      .open;

  if conn.result.RecordCount > 0 then
  begin
    FId   := conn.result.FieldByName('id').AsInteger;
    FName := conn.result.FieldByName('name').AsString;
    FEmail := conn.result.FieldByName('email').AsString;
    FPassword   := conn.result.FieldByName('password').AsString;
  end;
end;

function TUser.existUserByEmail(aValue: string): boolean;
begin
  conn.sql('select idusers, name, email, password from users where email=:email')
      .params('email', aValue)
      .open;

  result := (conn.result.RecordCount > 0);
end;


function TUser.loginUser(aEmail, aPassword : String): iUser;
begin
  result := Nil;

  conn.SQL('select * from users where email=:email and password=:password');
  conn.Params('email', aEmail);
  conn.Params('password', aPassword);
  conn.Open;

  if not conn.result.IsEmpty then
    Result := fillObject;
end;

function TUser.fillObject: iUser;
begin
  Result := TUser.Create;
  conn.result.First;

  Result.setId(conn.result.FieldByName('idusers').AsInteger);
  Result.setName(conn.result.FieldByName('name').AsString);
  Result.setEmail(conn.result.FieldByName('email').AsString);
  Result.setPassword(conn.result.FieldByName('password').AsString);
end;


end.
