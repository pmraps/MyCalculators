unit Preferences;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
    LCLTranslator, DefaultTranslator, LocalizedForms;

type

    { TfrmPreferences }

    TfrmPreferences = class(TLocalizedForm)
        btnOK: TButton;
        CBLanguage: TComboBox;
        CBoxThemes: TComboBox;
        lblTheme: TLabel;
        lblLanguage: TLabel;
        procedure btnOKClick(Sender: TObject);
        procedure CBLanguageGetItems(Sender: TObject);

    private

    protected

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

procedure TfrmPreferences.CBLanguageGetItems(Sender: TObject);
begin
    ShowMessage(IntToStr(frmPreferences.CbLanguage.Items.Count));
end;

end.

