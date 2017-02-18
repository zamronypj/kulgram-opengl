unit renderTriangleCommand;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, renderer, baseRenderCommand, standardRenderCommand;

type

   { TRenderTriangleCommand }

   TRenderTriangleCommand = class(TStandardRenderCommand)
   protected
     function doRender(const renderer : IRenderer; const elapsedTimeInSecs : single) : cardinal; override;
   end;

implementation
uses rendererPrimitive;

{ TRenderTriangleCommand }

function TRenderTriangleCommand.doRender(const renderer : IRenderer; const elapsedTimeInSecs: single): cardinal;
var prim: IRendererPrimitive;
begin
  prim := renderer.getPrimitive();
  renderer.beginPrimitive(prim.triangles());
  renderer.color3f(1.0, 0.0, 0.0);
  renderer.vertex3f(-1.0, 0.0, 0.0);
  renderer.vertex3f(0.0, 1.0, 0.0);
  renderer.vertex3f(1.0, 0.0, 0.0);
  renderer.endPrimitive();
  result := RENDER_OK;
end;

end.

