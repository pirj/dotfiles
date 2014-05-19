# Partially taken from: Base16 Default by Chris Kempson (http://chriskempson.com)

color00="00/00/00" # Black (not Base 00)
color07="d0/d0/d0" # Base 05 - White
color01="ac/41/42" # Base 08 - Red
color09="c2/5e/5f"
color02="90/a9/59" # Base 0B - Green
color10="83/a9/59"
color03="f4/bf/75" # Base 0A - Yellow
color11="f8/d5/a4"
color04="6a/9f/b5" # Base 0D - Blue
color12="8c/b5/c6"
color05="aa/75/9f" # Base 0E - Magenta
color13="bd/95/b5"
color06="75/b5/aa" # Base 0C - Cyan
color14="96/c7/be"
color08="50/50/50" # Base 03 - Bright Black
color15="f5/f5/f5" # Base 07 - Bright White

# 16 color space
printf "\e]4;0;rgb:$color00\e\\"
printf "\e]4;1;rgb:$color01\e\\"
printf "\e]4;2;rgb:$color02\e\\"
printf "\e]4;3;rgb:$color03\e\\"
printf "\e]4;4;rgb:$color04\e\\"
printf "\e]4;5;rgb:$color05\e\\"
printf "\e]4;6;rgb:$color06\e\\"
printf "\e]4;7;rgb:$color07\e\\"
printf "\e]4;8;rgb:$color08\e\\"
printf "\e]4;9;rgb:$color09\e\\"
printf "\e]4;10;rgb:$color10\e\\"
printf "\e]4;11;rgb:$color11\e\\"
printf "\e]4;12;rgb:$color12\e\\"
printf "\e]4;13;rgb:$color13\e\\"
printf "\e]4;14;rgb:$color14\e\\"
printf "\e]4;15;rgb:$color15\e\\"

# clean up
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
