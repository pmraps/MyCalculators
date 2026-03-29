unit Help;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
    ComCtrls, LocalizedForms, myResourceStrings;

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
var
  s: String;
begin
  //inherited;

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
    unit.

    This has been changed since Laz 2.2.0. The old conversion code is left
    here commented for comparison.
  }
//  s := FormatDateTime(DefaultFormatSettings.LongDateFormat, Date());
  {
  s := ConvertEncoding(
    FormatDateTime(DefaultFormatSettings.LongDateFormat, d),  // string to convert
    CodePage,      // source encoding as defined by "CodePage"
    EncodingUTF8   // destination encoding - UTF8
  );
  }
  { Note: "ConvertEncoding" requires the unit LConvEncoding in the uses clause. }
//  LblTodayIs.Caption := Format(rsTodayIs, [s]);

//  s := DefaultFormatSettings.CurrencyString;

  { Now the same with LblMoney... }
//  LblMoney.Caption := Format('%.*n %s', [
//    DefaultFormatSettings.CurrencyDecimals, 10.0e6, DefaultFormatSettings.CurrencyString]);
  {
  LblMoney.Caption := ConvertEncoding(
    Format('%.*n %s', [
      DefaultFormatSettings.CurrencyDecimals,
      10e6,
      DefaultFormatSettings.CurrencyString
    ]),
    CodePage, EncodingUTF8
  );
  }

  { The items of TRadiogroup are not translated automatically. }
  mmoDescription.Lines := rsHelpDescription;

  { We should translate CheckGroup here also. But we don't do this here
    to demonstrate the effect when the items of the CheckGroup are not
    translated explicitly as we did with the RadioGroup. }
end;

end.

