unit renderer;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, rendererTypes, rendererPrimitive;

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
       function enable(const state:cardinal) : cardinal;
       function disable(const state:cardinal) : cardinal;

       //get matrix for model/view or projection
       function getProjectionMatrixType() : cardinal;
       function getModelViewMatrixType() : cardinal;

       function frustum(const left, top, right, bottom, zNear, zFar : single) : cardinal;
       function perspective(const fovY, aspectRatio, zNear, zFar: single) : cardinal;
       function viewport(const left, top, width, height: cardinal) : cardinal;

       function setMatrixMode(const matrixType:cardinal) : cardinal;
       function setMatrix(const mat:TMat4x4f) : cardinal;
       function mulMatrix(const mat:TMat4x4f) : cardinal;
       function setIdentityMatrix() : cardinal;

       function beginScene(const primitive : cardinal): cardinal;
       function endScene(): cardinal;

       function vertex4f(const x: single; const y: single; const z:single; const w:single): cardinal;
       function vertex3f(const x: single; const y: single; const z:single): cardinal;
       function color4f(const r: single; const g: single; const b:single; const a:single): cardinal;
       function color3f(const r: single; const g: single; const b:single): cardinal;
   end;

implementation

end.

