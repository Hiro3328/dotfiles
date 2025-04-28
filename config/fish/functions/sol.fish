function sol --wraps='ddcutil' --description 'alias sol=ddcutil'
  switch $(count $argv)
    case 0
      ddcutil getvcp 10 | awk '{print "brightness: " $9 " " $13}'
      ddcutil getvcp 12 | awk '{print "contrast: " $9 " "$13}'
    case 1
      ddcutil setvcp 10 $argv
    case 2
      ddcutil setvcp 10 $argv[1]
      ddcutil setvcp 12 $argv[2]
  end
end
