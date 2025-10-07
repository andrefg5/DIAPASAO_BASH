#!/bin/bash

#sempre execulte com sudo, código feito para ter o mesmo funcionamento de um diapasão e para poder tocar algumas músicas
#use da maneira que quiser
#ele é focado na afinação, mas, com base na música feita neste programa vc pode fazer outras

C0=16
Cs0=17   
D0=18   
Ds0=19   
E0=21   
F0=22   
Fs0=23   
G0=25   
Gs0=26   
A0=27.5
As0=29   
B0=31   

C1=33   
Cs1=35  
D1=37   
Ds1=39   
E1=41   
F1=44   
Fs1=46   
G1=49   
Gs1=52   
A1=55   
As1=58   
B1=62   

C2=65  
Cs2=69  
D2=73  
Ds2=78  
E2=82 
F2=87  
Fs2=92  
G2=98  
Gs2=104 
A2=110 
As2=117 
B2=123 

C3=130 
Cs3=138 
D3=146
Ds3=155 
E3=164
F3=174 
Fs3=184 
G3=195 
Gs3=207 
A3=220 
As3=233 
B3=246 

C4=261
Cs4=277 
D4=293 
Ds4=311 
E4=329
F4=349 
Fs4=369 
G4=392 
Gs4=415 
A4=440 
As4=466 
B4=493 

C5=523 
Cs5=554 
D5=587 
Ds5=622 
E5=659 
F5=698 
Fs5=739 
G5=783 
Gs5=830 
A5=880 
As5=932 
B5=987 

C6=1046
Cs6=1108 
D6=1174 
Ds6=1244 
E6=1318 
F6=1396 
Fs6=1479 
G6=1567
Gs6=1661 
A6=1760 
As6=1864 
B6=1975 

C7=2093 
Cs7=2217 
D7=2349 
Ds7=2489
E7=2637 
F7=2793 
Fs7=2959 
G7=3135 
Gs7=3322 
A7=3520 
As7=3729 
B7=3951 

C8=4186 
Cs8=4435 
D8=4699 
Ds8=4978 
E8=5274 
F8=5588 
Fs8=5919 
G8=6271 
Gs8=6644 
A8=7040 
As8=7458  
B8=7902 

C9=8372
Cs9=8870 
D9=9397 
Ds9=9956 
E9=10548
F9=11175 
Fs9=11840 
G9=12544 
Gs9=13289 
A9=14080 
As9=14917 
B9=15804

function verifica_sox
{
	if dpkg -s sox &>/dev/null; then
	    echo "sox está instalado"
	else
	    sudo apt install -y sox
	    if dpkg -s sox &>/dev/null; then
            echo "sox instalado com sucesso!"
        else
            echo "Falha ao instalar o sox."
        fi
    fi

}

