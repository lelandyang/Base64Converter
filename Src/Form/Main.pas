unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TFrm_Main = class(TForm)
    pgMain: TPageControl;
    tbStrB64: TTabSheet;
    tbFileB64: TTabSheet;
    btnConvert: TButton;
    btnHelp: TButton;
    mmString: TMemo;
    mmBase64: TMemo;
    lblPlain: TLabel;
    lblBase64: TLabel;
    edtFile: TEdit;
    btnFile: TButton;
    Dlg: TOpenDialog;
    mm: TMemo;
    Button1: TButton;
    ChkOption: TCheckBox;
    SavDlg: TSaveDialog;
    procedure btnConvertClick(Sender: TObject);
    procedure btnFileClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Main: TFrm_Main;

implementation

{$R *.dfm}

uses
  Base64;

procedure TFrm_Main.btnConvertClick(Sender: TObject);
var
  ms:TMemoryStream;
  ss:TStringStream;
begin
  case pgMain.TabIndex of
    0:
      begin
        if (Length(Trim(mmString.Text))=0) and (Length(Trim(mmBase64.Text))=0)then
        begin
          Messagebox(handle,'至少必须填写一个字段！！！','【错误】',48);
          exit;
        end;
        if (Length(Trim(mmString.Text))<>0) and (Length(Trim(mmBase64.Text))<>0)then
        begin
          Messagebox(handle,'只能够填写一个字段！！！','【错误】',48);
          exit;
        end;
        if (Length(Trim(mmString.Text))<>0) and (Length(Trim(mmBase64.Text))=0)then
        begin
          mmBase64.Text:=StrToBase64(Trim(mmString.Text));
        end;
        if (Length(Trim(mmString.Text))=0) and (Length(Trim(mmBase64.Text))<>0) then
        begin
          mmString.Text:=Base64ToStr(Trim(mmBase64.Text));
        end;
      end;
    1:
      begin
        if (not ChkOption.Checked) then  //未勾选表明为Base64转文件
        begin
          try
            ms:=TMemoryStream.Create;
            ss:=TStringStream.Create(Trim(mm.Text),TEncoding.Default);
            Base64Decode(ss,ms,0,0);
            if (SavDlg.Execute()) then
            begin
              ms.SaveToFile(SavDlg.FileName);
            end;
          finally
            ms.Free;
            ss.Free;
          end;
        end
        else
          begin
            try
              ms:=TMemoryStream.Create;
              ms.LoadFromFile(Trim(edtFile.Text));
              ss:=TStringStream.Create;
              Base64Encode(ms,ss,0,0);
              mm.Text:=ss.DataString;
            finally
              ms.Free;
              ss.Free;
            end;
          end;
      end;
  end;
end;

procedure TFrm_Main.btnFileClick(Sender: TObject);
begin
  With Dlg do
  begin
    Filter:='All Files(*.*)|*.*';
    Title:='Select file to encode.';
  end;
  if (Dlg.Execute()) then
  begin
    edtFile.Text:=Dlg.FileName;
  end;
end;

procedure TFrm_Main.btnHelpClick(Sender: TObject);
begin
  Messagebox(handle,
            'Base64 Converter'+#13#10+
            'Copyright (C)2018 Leland Yang'+#13#10+
            'All Rights Reserved' ,
            '',64)
end;

procedure TFrm_Main.Button1Click(Sender: TObject);
begin
  mm.CopyToClipboard;
  Messagebox(handle,'已经复制到剪切板','【成功】',64)
end;

end.
