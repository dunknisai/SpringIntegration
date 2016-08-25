
;--------------------------------
;Include Modern UI

  !include "MUI2.nsh"

;--------------------------------
;General

  ;Name and file
  Name "Joget Workflow"
  ;OutFile "joget-installer.exe"

  ;Default installation folder
  ;InstallDir "$PROGRAMFILES\Joget"
  InstallDir "C:\Joget-v5"

  ;Get installation folder from registry if available
  ;InstallDirRegKey HKCU "Software\Joget"

  ;Request application privileges for Windows Vista
  RequestExecutionLevel user

;--------------------------------
;Variables and Constants

  !define INSTALL_TYPE_FULL full
  !define INSTALL_TYPE_UPGRADE upgrade
  !define INSTALL_TYPE_MINOR_UPGRADE minor_upgrade
  !define INSTALL_TYPE_UPDATE update
  !define INSTALL_TYPE_ABORT abort
  Var INSTALL_TYPE
  Var EXISTING_TOMCAT_VERSION 


;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING
  !define MUI_HEADERIMAGE
  !define MUI_HEADERIMAGE_BITMAP "joget_logo.bmp"
  !define MUI_HEADERIMAGE_RIGHT
  !define MUI_HEADERIMAGE_BITMAP_NOSTRETCH
  !define MUI_ICON "joget.ico"

;--------------------------------
;Language Selection Dialog Settings

  ;Remember the installer language
  ;!define MUI_LANGDLL_REGISTRY_ROOT "HKCU"
  ;!define MUI_LANGDLL_REGISTRY_KEY "Software\Joget"
  ;!define MUI_LANGDLL_REGISTRY_VALUENAME "Joget Installer Language"
  !define MUI_LANGDLL_ALLLANGUAGES 
;--------------------------------

;Pages

  !insertmacro MUI_PAGE_WELCOME
  !insertmacro MUI_PAGE_LICENSE "LICENSE.txt"
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
  !insertmacro MUI_PAGE_FINISH

  !insertmacro MUI_UNPAGE_WELCOME
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES
  !insertmacro MUI_UNPAGE_FINISH

;--------------------------------
;Languages

  !insertmacro MUI_LANGUAGE "English" ;first language is the default language
  !insertmacro MUI_LANGUAGE "French"
  !insertmacro MUI_LANGUAGE "German"
  !insertmacro MUI_LANGUAGE "Spanish"
  !insertmacro MUI_LANGUAGE "SpanishInternational"
  !insertmacro MUI_LANGUAGE "SimpChinese"
  !insertmacro MUI_LANGUAGE "TradChinese"
  !insertmacro MUI_LANGUAGE "Japanese"
  !insertmacro MUI_LANGUAGE "Korean"
  !insertmacro MUI_LANGUAGE "Italian"
  !insertmacro MUI_LANGUAGE "Dutch"
  !insertmacro MUI_LANGUAGE "Danish"
  !insertmacro MUI_LANGUAGE "Swedish"
  !insertmacro MUI_LANGUAGE "Norwegian"
  !insertmacro MUI_LANGUAGE "NorwegianNynorsk"
  !insertmacro MUI_LANGUAGE "Finnish"
  !insertmacro MUI_LANGUAGE "Greek"
  !insertmacro MUI_LANGUAGE "Russian"
  !insertmacro MUI_LANGUAGE "Portuguese"
  !insertmacro MUI_LANGUAGE "PortugueseBR"
  !insertmacro MUI_LANGUAGE "Polish"
  !insertmacro MUI_LANGUAGE "Ukrainian"
  !insertmacro MUI_LANGUAGE "Czech"
  !insertmacro MUI_LANGUAGE "Slovak"
  !insertmacro MUI_LANGUAGE "Croatian"
  !insertmacro MUI_LANGUAGE "Bulgarian"
  !insertmacro MUI_LANGUAGE "Hungarian"
  !insertmacro MUI_LANGUAGE "Thai"
  !insertmacro MUI_LANGUAGE "Romanian"
  !insertmacro MUI_LANGUAGE "Latvian"
  !insertmacro MUI_LANGUAGE "Macedonian"
  !insertmacro MUI_LANGUAGE "Estonian"
  !insertmacro MUI_LANGUAGE "Turkish"
  !insertmacro MUI_LANGUAGE "Lithuanian"
  !insertmacro MUI_LANGUAGE "Slovenian"
  !insertmacro MUI_LANGUAGE "Serbian"
  !insertmacro MUI_LANGUAGE "SerbianLatin"
  !insertmacro MUI_LANGUAGE "Arabic"
  !insertmacro MUI_LANGUAGE "Farsi"
  !insertmacro MUI_LANGUAGE "Hebrew"
  !insertmacro MUI_LANGUAGE "Indonesian"
  !insertmacro MUI_LANGUAGE "Mongolian"
  !insertmacro MUI_LANGUAGE "Luxembourgish"
  !insertmacro MUI_LANGUAGE "Albanian"
  !insertmacro MUI_LANGUAGE "Breton"
  !insertmacro MUI_LANGUAGE "Belarusian"
  !insertmacro MUI_LANGUAGE "Icelandic"
  !insertmacro MUI_LANGUAGE "Malay"
  !insertmacro MUI_LANGUAGE "Bosnian"
  !insertmacro MUI_LANGUAGE "Kurdish"
  !insertmacro MUI_LANGUAGE "Irish"
  !insertmacro MUI_LANGUAGE "Uzbek"
  !insertmacro MUI_LANGUAGE "Galician"
  !insertmacro MUI_LANGUAGE "Afrikaans"
  !insertmacro MUI_LANGUAGE "Catalan"
  !insertmacro MUI_LANGUAGE "Esperanto"

