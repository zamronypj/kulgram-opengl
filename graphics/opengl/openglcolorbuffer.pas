unit OpenGLColorBuffer;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, baseRenderBuffer;
type

    { TOpenGLColorBuffer }

    TOpenGLColorBuffer = class(TBaseRenderBuffer)
    private
    public
       function beginWrite() : cardinal; override;
       function write(const sourceMemory: pointer; const numberOfData: cardinal; const dataType:cardinal; const stride: cardinal) : cardinal; override;
       function endWrite() : cardinal; override;
    end;

implementation
uses gl;

{ TOpenGLColorBuffer }

function TOpenGLColorBuffer.beginWrite(): cardinal;
begin
  glEnableClientState(GL_COLOR_ARRAY);
  result := 0;
end;

function TOpenGLColorBuffer.write(const sourceMemory: pointer; const numberOfData: cardinal;
  const dataType: cardinal; const stride: cardinal): cardinal;
begin
  glColorPointer(numberOfData, dataType, stride, sourceMemory);
  result := 0;
end;

function TOpenGLColorBuffer.endWrite(): cardinal;
begin
  glDisableClientState(GL_COLOR_ARRAY);
  result := 0;
end;

end.

