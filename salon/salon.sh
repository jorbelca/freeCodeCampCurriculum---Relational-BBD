#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
#echo $($PSQL "TRUNCATE customers,appointments")
echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN(){
   if [[ $1 ]]
  then
    echo -e "\n$1"
    else
    echo -e "\nWelcome to My Salon, how can I help you?\n"
  fi


# get available services
 SERVICES=$($PSQL "SELECT service_id,name FROM services")

   # display available services
    echo "$SERVICES" | while read ID NAME
    do
      echo "$ID)" $NAME | sed  's/| //g'
    done

  read SERVICE_ID_SELECTED 
  AVAILABLE_SERVICE=$($PSQL "SELECT name FROM services where service_id = '$SERVICE_ID_SELECTED'")
# if no services available
  if [[ -z $AVAILABLE_SERVICE ]]
  then
    # send to main menu
    MAIN "I could not find that service. What would you like today?"
fi

  # GET PHONE NUMBER

  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  
  #QUERY BD CUSTOMER
  CUSTOMER=$($PSQL "SELECT name,customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
   
   if [[ -z $CUSTOMER ]] 
    then
    #get new customer name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    #insert new customer
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name,phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE') ")
    fi
 
if [[ -z $CUSTOMER_NAME ]]
  then
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  fi
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  #appointment time
  
  echo -e "\nWhat time would you like your$AVAILABLE_SERVICE, $CUSTOMER_NAME?"  
  read SERVICE_TIME

    #insert appointment
  
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments (time, customer_id, service_id) VALUES('$SERVICE_TIME' , '$CUSTOMER_ID' , '$SERVICE_ID_SELECTED')")
  if [[ $INSERT_APPOINTMENT == "INSERT 0 1" ]]
  then
  echo "I have put you down for a$AVAILABLE_SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
  exit
  fi 

}

MAIN