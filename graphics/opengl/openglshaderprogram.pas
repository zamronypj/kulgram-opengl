{-----------------------------------
 Base OpenGL Shader program implementation
-------------------------------------
This class provides shader program creation and
linking
-------------------------------------
(c) 2017 Zamrony P. Juhara <zamronypj@yahoo.com>
http://github.com/zamronypj/kulgram-opengl
-------------------------------------
Tested on:
-Ubuntu 14.04 64 bit Intel core i7, 8 GB RAM
-Ubuntu 16.04 64 bit AMD A9-9400, 4 GB RAM
-------------------------------------
TODO: Need to be tested on other
platform
-------------------------------------}
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
     function valid() : boolean; override;
     function createProgram() : cardinal; override;
     function destroyProgram() : cardinal;  override;
     function attachShader(const shaderObj: IShader): cardinal; override;
     function detachShader(const shaderObj: IShader): cardinal; override;
     function linkProgram() : cardinal; override;
     function useProgram() : cardinal; override;
     function unuseProgram() : cardinal; override;
  end;

implementation
uses constants, openglConstants, gl, glExt;

{ TOpenGLShaderProgram }

destructor TOpenGLShaderProgram.Destroy();
begin
  destroyProgram();
  inherited Destroy;
end;

function TOpenGLShaderProgram.valid(): boolean;
begin
  result := (programId <> NULL_ID);
end;

function TOpenGLShaderProgram.createProgram(): cardinal;
begin
  programId := glCreateProgram();
  case (valid()) of
     false : result := SHADER_CREATION_FAILED;
     true: result := SHADER_OK;
  end;
end;

function TOpenGLShaderProgram.destroyProgram(): cardinal;
begin
  if (valid()) then
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
  if (valid() and (shaderObj <> nil)) then
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
  if (valid() and (shaderObj <> nil)) then
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

function TOpenGLShaderProgram.unuseProgram(): cardinal;
begin
  glUseProgram(NULL_ID);
  result := SHADER_OK;
end;

end.

