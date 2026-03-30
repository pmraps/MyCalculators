unit Help;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
    ComCtrls, LocalizedForms;

type

    { TfrmHelp }

    TfrmHelp = class(TLocalizedForm)
        btnOK: TButton;
        Dates: TPage;
        Description: TPage;
        mmoSettings: TMemo;
        mmoDates: TMemo;
        mmoTrigonometric: TMemo;
        mmoMiscFunctions: TMemo;
        mmoSimple: TMemo;
        mmoDescription: TMemo;
        Miscellaneous: TPage;
        NtBookMainHelp: TNotebook;
        Settings: TPage;
        Simple: TPage;
        Trigonometric: TPage;
        TrViewHelpIndex: TTreeView;
        procedure btnOKClick(Sender: TObject);
        procedure TrViewHelpIndexSelectionChanged(Sender: TObject);
    private

    protected
        procedure UpdateTranslation(ALang : String); override;

    public

    end;

var
    frmHelp: TfrmHelp;

implementation

{$R *.lfm}

{ TfrmHelp }


procedure TfrmHelp.btnOKClick(Sender: TObject);
begin
    frmHelp.Close;
end;

procedure TfrmHelp.TrViewHelpIndexSelectionChanged(Sender: TObject);
begin
  if TrViewHelpIndex.Selected <> nil then
     NtBookMainHelp.PageIndex := TrViewHelpIndex.Selected.AbsoluteIndex;
end;

procedure TfrmHelp.UpdateTranslation(ALang: String);
begin
  inherited;

  { DefaultTranslator cannot execute code, i.e. strings combined by means of
    the Format statement are not translated automatically. Such a string is
    created for the caption of LblSum in "CalculateSum" - we have to call this
    method here to get that label translated. }
//  CalculateSum;

  { In old versions there was a complication for the labels LblTodayIs which
    displays the current date, and with LblMoney which displays some amount of
    money with the currency sign.
    Formatting for these data is extracted from the DefaultFormatSettings.
    The resulting strings are encoded in ansi and do not display locale-specific
    characters. To get this right they have to be converted to UTF8.
    Usually, it is sufficient to call SysToUTF8 for this purpose. Our example,
    however, allows for Hebrew characters which are usually not contained in the
    typical code pages. Therefore, we use'll a more general procedure based on
    ConvertEncoding which allows to specify the source code page which had been
    determined when UpdateFormatSettings had been called in the LocalizedForms
    unit. }
end;

end.

