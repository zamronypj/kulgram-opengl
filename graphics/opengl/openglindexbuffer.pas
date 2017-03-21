unit OpenGLIndexBuffer;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, baseRenderBuffer;

type

    { TOpenGLIndexBuffer }

    TOpenGLIndexBuffer = class(TBaseRenderBuffer)
    private
    public
       function beginWrite() : cardinal; override;
       function write(const sourceMemory: pointer; const numberOfData: cardinal; const dataType:cardinal; const stride: cardinal) : cardinal; override;
       function endWrite() : cardinal; override;
    end;

implementation
uses gl;
{ TOpenGLIndexBuffer }

function TOpenGLIndexBuffer.beginWrite(): cardinal;
begin
  glEnableClientState(GL_INDEX_ARRAY);
  result := 0;
end;

function TOpenGLIndexBuffer.write(const sourceMemory: pointer; const numberOfData: cardinal; const dataType: cardinal; const stride: cardinal): cardinal;
begin
  glIndexPointer(dataType, stride, sourceMemory);
  result := 0;
end;

function TOpenGLIndexBuffer.endWrite(): cardinal;
begin
  glDisableClientState(GL_INDEX_ARRAY);
  result := 0;
end;

end.

