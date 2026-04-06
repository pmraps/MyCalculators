program mycalculators;

{$mode objfpc}{$H+}

uses
    {$IFDEF UNIX}
    cthreads,
    {$ENDIF}
    {$IFDEF HASAMIGA}
    athreads,
    {$ENDIF}
    Interfaces, // this includes the LCL widgetset
    Forms, datetimectrls, mainCalculators, MyCredits, Help, myResourceStrings,
    Preferences, ErrorCatching;
    { you can add units after this }

{$R *.res}

begin
    RequireDerivedFormResource:=True;
    Application.Scaled:=True;
    {$PUSH}{$WARN 5044 OFF}
    Application.MainFormOnTaskbar:=True;
    {$POP}
    Application.Initialize;
    Application.CreateForm(TfrmMyCalculators, frmMyCalculators);
    Application.CreateForm(TfrmCredits, frmCredits);
    Application.CreateForm(TfrmHelp, frmHelp);
    Application.CreateForm(TfrmPreferences, frmPreferences);
    Application.Run;
end.

