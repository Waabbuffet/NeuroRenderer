@Echo off
for /f "delims=[] tokens=2" %%a in ('ping -4 -n 1 %ComputerName% ^| findstr [') do set NetworkIP=%%a
docker run -e DISPLAY=%NetworkIP%:0.0 --rm gpu_mans sh -c "cmake -S . && make all && ls ./src &&./src/RayTracer" 
pause


::This will share the directory but I am running into a problem with opening visual studio and creating images.. -v %cd%/src:/app 