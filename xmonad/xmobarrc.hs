
Config {
       font = "xft:Hack:size=11:bold:antialias=true"
       , additionalFonts = [ "xft:FontAwesome:size=11" ]
       , allDesktops = True
       , bgColor = "#282c34"
       , fgColor = "#bbc2cf"
       , position = TopW L 100
       , commands = [ Run Cpu [ "--template", "<fc=#a9a1e1>Cpu:</fc> <total>%"
                              , "--Low","3"
                              , "--High","50"
                              , "--low","#bbc2cf"
                              , "--normal","#bbc2cf"
                              , "--high","#fb4934"] 50

                    , Run Memory ["-t","<fc=#51afef>Memory:</fc> <usedratio>%"
                                 ,"-H","80"
                                 ,"-L","10"
                                 ,"-l","#bbc2cf"
                                 ,"-n","#bbc2cf"
                                 ,"-h","#fb4934"] 50

                    , Run Date "%a %b %_d %I:%M" "date" 300
                    , Run DynNetwork ["-t","<fc=#4db5bd>Down:</fc> <rx>, <fc=#c678dd>Up:</fc> <tx>"
                                     ,"-H","200"
                                     ,"-L","10"
                                     ,"-h","#bbc2cf"
                                     ,"-l","#bbc2cf"
                                     ,"-n","#bbc2cf"] 50

                    , Run CoreTemp ["-t", "<fc=#CDB464>Temp: </fc> <core0>°"
                                   , "-L", "30"
                                   , "-H", "75"
                                   , "-l", "lightblue"
                                   , "-n", "#bbc2cf"
                                   , "-h", "#aa4450"] 50

                    -- battery monitor
                    , Run BatteryP       [ "BAT0" ]
                                         [ "--template" , "<fc=#B1DE76>Battery:</fc> <acstatus>"
                                         , "--Low"      , "10"        -- units: %
                                         , "--High"     , "80"        -- units: %
                                         , "--low"      , "#fb4934" -- #ff5555
                                         , "--normal"   , "#bbc2cf"
                                         , "--high"     , "#98be65"

                                         , "--" -- battery specific options
                                                   -- discharging status
                                                   , "-o"   , "<left>% (<timeleft>)"
                                                   -- AC "on" status
                                                   , "-O"   , "<left>% (<fc=#98be65>Charging</fc>)" -- 50fa7b
                                                   -- charged status
                                                   , "-i"   , "<fc=#98be65>Charged</fc>"
                                         ] 50
                    , Run StdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%StdinReader% }{ %cpu% | %coretemp% | %memory% | %battery% | %dynnetwork% | %date%  |"   -- #69DFFA
       }


