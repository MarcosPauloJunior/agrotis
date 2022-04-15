unit oPedido;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, FireDAC.Stan.Param,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.IBBase, Data.DB;

type
  TPedido = Class
  private
    Fcodigo : integer;
    Freferencia    : string;
    Fnumeropedido  : integer;
    Fdataemissao   : TDate;
    Fcodigocliente : integer;
    Ftipooperacao  : string;
    Fvalortotal    : double;
    FConexao : TFDConnection;

  public
    property codigo : integer read Fcodigo write Fcodigo;
    property referencia : string read Freferencia write Freferencia;
    property numeropedido : integer read Fnumeropedido write Fnumeropedido;
    property dataemissao : TDate read Fdataemissao write Fdataemissao;
    property codigocliente : integer read Fcodigocliente write Fcodigocliente;
    property tipooperacao : string read Ftipooperacao write Ftipooperacao;
    property valortotal : double read Fvalortotal write Fvalortotal;
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

    function BuscarCliente(acodigocliente :Integer): string;
  end;

  TPedidoItens = Class
  private
    Fcodigo        : integer;
    FcodigoPedido  : integer;
    FcodigoProduto : integer;
    Fquantidade    : double;
    Fvalorunitario : double;
    Fvalortotal    : double;
    FConexao : TFDConnection;

  public
    property codigo : integer read Fcodigo write Fcodigo;
    property codigoPedido : integer read FcodigoPedido write FcodigoPedido;
    property codigoProduto : integer read FcodigoProduto write FcodigoProduto;
    property quantidade : double read Fquantidade write Fquantidade;
    property valorunitario : double read Fvalorunitario write Fvalorunitario;
    property valortotal : double read Fvalortotal write Fvalortotal;
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

    function BuscarProduto(acodigoproduto :Integer): string;
    procedure AlterarValorTotal;
  end;

implementation

var
  xQueryPedidos : TFDQuery;
  xQueryPedidosItens : TFDQuery;
  ItemNovo: boolean;

{ TPedido }

procedure TPedido.Alterar;
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
      SQL.Add('UPDATE PEDIDO SET REFERENCIA = :REFERENCIA, ');
      SQL.Add('NUMEROPEDIDO = :NUMEROPEDIDO, ');
      SQL.Add('DATAEMISSAO = :DATAEMISSAO, ');
      SQL.Add('CODIGOCLIENTE = :CODIGOCLIENTE, ');
      SQL.Add('TIPOOPERACAO = :TIPOOPERACAO, ');
      SQL.Add('VALORTOTAL = :VALORTOTAL ');
      SQL.Add('WHERE CODIGO = :CODIGO ');
      ParamByName('REFERENCIA').AsString     := referencia;
      ParamByName('NUMEROPEDIDO').AsInteger  := numeropedido;
      ParamByName('DATAEMISSAO').AsString    := DateToStr(dataemissao);
      ParamByName('CODIGOCLIENTE').AsInteger := codigocliente;
      ParamByName('TIPOOPERACAO').AsString   := tipooperacao;
      ParamByName('VALORTOTAL').AsCurrency   := valortotal;
      ParamByName('CODIGO').AsInteger        := codigo;
      ExecSQL;
    end;
  finally
    FreeAndNil(xQuery);
  end;
end;

procedure TPedido.Anterior;
begin
  try
    Limpar;

    with xQueryPedidos do
    begin
      Prior;

      if not IsEmpty then
      begin
        codigo        := xQueryPedidos.FieldByName('CODIGO').AsInteger;
        referencia    := xQueryPedidos.FieldByName('REFERENCIA').AsString;
        numeropedido  := xQueryPedidos.FieldByName('NUMEROPEDIDO').AsInteger;
        dataemissao   := StrToDate(xQueryPedidos.FieldByName('DATAEMISSAO').AsString);
        codigocliente := xQueryPedidos.FieldByName('CODIGOCLIENTE').AsInteger;
        tipooperacao  := xQueryPedidos.FieldByName('TIPOOPERACAO').AsString;
        valortotal    := xQueryPedidos.FieldByName('VALORTOTAL').AsCurrency;
      end;
    end;
  finally
  end;
