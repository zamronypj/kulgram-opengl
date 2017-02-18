unit openglrenderer;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, rendererPrimitive, baserenderer;

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
     function setIdentityMatrix() : cardinal; override;
     function beginPrimitive(const primitive : cardinal): cardinal; override;
     function vertex4f(const x: single; const y: single; const z:single; const w:single): cardinal; override;
     function vertex3f(const x: single; const y: single; const z:single): cardinal; override;
     function color4f(const r: single; const g: single; const b:single; const a:single): cardinal; override;
     function color3f(const r: single; const g: single; const b:single): cardinal; override;
     function endPrimitive(): cardinal; override;
   end;

implementation
uses gl;

{ TOpenGLRenderer }

constructor TOpenGLRenderer.Create(const primitive: IRendererPrimitive);
begin
  inherited Create();
  rendererPrimitive := primitive;
end;

destructor TOpenGLRenderer.Destroy;
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

function TOpenGLRenderer.setIdentityMatrix(): cardinal;
begin
  glLoadIdentity();
  result := 0;
end;

function TOpenGLRenderer.beginPrimitive(const primitive: cardinal): cardinal;
begin
  glBegin(primitive);
  result := 0;
end;

function TOpenGLRenderer.endPrimitive(): cardinal;
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

