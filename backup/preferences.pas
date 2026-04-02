unit Preferences;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
    LocalizedForms, gettext, LCLTranslator;

type

    { TfrmPreferences }

    TfrmPreferences = class(TLocalizedForm)
        Button1: TButton;
        cBoxPrefLang: TComboBox;
        cBoxPrefTheme: TComboBox;
        lblPrefLang: TLabel;
        lblPrefTheme: TLabel;
        procedure btnOKClick(Sender: TObject);
        procedure cBoxPrefLangChange(Sender: TObject);
    private

    public

    end;

var
    frmPreferences: TfrmPreferences;

implementation

{$R *.lfm}

{ TfrmPreferences }

procedure TfrmPreferences.btnOKClick(Sender: TObject);
begin
     frmPreferences.Close;
end;

procedure TfrmPreferences.cBoxPrefLangChange(Sender: TObject);
var
  lang: String;
  p: Integer;
begin
     SetDefaultLang(Copy(cBoxPrefLang.Text, 0, 2));
end;

end.

