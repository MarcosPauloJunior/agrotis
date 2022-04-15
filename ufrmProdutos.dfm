object frmProdutos: TfrmProdutos
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
  KeyPreview = True
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
      Left = 6
      Top = 106
      Width = 80
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
    object btnSalvar: TButton
      Left = 7
      Top = 137
      Width = 80
      Height = 25
      Caption = 'Salvar'
      Enabled = False
      TabOrder = 3
      OnClick = btnSalvarClick
    end
    object btnCancelar: TButton
      Left = 6
      Top = 168
      Width = 80
      Height = 25
      Caption = 'Cancelar'
      Enabled = False
      TabOrder = 4
      OnClick = btnCancelarClick
    end
    object btnAnterior: TButton
      Left = 4
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
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label3: TLabel
      Left = 178
      Top = 20
      Width = 176
      Height = 19
      Margins.Top = 0
      Alignment = taCenter
      Caption = 'Cadastro de Produtos'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object edtCodigo: TEdit
      Left = 17
      Top = 86
      Width = 80
      Height = 21
      Enabled = False
      MaxLength = 9
      NumbersOnly = True
      TabOrder = 0
      OnKeyPress = edtCodigoKeyPress
    end
    object edtDescricao: TEdit
      Tag = 1
      Left = 17
      Top = 129
      Width = 553
      Height = 21
      Hint = 'Descri'#231#227'o do Produto'
      CharCase = ecUpperCase
      Enabled = False
      MaxLength = 100
      TabOrder = 1
    end
  end
end
