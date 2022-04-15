unit ufrmPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, oPedido,
  Vcl.Mask;

type
  TfrmPedidos = class(TForm)
    pnlBotoes: TPanel;
    btnNovo: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnSalvar: TButton;
    btnCancelar: TButton;
    btnAnterior: TButton;
    btnProximo: TButton;
    Panel1: TPanel;
    Label3: TLabel;
    pFundo: TPanel;
    Label12: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edtCodigo: TEdit;
    edtReferencia: TEdit;
    edtNumPedido: TEdit;
    edtCodCliente: TEdit;
    edtNomeCliente: TEdit;
    cbxTipo: TComboBox;
    edtVlrTotalPedido: TEdit;
    Panel2: TPanel;
    btnNovoItens: TButton;
    btnAlterarItens: TButton;
    btnExcluirItens: TButton;
    btnSalvarItens: TButton;
    btnCancelarItens: TButton;
    btnAnteriorItens: TButton;
    btnProximoItens: TButton;
    pFundoItem: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label16: TLabel;
    edtQtd: TEdit;
    edtCodProduto: TEdit;
    edtDescricaoProd: TEdit;
    edtVlrUnit: TEdit;
    edtTotalItem: TEdit;
    Panel3: TPanel;
    Label17: TLabel;
    edtData: TMaskEdit;
    procedure btnAnteriorClick(Sender: TObject);


    procedure CarregarTela;
    procedure CarregarTelaItens;
    procedure btnProximoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);

    procedure BloqueiaCampos(tipo: integer);
    procedure BloqueiaCamposItens(tipo: integer);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAnteriorItensClick(Sender: TObject);
    procedure btnProximoItensClick(Sender: TObject);
    procedure btnNovoItensClick(Sender: TObject);
    procedure btnAlterarItensClick(Sender: TObject);
    procedure btnExcluirItensClick(Sender: TObject);
    procedure btnSalvarItensClick(Sender: TObject);
    procedure btnCancelarItensClick(Sender: TObject);
    procedure edtVlrTotalPedidoExit(Sender: TObject);
    procedure edtQtdExit(Sender: TObject);
    procedure edtVlrUnitExit(Sender: TObject);

    procedure CalculaValorItem;
    procedure edtCodClienteExit(Sender: TObject);
    procedure edtCodProdutoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidos: TfrmPedidos;
  Pedido: TPedido;
  PedidoItens: TPedidoItens;
  ItemNovo : Boolean;

implementation

{$R *.dfm}

uses ufrmPrincipal;

procedure TfrmPedidos.BloqueiaCampos(tipo: integer);
begin
  case tipo of
    0: // Inserção
      begin
        Panel2.Enabled            := False;
        btnAnterior.Enabled       := False;
        btnProximo.Enabled        := False;
        btnNovo.Enabled           := False;
        btnAlterar.Enabled        := False;
        btnExcluir.Enabled        := False;
        btnSalvar.Enabled         := True;
        btnCancelar.Enabled       := True;
        edtCodigo.Enabled         := True;
        edtReferencia.Enabled     := True;
        edtNumPedido.Enabled      := True;
        edtData.Enabled           := True;
        edtCodCliente.Enabled     := True;
        cbxTipo.Enabled           := True;
        edtCodigo.Text            := '';
        edtReferencia.Text        := '';
        edtNumPedido.Text         := '';
        edtData.Text              := '';
        edtCodCliente.Text        := '';
        cbxTipo.Text              := '';
        edtNomeCliente.Text       := '';
        edtVlrTotalPedido.Text    := '0,00';
        edtCodigo.SetFocus;
      end;
    1: // Alteração
      begin
        Panel2.Enabled            := False;
        btnAnterior.Enabled       := False;
        btnProximo.Enabled        := False;
        btnNovo.Enabled           := False;
        btnAlterar.Enabled        := False;
        btnExcluir.Enabled        := False;
        btnSalvar.Enabled         := True;
        btnCancelar.Enabled       := True;
        edtCodigo.Enabled         := False;
        edtReferencia.Enabled     := True;
        edtNumPedido.Enabled      := True;
        edtData.Enabled           := True;
        edtCodCliente.Enabled     := True;
        cbxTipo.Enabled           := True;
        edtReferencia.SetFocus;
      end;
    2: // Cancelar
      begin
        Panel2.Enabled            := True;
        btnAnterior.Enabled       := True;
        btnProximo.Enabled        := True;
        btnNovo.Enabled           := True;
        btnAlterar.Enabled        := True;
        btnExcluir.Enabled        := True;
        btnSalvar.Enabled         := False;
        btnCancelar.Enabled       := False;
        edtCodigo.Enabled         := False;
        edtReferencia.Enabled     := False;
        edtNumPedido.Enabled      := False;
        edtData.Enabled           := False;
        edtCodCliente.Enabled     := False;
        cbxTipo.Enabled           := False;
        edtCodigo.Text            := '';
        edtReferencia.Text        := '';
        edtNumPedido.Text         := '';
        edtData.Text              := '';
        edtCodCliente.Text        := '';
        edtNomeCliente.Text       := '';
        cbxTipo.Text              := '';
        edtVlrTotalPedido.Text    := '0,00';
      end;
    3:
      begin
        Panel2.Enabled            := True;
        btnAnterior.Enabled       := True;
        btnProximo.Enabled        := True;
        btnNovo.Enabled           := True;
        btnAlterar.Enabled        := True;
        btnExcluir.Enabled        := True;
        btnSalvar.Enabled         := False;
        btnCancelar.Enabled       := False;
        edtCodigo.Enabled         := False;
        edtReferencia.Enabled     := False;
        edtNumPedido.Enabled      := False;
        edtData.Enabled           := False;
        edtCodCliente.Enabled     := False;
        cbxTipo.Enabled           := False;
      end;
  end;
