object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'frmPrincipal'
  ClientHeight = 338
  ClientWidth = 533
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 25
    Width = 30
    Height = 16
    Caption = 'Para'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 52
    Width = 54
    Height = 16
    Caption = 'Assunto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 79
    Width = 69
    Height = 16
    Caption = 'Mensagem'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtPara: TEdit
    Left = 96
    Top = 24
    Width = 409
    Height = 21
    TabOrder = 0
  end
  object edtAssunto: TEdit
    Left = 96
    Top = 51
    Width = 409
    Height = 21
    TabOrder = 1
  end
  object memMensagem: TMemo
    Left = 96
    Top = 78
    Width = 409
    Height = 211
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 96
    Top = 295
    Width = 409
    Height = 25
    Caption = 'ENVIAR'
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object IdSMTP1: TIdSMTP
    SASLMechanisms = <>
    Left = 256
    Top = 168
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 320
    Top = 168
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 320
    Top = 224
  end
end
