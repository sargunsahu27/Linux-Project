USER_FILE="users.txt"
LOG_FILE="greeting.log"
touch "$USER_FILE" "$LOG_FILE"
source ./utils.sh 2>/dev/null
export DIALOGRC=~/.mydialogrc

main_menu() {
	while true; do
		CHOICE=$(dialog --title "👋 User Greeting System" --menu "Choose an option:" 20 50 10 \
			1 "Greet Me" \
			2 "Add New User" \
			3 "Update User Info" \
			4 "Delete User" \
			5 "View All Users" \
			6 "Exit" \
			3>&1 1>&2 2>&3)
		case $CHOICE in
			1) greet_user ;;
			2) add_user ;;
			3) update_user ;;
			4) delete_user ;;
			5) list_users ;;
			6) break ;;
		esac
	done

}
main_menu

