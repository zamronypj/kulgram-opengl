unit baseRendererProfile;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, rendererProfile;
type
   TRendererProfile = class(TInterfacedObject, IRendererProfile)
   public
      function initialize() : boolean; virtual; abstract;
   end;

implementation

end.