end;

function TPedido.BuscarCliente(acodigocliente: Integer): string;
var
  xQuery : TFDQuery;
begin
  Result := '';
  xQuery  := TFDQuery.Create(nil);

  try
    with xQuery do
    begin
      Close;
      Connection := conexao;
      SQL.Clear;
      SQL.Add('SELECT NOME FROM CLIENTE WHERE CODIGO = :CODIGO ');
      ParamByName('CODIGO').AsInteger := acodigocliente;
      Open;

      if not IsEmpty then
        Result := xQuery.FieldByName('NOME').AsString;
    end;
  finally
    FreeAndNil(xQuery);
  end;
end;

procedure TPedido.Carregar;
begin
  try
    with xQueryPedidos do
    begin
      Close;
      Connection := conexao;
      SQL.Clear;
      SQL.Add('SELECT * FROM PEDIDO');
      Open;
      First;

      Limpar;

      if not IsEmpty then
      begin
        codigo        := xQueryPedidos.FieldByName('CODIGO').AsInteger;
        referencia    := xQueryPedidos.FieldByName('REFERENCIA').AsString;
        numeropedido  := xQueryPedidos.FieldByName('NUMEROPEDIDO').AsInteger;
        dataemissao   := StrToDate(xQueryPedidos.FieldByName('DATAEMISSAO').AsString);
        codigocliente := xQueryPedidos.FieldByName('CODIGOCLIENTE').AsInteger;
        tipooperacao  := xQueryPedidos.FieldByName('TIPOOPERACAO').AsString;
        valortotal    := xQueryPedidos.FieldByName('VALORTOTAL').AsCurrency;
      end;
    end;
  finally
  end;
end;

constructor TPedido.Create;
begin
  if xQueryPedidos = nil then
    xQueryPedidos  := TFDQuery.Create(nil);
end;

procedure TPedido.Deletar;
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
      SQL.Add('DELETE FROM PEDIDO WHERE CODIGO = :CODIGO ');
      ParamByName('CODIGO').AsInteger := Codigo;
      ExecSQL;
    end;
  finally
    FreeAndNil(xQuery);
  end;
end;

destructor TPedido.Destroy;
begin
  if xQueryPedidos <> nil then
    FreeAndNil(xQueryPedidos);
end;

procedure TPedido.Gravar;
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
      SQL.Add('INSERT INTO PEDIDO (CODIGO, REFERENCIA, NUMEROPEDIDO, DATAEMISSAO, CODIGOCLIENTE, TIPOOPERACAO, VALORTOTAL) ');
      SQL.Add('VALUES (:CODIGO, :REFERENCIA, :NUMEROPEDIDO, :DATAEMISSAO, :CODIGOCLIENTE, :TIPOOPERACAO, :VALORTOTAL) ');
      ParamByName('CODIGO').AsInteger        := codigo;
      ParamByName('REFERENCIA').AsString     := referencia;
      ParamByName('NUMEROPEDIDO').AsInteger  := numeropedido;
      ParamByName('DATAEMISSAO').AsDate      := dataemissao;
      ParamByName('CODIGOCLIENTE').AsInteger := codigocliente;
      ParamByName('TIPOOPERACAO').AsString   := tipooperacao;
      ParamByName('VALORTOTAL').AsCurrency   := valortotal;
      ExecSQL;
    end;
  finally
    FreeAndNil(xQuery);
  end;
end;

procedure TPedido.Limpar;
begin
  codigo        := 0;
  referencia    := '';
  numeropedido  := 0;
  dataemissao   := 0;
  codigocliente := 0;
  tipooperacao  := '';
  valortotal    := 0;
end;

procedure TPedido.Proximo;
begin
  try
    Limpar;

    with xQueryPedidos do
    begin
      Next;

      if not IsEmpty then
      begin
        codigo        := xQueryPedidos.FieldByName('CODIGO').AsInteger;
        referencia    := xQueryPedidos.FieldByName('REFERENCIA').AsString;
        numeropedido  := xQueryPedidos.FieldByName('NUMEROPEDIDO').AsInteger;
        dataemissao   := StrToDate(xQueryPedidos.FieldByName('DATAEMISSAO').AsString);
        codigocliente := xQueryPedidos.FieldByName('CODIGOCLIENTE').AsInteger;
        tipooperacao  := xQueryPedidos.FieldByName('TIPOOPERACAO').AsString;
        valortotal    := xQueryPedidos.FieldByName('VALORTOTAL').AsCurrency;
      end;
    end;
  finally
  end;
