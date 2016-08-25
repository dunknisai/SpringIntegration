@ECHO OFF

REM Start MySQL
ECHO == Starting MySQL ==
ECHO.
CALL .\mysql-start.bat
ECHO.

REM Start Tomcat
set JAVA_HOME=.\jre1.7.0_76
set CATALINA_HOME=.\apache-tomcat-8.0.20
set JAVA_OPTS=-XX:MaxPermSize=128m -Xmx512M -Dwflow.home=./wflow/
REM set JAVA_OPTS=-XX:MaxPermSize=128m -Xmx1024M -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,suspend=n,server=y,address=5115 -Dwflow.home=./wflow/
ECHO == Starting Tomcat from %CATALINA_HOME% ==
ECHO.
%CATALINA_HOME%\bin\catalina.bat run