function tabela_de_notas_e_seus_Hz
{
	echo -e "
	Dó0  C0  = 16 Hz   
	Dó#0 C#0 = 17 Hz   
	Ré0  D0  = 18 Hz   
	Ré#0 D#0 = 19 Hz   
	Mi0  E0  = 21 Hz   
	Fá0  F0  = 22 Hz   
	Fá#0 F#0 = 23 Hz   
	Sol0 G0  = 25 Hz   
	Sol#0 G#0= 26 Hz   
	Lá0  A0  = 27.5 Hz
	Lá#0 A#0 = 29 Hz   
	Si0  B0  = 31 Hz   

	Dó1  C1  = 33 Hz   
	Dó#1 C#1 = 35 Hz   
	Ré1  D1  = 37 Hz   
	Ré#1 D#1 = 39 Hz   
	Mi1  E1  = 41 Hz   
	Fá1  F1  = 44 Hz   
	Fá#1 F#1 = 46 Hz   
	Sol1 G1  = 49 Hz   
	Sol#1 G#1= 52 Hz   
	Lá1  A1  = 55 Hz   
	Lá#1 A#1 = 58 Hz   
	Si1  B1  = 62 Hz   

	Dó2  C2  = 65 Hz  
	Dó#2 C#2 = 69 Hz  
	Ré2  D2  = 73 Hz  
	Ré#2 D#2 = 78 Hz  
	Mi2  E2  = 82 Hz 
	Fá2  F2  = 87 Hz  
	Fá#2 F#2 = 92 Hz  
	Sol2 G2  = 98 Hz  
	Sol#2 G#2= 104 Hz 
	Lá2  A2  = 110 Hz 
	Lá#2 A#2 = 117 Hz 
	Si2  B2  = 123 Hz 

	Dó3  C3  = 130 Hz 
	Dó#3 C#3 = 138 Hz 
	Ré3  D3  = 146 Hz
	Ré#3 D#3 = 155 Hz 
	Mi3  E3  = 164 Hz 
	Fá3  F3  = 174 Hz 
	Fá#3 F#3 = 184 Hz 
	Sol3 G3  = 195 Hz 
	Sol#3 G#3= 207 Hz 
	Lá3  A3  = 220 Hz 
	Lá#3 A#3 = 233 Hz 
	Si3  B3  = 246 Hz 

	Dó4  C4  = 261 Hz 
	Dó#4 C#4 = 277 Hz 
	Ré4  D4  = 293 Hz 
	Ré#4 D#4 = 311 Hz 
	Mi4  E4  = 329 Hz
	Fá4  F4  = 349 Hz 
	Fá#4 F#4 = 369 Hz 
	Sol4 G4  = 392 Hz 
	Sol#4 G#4= 415 Hz 
	Lá4  A4  = 440 Hz 
	Lá#4 A#4 = 466 Hz 
	Si4  B4  = 493 Hz 

	Dó5  C5  = 523 Hz 
	Dó#5 C#5 = 554 Hz 
	Ré5  D5  = 587 Hz 
	Ré#5 D#5 = 622 Hz 
	Mi5  E5  = 659 Hz 
	Fá5  F5  = 698 Hz 
	Fá#5 F#5 = 739 Hz 
	Sol5 G5  = 783 Hz 
	Sol#5 G#5= 830 Hz 
	Lá5  A5  = 880 Hz 
	Lá#5 A#5 = 932 Hz 
	Si5  B5  = 987 Hz 

	Dó6  C6  = 1046 Hz
	Dó#6 C#6 = 1108 Hz 
	Ré6  D6  = 1174 Hz 
	Ré#6 D#6 = 1244 Hz 
	Mi6  E6  = 1318 Hz 
	Fá6  F6  = 1396 Hz 
	Fá#6 F#6 = 1479 Hz 
	Sol6 G6  = 1567 Hz 
	Sol#6 G#6= 1661 Hz 
	Lá6  A6  = 1760 Hz 
	Lá#6 A#6 = 1864 Hz 
	Si6  B6  = 1975 Hz 

	Dó7  C7  = 2093 Hz 
	Dó#7 C#7 = 2217 Hz 
	Ré7  D7  = 2349 Hz 
	Ré#7 D#7 = 2489 Hz
	Mi7  E7  = 2637 Hz 
	Fá7  F7  = 2793 Hz 
	Fá#7 F#7 = 2959 Hz 
	Sol7 G7  = 3135 Hz 
	Sol#7 G#7= 3322 Hz 
	Lá7  A7  = 3520 Hz 
	Lá#7 A#7 = 3729 Hz 
	Si7  B7  = 3951 Hz 

	Dó8  C8  = 4186 Hz 
	Dó#8 C#8 = 4435 Hz 
	Ré8  D8  = 4699 Hz 
	Ré#8 D#8 = 4978 Hz 
	Mi8  E8  = 5274 Hz 
	Fá8  F8  = 5588 Hz 
	Fá#8 F#8 = 5919 Hz 
	Sol8 G8  = 6271 Hz 
	Sol#8 G#8= 6644 Hz 
	Lá8  A8  = 7040 Hz 
	Lá#8 A#8 = 7458 Hz 
	Si8  B8  = 7902 Hz 

	Dó9  C9  = 8372 Hz 
	Dó#9 C#9 = 8870 Hz 
	Ré9  D9  = 9397 Hz 
	Ré#9 D#9 = 9956 Hz 
	Mi9  E9  = 10548 Hz 
	Fá9  F9  = 11175 Hz 
	Fá#9 F#9 = 11840 Hz 
	Sol9 G9  = 12544 Hz 
	Sol#9 G#9= 13289 Hz 
	Lá9  A9  = 14080 Hz 
	Lá#9 A#9 = 14917 Hz 
	Si9  B9  = 15804 Hz 
	"
}

