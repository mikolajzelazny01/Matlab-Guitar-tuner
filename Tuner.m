clc;
%clear all;
close all;
uruchom=1;
while uruchom==1
fprintf('Witaj w stroiku do gitary\n');
fprintf('Wybierz strunę którą chcesz nastroić\n');
fprintf('1 - struna e\n');
fprintf('2 - struna B\n');
fprintf('3 - struna G\n');
fprintf('4 - struna D\n');
fprintf('5 - struna A\n');
fprintf('6 - struna E\n');
nrstruny = input('Wprowadz nr struny \n');

switch nrstruny    

    case 1 %struna e

error= -10;
while (error<=-0.5 || error>=0.5)

%czytanie dzwieku
deviceReader = audioDeviceReader;
Fs=get(deviceReader,'SampleRate');
Time=0.5;
dt=1/Fs;
dN=floor(Time/dt);
dN=2^(nextpow2(floor(Fs*Time)));
tvec=dt:dt:10*Time;

tvec=(1:10*dN)*dt;

J=length(tvec);
df=Fs/J;
f=[0:J-1]*df;
yvec=zeros(size(tvec));
N=floor(length(tvec)/10);
set(deviceReader,'SamplesPerFrame',2^(nextpow2(floor(Fs*Time))));
set(deviceReader,'NumChannels',1);
set(deviceReader,'SampleRate',Fs);
setup(deviceReader)
memory=[];
k=0;
%figure(1)
while (k<2)
   % fprintf('nasluchiwanie\n')