end;

procedure TfrmPedidos.BloqueiaCamposItens(tipo: integer);
begin
  case tipo of
    0: // Inserção
      begin
        pnlBotoes.Enabled         := False;
        btnAnteriorItens.Enabled  := False;
        btnProximoItens.Enabled   := False;
        btnNovoItens.Enabled      := False;
        btnAlterarItens.Enabled   := False;
        btnExcluirItens.Enabled   := False;
        btnSalvarItens.Enabled    := True;
        btnCancelarItens.Enabled  := True;

        edtCodProduto.Enabled     := True;
        edtDescricaoProd.Enabled  := True;
        edtQtd.Enabled            := True;
        edtVlrUnit.Enabled        := True;
        edtCodProduto.Text        := '';
        edtDescricaoProd.Text     := '';
        edtQtd.Text               := '0,00';
        edtVlrUnit.Text           := '0,00';
        edtTotalItem.Text         := '0,00';
        edtCodProduto.SetFocus;
      end;
    1: // Alteração
      begin
        pnlBotoes.Enabled         := False;
        btnAnteriorItens.Enabled  := False;
        btnProximoItens.Enabled   := False;
        btnNovoItens.Enabled      := False;
        btnAlterarItens.Enabled   := False;
        btnExcluirItens.Enabled   := False;
        btnSalvarItens.Enabled    := True;
        btnCancelarItens.Enabled  := True;

        edtCodProduto.Enabled     := True;
        edtDescricaoProd.Enabled  := True;
        edtQtd.Enabled            := True;
        edtVlrUnit.Enabled        := True;
        edtCodProduto.SetFocus;
      end;
    2: // Cancelar
      begin
        pnlBotoes.Enabled         := True;
        btnAnteriorItens.Enabled  := True;
        btnProximoItens.Enabled   := True;
        btnNovoItens.Enabled      := True;
        btnAlterarItens.Enabled   := True;
        btnExcluirItens.Enabled   := True;
        btnSalvarItens.Enabled    := False;
        btnCancelarItens.Enabled  := False;

        edtCodProduto.Enabled     := False;
        edtDescricaoProd.Enabled  := False;
        edtQtd.Enabled            := False;
        edtVlrUnit.Enabled        := False;
        edtCodProduto.Text        := '';
        edtDescricaoProd.Text     := '';
        edtQtd.Text               := '0,00';
        edtVlrUnit.Text           := '0,00';
        edtTotalItem.Text         := '0,00';
      end;
    3:
      begin
        pnlBotoes.Enabled         := True;
        btnAnteriorItens.Enabled  := True;
        btnProximoItens.Enabled   := True;
        btnNovoItens.Enabled      := True;
        btnAlterarItens.Enabled   := True;
        btnExcluirItens.Enabled   := True;
        btnSalvarItens.Enabled    := False;
        btnCancelarItens.Enabled  := False;

        edtCodProduto.Enabled     := False;
        edtDescricaoProd.Enabled  := False;
        edtQtd.Enabled            := False;
        edtVlrUnit.Enabled        := False;
      end;
  end;
