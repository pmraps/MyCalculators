unit MyCredits;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
    LclIntF, LocalizedForms;

type

    { TfrmCredits }

    TfrmCredits = class(TLocalizedForm)
        PgCtrlCredits: TPageControl;
        ScrllBarCreditsVertical: TScrollBar;
        ScrllBarContributorsVertical: TScrollBar;
        StTxtCredits8: TStaticText;
        StTxtCredits9: TStaticText;
        StTxtCredits10: TStaticText;
        StTxtContributors1: TStaticText;
        StTxtCredits7: TStaticText;
        StTxtCredits6: TStaticText;
        StTxtCredits5: TStaticText;
        StTxtCredits4: TStaticText;
        StTxtCredits3: TStaticText;
        StTxtCredits2: TStaticText;
        StTxtCredits1: TStaticText;
        TbShtCreditsContributors: TTabSheet;
        TbShtCreditsCredits: TTabSheet;
        procedure StTxtCredits9Click(Sender: TObject);
        procedure StTxtCredits9MouseEnter(Sender: TObject);
        procedure StTxtCredits10Click(Sender: TObject);
        procedure StTxtCredits10MouseEnter(Sender: TObject);
        procedure StTxtContributors1Click(Sender: TObject);
        procedure StTxtCredits6Click(Sender: TObject);
        procedure StTxtCredits1Click(Sender: TObject);
        procedure StTxtCredits2Click(Sender: TObject);
        procedure StTxtCredits2MouseEnter(Sender: TObject);
        procedure StTxtCredits3Click(Sender: TObject);
        procedure StTxtCredits3MouseEnter(Sender: TObject);
        procedure StTxtCredits4Click(Sender: TObject);
        procedure StTxtCredits4MouseEnter(Sender: TObject);
        procedure StTxtCredits5Click(Sender: TObject);
        procedure StTxtCredits5MouseEnter(Sender: TObject);
        procedure StTxtCredits6MouseEnter(Sender: TObject);
        procedure StTxtCredits7Click(Sender: TObject);
        procedure StTxtCredits7MouseEnter(Sender: TObject);
        procedure StTxtCredits8Click(Sender: TObject);
        procedure StTxtCredits8MouseEnter(Sender: TObject);
    private

    protected
             procedure UpdateTranslation(ALang : String); override;
    public

    end;

var
    frmCredits: TfrmCredits;

implementation

{$R *.lfm}

{ TfrmCredits }

procedure TfrmCredits.StTxtCredits1Click(Sender: TObject);
begin
    OpenURL('https://svn.code.sf.net/p/flyingsheep/code/trunk/MijnLib/fsiconv.pp');
end;

procedure TfrmCredits.StTxtCredits6Click(Sender: TObject);
begin
    OpenURL('https://www.flaticon.com/free-icon/calculator_548251');
end;

procedure TfrmCredits.StTxtContributors1Click(Sender: TObject);
begin
     OpenDocument('mailto: pmra@protonmail.com');
end;

procedure TfrmCredits.StTxtCredits9MouseEnter(Sender: TObject);
begin
    StTxtCredits9.Cursor := crHandPoint;
end;

procedure TfrmCredits.StTxtCredits10Click(Sender: TObject);
begin
    OpenURL('https://www.svgrepo.com');
end;

procedure TfrmCredits.StTxtCredits10MouseEnter(Sender: TObject);
begin
    StTxtCredits10.Cursor := crHandPoint;
end;

procedure TfrmCredits.StTxtCredits9Click(Sender: TObject);
begin
    OpenURL('https://icons8.com/icon/43131/book');
end;

procedure TfrmCredits.StTxtCredits2Click(Sender: TObject);
begin
    OpenURL('https://wiki.freepascal.org/Base_converting');
end;

procedure TfrmCredits.StTxtCredits2MouseEnter(Sender: TObject);
begin
    StTxtCredits2.Cursor := crHandPoint;
end;

procedure TfrmCredits.StTxtCredits3Click(Sender: TObject);
begin
    OpenURL('https://icons8.com/icon/15582/mosque');
end;

procedure TfrmCredits.StTxtCredits3MouseEnter(Sender: TObject);
begin
    StTxtCredits3.Cursor := crHandPoint;
end;

procedure TfrmCredits.StTxtCredits4Click(Sender: TObject);
begin
    OpenURL('https://www.flaticon.com/free-icons/settings');
end;

procedure TfrmCredits.StTxtCredits4MouseEnter(Sender: TObject);
begin
    StTxtCredits4.Cursor := crHandPoint;
end;

procedure TfrmCredits.StTxtCredits5Click(Sender: TObject);
begin
    OpenURL('https://www.freepik.com/icon/response_16856087#fromView=keyword&page=1&position=9&uuid=1ece30f9-b2b0-41a0-a3b3-af535626c9d0');
end;

procedure TfrmCredits.StTxtCredits5MouseEnter(Sender: TObject);
begin
    StTxtCredits5.Cursor := crHandPoint;
end;

procedure TfrmCredits.StTxtCredits6MouseEnter(Sender: TObject);
begin
    StTxtCredits6.Cursor := crHandPoint;
end;

procedure TfrmCredits.StTxtCredits7Click(Sender: TObject);
begin
    OpenURL('https://www.flaticon.com/free-icon/help_9796369');
end;

procedure TfrmCredits.StTxtCredits7MouseEnter(Sender: TObject);
begin
    StTxtCredits7.Cursor := crHandPoint;
end;

procedure TfrmCredits.StTxtCredits8Click(Sender: TObject);
begin
    OpenURL('https://forum.lazarus.freepascal.org/index.php/topic,49551.msg359552.html#msg359552');
end;

procedure TfrmCredits.StTxtCredits8MouseEnter(Sender: TObject);
begin
    StTxtCredits8.Cursor := crHandPoint;
end;

procedure TfrmCredits.UpdateTranslation(ALang: String);
var
  s: String;
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
{  with RadioGroup do begin
    Items[0] := rsOne;
    Items[1] := rsTwo;
    Items[2] := rsThree;
  end;
}
  { We should translate CheckGroup here also. But we don't do this here
    to demonstrate the effect when the items of the CheckGroup are not
    translated explicitly as we did with the RadioGroup. }
end;

end.

