program DesafioDelphi_WKTecnology;
uses
  Vcl.Forms,
  desafio.view.main in 'view\desafio.view.main.pas' {frmMain},
  desafio.view.login in 'view\desafio.view.login.pas' {frmLogin},
  desafio.model.interfaces.products in 'model\interfaces\desafio.model.interfaces.products.pas',
  desafio.model.interfaces.orders in 'model\interfaces\desafio.model.interfaces.orders.pas',
  desafio.model.interfaces.connection in 'model\interfaces\desafio.model.interfaces.connection.pas',
  desafio.model.interfaces.user in 'model\interfaces\desafio.model.interfaces.user.pas',
  desafio.model.implements.user in 'model\implements\desafio.model.implements.user.pas',
  desafio.model.implements.connection in 'model\implements\desafio.model.implements.connection.pas',
  desafio.model.dao.connection in 'model\DAO\desafio.model.dao.connection.pas' {DMConnection: TDataModule},
  desafio.view.register.user in 'view\desafio.view.register.user.pas' {frmRegisterUser},
  desafio.model.implements.orders in 'model\implements\desafio.model.implements.orders.pas',
  desafio.model.implements.products in 'model\implements\desafio.model.implements.products.pas',
  desafio.model.interfaces.customers in 'model\interfaces\desafio.model.interfaces.customers.pas',
  desafio.model.implements.customers in 'model\implements\desafio.model.implements.customers.pas';

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  ReportMemoryLeaksOnShutdown := true;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
