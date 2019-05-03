#! /bin/sh

##################################################
###################
###################     Matthias BRICARD
###################
##################################################

STATE=3
PLUGIN_PATH='/srv/eyesofnetwork/nagios/plugins'
COMMAND_PATH='/bin'

########################################### Aide #########################################

if [[ $# -lt 6 ]] ;  then

echo " La syntaxe de la commande est la suivante :

 - Check_stack_HP -H '@IP' -c 'element a tester' -w 'seuil d'alerte' -c 'seuil critique' -C 'communaute snmp'

+ elements possibles : cpuX, fanX, psX, tempX, memX et uptime"

exit $STATE

fi

####################################### Resultats #########################################

##################################################
####################CPU###########################
##################################################

###########################################################################################

#### valeur pour cpu1 ####

if [[ ($4 == cpu || $4 == CPU) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.2.6.1.1.1.1.6.65 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
#echo "valeur = $valeur"

rslt_affiche="Le processeur du premier equipement est utilise a $valeur %"

if [[ ($valeur -lt ${6}) ]] ; then
STATE=0
fi

if [[ ($valeur -ge ${6}) ]] ; then
        STATE=1
        if [[ ($valeur -ge ${8}) ]] ; then
                STATE=2
        fi
fi
fi

#########################

#### valeur pour cpu2 ####

if [[ ($4 == cpu2 || $4 == CPU2) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.2.6.1.1.1.1.6.71 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
#echo "valeur = $valeur"

rslt_affiche="Le processeur du second equipement est utilise a $valeur %"

if [[ ($valeur -lt ${6}) ]] ; then
STATE=0
fi

if [[ ($valeur -ge ${6}) ]] ; then
        STATE=1
        if [[ ($valeur -ge ${8}) ]] ; then
                STATE=2
        fi
fi
fi

#########################

#########################

#### valeur pour cpu3 ####

if [[ ($4 == cpu3 || $4 == CPU3) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.2.6.1.1.1.1.6.77 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
#echo "valeur = $valeur"

rslt_affiche="Le processeur du troisieme equipement est utilise a $valeur %"

if [[ ($valeur -lt ${6}) ]] ; then
STATE=0
fi

if [[ ($valeur -ge ${6}) ]] ; then
        STATE=1
        if [[ ($valeur -ge ${8}) ]] ; then
                STATE=2
        fi
fi
fi

#########################

#########################

#### valeur pour cpu4 ####

if [[ ($4 == cpu4 || $4 == CPU4) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.2.6.1.1.1.1.6.83 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
#echo "valeur = $valeur"

rslt_affiche="Le processeur du quatrieme equipement est utilise a $valeur %"

if [[ ($valeur -lt ${6}) ]] ; then
STATE=0
fi

if [[ ($valeur -ge ${6}) ]] ; then
        STATE=1
        if [[ ($valeur -ge ${8}) ]] ; then
                STATE=2
        fi
fi
fi

#########################

#########################

#### valeur pour cpu5 ####

if [[ ($4 == cpu5 || $4 == CPU5) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.2.6.1.1.1.1.6.89 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
#echo "valeur = $valeur"

rslt_affiche="Le processeur du cinquieme equipement est utilise a $valeur %"

if [[ ($valeur -lt ${6}) ]] ; then
STATE=0
fi

if [[ ($valeur -ge ${6}) ]] ; then
        STATE=1
        if [[ ($valeur -ge ${8}) ]] ; then
                STATE=2
        fi
fi
fi

#########################

#########################

#### valeur pour cpu6 ####

if [[ ($4 == cpu6 || $4 == CPU6) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.2.6.1.1.1.1.6.95 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
#echo "valeur = $valeur"

rslt_affiche="Le processeur du sixieme equipement est utilise a $valeur %"

if [[ ($valeur -lt ${6}) ]] ; then
STATE=0
fi

if [[ ($valeur -ge ${6}) ]] ; then
        STATE=1
        if [[ ($valeur -ge ${8}) ]] ; then
                STATE=2
        fi
fi
fi

#######################################################################################################################################################

##################################################
####################FANs##########################
##################################################

#########################

#### valeur pour fan1 ####

if [[ ($4 == fan || $4 == FAN) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.8.35.9.1.1.1.2.1 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
#echo "valeur = $valeur"

#rslt_affiche="Le ventilateur du premier equipement : $valeur %, $valeur1 %, $valeur2 %"

if [[ ($valeur == "1" ) ]] ; then
STATE=0
rslt_affiche="ok"

else 
        STATE=2
        rslt_affiche="ALERTE"
fi
fi

#########################
#########################

#### valeur pour fan2 ####

if [[ ($4 == fan2 || $4 == FAN2) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.8.35.9.1.1.1.2.2 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
#echo "valeur = $valeur"

#rslt_affiche="Le ventilateur du premier equipement : $valeur %, $valeur1 %, $valeur2 %"

if [[ ($valeur == "1" ) ]] ; then
STATE=0
rslt_affiche="ok"

else 
        STATE=2
        rslt_affiche="ALERTE"
fi
fi

#########################

#########################

#### valeur pour fan3 ####

if [[ ($4 == fan3 || $4 == FAN3) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.8.35.9.1.1.1.2.3 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
#echo "valeur = $valeur"

#rslt_affiche="Le ventilateur du premier equipement : $valeur %, $valeur1 %, $valeur2 %"

if [[ ($valeur == "1" ) ]] ; then
STATE=0
rslt_affiche="ok"

else 
        STATE=2
        rslt_affiche="ALERTE"
fi
fi

#########################

#########################

#### valeur pour fan4 ####

if [[ ($4 == fan4 || $4 == FAN4) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.8.35.9.1.1.1.2.4 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
#echo "valeur = $valeur"

#rslt_affiche="Le ventilateur du premier equipement : $valeur %, $valeur1 %, $valeur2 %"

if [[ ($valeur == "1" ) ]] ; then
STATE=0
rslt_affiche="ok"

else 
        STATE=2
        rslt_affiche="ALERTE"
fi
fi

#########################

#########################

#### valeur pour fan5 ####

if [[ ($4 == fan5 || $4 == FAN5) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.8.35.9.1.1.1.2.5 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
#echo "valeur = $valeur"

#rslt_affiche="Le ventilateur du premier equipement : $valeur %, $valeur1 %, $valeur2 %"

if [[ ($valeur == "1" ) ]] ; then
STATE=0
rslt_affiche="ok"

else 
        STATE=2
        rslt_affiche="ALERTE"
fi
fi

#########################

#########################

#### valeur pour fan6 ####

if [[ ($4 == fan6 || $4 == FAN6) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.8.35.9.1.1.1.2.6 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
#echo "valeur = $valeur"

#rslt_affiche="Le ventilateur du premier equipement : $valeur %, $valeur1 %, $valeur2 %"

if [[ ($valeur == "1" ) ]] ; then
STATE=0
rslt_affiche="ok"

else 
        STATE=2
        rslt_affiche="ALERTE"
fi
fi

#########################

#########################

##################################################
####################POWER#########################
##################################################

#### valeur pour ps1 ####

if [[ ($4 == ps || $4 == PS) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.8.35.9.1.2.1.2.1 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
#echo "valeur = $valeur"

valeur2=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.8.35.9.1.2.1.2.2 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
#echo "valeur = $valeur2"

#rslt_affiche="L'alim du premier equipement : $valeur %, $valeur1 %, $valeur2 %"

if [[ ( ($valeur == "1" && $valeur2 == "3" ) || ($valeur == "1" && $valeur2 == "1" ) || ($valeur == "3" && $valeur2 == "1" ) ) ]] ; then
STATE=0
rslt_affiche="ok"

else 
        STATE=2
        rslt_affiche="ALERTE"
fi

fi

#########################

#### valeur pour ps2 ####

if [[ ($4 == ps2 || $4 == PS2) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.8.35.9.1.2.1.2.3 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
#echo "valeur = $valeur"

valeur2=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.8.35.9.1.2.1.2.4 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
#echo "valeur = $valeur2"

#rslt_affiche="L'alim du premier equipement : $valeur %, $valeur1 %, $valeur2 %"

if [[ ( ($valeur == "1" && $valeur2 == "3" ) || ($valeur == "1" && $valeur2 == "1" ) || ($valeur == "3" && $valeur2 == "1" ) ) ]] ; then
STATE=0
rslt_affiche="ok"

else 
        STATE=2
        rslt_affiche="ALERTE"
fi

fi

#########################

#### valeur pour ps3 ####

if [[ ($4 == ps3 || $4 == PS3) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.8.35.9.1.2.1.2.5 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
#echo "valeur = $valeur"

valeur2=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.8.35.9.1.2.1.2.6 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
#echo "valeur = $valeur2"

#rslt_affiche="L'alim du premier equipement : $valeur %, $valeur1 %, $valeur2 %"

if [[ ( ($valeur == "1" && $valeur2 == "3" ) || ($valeur == "1" && $valeur2 == "1" ) || ($valeur == "3" && $valeur2 == "1" ) ) ]] ; then
STATE=0
rslt_affiche="ok"


else 
        STATE=2
        rslt_affiche="ALERTE"
fi

fi

#########################

#### valeur pour ps4 ####

if [[ ($4 == ps4 || $4 == PS4) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.8.35.9.1.2.1.2.7 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
#echo "valeur = $valeur"

valeur2=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.8.35.9.1.2.1.2.8 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
#echo "valeur = $valeur2"

#rslt_affiche="L'alim du premier equipement : $valeur %, $valeur1 %, $valeur2 %"

if [[ ( ($valeur == "1" && $valeur2 == "3" ) || ($valeur == "1" && $valeur2 == "1" ) || ($valeur == "3" && $valeur2 == "1" ) ) ]] ; then
STATE=0
rslt_affiche="ok"


else 
        STATE=2
        rslt_affiche="ALERTE"
fi

fi

#########################

#### valeur pour ps5 ####

if [[ ($4 == ps5 || $4 == PS5) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.8.35.9.1.2.1.2.9 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
#echo "valeur = $valeur"

valeur2=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.8.35.9.1.2.1.2.10 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
#echo "valeur = $valeur2"

#rslt_affiche="L'alim du premier equipement : $valeur %, $valeur1 %, $valeur2 %"

if [[ ( ($valeur == "1" && $valeur2 == "3" ) || ($valeur == "1" && $valeur2 == "1" ) || ($valeur == "3" && $valeur2 == "1" ) ) ]] ; then
STATE=0
rslt_affiche="ok"


else 
        STATE=2
        rslt_affiche="ALERTE"
fi

fi

#########################

#### valeur pour ps6 ####

if [[ ($4 == ps6 || $4 == PS6) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.8.35.9.1.2.1.2.11 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
#echo "valeur = $valeur"

valeur2=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.8.35.9.1.2.1.2.12 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
#echo "valeur = $valeur2"

#rslt_affiche="L'alim du premier equipement : $valeur %, $valeur1 %, $valeur2 %"

if [[ ( ($valeur == "1" && $valeur2 == "3" ) || ($valeur == "1" && $valeur2 == "1" ) || ($valeur == "3" && $valeur2 == "1" ) ) ]] ; then
STATE=0
rslt_affiche="ok"


else 
        STATE=2
        rslt_affiche="ALERTE"
fi

fi

#########################


##################################################
####################TEMP##########################
##################################################

#########################

#### valeur pour temp1 ####

if [[ ($4 == temp || $4 == TEMP) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.2.6.1.1.1.1.12.65 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
rslt_affiche="Temperature : $valeur °C"


if [[ ($valeur -lt ${6}) ]] ; then
STATE=0
fi

if [[ ($valeur -ge ${6}) ]] ; then
        STATE=1
        if [[ ($valeur -ge ${8}) ]] ; then
                STATE=2
        fi
fi
fi

#########################


#### valeur pour temp2 ####

if [[ ($4 == temp2 || $4 == TEMP2) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.2.6.1.1.1.1.12.71 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
rslt_affiche="Temperature : $valeur °C"


if [[ ($valeur -lt ${6}) ]] ; then
STATE=0
fi

if [[ ($valeur -ge ${6}) ]] ; then
        STATE=1
        if [[ ($valeur -ge ${8}) ]] ; then
                STATE=2
        fi
fi
fi

#########################

#### valeur pour temp3 ####

if [[ ($4 == temp3 || $4 == TEMP3) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.2.6.1.1.1.1.12.77 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
rslt_affiche="Temperature : $valeur °C"


if [[ ($valeur -lt ${6}) ]] ; then
STATE=0
fi

if [[ ($valeur -ge ${6}) ]] ; then
        STATE=1
        if [[ ($valeur -ge ${8}) ]] ; then
                STATE=2
        fi
fi
fi

#########################

#### valeur pour temp4 ####

if [[ ($4 == temp4 || $4 == TEMP4) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.2.6.1.1.1.1.12.83 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
rslt_affiche="Temperature : $valeur °C"


if [[ ($valeur -lt ${6}) ]] ; then
STATE=0
fi

if [[ ($valeur -ge ${6}) ]] ; then
        STATE=1
        if [[ ($valeur -ge ${8}) ]] ; then
                STATE=2
        fi
fi
fi

#########################

#### valeur pour temp5 ####

if [[ ($4 == temp5 || $4 == TEMP5) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.2.6.1.1.1.1.12.89 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
rslt_affiche="Temperature : $valeur °C"


if [[ ($valeur -lt ${6}) ]] ; then
STATE=0
fi

if [[ ($valeur -ge ${6}) ]] ; then
        STATE=1
        if [[ ($valeur -ge ${8}) ]] ; then
                STATE=2
        fi
fi
fi

#########################

#### valeur pour temp6 ####

if [[ ($4 == temp6 || $4 == TEMP6) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.2.6.1.1.1.1.12.95 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
rslt_affiche="Temperature : $valeur °C"


if [[ ($valeur -lt ${6}) ]] ; then
STATE=0
fi

if [[ ($valeur -ge ${6}) ]] ; then
        STATE=1
        if [[ ($valeur -ge ${8}) ]] ; then
                STATE=2
        fi
fi
fi

#########################

##################################################
####################MEM###########################
##################################################

###########################################################################################

#### valeur pour mem1 ####

if [[ ($4 == mem || $4 == MEM) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.2.6.1.1.1.1.8.65 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
echo "valeur = $valeur"

rslt_affiche="La memoire du premier equipement est utilisee a $valeur %"

if [[ ($valeur -lt ${6}) ]] ; then
STATE=0
fi

if [[ ($valeur -ge ${6}) ]] ; then
        STATE=1
        if [[ ($valeur -ge ${8}) ]] ; then
                STATE=2
        fi
fi
fi

#########################

#### valeur pour mem1 ####

if [[ ($4 == mem || $4 == MEM) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.2.6.1.1.1.1.8.65 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
#echo "valeur = $valeur"

rslt_affiche="La memoire du premier equipement est utilisee a $valeur %"

if [[ ($valeur -lt ${6}) ]] ; then
STATE=0
fi

if [[ ($valeur -ge ${6}) ]] ; then
        STATE=1
        if [[ ($valeur -ge ${8}) ]] ; then
                STATE=2
        fi
fi
fi

#########################


#### valeur pour mem2 ####

if [[ ($4 == mem2 || $4 == MEM2) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.2.6.1.1.1.1.8.71 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
#echo "valeur = $valeur"

rslt_affiche="La memoire du deuxieme equipement est utilisee a $valeur %"

if [[ ($valeur -lt ${6}) ]] ; then
STATE=0
fi

if [[ ($valeur -ge ${6}) ]] ; then
        STATE=1
        if [[ ($valeur -ge ${8}) ]] ; then
                STATE=2
        fi
fi
fi

#########################


#### valeur pour mem3 ####

if [[ ($4 == mem3 || $4 == MEM3) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.2.6.1.1.1.1.8.77 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
#echo "valeur = $valeur"

rslt_affiche="La memoire du troisieme equipement est utilisee a $valeur %"

if [[ ($valeur -lt ${6}) ]] ; then
STATE=0
fi

if [[ ($valeur -ge ${6}) ]] ; then
        STATE=1
        if [[ ($valeur -ge ${8}) ]] ; then
                STATE=2
        fi
fi
fi

#########################


#### valeur pour mem4 ####

if [[ ($4 == mem4 || $4 == MEM4) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.2.6.1.1.1.1.8.83 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
#echo "valeur = $valeur"

rslt_affiche="La memoire du quatrieme equipement est utilisee a $valeur %"

if [[ ($valeur -lt ${6}) ]] ; then
STATE=0
fi

if [[ ($valeur -ge ${6}) ]] ; then
        STATE=1
        if [[ ($valeur -ge ${8}) ]] ; then
                STATE=2
        fi
fi
fi

#########################


#### valeur pour mem5 ####

if [[ ($4 == mem5 || $4 == MEM5) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.2.6.1.1.1.1.8.89 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
#echo "valeur = $valeur"

rslt_affiche="La memoire du cinquieme equipement est utilisee a $valeur %"

if [[ ($valeur -lt ${6}) ]] ; then
STATE=0
fi

if [[ ($valeur -ge ${6}) ]] ; then
        STATE=1
        if [[ ($valeur -ge ${8}) ]] ; then
                STATE=2
        fi
fi
fi

#########################

#### valeur pour mem6 ####

if [[ ($4 == mem6 || $4 == MEM6) ]] ; then

valeur=`snmpget -v 2c -c ${10} ${2} 1.3.6.1.4.1.25506.2.6.1.1.1.1.8.95 | cut -d "=" -f2 | cut -d ":" -f2 | cut -d" " -f2`
#echo "valeur = $valeur"

rslt_affiche="La memoire du sixieme equipement est utilisee a $valeur %"

if [[ ($valeur -lt ${6}) ]] ; then
STATE=0
fi

if [[ ($valeur -ge ${6}) ]] ; then
        STATE=1
        if [[ ($valeur -ge ${8}) ]] ; then
                STATE=2
        fi
fi
fi

#########################




##################################################
##################################################
##################################################
#### valeur pour uptime ####
if [[ ($4 == uptime || $4 == UPTIME) ]] ; then

valeur=`snmpget -v 2c -c ${6} ${2} .1.3.6.1.2.1.1.3.0 | cut -d")" -f2 | cut -d" " -f 2-`
jour=`snmpget -v 2c -c ${6} ${2} 1.3.6.1.2.1.1.3.0 | cut -d")" -f2 | cut -d" " -f 2`
heure=`snmpget -v 2c -c ${6} ${2} 1.3.6.1.2.1.1.3.0 | cut -d")" -f2 | cut -d" " -f 4`
minute=`snmpget -v 2c -c ${6} ${2} 1.3.6.1.2.1.1.3.0 | cut -d")" -f2 | cut -d" " -f 4 |cut -d":" -f2`

#echo "valeur :"$valeur
#echo "jour :"$jour
#echo "heure :"$heure
#echo "minute :"$minute
rslt_affiche="L'équipement est en fonctionnement depuis $valeur"

if [[ ($jour > 0) ]] ; then
        STATE=0
        graph=2
elif [[ ($jour == 0 && $heure == 0 && $minute < 15 && $minute > 5) ]] ; then
        STATE=1
        graph=1
elif [[ ($jour == 0 && $heure == 0 && $minute < 5) ]] ; then
        STATE=2
        graph=0
fi

fi


#########################
External=`echo $valeur | cut -d":" -f1,2`
if [[ ($External == Externalcommanderror:Timeout ) ]] ; then
STATE=3
rslt_affiche="Aucune réponse de la requête"
valeur="TIMEOUT"
fi

if [[ ($valeur == "while executing system" || $valeur == "Plugintimedoutwhileexecutingsystemcall" ) ]] ; then
STATE=3
rslt_affiche="Aucune réponse de la requête"
valeur="TIMEOUT"
fi

#########CPU#################################################################################

if [[ ($4 == cpu) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | CPU=$valeur;$6;$8"
fi

if [[ ($4 == cpu2) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | CPU2=$valeur;$6;$8"
fi

if [[ ($4 == cpu3) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | CPU3=$valeur;$6;$8"
fi

if [[ ($4 == cpu4) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | CPU4=$valeur;$6;$8"
fi

if [[ ($4 == cpu5) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | CPU5=$valeur;$6;$8"
fi

if [[ ($4 == cpu6) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | CPU6=$valeur;$6;$8"
fi

##############################################################################################################################

#########FAN#################################################################################

if [[ ($4 == fan) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | FAN=$valeur;$6;$8"
fi

if [[ ($4 == fan2) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | FAN2=$valeur;$6;$8"
fi

if [[ ($4 == fan3) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | FAN3=$valeur;$6;$8"
fi

if [[ ($4 == fan4) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | FAN4=$valeur;$6;$8"
fi

if [[ ($4 == fan5) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | FAN5=$valeur;$6;$8"
fi

if [[ ($4 == fan6) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | FAN6=$valeur;$6;$8"
fi

##############################################################################################################################

#########FPS#################################################################################


if [[ ($4 == ps) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | PS1=$valeur;$valeur2;$6;$8"
fi

if [[ ($4 == ps2) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | PS2=$valeur;$valeur2;$6;$8"
fi

if [[ ($4 == ps3) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | PS3=$valeur;$valeur2;$6;$8"
fi

if [[ ($4 == ps4) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | PS4=$valeur;$valeur2;$6;$8"
fi

if [[ ($4 == ps5) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | PS5=$valeur;$valeur2;$6;$8"
fi

if [[ ($4 == ps6) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | PS6=$valeur;$valeur2;$6;$8"
fi

##############################################################################################################################
#########TEMP#################################################################################


if [[ ($4 == temp) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | Temp=$valeur;$6;$8"
fi

if [[ ($4 == temp2) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | Temp2=$valeur;$6;$8"
fi

if [[ ($4 == temp3) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | Temp3=$valeur;$6;$8"
fi

if [[ ($4 == temp4) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | Temp4=$valeur;$6;$8"
fi

if [[ ($4 == temp5) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | Temp5=$valeur;$6;$8"
fi

if [[ ($4 == temp6) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | Temp6=$valeur;$6;$8"
fi

##############################################################################################################################
#########TEMP#################################################################################

if [[ ($4 == mem) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | MEM=$valeur;${6};${8}"
fi

if [[ ($4 == mem2) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | MEM2=$valeur;${6};${8}"
fi

if [[ ($4 == mem3) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | MEM3=$valeur;${6};${8}"
fi

if [[ ($4 == mem4) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | MEM4=$valeur;${6};${8}"
fi

if [[ ($4 == mem5) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | MEM5=$valeur;${6};${8}"
fi

if [[ ($4 == mem6) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | MEM6=$valeur;${6};${8}"
fi

##############################################################################################################################

if [[ ($4 == disk) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | DISK=$valeur;$6;$8"
fi
if [[ ($4 == sessions) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | CPU=$valeur;$6;$8"
fi
if [[ ($4 == ssl) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | USERS=$valeur;$6;$8"
fi
if [[ ($4 == ipsec) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | TUNNEL=$valeur;2;1"
fi
if [[ ($4 == uptime) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | UPTIME=$graph;;"
fi
if [[ ($4 == BP) ]] ; then
$PLUGIN_PATH/check_dummy $STATE "$rslt_affiche | IN=$valeur_in;${10};${12} OUT=$valeur_out;${10};${12}"
fi
exit $STATE

