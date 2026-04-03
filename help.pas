{
Comments marked with 'wp' came from
https://forum.lazarus.freepascal.org/index.php?action=profile;u=45589
hero member of the Lazarus forum, who took the time and knowledge to correct
this project and teach me some basic notions.

MANY THANKS !
}
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
        procedure FormCreate(Sender: TObject);
        procedure TrViewHelpIndexSelectionChanged(Sender: TObject);

    private
        // wp
        procedure PrepareDescriptionMemo;
        procedure PrepareSimpleMemo;
        procedure PrepareTrigMemo;
        procedure PrepareMiscFunctionsMemo;
        procedure PrepareDatesMemo;
        procedure PrepareSettingsMemo;

    protected
        // wp
        procedure PopulateMemos;
        procedure PopulateTreeView;

    public
        procedure UpdateTranslation(ALang: String); override;
    public

    end;

var
    frmHelp: TfrmHelp;

implementation

{$R *.lfm}

{ wp General remark: Turning off the cursor inside the memos is annoying... }

{ TfrmHelp }

{ wp All these auxiliary forms are opened modally. Therefore the form closes
  automatically when the ModalResult of the OK button is different from mrNone.
  In the Object Inspector I set this to mrClose; therefore, this method is
  not needed any more.

procedure TfrmHelp.btnOKClick(Sender: TObject);
begin
    // Close;   // wp: not required when you set Modalresult to mrClose;
end;
}

procedure TfrmHelp.FormCreate(Sender: TObject);
begin
  { wp Hide the newly created help form. This is needed because you auto-create
   forms which would show the form immediately. }
  Visible := false;
  //frmHelp.Close;

  UpdateTranslation(CurrentLang);

  PopulateTreeView;
  PopulateMemos;
end;

{ wp This writes the help texts into the memos. This is done by code to facilitate
  translation. }
procedure TfrmHelp.PopulateMemos;
begin
  PrepareDescriptionMemo;
  PrepareSimpleMemo;
  PrepareTrigMemo;
  PrepareMiscFunctionsMemo;
  PrepareDatesMemo;
  PrepareSettingsMemo;
end;

{ wp I think populating the treeview by code here is safer than doing it in the
  object inspector because we have to access the nodes of the tree at verious
  places and must be sure that everything is in sync. This can be achieved more
  easily in a single file. }
procedure TfrmHelp.PopulateTreeView;
begin
  TrViewHelpIndex.Items.Clear;
  with TrViewHelpIndex.Items.Add(nil, rsTrViewDesc) do
  begin
    ImageIndex := 10;
    SelectedIndex := ImageIndex;
  end;
  with TrViewHelpIndex.Items.Add(nil, rsTrViewSimple) do
  begin
    ImageIndex := 16;
    SelectedIndex := ImageIndex;
  end;
  with TrViewHelpIndex.Items.Add(nil, rsTrViewMisc) do
  begin
    ImageIndex := 15;
    SelectedIndex := ImageIndex;
  end;
  with TrViewHelpIndex.Items.Add(nil, rsTrViewTrig) do
  begin
    ImageIndex := 14;
    SelectedIndex := ImageIndex;
  end;
  with TrViewHelpIndex.Items.Add(nil, rsTrViewDate) do
  begin
    ImageIndex := 13;
    SelectedIndex := ImageIndex;
  end;
  with TrViewHelpIndex.Items.Add(nil, rsTrViewSettings) do
  begin
    ImageIndex := 8;
    SelectedIndex := ImageIndex;
  end;
end;

procedure TfrmHelp.PrepareDescriptionMemo;
begin
  mmoDescription.Lines.Clear;
  mmoDescription.Lines.Add(rsHelpDescLine0);
  mmoDescription.Lines.Add('');
  mmoDescription.Lines.Add(rsHelpDescLine2);
  mmoDescription.Lines.Add('');
  mmoDescription.Lines.Add(rsHelpDescLine4);
  mmoDescription.Lines.Add('');
  mmoDescription.Lines.Add(rsHelpDescLine6);
  mmoDescription.Lines.Add('');
  mmoDescription.Lines.Add(rsHelpDescLine8);