end;

{ TPedidoItens }

procedure TPedidoItens.Alterar;
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
      SQL.Add('UPDATE PEDIDOITEM SET CODIGOPRODUTO = :CODIGOPRODUTO, ');
      SQL.Add('QUANTIDADE = :QUANTIDADE, ');
      SQL.Add('VALORUNITARIO = :VALORUNITARIO, ');
      SQL.Add('VALORTOTAL = :VALORTOTAL ');
      SQL.Add('WHERE CODIGOPEDIDO = :CODIGOPEDIDO ');
      SQL.Add('AND CODIGO = :CODIGO ');

      ParamByName('CODIGOPRODUTO').AsInteger  := codigoproduto;
      ParamByName('QUANTIDADE').AsCurrency    := quantidade;
      ParamByName('VALORUNITARIO').AsCurrency := valorunitario;
      ParamByName('VALORTOTAL').AsCurrency    := valortotal;
      ParamByName('CODIGOPEDIDO').AsInteger   := codigopedido;
      ParamByName('CODIGO').AsInteger         := codigo;
      ExecSQL;
    end;
  finally
    FreeAndNil(xQuery);
  end;
end;

procedure TPedidoItens.AlterarValorTotal;
var
  xQuery : TFDQuery;
  xQueryAtualiza : TFDQuery;
begin
  xQuery  := TFDQuery.Create(nil);
  xQueryAtualiza  := TFDQuery.Create(nil);

  try
    with xQuery do
    begin
      Close;
      Connection := conexao;
      SQL.Clear;
      SQL.Add('SELECT SUM(VALORTOTAL) AS VALORTOTAL FROM PEDIDOITEM WHERE CODIGOPEDIDO = :CODIGOPEDIDO ');
      ParamByName('CODIGOPEDIDO').AsInteger := codigopedido;
      Open;

      if not xQuery.IsEmpty then
      begin
        with xQueryAtualiza do
        begin
          Close;
          Connection := conexao;
          SQL.Clear;
          SQL.Add('UPDATE PEDIDO SET VALORTOTAL = :VALORTOTAL WHERE CODIGO = :CODIGO ');
          ParamByName('VALORTOTAL').AsCurrency  := xQuery.FieldByName('VALORTOTAL').AsCurrency;
          ParamByName('CODIGO').AsInteger       := codigopedido;
          ExecSQL;
        end;
      end;
    end;
  finally
    FreeAndNil(xQuery);
    FreeAndNil(xQueryAtualiza);
  end;
end;

procedure TPedidoItens.Anterior;
begin
  try
    Limpar;

    with xQueryPedidosItens do
    begin
      Prior;

      if not IsEmpty then
      begin
        codigo        := xQueryPedidosItens.FieldByName('CODIGO').AsInteger;
        codigoPedido  := xQueryPedidosItens.FieldByName('CODIGOPEDIDO').AsInteger;
        codigoProduto := xQueryPedidosItens.FieldByName('CODIGOPRODUTO').AsInteger;
        quantidade    := xQueryPedidosItens.FieldByName('QUANTIDADE').AsCurrency;
        valorunitario := xQueryPedidosItens.FieldByName('VALORUNITARIO').AsCurrency;
        valortotal    := xQueryPedidosItens.FieldByName('VALORTOTAL').AsCurrency;
      end;
    end;
  finally
  end;
end;

function TPedidoItens.BuscarProduto(acodigoproduto: Integer): string;
var
  xQuery : TFDQuery;
