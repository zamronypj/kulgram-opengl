unit OpenGL20RendererProfile;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, baseRendererProfile;
type

   { TOpenGL20RendererProfile }

   TOpenGL20RendererProfile = class(TRendererProfile)
   public
      function initialize() : boolean; override;
   end;

implementation
uses glExt;

{ TOpenGL20RendererProfile }

function TOpenGL20RendererProfile.initialize() : boolean;
begin
  result := Load_GL_Version_2_0();
end;

end.

