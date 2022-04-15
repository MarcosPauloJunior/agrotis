unit oGenerica;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, FireDAC.Stan.Param,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.IBBase, Data.DB;

type
  TProduto = Class
  private
    Fcodigo : integer;
    Fdescricao : string;
    FConexao : TFDConnection;
  public
    property codigo : integer read Fcodigo write Fcodigo;
    property descricao : string read Fdescricao write Fdescricao;
    property conexao : TFDConnection read FConexao write FConexao;

    constructor Create;
    destructor Destroy;

    procedure Carregar;
    procedure Proximo;
    procedure Anterior;
    procedure Gravar;
    procedure Alterar;
    procedure Deletar;
    procedure Limpar;
  end;

  TCliente = Class
  private
    Fcodigo : integer;
    Fnome : string;
    Fcep : string;
    Flogradouro : string;
    Fnumero : integer;
    Fcomplemento : string;
    Fbairro : string;
    Fcidade : string;
    Fuf : string;
    Fibge : integer;
    FConexao : TFDConnection;
  public
    property codigo : integer read Fcodigo write Fcodigo;
    property nome : string read Fnome write Fnome;
    property cep : string read Fcep write Fcep;
    property logradouro : string read Flogradouro write Flogradouro;
    property numero : integer read Fnumero write Fnumero;
    property complemento : string read Fcomplemento write Fcomplemento;
    property bairro : string read Fbairro write Fbairro;
    property cidade : string read Fcidade write Fcidade;
    property uf : string read Fuf write Fuf;
    property ibge : integer read Fibge write Fibge;
    property conexao : TFDConnection read FConexao write FConexao;

    constructor Create;
    destructor Destroy;

    procedure Carregar;
    procedure Proximo;
    procedure Anterior;
    procedure Gravar;
    procedure Alterar;
    procedure Deletar;
    procedure Limpar;
  end;

implementation

var
  xQueryProdutos : TFDQuery;
  xQueryClientes : TFDQuery;


constructor TProduto.Create;
begin
  if xQueryProdutos = nil then
    xQueryProdutos  := TFDQuery.Create(nil);
end;

destructor TProduto.Destroy;
begin
  if xQueryProdutos <> nil then
    FreeAndNil(xQueryProdutos);
end;

procedure TProduto.Carregar;
begin
  try
    with xQueryProdutos do
    begin
      Close;
      Connection := conexao;
      SQL.Clear;
      SQL.Add('SELECT * FROM PRODUTO');
      Open;
      First;

      Limpar;

      if not IsEmpty then
      begin
        codigo    := xQueryProdutos.FieldByName('codigo').AsInteger;
        descricao := xQueryProdutos.FieldByName('descricao').AsString;
      end;
    end;
  finally
  end;
end;

procedure TProduto.Proximo;
begin
  try
    Limpar;

    with xQueryProdutos do
    begin
      Next;

      if not IsEmpty then
      begin
        codigo    := xQueryProdutos.FieldByName('codigo').AsInteger;
        descricao := xQueryProdutos.FieldByName('descricao').AsString;
      end;
    end;
  finally
  end;
end;

procedure TProduto.Anterior;
begin
  try
    Limpar;

    with xQueryProdutos do
    begin
      Prior;

      if not IsEmpty then
      begin
        codigo    := xQueryProdutos.FieldByName('codigo').AsInteger;
        descricao := xQueryProdutos.FieldByName('descricao').AsString;
      end;
    end;
  finally
  end;
end;

procedure TProduto.Gravar;
var
  xQuery : TFDQuery;
begin
  xQuery  := TFDQuery.Create(nil);

  try
    with xQuery do
    begin
      Close;
      Connection := conexao;
      SQL.Clear;
      SQL.Add('INSERT INTO PRODUTO (CODIGO, DESCRICAO) VALUES (:CODIGO, :DESCRICAO)');
      ParamByName('CODIGO').AsInteger   := Codigo;
      ParamByName('DESCRICAO').AsString := Descricao;

      ExecSQL;
    end;
  finally
    FreeAndNil(xQuery);
  end;