;--------------------------------
;Reserve Files

  ;If you are using solid compression, files that are required before
  ;the actual installation should be stored first in the data block,
  ;because this will make your installer start faster.

  !insertmacro MUI_RESERVEFILE_LANGDLL

;--------------------------------

;Installer Sections

Section "Joget Workflow" SecJoget

  SectionIn RO
  SetOutPath "$INSTDIR"

  Call CheckUpgrade

  ${If} $INSTALL_TYPE == "${INSTALL_TYPE_ABORT}"
    MessageBox MB_OK "Existing v2 installation found in the directory '$INSTDIR'.$\r$\nSorry, upgrade from this version is not supported."
    Quit
  ${EndIf}

  ${If} $INSTALL_TYPE != "${INSTALL_TYPE_FULL}"
    ;MessageBox MB_OK $INSTALL_TYPE
    MessageBox MB_YESNO "Existing installation found in the directory '$INSTDIR'.$\r$\nWould you like to update? $\r$\n" IDYES DoUpgrade
    MessageBox MB_OK "Installation aborted"
    Quit

    DoUpgrade:
        ;MessageBox MB_OK "Upgrading"
        RmDir /r "$SMPROGRAMS\Joget Workflow v3 Enterprise"
        RmDir /r "$SMPROGRAMS\Joget Workflow v4 Enterprise"
        RmDir /r "$INSTDIR\apache-tomcat-$EXISTING_TOMCAT_VERSION\webapps\jw"
        RmDir /r "$INSTDIR\apache-tomcat-$EXISTING_TOMCAT_VERSION\webapps\jwdesigner"
        CreateDirectory "$INSTDIR\apache-tomcat-$EXISTING_TOMCAT_VERSION\webapps"
        File /oname=apache-tomcat-$EXISTING_TOMCAT_VERSION\webapps\jw.war apache-tomcat-8.0.20\webapps\jw.war
        File /oname=apache-tomcat-$EXISTING_TOMCAT_VERSION\webapps\jwdesigner.war apache-tomcat-8.0.20\webapps\jwdesigner.war
        CreateDirectory "$INSTDIR\data"
        File /oname=data\jwdb-empty.sql data\jwdb-empty.sql
        File /oname=data\jwdb-sample.sql data\jwdb-sample.sql
        File build.xml
        File LICENSE.txt
        File NOTICE.txt
        File VERSION.txt
        File CHANGES.txt
    Return

  ${EndIf}

  ;Joget Files Here
  File /r apache-ant-1.7.1
  CreateDirectory "$INSTDIR\apache-tomcat-8.0.20\webapps"
  File /oname=apache-tomcat-8.0.20\webapps\jw.war apache-tomcat-8.0.20\webapps\jw.war
  File /oname=apache-tomcat-8.0.20\webapps\jwdesigner.war apache-tomcat-8.0.20\webapps\jwdesigner.war
  CreateDirectory "$INSTDIR\data"
  File /oname=data\jwdb-empty.sql data\jwdb-empty.sql
  File /oname=data\jwdb-sample.sql data\jwdb-sample.sql
  ;File docs
  File /r wflow*.*
  File build.xml
  File LICENSE.txt
  File NOTICE.txt
  File VERSION.txt
  File CHANGES.txt
  ;File README.txt
  File joget.ico
  File joget_start.ico
  File joget_stop.ico

  ;Store installation folder
  ;WriteRegStr HKCU "Software\Joget" "" $INSTDIR

  ;Create uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"

