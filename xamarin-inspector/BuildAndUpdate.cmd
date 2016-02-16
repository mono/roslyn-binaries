@ECHO OFF

PUSHD ..\..\roslyn
msbuild /v:m /m /p:Configuration=Release Roslyn.sln
POPD

RD /S /Q Release
MD Release

FOR %%A IN (
	Microsoft.CodeAnalysis
	Microsoft.CodeAnalysis.Workspaces
	Microsoft.CodeAnalysis.Features
	Microsoft.CodeAnalysis.CSharp
	Microsoft.CodeAnalysis.CSharp.Features
	Microsoft.CodeAnalysis.CSharp.Workspaces
	Microsoft.CodeAnalysis.EditorFeatures.Text
	System.Reflection.Metadata
	System.Collections.Immutable
	System.Composition.AttributedModel
	System.Composition.Convention
	System.Composition.Hosting
	System.Composition.Runtime
	System.Composition.TypedParts
) DO (
	XCOPY /Y /Q ..\..\roslyn\binaries\Release\%%A.dll Release
	IF EXIST ..\..\roslyn\binaries\Release\%%A.pdb XCOPY /Y /Q ..\..\roslyn\binaries\Release\%%A.pdb Release
)
