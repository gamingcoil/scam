echo "sort? (y/n)"
read sort
if [ $sort = y ]
then
    echo "sorting..."
    cd discord
    mv discord-bots.txt discord-bots && sort discord-bots > discord-bots.txt && rm discord-bots
    mv discord-server.txt discord-server && sort discord-server > discord-server.txt && rm discord-server
    mv discord-user.txt discord-user && sort discord-user > discord-user.txt && rm discord-user
    cd ..

    cd number
    mv sms-numbers.txt sms-numbers && sort sms-numbers > sms-numbers.txt && rm sms-numbers
    mv telephone-numbers.txt telephone-numbers && sort telephone-numbers > telephone-numbers.txt && rm telephone-numbers
    cd ..

    cd web
    mv websites.txt websites && sort websites > websites.txt && rm websites
    cd ..
    echo ""
    echo "sorting done"
fi
echo ""
echo "test for duplicates? (y/n)"
echo ""
read testing
if [ $testing = y ]
then
    echo "discord/discord-bots.txt"
    sort discord/discord-bots.txt | uniq -c | grep -v '^ *1 '
    echo "discord/discord-server.txt"
    sort discord/discord-server.txt | uniq -c | grep -v '^ *1 '
    echo "discord/discord-user.txt"
    sort discord/discord-user.txt | uniq -c | grep -v '^ *1 '
    echo "number/sms-numbers.txt"
    sort number/sms-numbers.txt | uniq -c | grep -v '^ *1 '
    echo "number/telephone-numbers.txt"
    sort number/telephone-numbers.txt | uniq -c | grep -v '^ *1 '
    echo "web/websites.txt"
    sort web/websites.txt | uniq -c | grep -v '^ *1 '
    echo ""
fi
echo "done..."
echo ""
echo "push to github? (y/n)"
read push
echo ""
if [ $push = y ]
then
git add *
git rm *.sh && git rm */*.sh
git commit -m 'automated push'
git push
echo "done"
fi