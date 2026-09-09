echo "Please enter your GitHub email: "
read email

echo "Please enter your full name: "
read name

read -r -p "Create a GitHub config (including gpg key for signing commits) for: $email? y/n" response
response=${response,,}    # tolower
if [[ "$response" =~ ^(yes|y)$ ]]
then
    export GITHUB_EMAIL="$email"
    export GITHUB_NAME="$name"
    (envsubst < ./example_gitconfig) > gitconfig

    gpg --quick-gen-key "githubcommitsigningkey <$email>" rsa4096

    gpg --armor --export githubcommitsigningkey public.key
fi
exit 0