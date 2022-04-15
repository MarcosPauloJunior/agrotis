unit ufrmClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, oGenerica,
  idHTTp, system.Json, IdSSLOpenSSL;

type
  TfrmClientes = class(TForm)
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
    Label12: TLabel;
    edtCodigo: TEdit;
    edtNome: TEdit;
    Label1: TLabel;
    Label11: TLabel;
    edtCEP: TEdit;
    edtIBGE: TEdit;
    Label2: TLabel;
    Label6: TLabel;
    edtEndereco: TEdit;
    edtNumero: TEdit;
    Label7: TLabel;
    edtComplemento: TEdit;
    Label8: TLabel;
    edtBairro: TEdit;
    Label13: TLabel;
    edtCidade: TEdit;
    Label9: TLabel;
    cbxUF: TComboBox;
    Label10: TLabel;
    procedure btnAnteriorClick(Sender: TObject);

    procedure BloqueiaCampos(tipo: integer);
    procedure CarregarTela;
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

    procedure BuscaDadosViaCEP(cep : string);
    procedure edtCEPExit(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCEPKeyPress(Sender: TObject; var Key: Char);
    procedure edtNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure edtIBGEKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;
  cliente: TCliente;

implementation

{$R *.dfm}

uses ufrmPrincipal;

procedure TfrmClientes.BloqueiaCampos(tipo: integer);
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
        edtNome.Enabled := True;
        edtCEP.Enabled := True;
        edtEndereco.Enabled := True;
        edtNumero.Enabled := True;
        edtBairro.Enabled := True;
        edtCidade.Enabled := True;
        cbxUF.Enabled := True;
        edtComplemento.Enabled := True;
        edtIBGE.Enabled := True;


        edtCodigo.Text := '';
        edtNome.Text := '';
        edtCEP.Text := '';
        edtEndereco.Text := '';
        edtNumero.Text := '';
        edtBairro.Text := '';
        edtCidade.Text := '';
        cbxUF.Text := '';
        edtComplemento.Text := '';
        edtIBGE.Text := '';

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
        edtNome.Enabled := True;
        edtCEP.Enabled := True;
        edtEndereco.Enabled := True;
        edtNumero.Enabled := True;
        edtBairro.Enabled := True;
        edtCidade.Enabled := True;
        cbxUF.Enabled := True;
        edtComplemento.Enabled := True;
        edtIBGE.Enabled := True;
        edtNome.SetFocus;
      end;
    2: // Cancelar
      begin
        btnAnterior.Enabled := True;
        btnProximo.Enabled := True;
        btnNovo.Enabled := True;
        btnAlterar.Enabled := True;
        btnExcluir.Enabled := True;
        btnSalvar.Enabled := True;
        btnCancelar.Enabled := True;
        edtCodigo.Enabled := False;
        edtNome.Enabled := False;
        edtCEP.Enabled := False;
        edtEndereco.Enabled := False;
        edtNumero.Enabled := False;
        edtBairro.Enabled := False;
        edtCidade.Enabled := False;
        cbxUF.Enabled := False;
        edtComplemento.Enabled := False;
        edtIBGE.Enabled := False;
        edtCodigo.Text := '';
        edtNome.Text := '';
        edtCEP.Text := '';
        edtEndereco.Text := '';
        edtNumero.Text := '';
        edtBairro.Text := '';
        edtCidade.Text := '';
        cbxUF.Text := '';
        edtComplemento.Text := '';
        edtIBGE.Text := '';
      end;
    3:
      begin
        btnAnterior.Enabled := True;
        btnProximo.Enabled := True;
        btnNovo.Enabled := True;
        btnAlterar.Enabled := True;
        btnExcluir.Enabled := True;
        btnSalvar.Enabled := True;
        btnCancelar.Enabled := True;

        edtCodigo.Enabled := False;
        edtNome.Enabled := False;
        edtCEP.Enabled := False;
        edtEndereco.Enabled := False;
        edtNumero.Enabled := False;
        edtBairro.Enabled := False;
        edtCidade.Enabled := False;
        cbxUF.Enabled := False;
        edtComplemento.Enabled := False;
        edtIBGE.Enabled := False;
      end;
  end;
end;

procedure TfrmClientes.btnAlterarClick(Sender: TObject);
begin
  BloqueiaCampos(1);
end;

procedure TfrmClientes.btnAnteriorClick(Sender: TObject);
begin
  cliente.Anterior;
  CarregarTela;
end;

procedure TfrmClientes.btnCancelarClick(Sender: TObject);
begin
  BloqueiaCampos(2);
  cliente.Carregar;
  CarregarTela;
end;

procedure TfrmClientes.btnExcluirClick(Sender: TObject);
begin
  try
    cliente.codigo := StrToInt(edtCodigo.Text);
    cliente.Deletar;
  finally
    Application.MessageBox('Cliente deletado com sucesso!','Agrotis',MB_ICONINFORMATION + MB_OK + MB_SYSTEMMODAL);
    cliente.Carregar;
    BloqueiaCampos(2);
    CarregarTela;
  end;
end;

procedure TfrmClientes.btnNovoClick(Sender: TObject);
begin
  BloqueiaCampos(0);
end;

procedure TfrmClientes.btnProximoClick(Sender: TObject);
begin
  cliente.Proximo;
  CarregarTela;
end;

procedure TfrmClientes.btnSalvarClick(Sender: TObject);
begin
    if Trim(edtCodigo.Text) = '' then
    begin
      Application.MessageBox('Código não pode estar em branco! Verifique.','Agrotis',MB_ICONINFORMATION + MB_OK + MB_SYSTEMMODAL);
      abort;
    end
    else if Trim(edtNome.Text) = '' then
    begin
      Application.MessageBox('Nome não pode estar em branco! Verifique.','Agrotis',MB_ICONINFORMATION + MB_OK + MB_SYSTEMMODAL);
      abort;
    end;

    cliente.codigo      := StrToInt(edtCodigo.Text);
    cliente.nome        := edtnome.Text;
    cliente.cep         := edtCEP.Text;
    cliente.logradouro  := edtEndereco.Text;
    cliente.numero      := StrToInt(edtNumero.Text);
    cliente.bairro      := edtBairro.Text;
    cliente.Cidade      := edtCidade.Text;
    cliente.Uf          := cbxUF.Text;
    cliente.Complemento := edtComplemento.Text;
    cliente.ibge        := StrToInt(edtIBGE.Text);

    if edtCodigo.Enabled then
    begin
      cliente.Gravar;
      Application.MessageBox('Cliente cadastrado com sucesso!','Agrotis',MB_ICONINFORMATION + MB_OK + MB_SYSTEMMODAL);
    end
    else
    begin
      cliente.Alterar;
      Application.MessageBox('Cliente alterado com sucesso!','Agrotis',MB_ICONINFORMATION + MB_OK + MB_SYSTEMMODAL);
    end;

    cliente.Carregar;
    BloqueiaCampos(3);
    CarregarTela;
end;

procedure TfrmClientes.BuscaDadosViaCEP(cep: string);
var
  xIdHTTP : TIdHTTP;
  xSSLSocket : TIdSSLIOHandlerSocketOpenSSL;
  xXMLRetorno: TStringStream;

  procedure CarregarCep(aJson: String);
   var
     xJSon : TJSONObject;
   begin
     xJSon := nil;
     try
       xJSon := TJSONObject.Create;

       xJSon := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(aJson), 0) as TJSONObject;

       edtCidade.Text   := StringReplace(xJSon.GetValue('localidade').ToString, '"', '', [rfReplaceAll]);
       cbxUF.ItemIndex  := cbxUF.Items.IndexOf(StringReplace(xJSon.GetValue('uf').ToString, '"', '', [rfReplaceAll]));
       edtibge.Text     := StringReplace(xJSon.GetValue('ibge').ToString, '"', '', [rfReplaceAll]);
       edtBairro.Text   := StringReplace(xJSon.GetValue('bairro').ToString, '"', '', [rfReplaceAll]);
       edtEndereco.Text := StringReplace(xJSon.GetValue('logradouro').ToString, '"', '', [rfReplaceAll]);

     finally
       FreeAndNil(xJSon);
     end;
   end;
