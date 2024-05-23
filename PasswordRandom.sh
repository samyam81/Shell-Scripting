echo "Welcome to  simple password generator"

sleep 3

echo "Please enter the length of the password:"
read EightyOne

for p in $(seq 1);
do
        openssl rand -base64 48 | cut -c1-$EightyOne
done
