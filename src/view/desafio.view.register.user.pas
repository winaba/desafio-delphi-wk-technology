unit desafio.view.register.user;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmRegisterUser = class(TForm)
    Panel2: TPanel;
    Button1: TButton;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    edtName: TEdit;
    Panel5: TPanel;
    Label2: TLabel;
    edtemail: TEdit;
    Panel6: TPanel;
    Label3: TLabel;
    edtPassword: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegisterUser: TfrmRegisterUser;

implementation

uses
  desafio.model.interfaces.user, desafio.model.implements.user;

{$R *.dfm}


procedure TfrmRegisterUser.Button1Click(Sender: TObject);
  var
    lUser : iUser;

begin
  lUser := TUser.new;

  lUser.setId(0);
  lUser.setName(edtName.Text);
  lUser.setEmail(edtEmail.Text);
  lUser.setPassword(edtPassword.Text);

  lUser.insert(lUser);

  if lUser.getId > 0 then
  begin
    showmessage('Usuário inserido com sucesso') ;
    modalResult := mrOk;
  end
  else
    showmessage('Houve um erro na inserção deste usuário');

end;

end.
