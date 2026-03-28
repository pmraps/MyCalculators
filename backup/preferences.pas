unit Preferences;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

    { TfrmPreferences }

    TfrmPreferences = class(TForm)
        btnOK: TButton;
        ComboBox1: TComboBox;
        CBoxThemes: TComboBox;
        lblTheme: TLabel;
        lblLanguage: TLabel;
        procedure btnOKClick(Sender: TObject);
        function FormHelp(Command: Word; Data: PtrInt; var CallHelp: Boolean
            ): Boolean;
    private

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

function TfrmPreferences.FormHelp(Command: Word; Data: PtrInt;
    var CallHelp: Boolean): Boolean;
begin
    frmHelp.ShowModal;
end;

end.

