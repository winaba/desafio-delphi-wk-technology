object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Desafio Delphi - WK Technology'
  ClientHeight = 644
  ClientWidth = 824
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 65
    Width = 824
    Height = 72
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    Padding.Left = 10
    Padding.Top = 20
    Padding.Right = 10
    Padding.Bottom = 10
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 11
      Top = 21
      Width = 142
      Height = 40
      Align = alLeft
      Caption = 'C'#243'dido do Cliente:'
      ExplicitHeight = 23
    end
    object lbCustomerName: TLabel
      Left = 304
      Top = 20
      Width = 489
      Height = 23
      AutoSize = False
    end
    object edSearchCustomers: TEdit
      Left = 163
      Top = 16
      Width = 121
      Height = 31
      NumbersOnly = True
      TabOrder = 0
      OnChange = edSearchCustomersChange
      OnExit = edSearchCustomersExit
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 409
    Width = 824
    Height = 191
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    Padding.Left = 10
    Padding.Top = 20
    Padding.Right = 10
    Padding.Bottom = 20
    ParentFont = False
    TabOrder = 1
    object lbGridOrders: TLabel
      Left = 11
      Top = 21
      Width = 802
      Height = 23
      Align = alTop
      Caption = 'Historico de transa'#231#245'es:'
      ExplicitWidth = 181
    end
    object DBGOrders: TDBGrid
      Left = 11
      Top = 44
      Width = 802
      Height = 126
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -17
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object pnOrderOptions: TPanel
    Left = 0
    Top = 337
    Width = 824
    Height = 72
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    Padding.Left = 10
    Padding.Top = 5
    Padding.Right = 10
    Padding.Bottom = 5
    ParentFont = False
    TabOrder = 2
    object Panel11: TPanel
      Left = 11
      Top = 6
      Width = 414
      Height = 60
      Align = alLeft
      BevelOuter = bvNone
      Padding.Left = 5
      Padding.Top = 15
      Padding.Right = 5
      Padding.Bottom = 10
      TabOrder = 0
      object Label5: TLabel
        Left = 5
        Top = 15
        Width = 151
        Height = 35
        Align = alLeft
        Caption = 'C'#243'dido do Pedido:  '
        ExplicitHeight = 23
      end
      object edSearchOrders: TEdit
        Left = 156
        Top = 15
        Width = 119
        Height = 35
        Align = alLeft
        NumbersOnly = True
        TabOrder = 0
        ExplicitHeight = 31
      end
    end
    object Panel13: TPanel
      Left = 392
      Top = 6
      Width = 421
      Height = 60
      Align = alRight
      BevelOuter = bvNone
      Padding.Right = 20
      TabOrder = 1
      object btCancelOrder: TButton
        Left = 261
        Top = 0
        Width = 140
        Height = 60
        Align = alRight
        Caption = 'Cancelar pedido'
        TabOrder = 1
        OnClick = btCancelOrderClick
      end
      object btSearchOrder: TButton
        Left = 0
        Top = 0
        Width = 141
        Height = 60
        Align = alLeft
        Caption = 'Carregar pedido'
        TabOrder = 0
        OnClick = btSearchOrderClick
      end
    end
  end
  object pnNewOrder: TPanel
    Left = 0
    Top = 137
    Width = 824
    Height = 72
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    Padding.Left = 10
    Padding.Top = 5
    Padding.Right = 10
    Padding.Bottom = 10
    ParentFont = False
    TabOrder = 3
    Visible = False
    object Panel12: TPanel
      Left = 11
      Top = 6
      Width = 802
      Height = 55
      Align = alClient
      BevelOuter = bvNone
      Padding.Left = 20
      Padding.Right = 20
      TabOrder = 0
      object btnInsertNewOrder: TButton
        Left = 20
        Top = 0
        Width = 248
        Height = 55
        Align = alLeft
        Caption = 'Inserir novo pedido'
        TabOrder = 0
        OnClick = btnInsertNewOrderClick
      end
      object btnCancelNewOrder: TButton
        Left = 545
        Top = 0
        Width = 237
        Height = 55
        Align = alRight
        Caption = 'Cancelar novo pedido'
        TabOrder = 2
        OnClick = btnCancelNewOrderClick
      end
      object btnRegisterNewOrder: TButton
        Left = 268
        Top = 0
        Width = 277
        Height = 55
        Align = alClient
        Caption = 'Gravar novo pedido'
        TabOrder = 1
        OnClick = btnRegisterNewOrderClick
      end
    end
  end
  object pnNewItem: TPanel
    Left = 0
    Top = 209
    Width = 824
    Height = 128
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    Padding.Left = 10
    Padding.Top = 5
    Padding.Right = 10
    Padding.Bottom = 10
    ParentFont = False
    TabOrder = 4
    Visible = False
    object Panel10: TPanel
      Left = 11
      Top = 6
      Width = 646
      Height = 111
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      Padding.Left = 50
      Padding.Right = 50
      ParentFont = False
      TabOrder = 0
      object Label9: TLabel
        Left = 20
        Top = 67
        Width = 94
        Height = 23
        Caption = 'Quantidade:'
      end
      object Label10: TLabel
        Left = 355
        Top = 70
        Width = 109
        Height = 23
        Caption = 'Valor Unit'#225'rio:'
      end
      object lbProductDescription: TLabel
        Left = 355
        Top = 22
        Width = 263
        Height = 23
        AutoSize = False
      end
      object Panel14: TPanel
        Left = 20
        Top = 6
        Width = 157
        Height = 55
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = 'C'#243'digo do produto:'
        Padding.Right = 20
        TabOrder = 0
      end
      object edSearchProducts: TEdit
        Left = 183
        Top = 18
        Width = 140
        Height = 31
        NumbersOnly = True
        TabOrder = 1
        OnExit = edSearchProductsExit
      end
      object edAmountProducts: TEdit
        Left = 183
        Top = 67
        Width = 140
        Height = 31
        NumbersOnly = True
        TabOrder = 2
        OnChange = edSearchCustomersChange
      end
      object edProductUnitValue: TEdit
        Left = 478
        Top = 66
        Width = 140
        Height = 31
        TabOrder = 3
        OnChange = edSearchCustomersChange
        OnExit = edProductUnitValueExit
        OnKeyPress = edProductUnitValueKeyPress
      end
    end
    object Panel15: TPanel
      Left = 663
      Top = 6
      Width = 150
      Height = 111
      Align = alRight
      TabOrder = 1
      object btResgisterItem: TButton
        Left = 1
        Top = 1
        Width = 148
        Height = 109
        Align = alClient
        Caption = 'Inserir Item'
        TabOrder = 0
        OnClick = btResgisterItemClick
        OnExit = btResgisterItemExit
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 824
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    Padding.Left = 10
    Padding.Top = 20
    Padding.Right = 10
    Padding.Bottom = 10
    TabOrder = 5
    object Label8: TLabel
      Left = 10
      Top = 20
      Width = 804
      Height = 35
      Align = alClient
      Alignment = taCenter
      Caption = 'WK Technology - Controle de Pedidos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 30
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 349
      ExplicitHeight = 30
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 600
    Width = 824
    Height = 44
    Align = alBottom
    Padding.Top = 10
    Padding.Right = 30
    Padding.Bottom = 10
    TabOrder = 6
    object lbTotalOrder: TLabel
      Left = 657
      Top = 11
      Width = 136
      Height = 22
      Align = alRight
      Caption = 'Total do Pedido: R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 20
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitHeight = 20
    end
  end
end
