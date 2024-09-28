object frmRegisterUser: TfrmRegisterUser
  Left = 0
  Top = 0
  Caption = 'Desafio Delphi - WK Technology'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Panel2: TPanel
    Left = 0
    Top = 336
    Width = 628
    Height = 106
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    Padding.Left = 10
    Padding.Top = 10
    Padding.Right = 10
    Padding.Bottom = 10
    ParentFont = False
    TabOrder = 0
    object Button1: TButton
      Left = 10
      Top = 10
      Width = 158
      Height = 86
      Align = alLeft
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 336
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    Padding.Left = 10
    Padding.Top = 10
    Padding.Right = 10
    Padding.Bottom = 10
    ParentFont = False
    TabOrder = 1
    object Panel4: TPanel
      Left = 10
      Top = 10
      Width = 608
      Height = 75
      Align = alTop
      BevelOuter = bvNone
      Padding.Left = 10
      Padding.Top = 10
      Padding.Right = 10
      Padding.Bottom = 10
      TabOrder = 0
      object Label1: TLabel
        Left = 10
        Top = 10
        Width = 588
        Height = 23
        Align = alTop
        Caption = 'Nome'
        ExplicitWidth = 47
      end
      object edtName: TEdit
        Left = 10
        Top = 36
        Width = 588
        Height = 29
        Align = alBottom
        BevelInner = bvNone
        BevelOuter = bvNone
        Ctl3D = False
        ImeName = 'Japanese'
        ParentCtl3D = False
        TabOrder = 0
      end
    end
    object Panel5: TPanel
      AlignWithMargins = True
      Left = 10
      Top = 88
      Width = 608
      Height = 75
      Margins.Left = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      Padding.Left = 10
      Padding.Top = 10
      Padding.Right = 10
      Padding.Bottom = 10
      TabOrder = 1
      object Label2: TLabel
        Left = 10
        Top = 10
        Width = 588
        Height = 23
        Align = alTop
        Caption = 'E-mail'
        ExplicitWidth = 48
      end
      object edtemail: TEdit
        Left = 10
        Top = 36
        Width = 588
        Height = 29
        Align = alBottom
        BevelInner = bvNone
        BevelOuter = bvNone
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
      end
    end
    object Panel6: TPanel
      AlignWithMargins = True
      Left = 10
      Top = 166
      Width = 608
      Height = 75
      Margins.Left = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      Padding.Left = 10
      Padding.Top = 10
      Padding.Right = 10
      Padding.Bottom = 10
      TabOrder = 2
      object Label3: TLabel
        Left = 10
        Top = 10
        Width = 588
        Height = 23
        Align = alTop
        Caption = 'Senha'
        ExplicitWidth = 47
      end
      object edtPassword: TEdit
        Left = 10
        Top = 36
        Width = 588
        Height = 29
        Align = alBottom
        BevelInner = bvNone
        BevelOuter = bvNone
        Ctl3D = False
        ImeName = 'Japanese'
        ParentCtl3D = False
        PasswordChar = '*'
        TabOrder = 0
      end
    end
  end
end
