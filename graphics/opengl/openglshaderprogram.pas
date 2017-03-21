unit openglshaderprogram;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, shader, basicProgram;

type

  { TOpenGLShaderProgram }

  TOpenGLShaderProgram = class(TBasicProgram)
  public
     destructor Destroy(); override;
     function createProgram() : cardinal; override;
     function destroyProgram() : cardinal;  override;
     function attachShader(const shaderObj: IShader): cardinal; override;
     function detachShader(const shaderObj: IShader): cardinal; override;
     function linkProgram() : cardinal; override;
     function useProgram() : cardinal; override;
  end;

implementation
uses constants, openglConstants, gl, glExt;

{ TOpenGLShaderProgram }

destructor TOpenGLShaderProgram.Destroy();
begin
  destroyProgram();
  inherited Destroy;
end;

function TOpenGLShaderProgram.createProgram(): cardinal;
begin
  programId := glCreateProgram();
  case (programId = NULL_ID) of
     true : result := SHADER_CREATION_FAILED;
     false: result := SHADER_OK;
  end;
end;

function TOpenGLShaderProgram.destroyProgram(): cardinal;
begin
  if (programId <> NULL_ID) then
  begin
    glDeleteProgram(programId);
    result := SHADER_OK;
  end else
  begin
    result := SHADER_DELETION_FAILED;
  end;
end;

function TOpenGLShaderProgram.attachShader(const shaderObj: IShader): cardinal;
begin
  if shaderObj <> nil then
  begin
    glAttachShader(programId, shaderObj.id());
    result := SHADER_OK;
  end else
  begin
    result := SHADER_INVALID_OBJECT;
  end;
end;

function TOpenGLShaderProgram.detachShader(const shaderObj: IShader): cardinal;
begin
  if shaderObj <> nil then
  begin
    glDetachShader(programId, shaderObj.id());
    result := SHADER_OK;
  end else
  begin
    result := SHADER_INVALID_OBJECT;
  end;
end;

function TOpenGLShaderProgram.linkProgram(): cardinal;
begin
  glLinkProgram(programId);
  result := SHADER_OK;
end;

function TOpenGLShaderProgram.useProgram(): cardinal;
begin
  glUseProgram(programId);
  result := SHADER_OK;
end;

end.

