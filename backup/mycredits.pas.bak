unit MyCredits;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
    LclIntF;

type

    { TfrmCredits }

    TfrmCredits = class(TForm)
        ScrollBox1: TScrollBox;
        StaticText1: TStaticText;
        tabCtrlCredits: TTabControl;
        procedure StaticText1Click(Sender: TObject);
    private

    public

    end;

var
    frmCredits: TfrmCredits;

implementation

{$R *.lfm}

{ TfrmCredits }

procedure TfrmCredits.StaticText1Click(Sender: TObject);
begin
    OpenURL('https://svn.code.sf.net/p/flyingsheep/code/trunk/MijnLib/fsiconv.pp');
end;

end.

