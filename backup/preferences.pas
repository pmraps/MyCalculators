unit Preferences;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
    LocalizedForms, LCLTranslator, myResourceStrings;

type

    { TfrmPreferences }

    TfrmPreferences = class(TLocalizedForm)
        btnOK: TButton;
        cBoxPrefLang: TComboBox;
        cBoxPrefTheme: TComboBox;
        lblPrefLang: TLabel;
        lblPrefTheme: TLabel;
        procedure btnOKClick(Sender: TObject);
        procedure FormActivate(Sender: TObject);
    private
        function GetLanguage: String;  // wp: added

    public

    end;

    procedure UpdateLanguage(ALanguage: String);  // wp: added

var
    frmPreferences: TfrmPreferences;

implementation

{$R *.lfm}

{ TfrmPreferences }

procedure TfrmPreferences.btnOKClick(Sender: TObject);
begin
  UpdateLanguage(GetLanguage);
  frmPreferences.Close;
end;

procedure TfrmPreferences.FormActivate(Sender: TObject);
begin
     frmPreferences.Caption := rsStrSettingsDialog;
     btnOK.Caption := rsStrBtnClose;
     cBoxPrefLang.Font.Color := clGray;
     cBoxPrefLang.TextHint := CurrentLang;
     // cBoxPrefTheme.Font.Color := clGray;
     // cBoxPrefTheme.Text := CurrentTheme;
end;

function TfrmPreferences.GetLanguage: String;
var
  p: Integer;
begin
  Result := '';
  if cBoxPrefLang.ItemIndex > -1 then
  begin
    Result := cBoxPrefLang.Items[cBoxPrefLang.ItemIndex];
    p := pos(' ', Result);
    if p > 0 then
      Result := copy(Result, 1, p-1)
    else
      exit;
  end;
end;


procedure UpdateLanguage(ALanguage: String);
begin
  if ALanguage = '' then
    exit;

  CurrentLang := ALanguage;
  SetDefaultLang(ALanguage);

  if Application.MainForm is TLocalizedForm then
    TLocalizedForm(Application.MainForm).UpdateTranslation(ALanguage);
end;

end.

