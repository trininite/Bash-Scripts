#!/bin/bash
xrandr --output HDMI-0 --mode 1920x1080 --pos 3200x0 --rotate normal --output DP-0 --primary --mode 1920x1080 --pos 1280x0 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --mode 1280x1024 --pos 0x0 --rotate normal --output DP-3 --off

ids=$(xinput list --id-only)                            

sens=0.28

deviceID=()
devicePropID=()

for id in $ids 
do
        flag=0
        devProps=$(xinput list-props $id)

        if [[ "$devProps" == *"Coordinate Transformation Matrix"* ]]; 
        then
                if [[ "$devProps" == *"libinput Accel Speed"* ]];               
                then
                        if [[ "$devProps" == *"mouse"*  ]]   
                        then    
                                flag=1        
                        elif [[ "$devProps" == *"Mouse"* ]]   
                        then    
                                flag=1         
                        fi      
                        
                fi
        fi

        if [[ $flag == 1 ]]; 
        then
                props=$(xinput list-props $id | grep Matrix)
                propID=${props%)*}
                propID=${propID#*(}
                devicePropID+=("$propID")
                deviceID+=("$id")
        fi

done


for (( i=0; i<${#deviceID[@]}; i++ ))    
do            
        xinput set-prop "${deviceID[$i]}" "${devicePropID[$i]}" $sens, 0.0, 0.0, 0.0, $sens, 0.0, 0.0, 0.0, 1.0
done