end;

procedure TfrmPedidos.btnAlterarClick(Sender: TObject);
begin
  BloqueiaCampos(1);
end;

procedure TfrmPedidos.btnAlterarItensClick(Sender: TObject);
begin
  ItemNovo := False;
  BloqueiaCamposItens(1);
end;

procedure TfrmPedidos.btnAnteriorClick(Sender: TObject);
begin
  pedido.Anterior;
  CarregarTela;
  PedidoItens.Carregar;
  CarregarTelaItens;
end;

procedure TfrmPedidos.btnAnteriorItensClick(Sender: TObject);
begin
  pedidoItens.Anterior;
  CarregarTelaItens;
end;

procedure TfrmPedidos.btnCancelarClick(Sender: TObject);
begin
  BloqueiaCampos(2);
  Pedido.Carregar;
  CarregarTela;
  BloqueiaCamposItens(2);
  PedidoItens.Carregar;
  CarregarTelaItens;
end;

procedure TfrmPedidos.btnCancelarItensClick(Sender: TObject);
begin
  BloqueiaCamposItens(2);
  PedidoItens.Carregar;
  CarregarTelaItens;
end;

procedure TfrmPedidos.btnExcluirClick(Sender: TObject);
begin
  try
    Pedido.codigo := StrToInt(edtCodigo.Text);
    Pedido.Deletar;
  finally
    Application.MessageBox('Pedido deletado com sucesso!','Agrotis',MB_ICONINFORMATION + MB_OK + MB_SYSTEMMODAL);
    Pedido.Carregar;
    BloqueiaCampos(2);
    CarregarTela;
    BloqueiaCamposItens(2);
    PedidoItens.Carregar;
    CarregarTelaItens;
  end;
end;

procedure TfrmPedidos.btnExcluirItensClick(Sender: TObject);
begin
  try
    PedidoItens.Deletar;
  finally
    Application.MessageBox('Item do Pedido deletado com sucesso!','Agrotis',MB_ICONINFORMATION + MB_OK + MB_SYSTEMMODAL);
    PedidoItens.Carregar;
    BloqueiaCamposItens(2);
    CarregarTelaItens;
  end;
end;

procedure TfrmPedidos.btnNovoClick(Sender: TObject);
begin
  BloqueiaCampos(0);
end;

procedure TfrmPedidos.btnNovoItensClick(Sender: TObject);
begin
  ItemNovo := True;
  BloqueiaCamposItens(0);
end;

procedure TfrmPedidos.btnProximoClick(Sender: TObject);
begin
  pedido.Proximo;
  CarregarTela;
  PedidoItens.Carregar;
  CarregarTelaItens;
end;

procedure TfrmPedidos.btnProximoItensClick(Sender: TObject);
begin
  pedidoItens.Proximo;
  CarregarTelaItens;
end;

