unit OpenGLRendererFactory;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, renderer;

type

   { TOpenGLRendererFactory }

   TOpenGLRendererFactory = class(TObject)
   public
      class function create(): IRenderer; static;
   end;

implementation
uses openglrenderer, OpenGLRendererPrimitive;

{ TOpenGLRendererFactory }

class function TOpenGLRendererFactory.create(): IRenderer;
begin
  result := TOpenGLRenderer.Create(TOpenGLRendererPrimitive.Create());
end;

end.

