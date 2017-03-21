unit openglshader;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, basicShader;

type

   { TOpenGLShader }

   TOpenGLShader = class(TBasicShader)
   public
     destructor Destroy(); override;
     function valid() : boolean; override;
     function destroyShader() : cardinal; override;
     function setSource(const source:string) : cardinal; override;
     function compile() : cardinal; override;
   end;

implementation
uses constants, openglConstants, gl, glExt;

{ TOpenGLShader }

destructor TOpenGLShader.Destroy();
begin
  if (valid()) then
  begin
    destroyShader();
  end;
  inherited Destroy();
end;

function TOpenGLShader.valid(): boolean;
begin
  result := (shaderId <> NULL_ID);
end;

function TOpenGLShader.destroyShader(): cardinal;
begin
  if (valid()) then
  begin
    glDeleteShader(shaderId);
    shaderId := NULL_ID;
    result := SHADER_OK;
  end else
  begin
    result := SHADER_DELETION_FAILED;
  end;
end;

function TOpenGLShader.setSource(const source: string): cardinal;
var shaderText: PGLChar;
begin
  shaderText:= PGLChar(source);
  glShaderSource(shaderId, 1, @shaderText, nil);
  result := SHADER_OK;
end;

function TOpenGLShader.compile(): cardinal;
begin
  glCompileShader(shaderId);
  result := SHADER_OK;
end;

end.

