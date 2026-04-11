unit Preferences;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  LocalizedForms, LCLTranslator, resourcestrings,
  uDarkStyleParams, uDarkStyleSchemes, uMetaDarkStyle,
  Win32Proc, Registry;

type

  { TfrmPreferences }

  TfrmPreferences = class(TLocalizedForm)
    btnOK: TButton;
    cBoxPrefLang: TComboBox;
    cBoxPrefTheme: TComboBox;
    lblPrefLang: TLabel;
    lblPrefTheme: TLabel;
    lblTheme: TLabel;
    procedure btnOKClick(Sender: TObject);
    procedure CBoxPrefThemeChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    function GetLanguage: string;  // wp: added
    function IsDarkTheme: boolean;
  public

  end;

procedure UpdateLanguage(ALanguage: string);  // wp: added

var
  frmPreferences: TfrmPreferences;

implementation

uses MainCalculators;

  {$R *.lfm}

  { TfrmPreferences }

procedure TfrmPreferences.btnOKClick(Sender: TObject);
begin
  UpdateLanguage(GetLanguage);
  frmPreferences.Close;
end;

procedure TfrmPreferences.FormActivate(Sender: TObject);
begin
  if IsDarkTheme then
    ShowMessage('Is dark: ');
  frmPreferences.Caption := rsStrSettingsDialog;
  btnOK.Caption := rsStrBtnClose;
  cBoxPrefLang.Font.Color := clGray;
  cBoxPrefLang.TextHint := CurrentLang;
  cBoxPrefTheme.Font.Color := clGray;
  cBoxPrefTheme.Items.Add(rsStrDark);
  cBoxPrefTheme.Items.Add(rsStrLight);
end;

function TfrmPreferences.GetLanguage: string;
var
  p: integer;
begin
  Result := '';
  if cBoxPrefLang.ItemIndex > -1 then
  begin
    Result := cBoxPrefLang.Items[cBoxPrefLang.ItemIndex];
    p := pos(' ', Result);
    if p > 0 then
      Result := copy(Result, 1, p - 1)
    else
      exit;
  end;
end;

procedure UpdateLanguage(ALanguage: string);
begin
  if ALanguage = '' then
    exit;

  CurrentLang := ALanguage;
  SetDefaultLang(ALanguage);

  if Application.MainForm is TLocalizedForm then
    TLocalizedForm(Application.MainForm).UpdateTranslation(ALanguage);
end;

procedure TfrmPreferences.CBoxPrefThemeChange(Sender: TObject);   // TODO: Choose and restart the app
begin
  if not IsDarkTheme then
  begin
    frmMyCalculators.Color := clWindowFrame;
    case cBoxPrefTheme.ItemIndex of
      0: begin
        { - DARK MODE START - }
        // By default this is set to pamForceLight
        PreferredAppMode := pamForceDark;
        // This doesn't work if the above is set to pamForceLight
        uMetaDarkStyle.ApplyMetaDarkStyle(DefaultDark);
        { -  DARK MODE END  - }PreferredAppMode := pamForceDark;
      end;
      1: PreferredAppMode := pamForceLight;
    end;
  end;
end;

// CHECK TO SEE IF WINDOWS HAS DARK MODE ACTIVE
function TfrmPreferences.IsDarkTheme: boolean;
const
  KEYPATH = '\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize';
  KEYNAME = 'AppsUseLightTheme';
var
  LightKey: boolean;
  Registry: TRegistry;
begin
  Result := False;
  Registry := TRegistry.Create;
  try
    Registry.RootKey := HKEY_CURRENT_USER;
    if Registry.OpenKeyReadOnly(KEYPATH) then
    begin
      if Registry.ValueExists(KEYNAME) then
        LightKey := Registry.ReadBool(KEYNAME)
      else
        LightKey := True;
    end
    else
      LightKey := True;
    Result := not LightKey
  finally
    Registry.Free;
  end;
end;

end.
