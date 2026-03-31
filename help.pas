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
        pgDates: TPage;
        pgDescription: TPage;
        mmoSettings: TMemo;
        mmoDates: TMemo;
        mmoTrigonometric: TMemo;
        mmoMiscFunctions: TMemo;
        mmoSimple: TMemo;
        mmoDescription: TMemo;
        pgMiscellaneous: TPage;
        NtBookMainHelp: TNotebook;
        pgSettings: TPage;
        pgSimple: TPage;
        pgTrigonometric: TPage;
        TrViewHelpIndex: TTreeView;
        procedure btnOKClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure mmoDatesEnter(Sender: TObject);
        procedure mmoDescriptionEnter(Sender: TObject);
        procedure mmoMiscFunctionsEnter(Sender: TObject);
        procedure mmoSettingsEnter(Sender: TObject);
        procedure mmoSimpleEnter(Sender: TObject);
        procedure mmoTrigonometricEnter(Sender: TObject);
        procedure TrViewHelpIndexSelectionChanged(Sender: TObject);
    private

    protected
        procedure UpdateTranslation(ALang: String); override;
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

procedure TfrmHelp.FormCreate(Sender: TObject);
begin
    frmHelp.Close;
    UpdateTranslation(CurrentLang);
end;

procedure TfrmHelp.mmoDescriptionEnter(Sender: TObject);
begin
    mmoDescription.Lines[0] := rsHelpDescLine0;
    mmoDescription.Lines[1] := '';
    mmoDescription.Lines[2] := rsHelpDescLine2;
    mmoDescription.Lines[3] := '';
    mmoDescription.Lines[4] := rsHelpDescLine4;
    mmoDescription.Lines[5] := '';
    mmoDescription.Lines[6] := rsHelpDescLine6;
    mmoDescription.Lines[7] := '';
    mmoDescription.Lines[8] := rsHelpDescLine8;
end;

procedure TfrmHelp.mmoSimpleEnter(Sender: TObject);
begin
    mmoSimple.Lines[0] := rsHelpSimpleLine0;
    mmoSimple.Lines[1] := '';
    mmoSimple.Lines[2] := rsHelpSimpleLine2;
    mmoSimple.Lines[3] := '';
    mmoSimple.Lines[4] := rsHelpSimpleLine4;
    mmoSimple.Lines[5] := '';
    mmoSimple.Lines[6] := rsHelpSimpleLine6;
end;

procedure TfrmHelp.mmoTrigonometricEnter(Sender: TObject);
begin
    mmoTrigonometric.Lines[0] := rsHelpTrigLine0;
    mmoTrigonometric.Lines[1] := '';
    mmoTrigonometric.Lines[2] := rsHelpTrigLine2;
    mmoTrigonometric.Lines[3] := '';
    mmoTrigonometric.Lines[4] := rsHelpTrigLine4;
end;

procedure TfrmHelp.mmoMiscFunctionsEnter(Sender: TObject);
begin
    mmoMiscFunctions.Lines[0] := rsHelpMiscLine0;
    mmoMiscFunctions.Lines[1] := '';
    mmoMiscFunctions.Lines[2] := rsHelpMiscLine2;
    mmoMiscFunctions.Lines[3] := '';
    mmoMiscFunctions.Lines[4] := rsHelpMiscLine4;
    mmoMiscFunctions.Lines[5] := '';
    mmoMiscFunctions.Lines[6] := rsHelpMiscLine6;
    mmoMiscFunctions.Lines[7] := '';
    mmoMiscFunctions.Lines[8] := rsHelpMiscLine8;
    mmoMiscFunctions.Lines[9] := '';
    mmoMiscFunctions.Lines[10] := rsHelpMiscLine10;
end;

procedure TfrmHelp.mmoDatesEnter(Sender: TObject);
begin
    mmoDates.Lines[0] := rsHelpDateLine0;
    mmoDates.Lines[1] := rsHelpDateLine1;
    mmoDates.Lines[2] := '';
    mmoDates.Lines[3] := rsHelpDateLine3;
    mmoDates.Lines[4] := rsHelpDateLine4;
end;

procedure TfrmHelp.mmoSettingsEnter(Sender: TObject);
begin
    mmoSettings.Lines[0] := rsHelpSettingsLine0;
    mmoSettings.Lines[1] := '';
    mmoSettings.Lines[2] := rsHelpSettingsLine2;
end;

procedure TfrmHelp.TrViewHelpIndexSelectionChanged(Sender: TObject);
begin
  if TrViewHelpIndex.Selected <> nil then
     NtBookMainHelp.PageIndex := TrViewHelpIndex.Selected.AbsoluteIndex;
end;

procedure TfrmHelp.UpdateTranslation(ALang: String);
begin
  inherited;

  { Items that are are not translated automatically: }
{  with RadioGroup do begin
    Items[0] := rsOne;
    Items[1] := rsTwo;
    Items[2] := rsThree;
  end;}

  { We should translate CheckGroup here also. Probably also list strings, etc.. }
end;

end.

