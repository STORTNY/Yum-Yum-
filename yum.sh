#!/bin/bash
# fama figlet?
if command -v figlet &> /dev/null; then
    
    figlet -f big "~Yum Yum~"
    echo "Hi! Couldn't decide what to drink or eat today? Well, I am here to help you out!"
else
    # Fammech figlet
    echo "Hi! Couldn't decide what to drink or eat today? Well, I am here to help you out!"
fi


while true; do
  echo "1- pick a drink"
  echo "2- pick a food"
  echo "3- add options"
  echo "4- delete options"
  echo "5- quit"

  echo -n "lemmee havee uuuhhhh..... "
  read option

  if ! [[ $option =~ ^[1-5]$ ]] ; then
    echo "Please enter a valid option (1-5)"
  else
    case $option in
      1)
        if [ -s drinks.txt ]; then
          random_drink=$(shuf -n 1 drinks.txt)
          echo "$random_drink sounds like a good option"
        else
          echo "uh sir, I'm afraid we dont have that."
          echo''
          echo ''
        fi
        ;;
      2)
        if [ -s food.txt ]; then
          random_food=$(shuf -n 1 food.txt)
          echo "yeah $random_food sounds like a good option"
          echo''
          echo''
        else
          echo "uh sir, I'm afraid we dont have that."
        fi
        ;;
    3)
      echo "What do you want to add?  "
      echo ''
    
      while true; do
        echo "drink or food? [d/f]: "
        read df
    
        case $df in
          [fF]|[food])
            echo "Enter the food you wanna  add: "
            read food
            echo "$food" >> food.txt
            echo " $food added "
            break
            ;;
          [dD]|[drink])
            echo "Enter the drink you wanna add: "
            read drink
            echo "$drink" >> drinks.txt
            echo " $drink added "
            break
            ;;
          *)
            echo "bro, it's really not that hard, f for food, d for drinks . Again.."
            ;;
        esac
      done
      ;;
      4)
        echo "What do you want to delete?"
        echo''
        read delete
        if grep -q "$delete" food.txt; then
          sed -i "/$delete/d" food.txt
          echo "Deleted: $delete"
        else
          echo "$delete we dont have that dont worry ."
          echo''
        fi
        ;;
      5)
        echo "Goodbye :D"
        exit 0
        ;;
    esac

    # haja okhra khouya?
    while true; do
      echo -n "anything else ? [Y/n]: "
      read anything_else

      case $anything_else in
        [Nn])
          echo "BBye :D"
          exit 0
          ;;
        [Yy]|"")
          break
          ;;
        *)
          echo "bruh yes or no hello?   'Y' O R 'N'"
          ;;
      esac
    done
  fi
done
