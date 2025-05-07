#!/bin/bash
# Greet the user based on time


greet_user() {
  NAME=$(dialog --inputbox "Enter your name:" 8 40 3>&1 1>&2 2>&3)

  HOUR=$((10#$(date +%H)))
  if (( HOUR < 12 )); then
    GREETING="Good Morning"
  elif (( HOUR < 18 )); then
    GREETING="Good Afternoon"
  else
    GREETING="Good Evening"
  fi

  FULL_GREETING="$GREETING, $NAME!"

  echo "$(date): $FULL_GREETING" >> "$LOG_FILE"
  echo "$FULL_GREETING" | figlet | lolcat > /tmp/greeting_output.txt
  dialog --title "Greeting" --textbox /tmp/greeting_output.txt 20 100
  rm -f /tmp/greeting_output.txt
  
}



# Add a new user
add_user() {
  NAME=$(dialog --inputbox "Enter user name:" 8 40 3>&1 1>&2 2>&3)
  AGE=$(dialog --inputbox "Enter user age:" 8 40 3>&1 1>&2 2>&3)
  EMAIL=$(dialog --inputbox "Enter email:" 8 40 3>&1 1>&2 2>&3)
  PREF=$(dialog --inputbox "Greeting preference (morning/afternoon/evening):" 8 60 3>&1 1>&2 2>&3)

  echo "$NAME:$AGE:$EMAIL:$PREF" >> "$USER_FILE"
  dialog --msgbox "User added successfully!" 6 40
}

# Update existing user info
update_user() {
  NAME=$(dialog --inputbox "Enter name to update:" 8 40 3>&1 1>&2 2>&3)

  if grep -q "^$NAME:" "$USER_FILE"; then
    NEW_AGE=$(dialog --inputbox "Enter new age:" 8 40 3>&1 1>&2 2>&3)
    sed -i "s/^$NAME:[^:]*/$NAME:$NEW_AGE/" "$USER_FILE"
    dialog --msgbox "Updated $NAME's info." 6 40
  else
    dialog --msgbox "User not found." 6 40
  fi
}

# Delete a user
delete_user() {
  NAME=$(dialog --inputbox "Enter name to delete:" 8 40 3>&1 1>&2 2>&3)

  if grep -q "^$NAME:" "$USER_FILE"; then
    sed -i "/^$NAME:/d" "$USER_FILE"
    dialog --msgbox "Deleted $NAME." 6 40
  else
    dialog --msgbox "User not found." 6 40
  fi
}

# View all users
list_users() {
  if [[ -s "$USER_FILE" ]]; then
    dialog --textbox "$USER_FILE" 20 50
  else
    dialog --msgbox "No users found." 6 40
  fi
}