end;

procedure TProduto.Limpar;
begin
  codigo    := 0;
  descricao := '';
end;

procedure TProduto.Alterar;
var
  xQuery : TFDQuery;
begin
  xQuery  := TFDQuery.Create(nil);

  try
    with xQuery do
    begin
      Close;
      Connection := conexao;
      SQL.Clear;
      SQL.Add('UPDATE PRODUTO SET DESCRICAO = :DESCRICAO WHERE CODIGO = :CODIGO ');
      ParamByName('CODIGO').AsInteger   := Codigo;
      ParamByName('DESCRICAO').AsString := Descricao;

      ExecSQL;
    end;
  finally
    FreeAndNil(xQuery);
  end;
end;

procedure TProduto.Deletar;
var
  xQuery : TFDQuery;
begin
  xQuery  := TFDQuery.Create(nil);

  try
    with xQuery do
    begin
      Close;
      Connection := conexao;
      SQL.Clear;
      SQL.Add('DELETE FROM PRODUTO WHERE CODIGO = :CODIGO ');
      ParamByName('CODIGO').AsInteger := Codigo;
      ExecSQL;
    end;
  finally
    FreeAndNil(xQuery);
  end;
end;

{ TCliente }

procedure TCliente.Alterar;
var
  xQuery : TFDQuery;
begin
  xQuery  := TFDQuery.Create(nil);

  try
    with xQuery do
    begin
      Close;
      Connection := conexao;
      SQL.Clear;
      SQL.Add('UPDATE CLIENTE SET NOME = :NOME, ');
      SQL.Add('CEP = :CEP, ');
      SQL.Add('LOGRADOURO = :LOGRADOURO, ');
      SQL.Add('NUMERO = :NUMERO, ');
      SQL.Add('COMPLEMENTO = :COMPLEMENTO, ');
      SQL.Add('BAIRRO = :BAIRRO, ');
      SQL.Add('CIDADE = :CIDADE, ');
      SQL.Add('UF = :UF, ');
      SQL.Add('IBGE = :IBGE ');
      SQL.Add('WHERE CODIGO = :CODIGO ');
      ParamByName('codigo').AsInteger     := codigo;
      ParamByName('nome').AsString        := nome;
      ParamByName('cep').AsString         := cep;
      ParamByName('logradouro').AsString  := logradouro;
      ParamByName('numero').AsInteger     := numero;
      ParamByName('complemento').AsString := complemento;
      ParamByName('bairro').AsString      := bairro;
      ParamByName('cidade').AsString      := cidade;
      ParamByName('uf').AsString          := uf;
      ParamByName('ibge').AsInteger       := ibge;
      ExecSQL;
    end;
  finally
    FreeAndNil(xQuery);
  end;
end;

procedure TCliente.Anterior;
begin
  try
    Limpar;

    with xQueryClientes do
    begin
      Prior;

      if not IsEmpty then
      begin
        codigo      := xQueryClientes.FieldByName('codigo').AsInteger;
        nome        := xQueryClientes.FieldByName('nome').AsString;
        cep         := xQueryClientes.FieldByName('cep').AsString;
        logradouro  := xQueryClientes.FieldByName('logradouro').AsString;
        numero      := xQueryClientes.FieldByName('numero').AsInteger;
        complemento := xQueryClientes.FieldByName('complemento').AsString;
        bairro      := xQueryClientes.FieldByName('bairro').AsString;
        cidade      := xQueryClientes.FieldByName('cidade').AsString;
        uf          := xQueryClientes.FieldByName('uf').AsString;
        ibge        := xQueryClientes.FieldByName('ibge').AsInteger;
      end;
    end;
  finally
  end;
end;

