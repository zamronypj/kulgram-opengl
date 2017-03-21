unit clearcommand;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, rendererTypes, renderer, baseRenderCommand, standardRenderCommand;

type

   { TClearCommand }

   TClearCommand = class(TStandardRenderCommand)
   private
      clearColor : TColor4f;
   protected
      function doRender(const renderer : IRenderer; const elapsedTimeInSecs : single) : cardinal; override;
   public
      constructor Create(const aRenderer: IRenderer); override;
      procedure setClearColor(const clearCol: TColor4f);
   end;


implementation
uses constants;

{ TClearCommand }

function TClearCommand.doRender(const renderer: IRenderer; const elapsedTimeInSecs: single): cardinal;
var clearBuffer : cardinal;
begin
  renderer.clearColor(clearColor.r, clearColor.g, clearColor.b, clearColor.a);
  clearBuffer := renderer.getClearColorBufferBit() or
                 renderer.getClearDepthBufferBit();
  renderer.clear(clearBuffer);
  result := RENDER_OK;
end;

constructor TClearCommand.Create(const aRenderer: IRenderer);
begin
  inherited Create(aRenderer);
  clearColor.r := 0.0;
  clearColor.g := 0.0;
  clearColor.b := 0.0;
  clearColor.a := 1.0;
end;

procedure TClearCommand.setClearColor(const clearCol: TColor4f);
begin
  clearColor.r := clearCol.r;
  clearColor.g := clearCol.g;
  clearColor.b := clearCol.b;
  clearColor.a := clearCol.a;
end;

end.

