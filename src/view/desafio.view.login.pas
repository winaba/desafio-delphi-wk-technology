unit desafio.view.login;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;
type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    edEmail: TEdit;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    edPassword: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  frmLogin: TfrmLogin;
implementation
uses desafio.view.register.user;
{$R *.dfm}
procedure TfrmLogin.Button1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;
procedure TfrmLogin.Button2Click(Sender: TObject);
var
  lRegisterUser: TfrmRegisterUser;
begin
  lRegisterUser:= TfrmRegisterUser.Create(nil);
  try
    lRegisterUser.ShowModal;
    if lRegisterUser.ModalResult = mrOk then
    begin
      self.edEmail.Text := lRegisterUser.edtEmail.Text;
      self.edPassword.Text := lRegisterUser.edtPassword.Text;
    end;
  finally
    FreeAndNil(lRegisterUser);
  end;
end;
procedure TfrmLogin.Button3Click(Sender: TObject);
begin
  close;
end;
procedure TfrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key =#13 then
  begin
    key:=#0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

end.
