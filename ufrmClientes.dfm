object frmClientes: TfrmClientes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 411
  ClientWidth = 684
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBotoes: TPanel
    Left = 0
    Top = 0
    Width = 93
    Height = 411
    Align = alLeft
    BevelOuter = bvNone
    Color = clMenu
    ParentBackground = False
    TabOrder = 0
    object btnNovo: TButton
      Left = 6
      Top = 44
      Width = 80
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnAlterar: TButton
      Left = 6
      Top = 75
      Width = 80
      Height = 25
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnExcluir: TButton
      Left = 7
      Top = 106
      Width = 80
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
    object btnSalvar: TButton
      Left = 6
      Top = 137
      Width = 80
      Height = 25
      Caption = 'Salvar'
      Enabled = False
      TabOrder = 3
      OnClick = btnSalvarClick
    end
    object btnCancelar: TButton
      Left = 7
      Top = 168
      Width = 80
      Height = 25
      Caption = 'Cancelar'
      Enabled = False
      TabOrder = 4
      OnClick = btnCancelarClick
    end
    object btnAnterior: TButton
      Left = 6
      Top = 13
      Width = 38
      Height = 25
      Caption = '<-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = btnAnteriorClick
    end
    object btnProximo: TButton
      Left = 48
      Top = 13
      Width = 38
      Height = 25
      Caption = '->'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = btnProximoClick
    end
  end
  object Panel1: TPanel
    Left = 93
    Top = 0
    Width = 591
    Height = 411
    Align = alClient
    BevelInner = bvLowered
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object Label3: TLabel
      Left = 178
      Top = 13
      Width = 169
      Height = 19
      Margins.Top = 0
      Alignment = taCenter
      Caption = 'Cadastro de Clientes'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label12: TLabel
      Left = 17
      Top = 70
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label1: TLabel
      Left = 17
      Top = 114
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label11: TLabel
      Left = 17
      Top = 158
      Width = 19
      Height = 13
      Caption = 'CEP'
    end
    object Label2: TLabel
      Left = 463
      Top = 253
      Width = 23
      Height = 13
      Caption = 'IBGE'
    end
    object Label6: TLabel
      Left = 98
      Top = 158
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object Label7: TLabel
      Left = 515
      Top = 158
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object Label8: TLabel
      Left = 17
      Top = 253
      Width = 65
      Height = 13
      Caption = 'Complemento'
    end
    object Label13: TLabel
      Left = 17
      Top = 205
      Width = 28
      Height = 13
      Caption = 'Bairro'
    end
    object Label9: TLabel
      Left = 274
      Top = 205
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object Label10: TLabel
      Left = 528
      Top = 205
      Width = 13
      Height = 13
      Caption = 'UF'
    end
    object edtCodigo: TEdit
      Left = 17
      Top = 86
      Width = 60
      Height = 21
      Enabled = False
      MaxLength = 9
      NumbersOnly = True
      TabOrder = 0
      OnKeyPress = edtCodigoKeyPress
    end
    object edtNome: TEdit
      Tag = 1
      Left = 17
      Top = 130
      Width = 557
      Height = 21
      Hint = 'Nome'
      CharCase = ecUpperCase
      Enabled = False
      MaxLength = 100
      TabOrder = 1
    end
    object edtCEP: TEdit
      Tag = 1
      Left = 17
      Top = 174
      Width = 75
      Height = 21
      Hint = 'CEP'
      Enabled = False
      MaxLength = 8
      NumbersOnly = True
      TabOrder = 2
      OnExit = edtCEPExit
      OnKeyPress = edtCEPKeyPress
    end
    object edtIBGE: TEdit
      Left = 463
      Top = 270
      Width = 111
      Height = 21
      Enabled = False
      MaxLength = 9
      TabOrder = 9
      OnKeyPress = edtIBGEKeyPress
    end
    object edtEndereco: TEdit
      Tag = 1
      Left = 98
      Top = 174
      Width = 411
      Height = 21
      Hint = 'Endere'#231'o'
      CharCase = ecUpperCase
      Enabled = False
      MaxLength = 100
      TabOrder = 3
    end
    object edtNumero: TEdit
      Tag = 1
      Left = 515
      Top = 174
      Width = 59
      Height = 21
      Hint = 'N'#250'mero'
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 4
      OnKeyPress = edtNumeroKeyPress
    end
    object edtComplemento: TEdit
      Left = 17
      Top = 270
      Width = 440
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      MaxLength = 100
      TabOrder = 8
    end
    object edtBairro: TEdit
      Tag = 1
      Left = 17
      Top = 224
      Width = 251
      Height = 21
      Hint = 'Bairro'
      CharCase = ecUpperCase
      Enabled = False
      MaxLength = 100
      TabOrder = 5
    end
    object edtCidade: TEdit
      Tag = 1
      Left = 274
      Top = 224
      Width = 246
      Height = 21
      Hint = 'Cidade'
      CharCase = ecUpperCase
      Enabled = False
      MaxLength = 100
      TabOrder = 6
    end
    object cbxUF: TComboBox
      Tag = 1
      Left = 528
      Top = 224
      Width = 47
      Height = 21
      Hint = 'UF'
      Style = csDropDownList
      Enabled = False
      TabOrder = 7
      Items.Strings = (
        'AC'
        'AL'
        'AP'
        'AM'
        'BA'
        'CE'
        'ES'
        'GO'
        'MA'
        'MT'
        'MS'
        'MG'
        'PA'
        'PB'
        'PR'
        'PE'
        'PI'
        'RJ'
        'RN'
        'RS'
        'RO'
        'RR'
        'SC'
        'SP'
        'SE'
        'TO'
        'DF')
    end
  end
end
