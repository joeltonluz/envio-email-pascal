unit PrincipalF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, IdMessage, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, IdEMailAddress, IdGlobal, IdAttachmentFile, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL;

type
  TfrmPrincipal = class(TForm)
    edtPara: TEdit;
    edtAssunto: TEdit;
    memMensagem: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  IdSMTP1: TIdSMTP;
  IdMessage1: TIdMessage;
  IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;

implementation

{$R *.dfm}

procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
var
  Attachmentfile: TIdAttachmentFile;
begin
  // IO HANDLER SETTINGS //
  with IdSSLIOHandlerSocketOpenSSL1 do
  begin
    Destination := 'smtp.gmail.com:587';
    Host := 'smtp.gmail.com';
    MaxLineAction := maException;
    Port := 587;
    SSLOptions.Method := sslvTLSv1;
    SSLOptions.Mode := sslmUnassigned;
    SSLOptions.VerifyMode := [];
    SSLOptions.VerifyDepth := 0;
  end;
//SETTING SMTP COMPONENT DATA //
  IdSMTP1.Host := 'smtp.gmail.com';
  IdSMTP1.Port := 587;
  IdSMTP1.Username := 'joeltonluz@gmail.com';
  IdSMTP1.Password := 'SENHAFORTISSIMA';
  IdSMTP1.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
  IdSMTP1.AuthType := satDefault;
  IdSMTP1.UseTLS := utUseExplicitTLS;
// SETTING email MESSAGE DATA //
  IdMessage1.Clear;
// add recipient list //
  with IdMessage1.Recipients.Add do
  begin
    Name := 'Recipient 1';
    Address := edtPara.Text;
  end;

//add Attachment to mail //
//  Attachmentfile := TIdAttachmentFile.Create(IdMessage1.MessageParts,'C:\File1.txt');
  IdMessage1.From.Address := 'joeltonluz@gmail.com';
  IdMessage1.Subject := edtAssunto.Text;
  IdMessage1.Body := memMensagem.Lines;
  IdMessage1.Priority := mpHigh;
  TRY
    IdSMTP1.Connect();
    IdSMTP1.Send(IdMessage1);
    ShowMessage('Email Enviado com Sucesso !');
    IdSMTP1.Disconnect();
  except on e:Exception do
    begin
      ShowMessage(e.Message);
      IdSMTP1.Disconnect();
    end;
  END;
 // AttachmentFile.Free;
end;

end.
