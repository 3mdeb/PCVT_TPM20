@echo off 
:: Workflow for generating platform certificate from XML files 

SETLOCAL

set BLUE=[94m
set NC=[0m
set GREEN=[92m
set RED=[91m

set zz=0
set name=%0

:START
    if (%1)==() (
        goto END    
    )
    if %1==-zz (
        set zz=1
    )
    if %1==-xcommon if not (%2)==() (
        set xcommon=%2
        shift
    )
    if %1==-xek if not (%2)==() (
        set xek=%2
        shift
    )
    if %1==-xplat if not (%2)==() (
        set xplat=%2
        shift
    )
    if %1==-privkey if not (%2)==() (
        set privkey=%2
        shift
    )   
    if %1==-out if not (%2)==() (
        set out=%2
        shift
    )
    if %1==-der if not (%2)==() (
        set der=%2
        shift
    )       
    if %1==-v (
        set v=-v
    )
    shift
    goto START
:END
    
:: Test legitimate combinations

set valid=1

:: at least one input xml file is required
if not defined xcommon if not defined xek if not defined xplat (
    set valid=0
)

:: output file name is required
if not defined out (
    set valid=0
)

if %valid%==0 (
    echo %name%: Generate a Platform Certificate from ^(combining^) information input in XML formatted file^(s^)
    echo Usage: %name% [OPTIONS]
    echo OPTIONS:
    echo           -xcommon ^<filename^>  XML file containing information common accross platforms
    echo                                ^(at least one of -xcommon, -xek, -xplat is required^)
    echo           -xek ^<filename^>      XML file containing information contained in the Endorsement Key
    echo                                ^(The intended for EKIssuer, EKCertSerialNumber - which go into Holder field
    echo                                 This file will typically be auto-generated by another tool in this toolset from the EK Cert in the TPM^)
    echo                                ^(at least one of -xcommon, -xek, -xplat is required^)
    echo           -xplat ^<filename^>    XML file containing information specific to this platform
    echo                                ^(at least one of -xcommon, -xek, -xplat is required^)
    echo           -privkey ^<filename^>  Signing private key for generated certificate
    echo                                ^(If this is not present the Platform Certificate will be signed with a default generic key^)
    echo           -out ^<filename^>      Output Platform Certificate file name ^(REQUIRED^)
    echo           -der		       Output file will be in DER format if present, otherwise output will be in PEM format
    echo           -v                   ^(Verbose  mode^)
    exit /b
)

:: Get working directory
set DIR=%cd%

:: Create the optional command line arguments
set opt_cmd_line=

if defined xcommon ( 
    set opt_cmd_line=%opt_cmd_line% -c=%xcommon%
)

if defined xplat ( 
    set opt_cmd_line=%opt_cmd_line% -p=%xplat%
)

if defined xek ( 
    set opt_cmd_line=%opt_cmd_line% -e=%xek%
)

if defined privkey ( 
    set opt_cmd_line=%opt_cmd_line% -k=%privkey%
)

:: Generate the platform certificate
echo. 1>&2
echo %BLUE%Generating Platform Certificate from input XML files%NC% 1>&2

echo java -cp "%DIR%\tpm20VerificationToolset1.1.jar;%DIR%\lib\*" com.trustiphi.tpm2verification.PlatformCertFromXml %opt_cmd_line% -o=%out% %der% %v% 1>&2

(java -cp "%DIR%\tpm20VerificationToolset1.1.jar;%DIR%\lib\*" com.trustiphi.tpm2verification.PlatformCertFromXml %opt_cmd_line% -o=%out% %der% %v% 1>&2)

if %errorlevel% neq 0 (
    echo %RED%Failed to generate Platform Certificate %out%%NC% 1>&2
) else (
    echo %GREEN%Successfully generated Platform Certificate %out%%NC% 1>&2
)

ENDLOCAL