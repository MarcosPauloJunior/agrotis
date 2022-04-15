program agrotis;

uses
  Vcl.Forms,
  ufrmPrincipal in 'ufrmPrincipal.pas' {frmPrincipal},
  ufrmClientes in 'ufrmClientes.pas' {frmClientes},
  ufrmProdutos in 'ufrmProdutos.pas' {frmProdutos},
  ufrmPedidos in 'ufrmPedidos.pas' {frmPedidos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