begin
  Result := '';
  xQuery  := TFDQuery.Create(nil);

  try
    with xQuery do
    begin
      Close;
      Connection := conexao;
      SQL.Clear;
      SQL.Add('SELECT DESCRICAO FROM PRODUTO WHERE CODIGO = :CODIGO ');
      ParamByName('CODIGO').AsInteger := acodigoproduto;
      Open;

      if not IsEmpty then
        Result := xQuery.FieldByName('DESCRICAO').AsString;
    end;
  finally
    FreeAndNil(xQuery);
  end;
end;

procedure TPedidoItens.Carregar;
begin
  try
    with xQueryPedidosItens do
    begin
      Close;
      Connection := conexao;
      SQL.Clear;
      SQL.Add('SELECT * FROM PEDIDOITEM WHERE CODIGOPEDIDO = :CODIGOPEDIDO ');
      ParamByName('CODIGOPEDIDO').AsInteger := codigopedido;
      Open;
      First;

      Limpar;

      if not IsEmpty then
      begin
        codigo        := xQueryPedidosItens.FieldByName('CODIGO').AsInteger;
        codigoPedido  := xQueryPedidosItens.FieldByName('CODIGOPEDIDO').AsInteger;
        codigoProduto := xQueryPedidosItens.FieldByName('CODIGOPRODUTO').AsInteger;
        quantidade    := xQueryPedidosItens.FieldByName('QUANTIDADE').AsCurrency;
        valorunitario := xQueryPedidosItens.FieldByName('VALORUNITARIO').AsCurrency;
        valortotal    := xQueryPedidosItens.FieldByName('VALORTOTAL').AsCurrency;
      end;
    end;
  finally
  end;
end;

constructor TPedidoItens.Create;
begin
  if xQueryPedidosItens = nil then
    xQueryPedidosItens  := TFDQuery.Create(nil);
end;

procedure TPedidoItens.Deletar;
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
      SQL.Add('DELETE FROM PEDIDOITEM WHERE CODIGO = :CODIGO ');
      ParamByName('CODIGO').AsInteger := Codigo;
      ExecSQL;
    end;
  finally
    FreeAndNil(xQuery);
  end;
end;

destructor TPedidoItens.Destroy;
begin
  if xQueryPedidosItens <> nil then
    FreeAndNil(xQueryPedidosItens);
end;

procedure TPedidoItens.Gravar;
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
      SQL.Add('INSERT INTO PEDIDOITEM (CODIGOPEDIDO, CODIGOPRODUTO, QUANTIDADE, VALORUNITARIO, VALORTOTAL) ');
      SQL.Add('VALUES (:CODIGOPEDIDO, :CODIGOPRODUTO, :QUANTIDADE, :VALORUNITARIO, :VALORTOTAL) ');
      ParamByName('CODIGOPEDIDO').AsInteger   := codigopedido;
      ParamByName('CODIGOPRODUTO').AsInteger  := codigoproduto;
      ParamByName('QUANTIDADE').AsCurrency    := quantidade;
      ParamByName('VALORUNITARIO').AsCurrency := valorunitario;
      ParamByName('VALORTOTAL').AsCurrency    := valortotal;
      ExecSQL;
    end;
  finally
    FreeAndNil(xQuery);
  end;
end;

procedure TPedidoItens.Limpar;
begin
  codigo        := 0;
  codigoPedido  := 0;
  codigoProduto := 0;
  quantidade    := 0;
  valorunitario := 0;
  valortotal    := 0;
end;

procedure TPedidoItens.Proximo;
begin
  try
    Limpar;

    with xQueryPedidosItens do
    begin
      Next;

      if not IsEmpty then
      begin
        codigo        := xQueryPedidosItens.FieldByName('CODIGO').AsInteger;
        codigoPedido  := xQueryPedidosItens.FieldByName('CODIGOPEDIDO').AsInteger;
        codigoProduto := xQueryPedidosItens.FieldByName('CODIGOPRODUTO').AsInteger;
        quantidade    := xQueryPedidosItens.FieldByName('QUANTIDADE').AsCurrency;
        valorunitario := xQueryPedidosItens.FieldByName('VALORUNITARIO').AsCurrency;
        valortotal    := xQueryPedidosItens.FieldByName('VALORTOTAL').AsCurrency;
      end;
    end;
  finally
  end;
end;

end.