SectionEnd

Section "Apache Tomcat 8" SecTomcat

  SectionIn RO
  SetOutPath "$INSTDIR"

${If} $INSTALL_TYPE == "${INSTALL_TYPE_FULL}"
  ;Tomcat File Here
  File /r /x *.war apache-tomcat-8.0.20
  File tomcat8-run.bat
  File tomcat8-stop.bat
  File joget-start.bat
  File joget-stop.bat

  CreateShortCut "$INSTDIR\Start Joget Server.lnk" "$INSTDIR\joget-start.bat" "Start Joget Server" "$INSTDIR\joget_start.ico"
  CreateShortCut "$INSTDIR\Stop Joget Server.lnk" "$INSTDIR\joget-stop.bat" "Stop Joget Server" "$INSTDIR\joget_stop.ico"
${EndIf}

SectionEnd

Section "Java 7" SecJava

  SectionIn RO
  SetOutPath "$INSTDIR"

  ${If} $INSTALL_TYPE == "${INSTALL_TYPE_FULL}"  
    ;Java Files Here
    File /r jre1.7.0_76
  ${EndIf}  

SectionEnd

Section "MySQL 5" SecMySQL

  SectionIn RO
  SetOutPath "$INSTDIR"

  ${If} $INSTALL_TYPE == "${INSTALL_TYPE_FULL}"
    ;MySQL Files Here
    File /r mysql-5.0.96-win32
    File mysql-start.bat
    File mysql-stop.bat
  ${EndIf}

SectionEnd

Section "Start Menu Shortcuts" SecStartMenu

  SetOutPath "$INSTDIR"

  CreateDirectory "$SMPROGRAMS\Joget Workflow v5"
  CreateShortCut "$SMPROGRAMS\Joget Workflow v5\Start Joget Server.lnk" "$INSTDIR\joget-start.bat" "Start Joget Server" "$INSTDIR\joget_start.ico"
  CreateShortCut "$SMPROGRAMS\Joget Workflow v5\Stop Joget Server.lnk" "$INSTDIR\joget-stop.bat" "Stop Joget Server" "$INSTDIR\joget_stop.ico"
  CreateShortCut "$SMPROGRAMS\Joget Workflow v5\App Center.lnk" "http://localhost:8080/jw" "App Center" "$INSTDIR\joget.ico"
  CreateShortCut "$SMPROGRAMS\Joget Workflow v5\www.joget.org.lnk" "http://www.joget.org" "www.joget.org" "$INSTDIR\joget.ico"

SectionEnd

;--------------------------------
;Installer Functions

Function .onInit

  
  !insertmacro MUI_LANGDLL_DISPLAY

FunctionEnd


;--------------------------------
;Functions

