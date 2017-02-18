unit renderer;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, rendererPrimitive;

type

   IRenderer = interface
       ['{12AD6CBB-E7EC-48BC-B311-C752ACD24F59}']

       function clearColor(const r: single; const g: single; const b:single; const a:single): cardinal;
       function clear(const clearBit : cardinal): cardinal;

       //getter for color/stencil/depth buffer
       function getClearColorBufferBit() : cardinal;
       function getClearStencilBufferBit() : cardinal;
       function getClearDepthBufferBit() : cardinal;

       function getPrimitive() : IRendererPrimitive;

       function setIdentityMatrix() : cardinal;
       function beginPrimitive(const primitive : cardinal): cardinal;
       function vertex4f(const x: single; const y: single; const z:single; const w:single): cardinal;
       function vertex3f(const x: single; const y: single; const z:single): cardinal;
       function color4f(const r: single; const g: single; const b:single; const a:single): cardinal;
       function color3f(const r: single; const g: single; const b:single): cardinal;
       function endPrimitive(): cardinal;
   end;

implementation

end.