mensagem_inicial()
{
	echo -e "
	DIAPASÃO, PROGRAMA PARA AFINAR INSTRUMENTOS 
	OQUE DESEJA FAZER 
	0 TABELA DE NOTAS 
	1 TOCAR UMA NOTA
        2 TOCAR A PRIMEIRA SUITE DE BACH PARA CELLO	
	3 SAIR 
	"
}

tocar_nota()
{
	read -p "Nome da nota(se for sustenido troqweu o '#' por s: EX Ss5)" nota
	read -p "Duração da nota em segundos" duracao

	play -n synth "$duracao" sine "$nota"
}

primeira_suite_de_bach_para_cello()
{
	#1 compasso
	play -n synth 0.25 sine "$G2"
	play -n synth 0.25 sine "$D3" 	
	play -n synth 0.25 sine "$B3"
	play -n synth 0.25 sine "$A3"

	play -n synth 0.25 sine "$B3" 	
	play -n synth 0.25 sine "$D3" 
	play -n synth 0.25 sine "$B3" 
	play -n synth 0.25 sine "$D3"

	play -n synth 0.25 sine "$G2" 
	play -n synth 0.25 sine "$D3"
	play -n synth 0.25 sine "$B3" 
	play -n synth 0.25 sine "$A3"

	play -n synth 0.25 sine "$B3" 
	play -n synth 0.25 sine "$D3" 
	play -n synth 0.25 sine "$B3" 
	play -n synth 0.25 sine "$D3"

	#2 compasso
	play -n synth 0.25 sine "$G2"
	play -n synth 0.25 sine "$E3"
	play -n synth 0.25 sine "$C4"
	play -n synth 0.25 sine "$B3"

	play -n synth 0.25 sine "$C4"
	play -n synth 0.25 sine "$E3"
	play -n synth 0.25 sine "$C4"
	play -n synth 0.25 sine "$E3"

	play -n synth 0.25 sine "$G2"
	play -n synth 0.25 sine "$E3"
	play -n synth 0.25 sine "$C4"
	play -n synth 0.25 sine "$B3"

	play -n synth 0.25 sine "$C4"
	play -n synth 0.25 sine "$E3"	
	play -n synth 0.25 sine "$C4"
	play -n synth 0.25 sine "$E3"

	#3 compasso
	play -n synth 0.25 sine "$G2"
	play -n synth 0.25 sine "$Fs3"
	play -n synth 0.25 sine "$C4"
	play -n synth 0.25 sine "$B3"

	play -n synth 0.25 sine "$C4"
	play -n synth 0.25 sine "$Fs3"
	play -n synth 0.25 sine "$C4"
	play -n synth 0.25 sine "$Fs3"

	play -n synth 0.25 sine "$G2"
	play -n synth 0.25 sine "$Fs3"
	play -n synth 0.25 sine "$C4"
	play -n synth 0.25 sine "$B3"

	play -n synth 0.25 sine "$C4"
	play -n synth 0.25 sine "$Fs3"
	play -n synth 0.25 sine "$C4"
	play -n synth 0.25 sine "$Fs3"

	#4 compasso
	play -n synth 0.25 sine "$G2"
	play -n synth 0.25 sine "$G3"
	play -n synth 0.25 sine "$B3"
	play -n synth 0.25 sine "$A3"

	play -n synth 0.25 sine "$B3"
	play -n synth 0.25 sine "$G3"
	play -n synth 0.25 sine "$B3"
	play -n synth 0.25 sine "$G3"

	play -n synth 0.25 sine "$G2"
	play -n synth 0.25 sine "$G3"
	play -n synth 0.25 sine "$B3"
	play -n synth 0.25 sine "$A3"

	play -n synth 0.25 sine "$B3"
	play -n synth 0.25 sine "$G3"
	play -n synth 0.25 sine "$B3"
	play -n synth 0.25 sine "$G3"

	#5 compasso
	play -n synth 0.25 sine "$G2"
	play -n synth 0.25 sine "$E3"
	play -n synth 0.25 sine "$B3"
	play -n synth 0.25 sine "$A3"

	play -n synth 0.25 sine "$B3"
	play -n synth 0.25 sine "$G3"
	play -n synth 0.25 sine "$Fs3"
	play -n synth 0.25 sine "$G3"

	play -n synth 0.25 sine "$E3"
	play -n synth 0.25 sine "$G3"
	play -n synth 0.25 sine "$Fs3"
	play -n synth 0.25 sine "$G3"

	play -n synth 0.25 sine "$B2"
	play -n synth 0.25 sine "$D2"
	play -n synth 0.25 sine "$Cs3"
	play -n synth 0.25 sine "$B2"

	#6 compasso
	play -n synth 0.25 sine "$Cs3"
	play -n synth 0.25 sine "$G3"
	play -n synth 0.25 sine "$A3"
	play -n synth 0.25 sine "$G3"

	play -n synth 0.25 sine "$A3"
	play -n synth 0.25 sine "$G3"
	play -n synth 0.25 sine "$A3"
	play -n synth 0.25 sine "$G3"

	play -n synth 0.25 sine "$C3"
	play -n synth 0.25 sine "$G3"
	play -n synth 0.25 sine "$A3"
	play -n synth 0.25 sine "$G3"

	play -n synth 0.25 sine "$A3"
	play -n synth 0.25 sine "$G3"
	play -n synth 0.25 sine "$A3"
	play -n synth 0.25 sine "$G3"

	#7 compasso
	play -n synth 0.25 sine "$Fs3"
	play -n synth 0.25 sine "$A3"
	play -n synth 0.25 sine "$D4"
	play -n synth 0.25 sine "$Cs4"

	play -n synth 0.25 sine "$D4"
	play -n synth 0.25 sine "$A3"
	play -n synth 0.25 sine "$G3"
	play -n synth 0.25 sine "$A3"

	play -n synth 0.25 sine "$Fs3"
	play -n synth 0.25 sine "$A3"
	play -n synth 0.25 sine "$G3"
	play -n synth 0.25 sine "$A3"
	
	play -n synth 0.25 sine "$D3"
	play -n synth 0.25 sine "$Fs3"
	play -n synth 0.25 sine "$E3"
	play -n synth 0.25 sine "$D3"

	#8 compasso 
	play -n synth 0.25 sine "$E2"
	play -n synth 0.25 sine "$B2"
	play -n synth 0.25 sine "$G3"
	play -n synth 0.25 sine "$Fs3"

	play -n synth 0.25 sine "$G3"
	play -n synth 0.25 sine "$E2"
	play -n synth 0.25 sine "$G3"
	play -n synth 0.25 sine "$E2"

	play -n synth 0.25 sine "$E2"
	play -n synth 0.25 sine "$B2"	
	play -n synth 0.25 sine "$G3"
	play -n synth 0.25 sine "$Fs3"

	play -n synth 0.25 sine "$G3"
	play -n synth 0.25 sine "$E3"
	play -n synth 0.25 sine "$G3"
	play -n synth 0.25 sine "$E3"

	#9 compasso
	play -n synth 0.25 sine "$E2"
	play -n synth 0.25 sine "$Cs3"
	play -n synth 0.25 sine "$D3"
	play -n synth 0.25 sine "$E3"

	play -n synth 0.25 sine "$D3"
	play -n synth 0.25 sine "$C3"
	play -n synth 0.25 sine "$B2"
	play -n synth 0.25 sine "$A2"

	play -n synth 0.25 sine "$G3"
	play -n synth 0.25 sine "$Fs3"
	play -n synth 0.25 sine "$E3"
	play -n synth 0.25 sine "$D4"

	play -n synth 0.25 sine "$Cs4"
	play -n synth 0.25 sine "$B3"
	play -n synth 0.25 sine "$A3"
	play -n synth 0.25 sine "$G3"

	#10 compasso
	play -n synth 0.25 sine "$Fs3"
	play -n synth 0.25 sine "$E3"
	play -n synth 0.25 sine "$D3"
	play -n synth 0.25 sine "$D4"

	play -n synth 0.25 sine "$A3"
	play -n synth 0.25 sine "$D4"
	play -n synth 0.25 sine "$Fs3"
	play -n synth 0.25 sine "$A3"

	play -n synth 0.25 sine "$D3"
	play -n synth 0.25 sine "$E3"
	play -n synth 0.25 sine "$Fs3"
	play -n synth 0.25 sine "$A3"
	
	play -n synth 0.25 sine "$G3"
	play -n synth 0.25 sine "$Fs3"
	play -n synth 0.25 sine "$E3"
	play -n synth 0.25 sine "$D3"

	#11 compasso
	play -n synth 0.25 sine "$Gs3"
	play -n synth 0.25 sine "$D3"
	play -n synth 0.25 sine "$F3"
	play -n synth 0.25 sine "$E3"
	
	play -n synth 0.25 sine "$Fs3"
	play -n synth 0.25 sine "$D3"
	play -n synth 0.25 sine "$Gs3"
	play -n synth 0.25 sine "$D3"

	play -n synth 0.25 sine "$B3"
	play -n synth 0.25 sine "$D3"
	play -n synth 0.25 sine "$F3"
	play -n synth 0.25 sine "$E3"

	play -n synth 0.25 sine "$FS3"
	play -n synth 0.25 sine "$D3"
	play -n synth 0.25 sine "$Gs3"
	play -n synth 0.25 sine "$D3"

	#12 compasso
	play -n synth 0.25 sine "$C3"
	play -n synth 0.25 sine "$E3"
	play -n synth 0.25 sine "$A3"
	play -n synth 0.25 sine "$B3"
	
	play -n synth 0.25 sine "$C4"
	play -n synth 0.25 sine "$A3"
	play -n synth 0.25 sine "$E3"
	play -n synth 0.25 sine "$D3"

	play -n synth 0.25 sine "$D3"
	play -n synth 0.25 sine "$E3"
	play -n synth 0.25 sine "$A3"
	play -n synth 0.25 sine "$B3"

	play -n synth 0.25 sine "$C4"
	play -n synth 0.25 sine "$A3"
	play -n synth 0.25 sine "$Fs3"
	play -n synth 0.25 sine "$E3"

	#13 compasso
	play -n synth 0.25 sine "$Ds3"
	play -n synth 0.25 sine "$Fs3"
	play -n synth 0.25 sine "$Ds3"
	play -n synth 0.25 sine "$Fs3"

	play -n synth 0.25 sine "$A3"
	play -n synth 0.25 sine "$Fs3"
	play -n synth 0.25 sine "$A3"
	play -n synth 0.25 sine "$Fs3"

	play -n synth 0.25 sine "$Ds3"
	play -n synth 0.25 sine "$Fs3"
	play -n synth 0.25 sine "$Ds3"
	play -n synth 0.25 sine "$Fs3"

	play -n synth 0.25 sine "$A3"
	play -n synth 0.25 sine "$Fs3"
	play -n synth 0.25 sine "$A3"
	play -n synth 0.25 sine "$Fs3"

	#14 compasso
	play -n synth 0.25 sine "$G3"
	play -n synth 0.25 sine "$Fs3"
	play -n synth 0.25 sine "$E3"
	play -n synth 0.25 sine "$G3"

	play -n synth 0.25 sine "$Fs3"
	play -n synth 0.25 sine "$G3"
	play -n synth 0.25 sine "$A3"
	play -n synth 0.25 sine "$Fs3"

	play -n synth 0.25 sine "$G3"
	play -n synth 0.25 sine "$Fs3"
	play -n synth 0.25 sine "$E3"
	play -n synth 0.25 sine "$D3"

	play -n synth 0.25 sine "$C3"
	play -n synth 0.25 sine "$B2"
	play -n synth 0.25 sine "$A2"
	play -n synth 0.25 sine "$G2"

	#15 compasso
	play -n synth 0.25 sine "$Fs2"
	play -n synth 0.25 sine "$C3"
	play -n synth 0.25 sine "$D3"
	play -n synth 0.25 sine "$C3"

	play -n synth 0.25 sine "$D3"
	play -n synth 0.25 sine "$C3"
	play -n synth 0.25 sine "$D3"
	play -n synth 0.25 sine "$C3"

	play -n synth 0.25 sine "$Fs2"
	play -n synth 0.25 sine "$C3"
	play -n synth 0.25 sine "$D3"
	play -n synth 0.25 sine "$C3"

	play -n synth 0.25 sine "$D3"
	play -n synth 0.25 sine "$C3"
	play -n synth 0.25 sine "$D3"
	play -n synth 0.25 sine "$C3"
}

resposta=0

while [ "$resposta" != 2 ]; do
	mensagem_inicial
    read -p "Escolha uma opção: " resposta

    if [ "$resposta" = 0 ]; then
	    tabela_de_notas_e_seus_Hz
    elif [ "$resposta" = 1 ]; then
	    tocar_nota
    elif [ "$resposta" = 2 ]; then
   	    primeira_suite_de_bach_para_cello
    elif [ "$resposta" = 3 ]; then
        echo "Saindo..."
        exit 0
    else
        echo "Opção inválida. Tente novamente."
    fi
done

