unit BasicShader;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, shader;

type

    { TBasicShader }

    TBasicShader = class(TInterfacedObject, IShader)
    protected
       shaderId :cardinal;
    public
       function id() : cardinal;
       function valid() : boolean; virtual; abstract;
       function createShader() : cardinal; virtual; abstract;
       function destroyShader() : cardinal; virtual; abstract;
       function setSource(const source:string) : cardinal; virtual; abstract;
       function compile() : cardinal; virtual; abstract;
    end;

implementation

{ TBasicShader }

function TBasicShader.id(): cardinal;
begin
  result := shaderId;
end;

end.

