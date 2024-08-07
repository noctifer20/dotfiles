PRIVATE_KEY=$(op item get --vault MacSetup id_rsa --reveal --fields private_key --format text)

echo $PRIVATE_KEY