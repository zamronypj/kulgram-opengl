{-----------------------------------
 Shader program interface
-------------------------------------
 interface for class that provides shader
 program functionalities
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
unit shaderprogram;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, baseshader, shader;

type
   IShaderProgram = interface(IBaseShader)
       ['{5F63D3A7-84AA-4E70-9D8F-79C50D82CDD1}']
       function createProgram() : cardinal;
       function destroyProgram() : cardinal;
       function attachShader(const shaderObj: IShader): cardinal;
       function detachShader(const shaderObj: IShader): cardinal;
       function linkProgram() : cardinal;
       function useProgram() : cardinal;
       function unuseProgram() : cardinal;
   end;

implementation

end.

