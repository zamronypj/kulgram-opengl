{-----------------------------------
 Base Shader program implementation
-------------------------------------
This class provides shader program creation and
linking
-------------------------------------
(c) 2017 Zamrony P. Juhara <zamronypj@yahoo.com>
http://github.com/zamronypj/kulgram-opengl
-------------------------------------
Tested on:
-Ubuntu 14.04 64 bit Intel core i7, 8 GB RAM
-Ubuntu 16.04 64 bit AMD A9-9400, 4 GB RAM
-------------------------------------
TODO: Need to be tested on other
platform
-------------------------------------}
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
     function valid() : boolean; virtual; abstract;
     function createProgram() : cardinal; virtual; abstract;
     function destroyProgram() : cardinal;  virtual; abstract;
     function attachShader(const shaderObj: IShader): cardinal; virtual; abstract;
     function detachShader(const shaderObj: IShader): cardinal; virtual; abstract;
     function linkProgram() : cardinal; virtual; abstract;
     function useProgram() : cardinal; virtual; abstract;
     function unuseProgram() : cardinal; virtual; abstract;
  end;

implementation

{ TBasicProgram }

function TBasicProgram.id(): cardinal;
begin
  result := programId;
end;

end.

