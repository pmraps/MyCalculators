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
        lang : String;

    protected
             procedure UpdateTranslation(ALang: String); override;

    public
        procedure SetLanguage;
        function GetLanguage : String;
    end;
var
    frmPreferences: TfrmPreferences;

implementation

uses MainCalculators; //circumvent Language not recognized for now

{$R *.lfm}

{ TfrmPreferences }

procedure TfrmPreferences.SetLanguage;
begin
     frmPreferences.lang :=  frmPreferences.CBLanguage.Caption;
end;

function TfrmPreferences.GetLanguage : String;
begin
     GetLanguage := frmPreferences.lang;
end;

procedure TfrmPreferences.btnOKClick(Sender: TObject);
begin
    frmPreferences.Close;
end;

procedure TfrmPreferences.CBLanguageChange(Sender: TObject);
begin
    Language := GetLanguage;
end;

{ This method is inherited from LocalizedForm and manually inserts translated
  strings in cases where LCL/DefaultTranslator cannot do this. }
procedure TfrmPreferences.UpdateTranslation(ALang: String);
begin
  inherited;

  { The items of the radiogroup are not automatically handled by
    LCL/DefaultTranslator. Therefore, we have to assign the strings to the
    translated versions explicitly. }
{RgDrinks.Items[0] := rsBeer;
  RgDrinks.Items[1] := rsWine;
  RgDrinks.Items[2] := rsWater;}

  { The label LblCurrentSelection is created by a Format statement. Since
    LCL/DefaultTranslator does not execute code we have to update the translation
    of the label here. It is sufficient to call RgDrinksClick here where the
    caption is re-composed by means of the Format statement. }
// RgDrinksClick(nil);
end;

end.