begin
  xIdHTTP := TIdHTTP.Create(nil);
  xSSLSocket := TIdSSLIOHandlerSocketOpenSSL.Create;
  xIdHTTP.IOHandler := xSSLSocket;
  xSSLSocket.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
  xXMLRetorno := TStringStream.Create('');

  try
    xIdHTTP.Get('https://viacep.com.br/ws/' + Cep + '/json', xXMLRetorno);
      if (xIdHTTP.ResponseCode = 200) and not(xXMLRetorno.DataString = '{'#$A'  "erro": true'#$A'}') then
        CarregarCep(xXMLRetorno.DataString);
  Finally
    FreeAndNil(xSSLSocket);
    FreeAndNil(xIdHTTP);
    FreeAndNil(xXMLRetorno);
  end;
end;

procedure TfrmClientes.CarregarTela;
begin
  edtCodigo.Text      := IntToStr(cliente.codigo);
  edtNome.Text        := cliente.nome;
  edtCEP.Text         := cliente.cep;
  edtEndereco.Text    := cliente.logradouro;
  edtNumero.Text      := IntToStr(cliente.numero);
  edtBairro.Text      := cliente.bairro;
  edtCidade.Text      := cliente.Cidade;
  cbxUF.ItemIndex     := cbxUF.Items.IndexOf(cliente.Uf);
  edtComplemento.Text := cliente.Complemento;
  edtIBGE.Text        := IntToStr(cliente.ibge);
end;

procedure TfrmClientes.edtCEPExit(Sender: TObject);
begin
  BuscaDadosViaCEP(edtCEP.Text);
end;

procedure TfrmClientes.edtCEPKeyPress(Sender: TObject; var Key: Char);
begin
    if (not (Key in ['0'..'9'])) and (Key <> #8) then
  Key := #0;
end;

procedure TfrmClientes.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if (not (Key in ['0'..'9'])) and (Key <> #8) then
  Key := #0;
end;

procedure TfrmClientes.edtIBGEKeyPress(Sender: TObject; var Key: Char);
begin
  if (not (Key in ['0'..'9'])) and (Key <> #8) then
  Key := #0;
end;

procedure TfrmClientes.edtNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  if (not (Key in ['0'..'9'])) and (Key <> #8) then
  Key := #0;
end;

procedure TfrmClientes.FormCreate(Sender: TObject);
begin
  if cliente = nil then
    cliente := Tcliente.Create;

  cliente.conexao := frmPrincipal.FDConnection;
  cliente.Carregar;
  CarregarTela;
end;

procedure TfrmClientes.FormDestroy(Sender: TObject);
begin
  if cliente <> nil then
    FreeAndNil(cliente);
end;

end.
