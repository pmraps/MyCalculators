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

end.