procedure TfrmPedidos.btnSalvarClick(Sender: TObject);
begin
    if Trim(edtCodigo.Text) = '' then
    begin
      Application.MessageBox('Código não pode estar em branco! Verifique.','Agrotis',MB_ICONINFORMATION + MB_OK + MB_SYSTEMMODAL);
      abort;
    end
    else if Trim(edtReferencia.Text) = '' then
    begin
      Application.MessageBox('Referencia não pode estar em branco! Verifique.','Agrotis',MB_ICONINFORMATION + MB_OK + MB_SYSTEMMODAL);
      abort;
    end


    else if Trim(edtNumPedido.Text) = '' then
    begin
      Application.MessageBox('Número do Pedido não pode estar em branco! Verifique.','Agrotis',MB_ICONINFORMATION + MB_OK + MB_SYSTEMMODAL);
      abort;
    end
    else if Trim(edtData.Text) = '' then
    begin
      Application.MessageBox('Data não pode estar em branco! Verifique.','Agrotis',MB_ICONINFORMATION + MB_OK + MB_SYSTEMMODAL);
      abort;
    end
    else if Trim(edtCodCliente.Text) = '' then
    begin
      Application.MessageBox('Código do Cliente não pode estar em branco! Verifique.','Agrotis',MB_ICONINFORMATION + MB_OK + MB_SYSTEMMODAL);
      abort;
    end
    else if Trim(edtNomeCliente.Text) = '' then
    begin
      Application.MessageBox('Nome do Cliente não pode estar em branco! Verifique.','Agrotis',MB_ICONINFORMATION + MB_OK + MB_SYSTEMMODAL);
      abort;
    end
    else if Trim(cbxTipo.Text) = '' then
    begin
      Application.MessageBox('Tipo de Operação não pode estar em branco! Verifique.','Agrotis',MB_ICONINFORMATION + MB_OK + MB_SYSTEMMODAL);
      abort;
    end
    else if Trim(edtVlrTotalPedido.Text) = '' then
    begin
      Application.MessageBox('Valor Total não pode estar em branco! Verifique.','Agrotis',MB_ICONINFORMATION + MB_OK + MB_SYSTEMMODAL);
      abort;
    end;

    Pedido.codigo        := StrToInt(edtCodigo.Text);
    Pedido.referencia    := edtreferencia.Text;
    Pedido.numeropedido  := StrToInt(edtNumPedido.Text);
    Pedido.dataemissao   := StrToDate(edtData.Text);
    Pedido.codigocliente := StrToInt(edtCodCliente.Text);
    Pedido.tipooperacao  := cbxTipo.Text;
    Pedido.valortotal    := StrToFloat(edtVlrTotalPedido.Text);

    if edtCodigo.Enabled then
    begin
      Pedido.Gravar;
      Application.MessageBox('Pedido Inserido com sucesso!','Agrotis',MB_ICONINFORMATION + MB_OK + MB_SYSTEMMODAL);
    end
    else
    begin
      Pedido.Alterar;
      Application.MessageBox('Pedido alterado com sucesso!','Agrotis',MB_ICONINFORMATION + MB_OK + MB_SYSTEMMODAL);
    end;

    Pedido.Carregar;
    BloqueiaCampos(3);
    CarregarTela;

end;

procedure TfrmPedidos.btnSalvarItensClick(Sender: TObject);
begin
    if Trim(edtCodProduto.Text) = '' then
    begin
      Application.MessageBox('Código Produto não pode estar em branco! Verifique.','Agrotis',MB_ICONINFORMATION + MB_OK + MB_SYSTEMMODAL);
      abort;
    end
    else if Trim(edtDescricaoProd.Text) = '' then
    begin
      Application.MessageBox('Descrição do Produto não pode estar em branco! Verifique.','Agrotis',MB_ICONINFORMATION + MB_OK + MB_SYSTEMMODAL);
      abort;
    end
    else if Trim(edtQtd.Text) = '' then
    begin
      Application.MessageBox('Quantidade do Produto não pode estar em branco! Verifique.','Agrotis',MB_ICONINFORMATION + MB_OK + MB_SYSTEMMODAL);
      abort;
    end
    else if Trim(edtVlrUnit.Text) = '' then
    begin
      Application.MessageBox('Valor unitário do Produto não pode estar em branco! Verifique.','Agrotis',MB_ICONINFORMATION + MB_OK + MB_SYSTEMMODAL);
      abort;
    end;

    PedidoItens.codigoPedido  := Pedido.codigo;
    PedidoItens.codigoProduto := StrToInt(edtCodProduto.Text);
    PedidoItens.quantidade    := StrToFloat(StringReplace(edtQtd.Text, '.', '', []));
    PedidoItens.valorunitario := StrToFloat(StringReplace(edtVlrUnit.Text, '.', '', []));
    PedidoItens.valortotal    := StrToFloat(StringReplace(edtTotalItem.Text, '.', '', []));

    if ItemNovo then
    begin
      PedidoItens.Gravar;
      Application.MessageBox('Pedido Inserido com sucesso!','Agrotis',MB_ICONINFORMATION + MB_OK + MB_SYSTEMMODAL);
    end
    else
    begin
      PedidoItens.Alterar;
      Application.MessageBox('Pedido alterado com sucesso!','Agrotis',MB_ICONINFORMATION + MB_OK + MB_SYSTEMMODAL);
    end;

    PedidoItens.AlterarValorTotal;
    Pedido.Carregar;
    CarregarTela;
    BloqueiaCampos(3);
    PedidoItens.Carregar;
    BloqueiaCamposItens(3);
    CarregarTelaItens;
end;

procedure TfrmPedidos.CalculaValorItem;
var
  vValor, vValorTotal : double;
  vQuantidade : double;
