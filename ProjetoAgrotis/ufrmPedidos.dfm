object frmPedidos: TfrmPedidos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Lan'#231'amento de Pedidos'
  ClientHeight = 511
  ClientWidth = 714
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
    Width = 714
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    Color = clMenu
    ParentBackground = False
    TabOrder = 0
    object btnNovo: TButton
      Left = 160
      Top = 0
      Width = 80
      Height = 26
      Align = alLeft
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnAlterar: TButton
      Left = 240
      Top = 0
      Width = 80
      Height = 26
      Align = alLeft
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnExcluir: TButton
      Left = 320
      Top = 0
      Width = 80
      Height = 26
      Align = alLeft
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
    object btnSalvar: TButton
      Left = 400
      Top = 0
      Width = 80
      Height = 26
      Align = alLeft
      Caption = 'Salvar'
      Enabled = False
      TabOrder = 3
      OnClick = btnSalvarClick
    end
    object btnCancelar: TButton
      Left = 480
      Top = 0
      Width = 80
      Height = 26
      Align = alLeft
      Caption = 'Cancelar'
      Enabled = False
      TabOrder = 4
      OnClick = btnCancelarClick
    end
    object btnAnterior: TButton
      Left = 0
      Top = 0
      Width = 80
      Height = 26
      Align = alLeft
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
      Left = 80
      Top = 0
      Width = 80
      Height = 26
      Align = alLeft
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
    Left = 0
    Top = 26
    Width = 714
    Height = 20
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object Label3: TLabel
      Left = 17
      Top = 3
      Width = 132
      Height = 13
      Margins.Top = 0
      Alignment = taCenter
      Caption = 'Dados Gerais do Pedido'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
  end
  object pFundo: TPanel
    Left = 0
    Top = 46
    Width = 714
    Height = 162
    Align = alTop
    BevelInner = bvLowered
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object Label12: TLabel
      Left = 17
      Top = 13
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label1: TLabel
      Left = 97
      Top = 13
      Width = 52
      Height = 13
      Caption = 'Refer'#234'ncia'
    end
    object Label2: TLabel
      Left = 17
      Top = 59
      Width = 56
      Height = 13
      Caption = 'Num Pedido'
    end
    object Label10: TLabel
      Left = 97
      Top = 59
      Width = 64
      Height = 13
      Caption = 'Data Emiss'#227'o'
    end
    object Label11: TLabel
      Left = 224
      Top = 59
      Width = 69
      Height = 13
      Caption = 'C'#243'digo Cliente'
    end
    object Label13: TLabel
      Left = 299
      Top = 59
      Width = 63
      Height = 13
      Caption = 'Nome Cliente'
    end
    object Label14: TLabel
      Left = 17
      Top = 105
      Width = 70
      Height = 13
      Caption = 'Tipo Opera'#231#227'o'
    end
    object Label15: TLabel
      Left = 97
      Top = 105
      Width = 86
      Height = 13
      Caption = 'Valor Total Pedido'
    end
    object edtCodigo: TEdit
      Tag = 1
      Left = 17
      Top = 32
      Width = 74
      Height = 21
      Enabled = False
      NumbersOnly = True
      TabOrder = 0
    end
    object edtReferencia: TEdit
      Tag = 1
      Left = 97
      Top = 32
      Width = 608
      Height = 21
      Hint = 'Refer'#234'ncia'
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 1
    end
    object edtNumPedido: TEdit
      Tag = 1
      Left = 17
      Top = 78
      Width = 74
      Height = 21
      Hint = 'Num Pedido'
      Enabled = False
      TabOrder = 2
    end
    object edtCodCliente: TEdit
      Tag = 1
      Left = 224
      Top = 78
      Width = 69
      Height = 21
      Hint = 'C'#243'digo Cliente'
      Enabled = False
      NumbersOnly = True
      TabOrder = 4
      OnExit = edtCodClienteExit
    end
    object edtNomeCliente: TEdit
      Tag = 1
      Left = 299
      Top = 78
      Width = 406
      Height = 21
      Enabled = False
      TabOrder = 5
    end
    object cbxTipo: TComboBox
      Tag = 1
      Left = 17
      Top = 124
      Width = 74
      Height = 21
      Hint = 'Tipo Opera'#231#227'o'
      Style = csDropDownList
      Enabled = False
      TabOrder = 6
      Items.Strings = (
        'E'
        'S')
    end
    object edtVlrTotalPedido: TEdit
      Tag = 1
      Left = 97
      Top = 124
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 7
      Text = '0,00'
      OnExit = edtVlrTotalPedidoExit
    end
    object edtData: TMaskEdit
      Left = 97
      Top = 78
      Width = 120
      Height = 21
      Enabled = False
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 3
      Text = '  /  /    '
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 208
    Width = 714
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    Color = clMenu
    ParentBackground = False
    TabOrder = 3
    object btnNovoItens: TButton
      Left = 160
      Top = 0
      Width = 80
      Height = 26
      Align = alLeft
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btnNovoItensClick
    end
    object btnAlterarItens: TButton
      Left = 240
      Top = 0
      Width = 80
      Height = 26
      Align = alLeft
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = btnAlterarItensClick
    end
    object btnExcluirItens: TButton
      Left = 320
      Top = 0
      Width = 80
      Height = 26
      Align = alLeft
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btnExcluirItensClick
    end
    object btnSalvarItens: TButton
      Left = 400
      Top = 0
      Width = 80
      Height = 26
      Align = alLeft
      Caption = 'Salvar'
      Enabled = False
      TabOrder = 3
      OnClick = btnSalvarItensClick
    end
    object btnCancelarItens: TButton
      Left = 480
      Top = 0
      Width = 80
      Height = 26
      Align = alLeft
      Caption = 'Cancelar'
      Enabled = False
      TabOrder = 4
      OnClick = btnCancelarItensClick
    end
    object btnAnteriorItens: TButton
      Left = 0
      Top = 0
      Width = 80
      Height = 26
      Align = alLeft
      Caption = '<-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = btnAnteriorItensClick
    end
    object btnProximoItens: TButton
      Left = 80
      Top = 0
      Width = 80
      Height = 26
      Align = alLeft
      Caption = '->'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = btnProximoItensClick
    end
  end
  object pFundoItem: TPanel
    Left = 0
    Top = 254
    Width = 714
    Height = 257
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 4
    object Label6: TLabel
      Left = 17
      Top = 60
      Width = 56
      Height = 13
      Caption = 'Quantidade'
    end
    object Label7: TLabel
      Left = 17
      Top = 14
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label8: TLabel
      Left = 97
      Top = 14
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label9: TLabel
      Left = 144
      Top = 60
      Width = 64
      Height = 13
      Caption = 'Valor Unit'#225'rio'
    end
    object Label16: TLabel
      Left = 271
      Top = 60
      Width = 24
      Height = 13
      Caption = 'Total'
    end
    object edtQtd: TEdit
      Tag = 2
      Left = 17
      Top = 79
      Width = 121
      Height = 21
      Hint = 'Quantidade'
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 2
      Text = '0,00'
      OnExit = edtQtdExit
    end
    object edtCodProduto: TEdit
      Tag = 2
      Left = 17
      Top = 33
      Width = 74
      Height = 21
      Hint = 'Codigo Produto'
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 0
      OnExit = edtCodProdutoExit
    end
    object edtDescricaoProd: TEdit
      Tag = 2
      Left = 97
      Top = 33
      Width = 608
      Height = 21
      Hint = 'Descri'#231#227'o Produto'
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 1
    end
    object edtVlrUnit: TEdit
      Tag = 2
      Left = 144
      Top = 79
      Width = 121
      Height = 21
      Hint = 'Valor Unit'#225'rio'
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 3
      Text = '0,00'
      OnExit = edtVlrUnitExit
    end
    object edtTotalItem: TEdit
      Tag = 2
      Left = 271
      Top = 79
      Width = 121
      Height = 21
      Hint = 'Total'
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 4
      Text = '0,00'
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 234
    Width = 714
    Height = 20
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 5
    object Label17: TLabel
      Left = 17
      Top = 3
      Width = 88
      Height = 13
      Margins.Top = 0
      Alignment = taCenter
      Caption = 'Itens do Pedido'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
  end
end
