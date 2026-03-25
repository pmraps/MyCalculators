unit MyCredits;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
    LclIntF, LCL;

type

    { TfrmCredits }

    TfrmCredits = class(TForm)
        PgCtrlCredits: TPageControl;
        StTxtCredits1: TStaticText;
        TbShtCreditsContributors: TTabSheet;
        TbShtCreditsCredits: TTabSheet;
        procedure StTxtCredits1Click(Sender: TObject);
    private

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

end.