end;

{ wp This is not working. The memo lines must be provided already when the form
  is created. I put this code into the PrepareXXXXMemo procedures which are
  called from the form's OnCreate and when language changes. The latter
  automatically writes the translated texts into the memos.

  This comment holds for all the other mmoXXXXEnter procedures. }

  { I removed all other similar procedures in accordance. Left this one to
    show the difference

procedure TfrmHelp.mmoDescriptionEnter(Sender: TObject);
begin
    mmoDescription.Lines[0] := rsHelpDescLine0;
    mmoDescription.Lines[1] := '';
    ...
end;
}

procedure TfrmHelp.PrepareSimpleMemo;
begin
  mmoSimple.Lines.Clear;
  mmoSimple.Lines.Add(rsHelpSimpleLine0);
  mmoSimple.Lines.Add('');
  mmoSimple.Lines.Add(rsHelpSimpleLine2);
  mmoSimple.Lines.Add('');
  mmoSimple.Lines.Add(rsHelpSimpleLine4);
  mmoSimple.Lines.Add('');
  mmoSimple.Lines.Add(rsHelpSimpleLine6);
end;

procedure TfrmHelp.PrepareTrigMemo;
begin
  mmoTrigonometric.Lines.Clear;
  mmoTrigonometric.Lines.Add(rsHelpTrigLine0);
  mmoTrigonometric.Lines.Add('');
  mmoTrigonometric.Lines.Add(rsHelpTrigLine2);
  mmoTrigonometric.Lines.Add('');
  mmoTrigonometric.Lines.Add(rsHelpTrigLine4);
end;

procedure TfrmHelp.PrepareMiscFunctionsMemo;
begin
  mmoMiscFunctions.Lines.Clear;
  mmoMiscFunctions.Lines.Add(rsHelpMiscLine0);
  mmoMiscFunctions.Lines.Add('');
  mmoMiscFunctions.Lines.Add(rsHelpMiscLine2);
  mmoMiscFunctions.Lines.Add('');
  mmoMiscFunctions.Lines.Add(rsHelpMiscLine4);
  mmoMiscFunctions.Lines.Add('');
  mmoMiscFunctions.Lines.Add(rsHelpMiscLine6);
  mmoMiscFunctions.Lines.Add('');
  mmoMiscFunctions.Lines.Add(rsHelpMiscLine8);
  mmoMiscFunctions.Lines.Add('');
  mmoMiscFunctions.Lines.Add(rsHelpMiscLine10);
end;

procedure TfrmHelp.PrepareDatesMemo;
begin
    mmoDates.Lines.Clear;
    mmoDates.Lines.Add(rsHelpDateLine0);
    mmoDates.Lines.Add(rsHelpDateLine1);
    mmoDates.Lines.Add('');
    mmoDates.Lines.Add(rsHelpDateLine3);
    mmoDates.Lines.Add(rsHelpDateLine4);
end;

procedure TfrmHelp.PrepareSettingsMemo;
begin
    mmoSettings.Lines.Clear;
    mmoSettings.Lines.Add(rsHelpSettingsLine0);
    mmoSettings.Lines.Add('');
    mmoSettings.Lines.Add(rsHelpSettingsLine2);
end;

procedure TfrmHelp.TrViewHelpIndexSelectionChanged(Sender: TObject);
begin
  if TrViewHelpIndex.Selected <> nil then
     NtBookMainHelp.PageIndex := TrViewHelpIndex.Selected.AbsoluteIndex;
end;

procedure TfrmHelp.UpdateTranslation(ALang: String);
begin
  inherited;

  { wp It seems to be that the nodes of the treeview are not automatically
    translated. --> We must update the texts manually. }
  PopulateTreeView;

  { wp The same with the help texts in the memos. }
  PopulateMemos;
end;

end.

