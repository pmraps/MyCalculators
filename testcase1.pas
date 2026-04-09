unit TestCase1;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, fpcunit, testutils, testregistry,
    maincalculators;

type

    TTestCase1= class(TTestCase)
    private
        frmMyCalculators;
    protected
        procedure SetUp; override;
        procedure TearDown; override;
    published
        procedure TestHookUp;
    end;

implementation

procedure TTestCase1.TestHookUp;
begin
    Fail('Write your own test');
end;

procedure TTestCase1.SetUp;
begin
     frmMyCalculators.Create;
end;

procedure TTestCase1.TearDown;
begin
     frmMyCalculators.Free
end;

initialization

    RegisterTest(TTestCase1);
end.