procedure TCliente.Carregar;
begin
  try
    with xQueryClientes do
    begin
      Close;
      Connection := conexao;
      SQL.Clear;
      SQL.Add('SELECT * FROM CLIENTE');
      Open;
      First;

      Limpar;

      if not IsEmpty then
      begin
        codigo      := xQueryClientes.FieldByName('codigo').AsInteger;
        nome        := xQueryClientes.FieldByName('nome').AsString;
        cep         := xQueryClientes.FieldByName('cep').AsString;
        logradouro  := xQueryClientes.FieldByName('logradouro').AsString;
        numero      := xQueryClientes.FieldByName('numero').AsInteger;
        complemento := xQueryClientes.FieldByName('complemento').AsString;
        bairro      := xQueryClientes.FieldByName('bairro').AsString;
        cidade      := xQueryClientes.FieldByName('cidade').AsString;
        uf          := xQueryClientes.FieldByName('uf').AsString;
        ibge        := xQueryClientes.FieldByName('ibge').AsInteger;
      end;
    end;
  finally
  end;
end;

constructor TCliente.Create;
begin
  xQueryClientes  := TFDQuery.Create(nil);
end;

procedure TCliente.Deletar;
var
  xQuery : TFDQuery;
begin
  xQuery  := TFDQuery.Create(nil);

  try
    with xQuery do
    begin
      Close;
      Connection := conexao;
      SQL.Clear;
      SQL.Add('DELETE FROM CLIENTE WHERE CODIGO = :CODIGO ');
      ParamByName('CODIGO').AsInteger := Codigo;
      ExecSQL;
    end;
  finally
    FreeAndNil(xQuery);
  end;
end;

destructor TCliente.Destroy;
begin
  FreeAndNil(xQueryClientes);
end;

procedure TCliente.Gravar;
var
  xQuery : TFDQuery;
begin
  xQuery  := TFDQuery.Create(nil);

  try
    with xQuery do
    begin
      Close;
      Connection := conexao;
      SQL.Clear;
      SQL.Add('INSERT INTO CLIENTE (CODIGO, NOME, CEP, LOGRADOURO, NUMERO, COMPLEMENTO, BAIRRO, CIDADE, UF, IBGE) ');
      SQL.Add('VALUES (:CODIGO, :NOME, :CEP, :LOGRADOURO, :NUMERO, :COMPLEMENTO, :BAIRRO, :CIDADE, :UF, :IBGE) ');
      ParamByName('CODIGO').AsInteger      := codigo;
      ParamByName('NOME').AsString         := nome;
      ParamByName('CEP').AsString          := cep;
      ParamByName('LOGRADOURO').AsString   := logradouro;
      ParamByName('NUMERO').AsInteger      := numero;
      ParamByName('COMPLEMENTO').AsString  := complemento;
      ParamByName('BAIRRO').AsString       := bairro;
      ParamByName('CIDADE').AsString       := cidade;
      ParamByName('UF').AsString           := uf;
      ParamByName('IBGE').AsInteger        := ibge;
      ExecSQL;
    end;
  finally
    FreeAndNil(xQuery);
  end;
end;

procedure TCliente.Limpar;
begin
  codigo      := 0;
  nome        := '';
  cep         := '';
  logradouro  := '';
  numero      := 0;
  complemento := '';
  bairro      := '';
  uf          := '';
  ibge        := 0;
end;

procedure TCliente.Proximo;
begin
  try
    Limpar;

    with xQueryClientes do
    begin
      Next;

      if not IsEmpty then
      begin
        codigo      := xQueryClientes.FieldByName('codigo').AsInteger;
        nome        := xQueryClientes.FieldByName('nome').AsString;
        cep         := xQueryClientes.FieldByName('cep').AsString;
        logradouro  := xQueryClientes.FieldByName('logradouro').AsString;
        numero      := xQueryClientes.FieldByName('numero').AsInteger;
        complemento := xQueryClientes.FieldByName('complemento').AsString;
        bairro      := xQueryClientes.FieldByName('bairro').AsString;
        uf          := xQueryClientes.FieldByName('uf').AsString;
        ibge        := xQueryClientes.FieldByName('ibge').AsInteger;
      end;
    end;
  finally
  end;
end;

end.



