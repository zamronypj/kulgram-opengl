unit openglrenderer;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, rendererTypes, rendererPrimitive, baserenderer;

type

   { TOpenGLRenderer }

   TOpenGLRenderer = class(TBaseRenderer)
   private
     rendererPrimitive : IRendererPrimitive;
   public
     constructor Create(const primitive: IRendererPrimitive);
     destructor Destroy(); override;

     function clearColor(const r: single; const g: single; const b:single; const a:single): cardinal; override;
     function clear(const clearBit : cardinal): cardinal; override;
     function getClearColorBufferBit() : cardinal; override;
     function getClearStencilBufferBit() : cardinal; override;
     function getClearDepthBufferBit() : cardinal; override;
     function getPrimitive() : IRendererPrimitive; override;
     function enable(const state:cardinal) : cardinal; override;
     function disable(const state:cardinal) : cardinal; override;

     //get matrix for model/view or projection
     function getProjectionMatrixType() : cardinal; override;
     function getModelViewMatrixType() : cardinal; override;
     function frustum(const left, top, right, bottom, znear, zfar : single) : cardinal; override;
     function perspective(const fovY, aspectRatio, zNear, zFar: single) :cardinal; override;
     function viewport(const left, top, width, height: cardinal) : cardinal; override;

     function setMatrixMode(const matrixType:cardinal) : cardinal; override;
     function setMatrix(const mat:TMat4x4f) : cardinal; override;
     function mulMatrix(const mat:TMat4x4f) : cardinal; override;
     function setIdentityMatrix() : cardinal; override;
     function beginScene(const primitive : cardinal): cardinal; override;
     function endScene(): cardinal; override;
     function vertex4f(const x: single; const y: single; const z:single; const w:single): cardinal; override;
     function vertex3f(const x: single; const y: single; const z:single): cardinal; override;
     function color4f(const r: single; const g: single; const b:single; const a:single): cardinal; override;
     function color3f(const r: single; const g: single; const b:single): cardinal; override;
   end;

implementation
uses math, gl;

{ TOpenGLRenderer }

constructor TOpenGLRenderer.Create(const primitive: IRendererPrimitive);
begin
  inherited Create();
  rendererPrimitive := primitive;
end;

destructor TOpenGLRenderer.Destroy();
begin
  rendererPrimitive := nil;
  inherited Destroy;
end;

function TOpenGLRenderer.clearColor(const r: single; const g: single;
  const b: single; const a: single): cardinal;
begin
  glClearColor(r, g, b, a);
  result:= 0;
end;

function TOpenGLRenderer.clear(const clearBit: cardinal): cardinal;
begin
  glClear(clearBit);
  result := 0;
end;

function TOpenGLRenderer.getClearColorBufferBit(): cardinal;
begin
  result := GL_COLOR_BUFFER_BIT;
end;

function TOpenGLRenderer.getClearStencilBufferBit(): cardinal;
begin
  result := GL_STENCIL_BUFFER_BIT;
end;

function TOpenGLRenderer.getClearDepthBufferBit(): cardinal;
begin
  result := GL_DEPTH_BUFFER_BIT;
end;

function TOpenGLRenderer.getPrimitive(): IRendererPrimitive;
begin
  result:= rendererPrimitive;
end;

function TOpenGLRenderer.enable(const state: cardinal): cardinal;
begin
  glEnable(state);
  result := 0;
end;

function TOpenGLRenderer.disable(const state: cardinal): cardinal;
begin
  glDisable(state);
  result := 0
end;

function TOpenGLRenderer.getProjectionMatrixType(): cardinal;
begin
  result := GL_PROJECTION;
end;

function TOpenGLRenderer.getModelViewMatrixType(): cardinal;
begin
  result := GL_MODELVIEW;
end;

function TOpenGLRenderer.frustum(const left, top, right, bottom, znear, zfar: single): cardinal;
begin
  glFrustum(left, right, bottom, top, znear, zfar);
  result := 0;
end;

function TOpenGLRenderer.perspective(const fovY, aspectRatio, zNear, zFar: single): cardinal;
var fW, fH : single;
begin
   fH := tan( fovY / 360 * pi ) * zNear;
   fW := fH * aspectRatio;
   result := frustum( -fW, fW, -fH, fH, zNear, zFar);
end;

function TOpenGLRenderer.viewport(const left, top, width, height: cardinal): cardinal;
begin
  glViewport(left, top, width, height);
  result := 0;
end;

function TOpenGLRenderer.setMatrixMode(const matrixType: cardinal): cardinal;
begin
  glMatrixMode(matrixType);
  result := 0;
end;

function TOpenGLRenderer.setMatrix(const mat: TMat4x4f): cardinal;
begin
  glLoadMatrixf(@mat);
  result := 0;
end;

function TOpenGLRenderer.mulMatrix(const mat: TMat4x4f): cardinal;
begin
  glMultMatrixf(@mat);
  result := 0;
end;

function TOpenGLRenderer.setIdentityMatrix(): cardinal;
begin
  glLoadIdentity();
  result := 0;
end;

function TOpenGLRenderer.beginScene(const primitive: cardinal): cardinal;
begin
  glBegin(primitive);
  result := 0;
end;

function TOpenGLRenderer.endScene(): cardinal;
begin
  glEnd();
  result := 0;
end;

function TOpenGLRenderer.vertex4f(const x: single; const y: single;
  const z: single; const w: single): cardinal;
begin
  glVertex4f(x, y, z, w);
  result:= 0;
end;

function TOpenGLRenderer.vertex3f(const x: single; const y: single;
  const z: single): cardinal;
begin
  glVertex3f(x, y, z);
  result:= 0;
end;

function TOpenGLRenderer.color4f(const r: single; const g: single;
  const b: single; const a: single): cardinal;
begin
  glColor4f(r, g, b, a);
  result:= 0;
end;

function TOpenGLRenderer.color3f(const r: single; const g: single;
  const b: single): cardinal;
begin
  glColor3f(r, g, b);
  result := 0;
end;


end.

