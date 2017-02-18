unit OpenGLRendererPrimitive;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, rendererPrimitive;

type

   { TOpenGLRendererPrimitive }

   TOpenGLRendererPrimitive = class(TInterfacedObject, IRendererPrimitive)
   public
     function triangles() : cardinal;
     function triangleStrip() : cardinal;
     function triangleFan() : cardinal;

     function lines() : cardinal;
     function lineStrip(): cardinal;
     function lineLoop() : cardinal;

     function points() : cardinal;
   end;

implementation
uses gl;

{ TOpenGLRendererPrimitive }

function TOpenGLRendererPrimitive.triangles(): cardinal;
begin
  result := GL_TRIANGLES;
end;

function TOpenGLRendererPrimitive.triangleStrip(): cardinal;
begin
  result := GL_TRIANGLE_STRIP;

end;

function TOpenGLRendererPrimitive.triangleFan(): cardinal;
begin
  result := GL_TRIANGLE_FAN;
end;

function TOpenGLRendererPrimitive.lines(): cardinal;
begin
  result := GL_LINES;
end;

function TOpenGLRendererPrimitive.lineStrip(): cardinal;
begin
  result := GL_LINE_STRIP;
end;

function TOpenGLRendererPrimitive.lineLoop(): cardinal;
begin
  result := GL_LINE_LOOP;
end;

function TOpenGLRendererPrimitive.points(): cardinal;
begin
  result := GL_POINTS;
end;

end.

