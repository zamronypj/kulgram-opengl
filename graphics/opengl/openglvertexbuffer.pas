unit OpenGLVertexBuffer;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, baseRenderBuffer;
type

   { TOpenGLVertexBuffer }

   TOpenGLVertexBuffer = class(TBaseRenderBuffer)
   private
   public
      function beginWrite() : cardinal; override;
      function write(const sourceMemory: pointer; const numberOfData: cardinal; const dataType:cardinal; const stride: cardinal) : cardinal; override;
      function endWrite() : cardinal; override;
   end;

implementation
uses gl;

{ TOpenGLVertexBuffer }

function TOpenGLVertexBuffer.beginWrite(): cardinal;
begin
  glEnableClientState(GL_VERTEX_ARRAY);
  result := 0;
end;

function TOpenGLVertexBuffer.write(const sourceMemory: pointer; const numberOfData: cardinal;
  const dataType: cardinal; const stride: cardinal): cardinal;
begin
  glVertexPointer(numberOfData, dataType, stride, sourceMemory);
  result := 0;
end;

function TOpenGLVertexBuffer.endWrite(): cardinal;
begin
  glDisableClientState(GL_VERTEX_ARRAY);
  result := 0;
end;

end.

