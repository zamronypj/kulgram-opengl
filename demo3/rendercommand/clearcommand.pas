unit clearcommand;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, renderer, baseRenderCommand, standardRenderCommand;

type

   { TClearCommand }

   TClearCommand = class(TStandardRenderCommand)
   protected

      function doRender(const renderer : IRenderer; const elapsedTimeInSecs : single) : cardinal; override;
   public

   end;


implementation

{ TClearCommand }

function TClearCommand.doRender(const renderer: IRenderer; const elapsedTimeInSecs: single): cardinal;
var clearBuffer : cardinal;
begin
  renderer.clearColor(0.0, 0.0, 0.0, 0.0);
  clearBuffer := renderer.getClearColorBufferBit() or
                 renderer.getClearDepthBufferBit();
  renderer.clear(clearBuffer);
  result := RENDER_OK;
end;

end.

