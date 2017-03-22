{-----------------------------------
 Shader interface
-------------------------------------
Interface for class provides shader creation
and compilation
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
unit shader;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, baseshader;
type

   IShader = interface(IBaseShader)
       ['{7BE5B3BF-F9CA-4B43-B5EB-3B3E9D60EB9C}']
       function createShader() : cardinal;
       function destroyShader() : cardinal;
       function setSource(const source:string) : cardinal;
       function compile() : cardinal;
   end;

implementation

end.

