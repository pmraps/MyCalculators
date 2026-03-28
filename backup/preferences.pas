unit Preferences;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
    LCLTranslator, DefaultTranslator, LocalizedForms, myResourceStrings;

type

    { TfrmPreferences }

    TfrmPreferences = class(TLocalizedForm)
        btnOK: TButton;
        CBLanguage: TComboBox;
        CBoxThemes: TComboBox;
        lblTheme: TLabel;
        lblLanguage: TLabel;
        procedure btnOKClick(Sender: TObject);
        procedure CBLanguageChange(Sender: TObject);
    private
        FSelectionTime: TTime;
        procedure SelectLanguage(ALang: String);
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

procedure TfrmPreferences.CBLanguageChange(Sender: TObject);
var lang: String;
  p: Integer;
begin
  if CbLanguage.ItemIndex > -1 then
     begin
        lang := CbLanguage.Items[CbLanguage.ItemIndex];
        p := pos(' ', lang);
        if p = 0 then p := pos('-', lang);
        if p = 0 then
          raise Exception.Create('Language items are not properly formatted');
          { This string is essentially meant as a message to the programmer, it
            will - hopefully - never make its way to the user. Therefore, there is
            not need to use a resourcestring and activate if for translation. }
        lang := copy(lang, 1, p-1);
        SelectLanguage(lang);
     end;
end;


{ This is the main procedure that has to be called when changing language:
  - It replaces resourcestrings with the translated ones.
  - It activates the format settings corresponding to the new language
  - It tries to use the BiDi mode for the new language (not completely correct)
  - It calls "UpdateTranslation" for itself and for each form of the project -
    this way, the forms can do things that are not done automatically.
  - It updates the language selector combobox }
procedure TfrmPreferences.SelectLanguage(ALang: String);
var
  i, p: Integer;
  lang: String;
begin
  // Switch language - this is in LCLTranslator
  ALang := SetDefaultLang(ALang);

  if ALang <> '' then
  begin
    // Switch default settings by calling the procedure provided in BasicLocalizedForm.pas.
    UpdateFormatSettings(ALang);

    // Adjust BiDiMode to new language
    UpdateBiDiMode(ALang);

    // Update items not automatically translated.
    UpdateTranslation(ALang);

    // Select the new language in the language combobox.
    ALang := lowercase(ALang);
    for i:=0 to frmPreferences.CbLanguage.Items.Count-1 do begin
      lang := frmPreferences.CbLanguage.Items[i];
      p := pos(' ', lang);
      if p = 0 then p := pos('-', lang);
      if p = 0 then
        raise Exception.Create('Language items are not properly formatted.');
      lang := lowercase(copy(lang, 1, p-1));
      if lang = ALang then begin
        frmPreferences.CbLanguage.ItemIndex := i;
        break;
      end;
    end;

    { Remember the new language. Forms may want to check in UpdateTranslation
      whether the new language has a different BiDiMode. }
    CurrentLang := ALang;
  end;
end;

{ This method is inherited from LocalizedForm and manually inserts translated
  strings in cases where LCL/DefaultTranslator cannot do this. }
procedure TfrmPreferences.UpdateTranslation(ALang: String);
begin
  //inherited;

  { The items of the radiogroup are not automatically handled by
    LCL/DefaultTranslator. Therefore, we have to assign the strings to the
    translated versions explicitly. }
  {{RgDrinks.Items[0] := rsBeer;
  RgDrinks.Items[1] := rsWine;
  RgDrinks.Items[2] := rsWater;}}
  rdBtnSimpleCalculator.Caption := rsSimple;

  { The label LblCurrentSelection is created by a Format statement. Since
    LCL/DefaultTranslator does not execute code we have to update the translation
    of the label here. It is sufficient to call RgDrinksClick here where the
    caption is re-composed by means of the Format statement. }
  // RgDrinksClick(nil);
end;

end.

