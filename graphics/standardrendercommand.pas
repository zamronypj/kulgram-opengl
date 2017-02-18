unit standardRenderCommand;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, renderer, baseRenderCommand;

type

   {----------------------------------------
   Basic render command that render only if
   renderrr instance is available
   -----------------------------------------}

   { TStandardRenderCommand }

   TStandardRenderCommand = class(TBaseRenderCommand)
   protected
     function doRender(const renderer : IRenderer; const elapsedTimeInSecs : single) : cardinal; virtual; abstract;
   public
     function render(const elapsedTimeInSecs : single) : cardinal; override;
   end;

implementation

{ TStandardRenderCommand }

function TStandardRenderCommand.render(const elapsedTimeInSecs: single): cardinal;
var renderer : IRenderer;
begin
  renderer := getRenderer();
  if (renderer <> nil) then
  begin
    result := doRender(renderer, elapsedTimeInSecs);
  end else
  begin
    result := INVALID_RENDERER;
  end;
end;

end.