k=k+1;
tic;
while (toc < Time)
acquiredAudio = deviceReader();
end
memory=[memory acquiredAudio.'];
yvec(1:9*dN)=yvec(dN+1:10*dN);
yvec(9*dN+1:10*dN)=acquiredAudio(:);
%plot(tvec,yvec)
%xlabel('Time [s]')
%xlim([tvec(1) tvec(end)])
%drawnow
end
release(deviceReader)
%koniec zczytywania


%filtr 
B1=fir1(4500,[0.01133786848 0.01814058957],'bandpass');
dzwiek_po_filtracji=filter(B1,1,yvec);
A1=abs(fft(dzwiek_po_filtracji));

ind = A1 > 40;
A1(~ind) = 0;
%odczytanie czestotliwosci
for i=1:length(A1)
if (floor(A1(i)) == floor(max(A1)))
    czest_odczyt= f(i)
break
end
end



% porownanie czestotliwosci 
czest_zadana = 329.63;
error = czest_zadana - czest_odczyt;
if ( error> 0.5)
    fprintf('Zwiększ naciąg struny\n');
else
   if ( error< -0.5)
       fprintf('Zmniejsz naciąg struny\n')
   
   end
end

pause(1);
end
fprintf('Nastroiłeś strunę e !\n')


case 2 %struna B
error= -10;
while (error<=-0.5 || error>=0.5)

%czytanie dzwieku
deviceReader = audioDeviceReader;
Fs=get(deviceReader,'SampleRate');
Time=0.5;
dt=1/Fs;
dN=floor(Time/dt);
dN=2^(nextpow2(floor(Fs*Time)));
tvec=dt:dt:10*Time;

tvec=(1:10*dN)*dt;

J=length(tvec);
df=Fs/J;
f=[0:J-1]*df;
yvec=zeros(size(tvec));
N=floor(length(tvec)/10);
set(deviceReader,'SamplesPerFrame',2^(nextpow2(floor(Fs*Time))));
set(deviceReader,'NumChannels',1);
set(deviceReader,'SampleRate',Fs);
setup(deviceReader)
memory=[];
k=0;
%figure(1)
while (k<2)
   % fprintf('nasluchiwanie\n')
k=k+1;
tic;
while (toc < Time)
acquiredAudio = deviceReader();
end
memory=[memory acquiredAudio.'];
yvec(1:9*dN)=yvec(dN+1:10*dN);
yvec(9*dN+1:10*dN)=acquiredAudio(:);
%plot(tvec,yvec)
%xlabel('Time [s]')
%xlim([tvec(1) tvec(end)])
%drawnow
end
release(deviceReader)
%koniec zczytywania


%filtr 
B1=fir1(4500,[0.009070294785 0.01360544218],'bandpass');
dzwiek_po_filtracji=filter(B1,1,yvec);
A1=abs(fft(dzwiek_po_filtracji));

ind = A1 > 40;
A1(~ind) = 0;
%odczytanie czestotliwosci
for i=1:length(A1)
if (floor(A1(i)) == floor(max(A1)))
    czest_odczyt= f(i)
break
end
end



% porownanie czestotliwosci 
czest_zadana = 246.94;
error = czest_zadana - czest_odczyt;
if ( error> 0.5)
    fprintf('Zwiększ naciąg struny\n');
else
   if ( error< -0.5)
       fprintf('Zmniejsz naciąg struny\n')
   
   end
end

pause(1);
end
fprintf('Nastroiłeś strunę B !\n')



    case 3 %struna G
error= -10;
while (error<=-0.5 || error>=0.5)

%czytanie dzwieku
deviceReader = audioDeviceReader;
Fs=get(deviceReader,'SampleRate');
Time=0.5;
dt=1/Fs;
dN=floor(Time/dt);
dN=2^(nextpow2(floor(Fs*Time)));
tvec=dt:dt:10*Time;

tvec=(1:10*dN)*dt;

J=length(tvec);
df=Fs/J;
f=[0:J-1]*df;
yvec=zeros(size(tvec));
N=floor(length(tvec)/10);
set(deviceReader,'SamplesPerFrame',2^(nextpow2(floor(Fs*Time))));
set(deviceReader,'NumChannels',1);
set(deviceReader,'SampleRate',Fs);
setup(deviceReader)
memory=[];
k=0;
%figure(1)
while (k<2)
   % fprintf('nasluchiwanie\n')
k=k+1;
tic;
while (toc < Time)
acquiredAudio = deviceReader();
end
memory=[memory acquiredAudio.'];
yvec(1:9*dN)=yvec(dN+1:10*dN);
yvec(9*dN+1:10*dN)=acquiredAudio(:);
%plot(tvec,yvec)
%xlabel('Time [s]')
%xlim([tvec(1) tvec(end)])
%drawnow
end
release(deviceReader)
%koniec zczytywania


%filtr 
B1=fir1(4500,[0.006802721088 0.01088435374],'bandpass');
dzwiek_po_filtracji=filter(B1,1,yvec);
A1=abs(fft(dzwiek_po_filtracji));

ind = A1 > 40;
A1(~ind) = 0;
%odczytanie czestotliwosci
for i=1:length(A1)
if (floor(A1(i)) == floor(max(A1)))
    czest_odczyt= f(i)
break
end
end



% porownanie czestotliwosci 
czest_zadana = 196;
error = czest_zadana - czest_odczyt;
if ( error> 0.5)
    fprintf('Zwiększ naciąg struny\n');
else
   if ( error< -0.5)
       fprintf('Zmniejsz naciąg struny\n')
   
   end
end

pause(1);
end
fprintf('Nastroiłeś strunę G !\n')




    case 4 %struna D
error= -10;
while (error<=-1 || error>=1)

%czytanie dzwieku
deviceReader = audioDeviceReader;
Fs=get(deviceReader,'SampleRate');
Time=0.5;
dt=1/Fs;
dN=floor(Time/dt);
dN=2^(nextpow2(floor(Fs*Time)));
tvec=dt:dt:10*Time;

tvec=(1:10*dN)*dt;

J=length(tvec);
df=Fs/J;
f=[0:J-1]*df;
yvec=zeros(size(tvec));
N=floor(length(tvec)/10);
set(deviceReader,'SamplesPerFrame',2^(nextpow2(floor(Fs*Time))));
set(deviceReader,'NumChannels',1);
set(deviceReader,'SampleRate',Fs);
setup(deviceReader)
memory=[];
k=0;
%figure(1)
while (k<2)
   % fprintf('nasluchiwanie\n')
k=k+1;
tic;
while (toc < Time)
acquiredAudio = deviceReader();
end
memory=[memory acquiredAudio.'];
yvec(1:9*dN)=yvec(dN+1:10*dN);
yvec(9*dN+1:10*dN)=acquiredAudio(:);
%plot(tvec,yvec)
%xlabel('Time [s]')
%xlim([tvec(1) tvec(end)])
%drawnow
end
release(deviceReader)
%koniec zczytywania


%filtr 
B1=fir1(4500,[0.004988662132 0.008163265306],'bandpass');
dzwiek_po_filtracji=filter(B1,1,yvec);
A1=abs(fft(dzwiek_po_filtracji));

ind = A1 > 40;
A1(~ind) = 0;
%odczytanie czestotliwosci
for i=1:length(A1)
if (floor(A1(i)) == floor(max(A1)))
    czest_odczyt= f(i)
break
end
end



% porownanie czestotliwosci 
czest_zadana = 146.83;
error = czest_zadana - czest_odczyt;
if ( error> 0.5)
    fprintf('Zwiększ naciąg struny\n');
else
   if ( error< -0.5)
       fprintf('Zmniejsz naciąg struny\n')
   
   end
end

pause(1);
end
fprintf('Nastroiłeś strunę D !\n')



    case 5 %struna A
error= -10;
while (error<=-0.5 || error>=0.5)

%czytanie dzwieku
deviceReader = audioDeviceReader;
Fs=get(deviceReader,'SampleRate');
Time=0.5;
dt=1/Fs;
dN=floor(Time/dt);
dN=2^(nextpow2(floor(Fs*Time)));
tvec=dt:dt:10*Time;

tvec=(1:10*dN)*dt;

J=length(tvec);
df=Fs/J;
f=[0:J-1]*df;
yvec=zeros(size(tvec));
N=floor(length(tvec)/10);
set(deviceReader,'SamplesPerFrame',2^(nextpow2(floor(Fs*Time))));
set(deviceReader,'NumChannels',1);
set(deviceReader,'SampleRate',Fs);
setup(deviceReader)
memory=[];
k=0;
%figure(1)
while (k<2)
   % fprintf('nasluchiwanie\n')
k=k+1;
tic;
while (toc < Time)
acquiredAudio = deviceReader();
end
memory=[memory acquiredAudio.'];
yvec(1:9*dN)=yvec(dN+1:10*dN);
yvec(9*dN+1:10*dN)=acquiredAudio(:);
%plot(tvec,yvec)
%xlabel('Time [s]')
%xlim([tvec(1) tvec(end)])
%drawnow
end
release(deviceReader)
%koniec zczytywania


%filtr 
B1=fir1(4500,[0.002721088435 0.006802721088],'bandpass');
dzwiek_po_filtracji=filter(B1,1,yvec);
A1=abs(fft(dzwiek_po_filtracji));

ind = A1 > 20;
A1(~ind) = 0;
%odczytanie czestotliwosci
for i=1:length(A1)
if (floor(A1(i)) == floor(max(A1)))
    czest_odczyt= f(i)
break
end
end



% porownanie czestotliwosci 
czest_zadana = 110;
error = czest_zadana - czest_odczyt;
if ( error> 0.5)
    fprintf('Zwiększ naciąg struny\n');
else
   if ( error< -0.5)
       fprintf('Zmniejsz naciąg struny\n')
   
   end
end

pause(1);
end
fprintf('Nastroiłeś strunę A !\n')




    case 6 %struna E
error= -10;
while (error<=-0.5 || error>=0.5)

%czytanie dzwieku
deviceReader = audioDeviceReader;
Fs=get(deviceReader,'SampleRate');
Time=0.5;
dt=1/Fs;
dN=floor(Time/dt);
dN=2^(nextpow2(floor(Fs*Time)));
tvec=dt:dt:10*Time;

tvec=(1:10*dN)*dt;

J=length(tvec);
df=Fs/J;
f=[0:J-1]*df;
yvec=zeros(size(tvec));
N=floor(length(tvec)/10);
set(deviceReader,'SamplesPerFrame',2^(nextpow2(floor(Fs*Time))));
set(deviceReader,'NumChannels',1);
set(deviceReader,'SampleRate',Fs);
setup(deviceReader)
memory=[];
k=0;
%figure(1)
while (k<2)
   % fprintf('nasluchiwanie\n')
k=k+1;
tic;
while (toc < Time)
acquiredAudio = deviceReader();
end
memory=[memory acquiredAudio.'];
yvec(1:9*dN)=yvec(dN+1:10*dN);
yvec(9*dN+1:10*dN)=acquiredAudio(:);
%plot(tvec,yvec)
%xlabel('Time [s]')
%xlim([tvec(1) tvec(end)])
%drawnow
end
release(deviceReader)
%koniec zczytywania


%filtr 
B1=fir1(4500,[0.001360544218 0.005442176871],'bandpass');
dzwiek_po_filtracji=filter(B1,1,yvec);
A1=abs(fft(dzwiek_po_filtracji));
A2 = A1;
ind = A1 > 10;
A1(~ind) = 0;
%odczytanie czestotliwosci
for i=1:length(A1)
if (floor(A1(i)) == floor(max(A1)))
    czest_odczyt= f(i)
break
end
end



% porownanie czestotliwosci 
czest_zadana = 82.41;
error = czest_zadana - czest_odczyt;
if ( error> 0.5)
    fprintf('Zwiększ naciąg struny\n');
else
   if ( error< -0.5)
       fprintf('Zmniejsz naciąg struny\n')
   
   end
end

pause(1);
end
fprintf('Nastroiłeś strunę E !\n')


    otherwise
        fprintf('wybrano zły numer\n');

end
uruchom = input('Czy chcesz nastroic kolejna strunę ?\n Jeśli tak wybierz 1 jeśli nie wybierz 0 : ');


end
fprintf('Dziękujemy za skorzytanie z naszego stroika do gitary ;)\n');
%plot(f,A1)
%axis([250, 400 ,0,200]);
%figure(2);
%freqz(B1,1,length(yvec),Fs)

