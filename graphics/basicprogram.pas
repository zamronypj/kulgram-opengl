unit basicprogram;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, shader, shaderProgram;

type

  { TBasicProgram }

  TBasicProgram = class(TInterfacedObject, IShaderProgram)
  protected
     programId :cardinal;
  public
     function id() : cardinal;
     function createProgram() : cardinal; virtual; abstract;
     function destroyProgram() : cardinal;  virtual; abstract;
     function attachShader(const shaderObj: IShader): cardinal; virtual; abstract;
     function detachShader(const shaderObj: IShader): cardinal; virtual; abstract;
     function linkProgram() : cardinal; virtual; abstract;
     function useProgram() : cardinal; virtual; abstract;
  end;

implementation

{ TBasicProgram }

function TBasicProgram.id(): cardinal;
begin
  result := programId;
end;

end.

