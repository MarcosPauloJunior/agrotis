unit ufrmProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, oGenerica;

type
  TfrmProdutos = class(TForm)
    pnlBotoes: TPanel;
    btnNovo: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnSalvar: TButton;
    btnCancelar: TButton;
    btnAnterior: TButton;
    btnProximo: TButton;
    Panel1: TPanel;
    Label12: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure BloqueiaCampos(tipo: integer);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);

    procedure CarregarTela;
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;
  produto: TProduto;

implementation

{$R *.dfm}

uses ufrmPrincipal;

procedure TfrmProdutos.BloqueiaCampos(tipo: integer);
begin
  case tipo of
    0: // Inserção
      begin
        btnAnterior.Enabled := False;
        btnProximo.Enabled := False;
        btnNovo.Enabled := False;
        btnAlterar.Enabled := False;
        btnExcluir.Enabled := False;
        btnSalvar.Enabled := True;
        btnCancelar.Enabled := True;
        edtCodigo.Enabled := True;
        edtDescricao.Enabled := True;
        edtCodigo.Text := '';
        edtDescricao.Text := '';
        edtCodigo.SetFocus;
      end;
    1: // Alteração
      begin
        btnAnterior.Enabled := False;
        btnProximo.Enabled := False;
        btnNovo.Enabled := False;
        btnAlterar.Enabled := False;
        btnExcluir.Enabled := False;
        btnSalvar.Enabled := True;
        btnCancelar.Enabled := True;
        edtCodigo.Enabled := False;
        edtDescricao.Enabled := True;
        edtDescricao.SetFocus;
      end;
    2: // Cancelar
      begin
        btnAnterior.Enabled := True;
        btnProximo.Enabled := True;
        btnNovo.Enabled := True;
        btnAlterar.Enabled := True;
        btnExcluir.Enabled := True;
        btnSalvar.Enabled := False;
        btnCancelar.Enabled := False;
        edtCodigo.Enabled := False;
        edtDescricao.Enabled := False;
        edtCodigo.Text := '';
        edtDescricao.Text := '';
      end;
    3:
      begin
        btnAnterior.Enabled := True;
        btnProximo.Enabled := True;
        btnNovo.Enabled := True;
        btnAlterar.Enabled := True;
        btnExcluir.Enabled := True;
        btnSalvar.Enabled := False;
        btnCancelar.Enabled := False;
        edtCodigo.Enabled := False;
        edtDescricao.Enabled := False;
      end;
  end;
end;

procedure TfrmProdutos.btnAlterarClick(Sender: TObject);
begin
  BloqueiaCampos(1);
end;

procedure TfrmProdutos.btnAnteriorClick(Sender: TObject);
begin
  produto.Anterior;
  CarregarTela;
end;

procedure TfrmProdutos.btnCancelarClick(Sender: TObject);
begin
  BloqueiaCampos(2);
  produto.Carregar;
  CarregarTela;
end;

procedure TfrmProdutos.btnExcluirClick(Sender: TObject);
begin
  try
    produto.codigo := StrToInt(edtCodigo.Text);
    produto.Deletar;
  finally
    Application.MessageBox('Produto deletado com sucesso!','Agrotis',MB_ICONINFORMATION + MB_OK + MB_SYSTEMMODAL);
    produto.Carregar;
    BloqueiaCampos(2);
    CarregarTela;
  end;
end;

procedure TfrmProdutos.btnNovoClick(Sender: TObject);
begin
  BloqueiaCampos(0);
end;

procedure TfrmProdutos.btnProximoClick(Sender: TObject);
begin
  produto.Proximo;
  CarregarTela;
end;

procedure TfrmProdutos.btnSalvarClick(Sender: TObject);
begin
  if Trim(edtCodigo.Text) = '' then
  begin
    Application.MessageBox('Código não pode estar em branco! Verifique.','Agrotis',MB_ICONINFORMATION + MB_OK + MB_SYSTEMMODAL);
    abort;
  end
  else if Trim(edtDescricao.Text) = '' then
  begin
    Application.MessageBox('Descrição não pode estar em branco! Verifique.','Agrotis',MB_ICONINFORMATION + MB_OK + MB_SYSTEMMODAL);
    abort;
  end;

  produto.codigo := StrToInt(edtCodigo.Text);
  produto.descricao := edtDescricao.Text;

  if edtCodigo.Enabled then
  begin
    produto.Gravar;
    Application.MessageBox('Produto cadastrado com sucesso!','Agrotis',MB_ICONINFORMATION + MB_OK + MB_SYSTEMMODAL);
  end
  else
  begin
    produto.Alterar;
    Application.MessageBox('Produto alterado com sucesso!','Agrotis',MB_ICONINFORMATION + MB_OK + MB_SYSTEMMODAL);
  end;

  produto.Carregar;
  BloqueiaCampos(3);
  CarregarTela;
end;

procedure TfrmProdutos.CarregarTela;
begin
  edtCodigo.Text := IntToStr(produto.codigo);
  edtDescricao.Text := produto.descricao;
end;

procedure TfrmProdutos.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if (not (Key in ['0'..'9'])) and (Key <> #8) then
  Key := #0;
end;

procedure TfrmProdutos.FormCreate(Sender: TObject);
begin
  if produto = nil then
    produto := TProduto.Create;

  produto.conexao := frmPrincipal.FDConnection;
  produto.Carregar;
  CarregarTela;
end;

procedure TfrmProdutos.FormDestroy(Sender: TObject);
begin
  if produto <> nil then
    FreeAndNil(produto);
end;

end.