begin
  vValor      := 0;
  vQuantidade := 0;

  vValor      := StrToCurr(edtVlrUnit.text);
  vQuantidade := StrToCurr(edtQtd.text);

  vValorTotal :=  vValor*vQuantidade;
  edtTotalItem.text := FormatFloat('#,0.00',(vValorTotal));
end;

procedure TfrmPedidos.CarregarTela;
begin
  edtCodigo.Text         := IntToStr(Pedido.codigo);
  edtReferencia.Text     := Pedido.referencia;
  edtNumPedido.Text      := IntToStr(Pedido.numeropedido);
  edtData.Text           := DateToStr(Pedido.dataemissao);
  edtCodCliente.Text     := IntToStr(Pedido.codigocliente);
  edtNomeCliente.Text    := pedido.BuscarCliente(Pedido.codigocliente);
  cbxTipo.ItemIndex  := cbxTipo.Items.IndexOf(Pedido.tipooperacao);
  edtVlrTotalPedido.Text := FormatFloat('#,0.00',Pedido.valortotal);
  pedidoitens.codigoPedido := Pedido.codigo;
end;

procedure TfrmPedidos.CarregarTelaItens;
begin
  edtCodProduto.Text     := IntToStr(PedidoItens.codigoProduto);
  edtDescricaoProd.Text  := pedidoItens.BuscarProduto(PedidoItens.codigoProduto);
  edtQtd.Text            := FormatFloat('#,0.00',PedidoItens.quantidade);
  edtVlrUnit.Text        := FormatFloat('#,0.00',PedidoItens.valorunitario);
  edtTotalItem.Text      := FormatFloat('#,0.00',PedidoItens.valortotal);
end;

procedure TfrmPedidos.edtCodClienteExit(Sender: TObject);
begin
   if Trim(edtCodCliente.Text) <> '' then
   begin
     edtNomeCliente.Text := pedido.BuscarCliente(StrToInt(edtCodCliente.Text));

     if Trim(edtNomeCliente.Text) = '' then
     begin
       edtCodCliente.Text := '';
       Application.MessageBox('Cliente não encontrado! Verifique','Agrotis',MB_ICONINFORMATION + MB_OK + MB_SYSTEMMODAL);
       edtCodCliente.SetFocus;
     end;
   end;
end;

procedure TfrmPedidos.edtCodProdutoExit(Sender: TObject);
begin
   if Trim(edtCodProduto.Text) <> '' then
   begin
     edtDescricaoProd.Text := pedidoItens.BuscarProduto(StrToInt(edtCodProduto.Text));

     if Trim(edtDescricaoProd.Text) = '' then
     begin
       edtCodProduto.Text := '';
       Application.MessageBox('Produto não encontrado! Verifique','Agrotis',MB_ICONINFORMATION + MB_OK + MB_SYSTEMMODAL);
       edtCodProduto.SetFocus;
     end;
   end;
end;

procedure TfrmPedidos.edtQtdExit(Sender: TObject);
var
  vQuantidade : double;
begin
  vQuantidade := StrToCurr(edtQtd.text);
  edtQtd.text := FormatFloat('#,0.00',(vQuantidade));

  CalculaValorItem;
end;

procedure TfrmPedidos.edtVlrTotalPedidoExit(Sender: TObject);
var
  vValor : double;
begin
  vValor := StrToCurr(edtVlrTotalPedido.text);
  edtVlrTotalPedido.text := FormatFloat('#,0.00',(vValor));
end;

procedure TfrmPedidos.edtVlrUnitExit(Sender: TObject);
var
  vValor : double;
begin
  vValor          := 0;
  vValor          := StrToCurr(edtVlrUnit.text);
  edtVlrUnit.text := FormatFloat('#,0.00',(vValor));

  CalculaValorItem;
end;

procedure TfrmPedidos.FormCreate(Sender: TObject);
begin
  if Pedido = nil then
    Pedido := TPedido.Create;

  if PedidoItens = nil then
    PedidoItens := TPedidoItens.Create;

  Pedido.conexao := frmPrincipal.FDConnection;
  PedidoItens.conexao := frmPrincipal.FDConnection;

  Pedido.Carregar;
  CarregarTela;

  PedidoItens.Carregar;
  CarregarTelaItens;
end;

procedure TfrmPedidos.FormDestroy(Sender: TObject);
begin
  if Pedido <> nil then
    FreeAndNil(Pedido);

  if PedidoItens <> nil then
    FreeAndNil(PedidoItens);
end;

end.
