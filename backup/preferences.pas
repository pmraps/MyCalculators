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

    private

    protected
             procedure UpdateTranslation(ALang: String); override;

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

{ This method is inherited from LocalizedForm and manually inserts translated
  strings in cases where LCL/DefaultTranslator cannot do this. }
procedure TfrmPreferences.UpdateTranslation(ALang: String);
begin
  inherited;

{ The items of the radiogroup are not automatically handled by
  LCL/DefaultTranslator. Therefore, we have to assign the strings to the
  translated versions explicitly.

  Untranslated resource strings should be added here, like
  rsSomeString := 'Some translated text}

end;

end.

