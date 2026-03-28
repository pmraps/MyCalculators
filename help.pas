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

end.