Function CheckUpgrade

  ${If} ${FileExists} $INSTDIR\apache-tomcat-6.0.18\webapps\wflow-designerweb.war
    StrCpy $INSTALL_TYPE ${INSTALL_TYPE_ABORT}
  ${ElseIf} ${FileExists} $INSTDIR\apache-tomcat-8.0.20\webapps\jw.war
    StrCpy $INSTALL_TYPE ${INSTALL_TYPE_UPDATE}
    StrCpy $EXISTING_TOMCAT_VERSION "8.0.20"  
  ${ElseIf} ${FileExists} $INSTDIR\apache-tomcat-7.0.52\webapps\jw.war
    StrCpy $INSTALL_TYPE ${INSTALL_TYPE_UPGRADE}
    StrCpy $EXISTING_TOMCAT_VERSION "7.0.52"
  ${ElseIf} ${FileExists} $INSTDIR\apache-tomcat-7.0.39\webapps\jw.war
    StrCpy $INSTALL_TYPE ${INSTALL_TYPE_UPGRADE}
    StrCpy $EXISTING_TOMCAT_VERSION "7.0.39"
  ${ElseIf} ${FileExists} $INSTDIR\apache-tomcat-6.0.18\webapps\jw.war
    StrCpy $INSTALL_TYPE ${INSTALL_TYPE_UPGRADE}
    StrCpy $EXISTING_TOMCAT_VERSION "6.0.18"
  ${Else}
    StrCpy $INSTALL_TYPE ${INSTALL_TYPE_FULL}
  ${EndIf}
  ;MessageBox MB_OK $INSTALL_TYPE

FunctionEnd


;--------------------------------
;Descriptions

  ;Language strings
  LangString DESC_SecJoget ${LANG_ENGLISH} "Core Joget Workflow Application"
  LangString DESC_SecTomcat ${LANG_ENGLISH} "Apache Tomcat Web Application Server"
  LangString DESC_SecJava ${LANG_ENGLISH} "Java 7 Standard Edition"
  LangString DESC_SecMySQL ${LANG_ENGLISH} "MySQL 5 Database Server"
  LangString DESC_SecStartMenu ${LANG_ENGLISH} "Start Menu Shortcuts"

  ;Assign language strings to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${SecJoget} $(DESC_SecJoget)
    !insertmacro MUI_DESCRIPTION_TEXT ${SecTomcat} $(DESC_SecTomcat)
    !insertmacro MUI_DESCRIPTION_TEXT ${SecJava} $(DESC_SecJava)
    !insertmacro MUI_DESCRIPTION_TEXT ${SecMySQL} $(DESC_SecMySQL)
    !insertmacro MUI_DESCRIPTION_TEXT ${SecStartMenu} $(DESC_SecStartMenu)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END

;--------------------------------
;Uninstaller Section

Section "Uninstall"


  ;Uninstall Files Here
  RMDir /r "$SMPROGRAMS\Joget Workflow v5"

  RmDir /r "$INSTDIR\apache-ant-1.7.1"
  RmDir /r "$INSTDIR\jre1.7.0_76"
  RmDir /r "$INSTDIR\apache-tomcat-8.0.20\webapps\jw"
  RmDir /r "$INSTDIR\apache-tomcat-8.0.20\webapps\jwdesigner"
  Delete "$INSTDIR\apache-tomcat-8.0.20\webapps\jw.war"
  Delete "$INSTDIR\apache-tomcat-8.0.20\webapps\jwdesigner.war"

  Delete "$INSTDIR\build.xml"
  Delete "$INSTDIR\LICENSE.txt"
  Delete "$INSTDIR\NOTICE.txt"
  Delete "$INSTDIR\VERSION.txt"
  Delete "$INSTDIR\README.txt"
  Delete "$INSTDIR\CHANGES.txt"
  Delete "$INSTDIR\joget.ico"
  Delete "$INSTDIR\joget_start.ico"
  Delete "$INSTDIR\joget_stop.ico"
  Delete "$INSTDIR\Start Joget Server.lnk"
  Delete "$INSTDIR\Stop Joget Server.lnk"
  Delete "$INSTDIR\tomcat8-run.bat"
  Delete "$INSTDIR\tomcat8-stop.bat"
  Delete "$INSTDIR\mysql-start.bat"
  Delete "$INSTDIR\mysql-stop.bat"
  Delete "$INSTDIR\joget-start.bat"
  Delete "$INSTDIR\joget-stop.bat"

  Delete "$INSTDIR\Uninstall.exe"

  ;RMDir "$INSTDIR"

  ;DeleteRegKey /ifempty HKCU "Software\Joget"

  MessageBox MB_OK "Uninstallation complete. Data files in $INSTDIR have not been deleted. $\r$\nPlease delete the folder manually if you do not wish to keep the data."

SectionEnd

;--------------------------------
;Uninstaller Functions

Function un.onInit

  !insertmacro MUI_UNGETLANGUAGE

FunctionEnd