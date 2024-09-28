object DMConnection: TDMConnection
  Height = 305
  Width = 426
  PixelsPerInch = 120
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=MySQL'
      'Password=root'
      'Server=localhost'
      'User_Name=root'
      'Database=demo')
    LoginPrompt = False
    Left = 144
    Top = 48
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'E:\projetos\Delphi\desafio-delphi-desafio_delphi_khipo\desafio-d' +
      'elphi-desafio_delphi_khipo\src\Win32\Debug\libmysql.dll'
    Left = 192
    Top = 136
  end
end
