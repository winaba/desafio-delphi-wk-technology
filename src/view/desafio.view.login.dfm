object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  Caption = 'Desafio Delphi - WK Technology'
  ClientHeight = 390
  ClientWidth = 551
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 551
    Height = 97
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    Padding.Left = 30
    Padding.Top = 30
    Padding.Right = 30
    Padding.Bottom = 10
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 30
      Top = 30
      Width = 491
      Height = 23
      Align = alTop
      Caption = 'Usu'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 58
    end
    object edEmail: TEdit
      Left = 30
      Top = 56
      Width = 491
      Height = 31
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'wagner.inaba@wktechnology.com.br'
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 244
    Width = 551
    Height = 146
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    Padding.Left = 30
    Padding.Top = 30
    Padding.Right = 30
    Padding.Bottom = 10
    ParentFont = False
    TabOrder = 2
    object Button1: TButton
      Left = 270
      Top = 30
      Width = 130
      Height = 106
      Align = alRight
      Caption = 'Entrar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 400
      Top = 30
      Width = 121
      Height = 106
      Align = alRight
      Caption = 'Cadastrar'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 30
      Top = 30
      Width = 122
      Height = 106
      Align = alLeft
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 551
    Height = 97
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    Padding.Left = 30
    Padding.Top = 30
    Padding.Right = 30
    Padding.Bottom = 10
    ParentFont = False
    TabOrder = 1
    object Label2: TLabel
      Left = 30
      Top = 30
      Width = 491
      Height = 23
      Align = alTop
      Caption = 'Senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 47
    end
    object edPassword: TEdit
      Left = 30
      Top = 56
      Width = 491
      Height = 31
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 0
      Text = '1234'
    end
  end
end
